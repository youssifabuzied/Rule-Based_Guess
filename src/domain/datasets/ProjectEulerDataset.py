"""Dataset implementation for Project Euler assembly code."""

import json
from pathlib import Path
import subprocess
from typing import Dict, List, Union

from src.helpers.dataset import Dataset, DatasetInstance, AssemblyLanguage, DatasetConfig


@Dataset.register('project_euler')
class ProjectEulerDataset(Dataset):
    """Dataset for Project Euler assembly code.
    
    This dataset expects data in a specific directory structure:
    data/
    ├──datasets/
    │   ├── ProjectEuler/
    │       ├── original_c/  # Original C source files
    │       ├── target_arm/  # ARM64 assembly files
    │       ├── target_risc/ # RISC-V assembly files
    """
    
    # Map architecture to file suffix
    arch_suffix = {
        'x86': 'x86',
        'arm64': 'arm',
        'riscv': 'risc'
    }

    def __init__(self, config: DatasetConfig):
        super().__init__(config)
        self.dataset_name = 'ProjectEuler'
        self.source_arch = config.source_lang  
        self.target_arch = config.target_lang  
        
        # Validate architectures
        valid_archs = {'arm64', 'riscv'}
        if self.source_arch not in valid_archs or self.target_arch not in valid_archs:
            raise ValueError(f"Invalid architecture. Must be one of: {valid_archs}")
            
        # Load dataset metadata
        self.metadata = self._load_metadata()
        
    def _load_metadata(self) -> Dict:
        """Load dataset metadata from source files and assembly files."""
        # Construct paths to dataset directories
        base_path = Path('data/datasets') / self.dataset_name
        c_source_dir = base_path / 'original_c'
        source_asm_dir = base_path / f'target_{self.arch_suffix[self.source_arch]}'
        target_asm_dir = base_path / f'target_{self.arch_suffix[self.target_arch]}'
        
        # Validate paths
        if not c_source_dir.exists():
            raise ValueError(f"Missing C source directory: {c_source_dir}")
        if not source_asm_dir.exists():
            raise ValueError(f"Missing source assembly directory: {source_asm_dir}")
        if not target_asm_dir.exists():
            raise ValueError(f"Missing target assembly directory: {target_asm_dir}")
        
        # Load C source files
        c_files = list(c_source_dir.glob('*.c'))
        c_files.extend(list(c_source_dir.glob('*.cc')))  # Include C++ files
        
        # Load assembly files
        source_suffix = self.arch_suffix[self.source_arch]
        target_suffix = self.arch_suffix[self.target_arch]
        
        source_files = list(source_asm_dir.glob(f'*.{source_suffix}.s'))
        target_files = list(target_asm_dir.glob(f'*.{target_suffix}.s'))
        
        # Create metadata dictionary
        metadata = {
            'c_files': {f.stem: f.read_text() for f in c_files},
            'source_files': {f.stem.replace(f'.{source_suffix}', ''): f for f in source_files},
            'target_files': {f.stem.replace(f'.{target_suffix}', ''): f for f in target_files},
        }
        
        # Log dataset statistics
        print(f"Loaded {len(metadata['c_files'])} C source files")
        print(f"Loaded {len(metadata['source_files'])} source assembly files")
        print(f"Loaded {len(metadata['target_files'])} target assembly files")
        
        return metadata
    
    def load_data(self) -> List[DatasetInstance]:
        """Load all instances for inference."""
        instances = []
        
        # Find common problem IDs across all file types
        common_ids = set(self.metadata['c_files'].keys())
        common_ids &= set(self.metadata['source_files'].keys())
        common_ids &= set(self.metadata['target_files'].keys())
        
        print(f"Found {len(common_ids)} common problem IDs")
        
        # Create instances for each problem
        for problem_id in common_ids:
            # Get source code files
            c_source = self.metadata['c_files'].get(problem_id, '')
            source_file = self.metadata['source_files'][problem_id]
            target_file = self.metadata['target_files'][problem_id]
            
            # Read assembly code
            source_asm = source_file.read_text()
            target_asm = target_file.read_text()
            
            # Create dataset instance
            instance = DatasetInstance(
                instance_id=f"{self.dataset_name}/{problem_id}",
                source_lang=AssemblyLanguage(self.source_arch),
                target_lang=AssemblyLanguage(self.target_arch),
                source=source_asm,  # Contains assembly code
                target=target_asm,  # Contains assembly code
                metadata={
                    'problem_id': problem_id,
                    'c_source': c_source,
                }
            )
            instances.append(instance)
            
        print(f"Created {len(instances)} instances")
        self.logger.info(f"Loaded {len(instances)} instances")
        self._instances = instances
        return instances
    
    def evaluate(self, predictions: Dict[str, Dict]) -> Dict[str, Union[float, Dict[str, str]]]:
        """Evaluate transpilation quality by checking if assembly code can be compiled.
        
        Returns:
            Dict containing:
            - compile_rate: Overall compilation success rate
            - per_problem_results: Dict mapping problem IDs to compilation results
            - errors: Dict mapping problem IDs to error stacktraces
        """
        metrics = {}
        errors = {}
        per_problem_results = {}

        total = len(predictions)
        compile_success = 0

        for instance_id, pred in predictions.items():
            instance = [i for i in self._instances if i.instance_id == instance_id][0]
            problem_id = instance.metadata['problem_id']
            
            # Create temporary directory for compilation
            temp_dir = Path(f"/tmp/ProjectEuler")
            temp_dir.mkdir(parents=True, exist_ok=True)
            
            try:
                # Write prediction to assembly file
                asm_file = temp_dir / f"{problem_id}.s"
                asm_file.write_text(pred[f"tgt_{self.target_arch}"]["functions"]["main"][f"{self.target_arch}_tokens"])
                
                # Try to compile the assembly
                if self.target_arch == 'arm64':
                    compile_cmd = f"aarch64-linux-gnu-as {asm_file} -o {temp_dir}/out.o && "
                    compile_cmd += f"aarch64-linux-gnu-ld {temp_dir}/out.o -o {temp_dir}/out"
                else:  # riscv
                    compile_cmd = f"riscv64-linux-gnu-as {asm_file} -o {temp_dir}/out.o && "
                    compile_cmd += f"riscv64-linux-gnu-ld {temp_dir}/out.o -o {temp_dir}/out"
                
                # Run compilation
                result = subprocess.run(
                    compile_cmd,
                    shell=True,
                    capture_output=True,
                    text=True,
                    cwd=temp_dir
                )

                if result.returncode == 0:
                    compile_success += 1
                    per_problem_results[problem_id] = "success"
                else:
                    per_problem_results[problem_id] = "failed"
                    errors[problem_id] = result.stderr
                
            except Exception as e:
                import traceback
                per_problem_results[problem_id] = "error"
                errors[problem_id] = traceback.format_exc()
                self.logger.error(f"Error compiling {problem_id}: {e}")
                
        # Calculate overall metrics
        compile_rate = compile_success / total if total > 0 else 0.0
        
        metrics = {
            'compile_rate': compile_rate,
            'per_problem_results': per_problem_results,
            'errors': errors
        }
        
        return metrics

"""Dataset implementation for HumanEval assembly code."""

import json
from pathlib import Path
import subprocess
from typing import Dict, List, Union

from src.helpers.dataset import Dataset, DatasetInstance, AssemblyLanguage, DatasetConfig


@Dataset.register('human_eval')
class HumanEvalDataset(Dataset):
    """Dataset for HumanEval assembly code.
    
    This dataset contains C programming problems from the HumanEval benchmark,
    compiled to different assembly architectures.
    
    The dataset expects data in a specific directory structure:
    data/
    ├──datasets/
    │   ├── HumanEval/
    │       ├── problem1/  # Problem directory
    │           ├── code.c  # Implementation file
    │           ├── test.c  # Test file
    ├──processed/
        ├── ARM64/      # ARM64 assembly files
        ├── RISCV/      # RISC-V assembly files
    """
    
    # Map architecture to file suffix
    arch_suffix = {
        'x86': 'x86',
        'arm64': 'arm',
        'riscv': 'risc'
    }

    def __init__(self, config: DatasetConfig):
        super().__init__(config)
        self.dataset_name = 'HumanEval'
        self.source_arch = config.source_lang  
        self.target_arch = config.target_lang  
        
        # Validate architectures
        valid_archs = {'arm64', 'riscv'}
        if self.source_arch not in valid_archs or self.target_arch not in valid_archs:
            raise ValueError(f"Invalid architecture. Must be one of: {valid_archs}")
            
        # Load dataset metadata
        self.metadata = self._load_metadata()
        
    def _load_metadata(self) -> Dict:
        """Load dataset metadata from source files and JSONL."""
        # Load assembly files
        source_jsonl = Path('data/processed') / self.source_arch.upper() / f'HumanEval_{self.arch_suffix[self.source_arch]}.jsonl'
        target_jsonl = Path('data/processed') / self.target_arch.upper() / f'HumanEval_{self.arch_suffix[self.target_arch]}.jsonl'
        print(f"Source JSONL: {source_jsonl}")
        print(f"Target JSONL: {target_jsonl}")
        if not source_jsonl.exists() or not target_jsonl.exists():
            raise ValueError(f"Missing JSONL files for {self.dataset_name}")
            
        # Load C source files
        c_files = {}
        base_path = Path('data/datasets') / self.dataset_name
        for problem_dir in base_path.glob('problem*'):
            if problem_dir.is_dir():
                code_file = problem_dir / 'code.c'
                test_file = problem_dir / 'test.c'
                if code_file.exists() and test_file.exists():
                    problem_id = problem_dir.name
                    c_files[problem_id] = {
                        'code': code_file.read_text(),
                        'test': test_file.read_text()
                    }
        
        metadata = {
            'c_files': c_files,
            'source': self._load_jsonl(source_jsonl),
            'target': self._load_jsonl(target_jsonl)
        }
        
        return metadata
    
    def _load_jsonl(self, file_path: Path, log_file: bool = False) -> List[Dict]:
        """Load entries from a JSONL file.
        
        Args:
            file_path: Path to the JSONL file
            log_file: Whether to log the file being loaded
        
        Returns:
            List of entries from the JSONL file
        """
        entries = []
        if log_file:
            self.logger.info(f"Loading JSONL file: {file_path}")
        print(f"Loading file: {file_path}")
        with open(file_path) as f:
            for line in f:
                if line.strip():
                    entry = json.loads(line)
                    entries.append(entry)
        print(f"Loaded {len(entries)} entries from {file_path}")
        return entries
    
    def load_data(self) -> List[DatasetInstance]:
        """Load all instances for inference."""
        instances = []
        
        # Create a mapping from problem ID to entries
        source_entries_map = {entry['source']: entry for entry in self.metadata['source']}
        target_entries_map = {entry['source']: entry for entry in self.metadata['target']}
        
        # Find common problem IDs
        common_ids = set(source_entries_map.keys()) & set(target_entries_map.keys())
        print(f"Found {len(common_ids)} common problem IDs")
        
        # Create instances for each problem
        for problem_id in common_ids:
            source_entry = source_entries_map[problem_id]
            target_entry = target_entries_map[problem_id]
            
            # Get C source code if available
            c_source = self.metadata['c_files'].get(problem_id, {})
            
            source_key = self.arch_suffix[self.source_arch]
            target_key = self.arch_suffix[self.target_arch]
            
            # Create dataset instance
            instance = DatasetInstance(
                instance_id=f"{self.dataset_name}/{problem_id}",
                source_lang=AssemblyLanguage(self.source_arch),
                target_lang=AssemblyLanguage(self.target_arch),
                source=source_entry[source_key],  # Contains assembly code
                target=target_entry[target_key],  # Contains assembly code
                metadata={
                    'problem_id': problem_id,
                    'c_code': c_source.get('code', ''),
                    'c_test': c_source.get('test', ''),
                    'source_verbose': source_entry.get(f'{source_key}_verbose', ''),
                    'target_verbose': target_entry.get(f'{target_key}_verbose', ''),
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
            temp_dir = Path(f"/tmp/HumanEval")
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
                    compile_cmd = f"riscv64-unknown-elf-as {asm_file} -o {temp_dir}/out.o && "
                    compile_cmd += f"riscv64-unknown-elf-ld {temp_dir}/out.o -o {temp_dir}/out"
                
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

"""Assembly code preprocessing module.

This module provides functionality for cleaning assembly code files
by removing comments and empty lines.
"""

from dataclasses import dataclass
from pathlib import Path
from typing import List
import re


@dataclass
class AssemblyPreprocessor:
    """Handles preprocessing of assembly code files.
    
    This class provides utilities for cleaning assembly code by removing
    comments and empty lines.
    
    Attributes:
        min_func_lines: Minimum lines for a valid function
        max_func_lines: Maximum lines for a valid function
    """
    min_func_lines: int = 3
    max_func_lines: int = 500
    def clean_file(self, file_path: Path) -> str:
        """Clean an assembly file by removing comments.
        
        Args:
            file_path: Path to assembly file
            
        Returns:
            Cleaned assembly code as string
        """
        with open(file_path, 'r') as f:
            content = f.read()
        return self.clean_code(content)
    
    def clean_code(self, code: str) -> str:
        """Clean assembly code by removing comments and empty lines.
        
        Args:
            code: Raw assembly code string
            
        Returns:
            Cleaned assembly code string
        """
        # Split into lines and process each one
        lines = code.split('\n')
        cleaned_lines = self._clean_lines(lines)
        
        # Join non-empty lines
        return '\n'.join(line for line in cleaned_lines if line)
    
    def _clean_lines(self, lines: List[str]) -> List[str]:
        """Clean individual lines of assembly code.
        
        Args:
            lines: List of code lines
            
        Returns:
            List of cleaned lines
        """
        cleaned = []
        for line in lines:
            # Remove comments and whitespace
            line = self._remove_comments(line).strip()
            
            # Skip empty lines
            if not line:
                continue
            
            cleaned.append(line)
        
        return cleaned
    
    def _remove_comments(self, line: str) -> str:
        """Remove comments from a line of assembly code.
        
        Handles both semicolon and hash comments:
        - ; Comment
        - # Comment
        
        Args:
            line: Single line of code
            
        Returns:
            Line with comments removed
        """
        # Remove everything after comment characters
        return re.sub(r'[#;].*$', '', line)

    def preprocess_file(self, file_path: Path) -> List[dict]:
        """Preprocess an assembly file and extract functions.
        
        Args:
            file_path: Path to assembly file
            
        Returns:
            List of dictionaries containing function info:
            - name: Function name
            - code: Cleaned function code
            - start_line: Starting line number
            - end_line: Ending line number
        """
        # Clean the file first
        cleaned_code = self.clean_file(file_path)
        
        # Split into lines
        lines = cleaned_code.split('\n')
        
        functions = []
        current_func = []
        current_name = None
        start_line = None
        
        for i, line in enumerate(lines):
            # Look for function labels (ending with :)
            if line.strip().endswith(':') and not current_func:
                current_name = line.strip()[:-1].strip()
                start_line = i
                current_func = [line]
            elif current_func:
                current_func.append(line)
                
                # End of function detection
                if line.strip() in ['ret', 'retq', 'b lr', 'ret lr']:
                    # Check function size constraints
                    if self.min_func_lines <= len(current_func) <= self.max_func_lines:
                        functions.append({
                            'name': current_name,
                            'code': '\n'.join(current_func),
                            'start_line': start_line,
                            'end_line': i
                        })
                    current_func = []
                    current_name = None
                    start_line = None
        
        # Handle last function if it exists
        if current_func and self.min_func_lines <= len(current_func) <= self.max_func_lines:
            functions.append({
                'name': current_name,
                'code': '\n'.join(current_func),
                'start_line': start_line,
                'end_line': len(lines) - 1
            })
        
        return functions
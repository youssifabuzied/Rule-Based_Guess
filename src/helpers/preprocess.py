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
    
    Args:
        log_file: Optional path to log file
        min_func_lines: Minimum lines for a valid function
        max_func_lines: Maximum lines for a valid function
    """
    log_file: str | None = None
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
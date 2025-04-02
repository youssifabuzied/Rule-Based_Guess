#!/bin/bash

# Script to compile HumanEval problems for RISC-V and ARM architectures
# Creates assembly files for each problem

# Set up directory structure
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="${BASE_DIR}/../../processed"
RISCV_DIR="${OUTPUT_DIR}/RISCV"
ARM_DIR="${OUTPUT_DIR}/ARM64"

# Create output directories if they don't exist
mkdir -p "${RISCV_DIR}"
mkdir -p "${ARM_DIR}"

# Compiler flags
RISCV_CFLAGS="-S -O2"
ARM_CFLAGS="-S -O2"

# JSONL output files
RISCV_JSONL="${RISCV_DIR}/HumanEval_risc.jsonl"
ARM_JSONL="${ARM_DIR}/HumanEval_arm.jsonl"

# Initialize JSONL files
> "${RISCV_JSONL}"
> "${ARM_JSONL}"

# Function to compile a problem
compile_problem() {
    local problem_dir="$1"
    local problem_id=$(basename "${problem_dir}")
    echo "Compiling ${problem_id}..."
    
    # Source files
    local code_file="${problem_dir}/code.c"
    local test_file="${problem_dir}/test.c"
    
    if [ ! -f "${code_file}" ] || [ ! -f "${test_file}" ]; then
        echo "  Skipping ${problem_id}: Missing code or test file"
        return
    fi
    
    # Output files
    local riscv_asm="${RISCV_DIR}/${problem_id}.risc.s"
    local arm_asm="${ARM_DIR}/${problem_id}.arm.s"
    
    # Compile for RISC-V
    echo "  Compiling for RISC-V..."
    riscv64-unknown-elf-gcc ${RISCV_CFLAGS} -march=rv64imafdc -mabi=lp64d -o "${riscv_asm}" "${code_file}" 2>/dev/null
    
    # Compile for ARM
    echo "  Compiling for ARM..."
    aarch64-unknown-linux-gnu-gcc ${ARM_CFLAGS} -march=armv8-a -o "${arm_asm}" "${code_file}" 2>/dev/null
    # Check if compilation succeeded
    if [ ! -f "${riscv_asm}" ] || [ ! -f "${arm_asm}" ]; then
        echo "  Warning: Compilation failed for ${problem_id}"
        return
    fi
    
    # Create temporary files for JSON-safe content
    local tmp_risc="${RISCV_DIR}/tmp_${problem_id}.json"
    local tmp_arm="${ARM_DIR}/tmp_${problem_id}.json"
    
    # Use perl to properly escape the content for JSON
    perl -e '
        local $/; 
        my $content = <>; 
        $content =~ s/\\/\\\\/g; 
        $content =~ s/"/\\"/g; 
        $content =~ s/\n/\\n/g; 
        print $content;
    ' "${riscv_asm}" > "${tmp_risc}"
    
    perl -e '
        local $/; 
        my $content = <>; 
        $content =~ s/\\/\\\\/g; 
        $content =~ s/"/\\"/g; 
        $content =~ s/\n/\\n/g; 
        print $content;
    ' "${arm_asm}" > "${tmp_arm}"
    
    # Read the escaped content
    local riscv_content=$(cat "${tmp_risc}")
    local arm_content=$(cat "${tmp_arm}")
    
    # Create JSON entries
    local riscv_json="{\"source\": \"${problem_id}\", \"risc\": \"${riscv_content}\", \"risc_output\": \"\", \"risc_verbose\": \"${riscv_content}\"}"
    local arm_json="{\"source\": \"${problem_id}\", \"arm\": \"${arm_content}\", \"arm_output\": \"\", \"arm_verbose\": \"${arm_content}\"}"
    
    # Append to JSONL files
    echo "${riscv_json}" >> "${RISCV_JSONL}"
    echo "${arm_json}" >> "${ARM_JSONL}"
    
    # Remove temporary files
    rm -f "${tmp_risc}" "${tmp_arm}" "${riscv_asm}" "${arm_asm}"
    
    echo "  Successfully compiled ${problem_id}"
}

# Main execution
echo "Starting compilation of HumanEval problems..."

# Find all problem directories
for problem_dir in "${BASE_DIR}"/problem*/; do
    if [ -d "${problem_dir}" ]; then
        compile_problem "${problem_dir}"
    fi
done

# Clean up any remaining temporary files
echo "Cleaning up temporary files..."
find "${RISCV_DIR}" -name "*.s" -type f -delete
find "${ARM_DIR}" -name "*.s" -type f -delete
find "${RISCV_DIR}" -name "*.tmp" -type f -delete
find "${ARM_DIR}" -name "*.tmp" -type f -delete
find "${RISCV_DIR}" -name "tmp_*.json" -type f -delete
find "${ARM_DIR}" -name "tmp_*.json" -type f -delete

echo "Compilation complete!"
echo "JSONL files created at:"
echo "  RISC-V: ${RISCV_JSONL}"
echo "  ARM: ${ARM_JSONL}"

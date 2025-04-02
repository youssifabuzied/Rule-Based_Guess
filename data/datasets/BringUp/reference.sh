#!/bin/bash

set -e  # Exit on error

if [ ! -d "bringup_bench" ]; then
    git clone git@github.com:toddmaustin/bringup-bench.git bringup_bench
    mv bringup_bench bup_bench
    git submodule deinit -f bringup_bench
    rm -rf .git/modules/bringup_bench
    git rm --cached bringup_bench || true  # Avoid errors if not tracked
    mv bup_bench bringup_bench
    rm -rf bringup_bench/.git  # Ensure it's a normal directory
fi


cd bringup_bench || { echo "Error: Failed to enter bringup_bench directory"; exit 1; }

OUTPUT_DIR="assembly_output"

mkdir -p "$OUTPUT_DIR"

for problem_dir in */; do
    problem_name="${problem_dir%/}"

    if [ ! -f "$problem_name/Makefile" ]; then
        echo "Skipping $problem_name (No Makefile found)"
        continue
    fi
    
    if [[ "$problem_name" == "anagram" || 
          "$problem_name" == "avl-tree" || 
          "$problem_name" == "blake2b" || 
          "$problem_name" == "bloom-filter" || 
          "$problem_name" == "checkers" || 
          "$problem_name" == "c-interp" || 
          "$problem_name" == "gcd-list" || 
          "$problem_name" == "graph-tests" || 
          "$problem_name" == "k-means" || 
          "$problem_name" == "longdiv" || 
          "$problem_name" == "lz-compress" || 
          "$problem_name" == "priority-queue" || 
          "$problem_name" == "rabinkarp-search" || 
          "$problem_name" == "rho-factor" || 
          "$problem_name" == "rle-compress" || 
          "$problem_name" == "satomi" || 
          "$problem_name" == "spirograph"  || "$problem_name" == "target" || "$problem_name" == "topo-sort"   ]]; then
        echo "Skipping $problem_name (need to revisit)"
        continue
    fi

    echo "Processing $problem_name..."

    # Step 1: Move into the problem directory before extracting dependencies
    cd "$problem_name"

    echo "Extracting required files from Makefile..."
    make -n TARGET=host clean build > "../$OUTPUT_DIR/$problem_name.makefile_output"

    # Extract C files (convert relative to absolute paths)
    required_files=($(grep -oE '[^ ]+\.c' "../$OUTPUT_DIR/$problem_name.makefile_output" | sort -u))

    # Extract Include paths
    include_flags=$(grep -oE ' -I[^ ]+' "../$OUTPUT_DIR/$problem_name.makefile_output" | sort -u)

    # Extract Linking flags
    link_flags=$(grep -oE ' -L[^ ]+| -l[^ ]+' "../$OUTPUT_DIR/$problem_name.makefile_output" | sort -u)
    
    # go up a level
    cd ..
    
    # Create bringup_bench_link_flags.json if it doesn't exist
    if [ ! -f "bringup_bench_link_flags.json" ]; then
        echo "{}" > "bringup_bench_link_flags.json"
    fi

    # Update JSON file with problem-specific link flags (even if empty)
    jq --arg problem "$problem_name" --arg link "$link_flags" \
   '.[$problem] = $link' "bringup_bench_link_flags.json" > tmp.json && mv tmp.json "bringup_bench_link_flags.json"
   
    # Move back into the specific problem directory for further processing
    cd "$problem_name"
    
    echo "Required files: ${required_files[*]}"
    echo "Include flags: $include_flags"
    echo "Linking flags: $link_flags"

    # Separate object files by ISA
    obj_files_risc=()
    obj_files_arm=()
    obj_files_x86=()

    # Step 2: Compile each extracted C file into an object file AND generate assembly files
    for file in "${required_files[@]}"; do
        base_name=$(basename "$file" .c)
        obj_file_risc="../$OUTPUT_DIR/$base_name.risc.o"
        obj_file_arm="../$OUTPUT_DIR/$base_name.arm.o"
        obj_file_x86="../$OUTPUT_DIR/$base_name.x86.o"

        asm_file_risc="../$OUTPUT_DIR/$base_name.risc.s"
        asm_file_arm="../$OUTPUT_DIR/$base_name.arm.s"
        asm_file_x86="../$OUTPUT_DIR/$base_name.x86.s"

        obj_files_risc+=("$obj_file_risc")
        obj_files_arm+=("$obj_file_arm")
        obj_files_x86+=("$obj_file_x86")

        # Generate assembly files (.s)
        riscv64-linux-gnu-gcc -S "$file" -DTARGET_HOST $include_flags -o "$asm_file_risc"
        aarch64-linux-gnu-gcc -S "$file" -DTARGET_HOST $include_flags -o "$asm_file_arm"
        x86_64-linux-gnu-gcc -S "$file" -DTARGET_HOST $include_flags -o "$asm_file_x86"

        # Compile to object files (.o)
        riscv64-linux-gnu-gcc -c "$file" -DTARGET_HOST $include_flags -o "$obj_file_risc"
        aarch64-linux-gnu-gcc -c "$file" -DTARGET_HOST $include_flags -o "$obj_file_arm"
        x86_64-linux-gnu-gcc -c "$file" -DTARGET_HOST $include_flags -o "$obj_file_x86"
    done


    # Step 3: Link object files into separate executables
    riscv64-linux-gnu-gcc "${obj_files_risc[@]}" -DTARGET_HOST -o "../$OUTPUT_DIR/$problem_name.risc" $link_flags
    aarch64-linux-gnu-gcc "${obj_files_arm[@]}" -DTARGET_HOST -o "../$OUTPUT_DIR/$problem_name.arm" $link_flags
    x86_64-linux-gnu-gcc "${obj_files_x86[@]}" -DTARGET_HOST -o "../$OUTPUT_DIR/$problem_name.x86" $link_flags

    # Step 4: Run binaries and capture output
    
    if [[ "$problem_name" == "anagram" ]]; then
        qemu-riscv64 -L /usr/riscv64-linux-gnu "../$OUTPUT_DIR/$problem_name.risc" "../$problem_name/words" > "../$OUTPUT_DIR/output_risc.txt"
        qemu-aarch64 -L /usr/aarch64-linux-gnu "../$OUTPUT_DIR/$problem_name.arm" "../$problem_name/words" > "../$OUTPUT_DIR/output_arm.txt"
        qemu-x86_64 -L /usr/x86_64-linux-gnu "../$OUTPUT_DIR/$problem_name.x86" "../$problem_name/words" > "../$OUTPUT_DIR/output_x86.txt"
    else
        qemu-riscv64 -L /usr/riscv64-linux-gnu "../$OUTPUT_DIR/$problem_name.risc" > "../$OUTPUT_DIR/output_risc.txt"
        qemu-aarch64 -L /usr/aarch64-linux-gnu "../$OUTPUT_DIR/$problem_name.arm" > "../$OUTPUT_DIR/output_arm.txt"
        qemu-x86_64 -L /usr/x86_64-linux-gnu "../$OUTPUT_DIR/$problem_name.x86" > "../$OUTPUT_DIR/output_x86.txt"
    fi


    # Step 5: Compare output
    expected_output="../$problem_name/$problem_name.out"
    if diff "../$OUTPUT_DIR/output_risc.txt" "$expected_output" &&
       diff "../$OUTPUT_DIR/output_arm.txt" "$expected_output" &&
       diff "../$OUTPUT_DIR/output_x86.txt" "$expected_output"; then
        echo "✅ $problem_name PASSED"
    else
        echo "❌ $problem_name FAILED"
    fi
    
    # Print current working directory for debugging
    pwd  

   # Debug: Print which file we're copying
    echo "Attempting to copy: $problem_name.c -> ../../bringup_bench/$problem_name.c"

    # Copy the main C file into bringup_bench, ensuring it's correctly named
    if [ -f "$problem_name.c" ]; then
        cp "$problem_name.c" "../../bringup_bench/$problem_name.c"
    else
        echo "Warning: $problem_name.c not found in $(pwd)! Skipping copy."
    fi

    echo "----------------------"

    # Move back to bringup_bench directory before next loop iteration
    cd ..
done

echo "All problems processed!"

echo "Parsing benchmark problems...."
cd ..
python parse.py bringup_bench/ jsonl_files/bench.jsonl

echo "Parsing complete. Check jsonl_files/ for the bench.jsonl file"
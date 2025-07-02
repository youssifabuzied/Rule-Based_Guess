#!/bin/bash

cd "$(dirname "$0")"  # Ensure we're in the script's directory

SUCCESS_LOG="passed.txt"
FAIL_LOG="failed.txt"

# Clear logs
> "$SUCCESS_LOG"
> "$FAIL_LOG"

for dir in problem*; do
    echo "Processing $dir"

    TEST_C="$dir/test.c"
    ASM_S="$dir/code.s"
    TEST_O="$dir/test.o"
    ASM_O="$dir/code.o"
    EXEC="$dir/test_exec"

    # Check required files exist
    if [[ ! -f "$TEST_C" || ! -f "$ASM_S" ]]; then
        echo "Missing files in $dir, skipping."
        continue
    fi

    # Compile C test file for ARM Linux (suppress errors)
    if ! aarch64-linux-gnu-gcc -c "$TEST_C" -o "$TEST_O" 2>/dev/null; then
        echo "Failed test: $dir (compile error)"
        echo "$dir (compile error)" >> "$FAIL_LOG"
        continue
    fi

    # Assemble the predicted ARM assembly code (suppress errors)
    if ! aarch64-linux-gnu-as "$ASM_S" -o "$ASM_O" 2>/dev/null; then
        echo "Failed test: $dir (assemble error)"
        echo "$dir (assemble error)" >> "$FAIL_LOG"
        continue
    fi

    # Link the object files, explicitly linking libc
    LINK_OUTPUT=$(aarch64-linux-gnu-gcc "$ASM_O" "$TEST_O" -o "$EXEC" -lc 2>&1)
    LINK_EXIT_CODE=$?
    if [[ $LINK_EXIT_CODE -ne 0 ]]; then
        # Only print detailed errors for linking
        if echo "$LINK_OUTPUT" | grep -qiE "undefined reference|ld: error|linker command failed"; then
            echo "Link failed in $dir with errors:"
            echo "$LINK_OUTPUT"
        else
            echo "Failed test: $dir (link error)"
        fi
        echo "$dir (link error)" >> "$FAIL_LOG"
        continue
    fi

    # Run using QEMU with 10-second timeout (suppress its output)
    timeout 10s qemu-aarch64 -L /usr/aarch64-linux-gnu "$EXEC" >/dev/null 2>&1
    EXIT_CODE=$?
    if [[ $EXIT_CODE -eq 0 ]]; then
        echo "Passed test: $dir"
        echo "$dir" >> "$SUCCESS_LOG"
    elif [[ $EXIT_CODE -eq 124 ]]; then
        echo "Failed test: $dir (timeout)"
        echo "$dir (timeout)" >> "$FAIL_LOG"
    else
        echo "Failed test: $dir (exit code: $EXIT_CODE)"
        echo "$dir (exit $EXIT_CODE)" >> "$FAIL_LOG"
    fi
done

echo ""
echo "Passed: $(wc -l < $SUCCESS_LOG)"
echo "Failed: $(wc -l < $FAIL_LOG)"

TESTED=$(( $(wc -l < "$SUCCESS_LOG") + $(wc -l < "$FAIL_LOG") ))
echo "Tested: $TESTED"

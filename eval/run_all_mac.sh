#!/bin/bash

cd "$(dirname "$0")"  # Ensure we are in the eval/ directory

SUCCESS_LOG="passed.txt"
FAIL_LOG="failed.txt"

# Clear logs
> "$SUCCESS_LOG"
> "$FAIL_LOG"

for dir in problem*; do
    echo "Testing $dir..."

    CODE_S="$dir/new_code.s"
    TEST_C="$dir/test.c"
    CODE_O="$dir/code.o"
    TEST_O="$dir/test.o"
    EXEC="$dir/test_exec"

    # Ensure required files exist
    if [[ ! -f "$CODE_S" || ! -f "$TEST_C" ]]; then
        echo "Failed: $dir (missing files)"
        echo "$dir (missing files)" >> "$FAIL_LOG"
        continue
    fi

    # Assemble new_code.s -> code.o
    if ! clang -target arm64-apple-macos -c "$CODE_S" -o "$CODE_O" 2>/dev/null; then
        echo "Failed: $dir (assembly error)"
        echo "$dir (assembly error)" >> "$FAIL_LOG"
        continue
    fi

    # Compile test.c -> test.o
    if ! clang -target arm64-apple-macos -c "$TEST_C" -o "$TEST_O" 2>/dev/null; then
        echo "Failed: $dir (compile error)"
        echo "$dir (compile error)" >> "$FAIL_LOG"
        continue
    fi

    # Link code.o + test.o -> test_exec
    LINK_OUTPUT=$(clang -target arm64-apple-macos "$CODE_O" "$TEST_O" -o "$EXEC" 2>&1)
    LINK_EXIT=$?
    if [[ $LINK_EXIT -ne 0 ]]; then
        echo "Failed: $dir (link error)"
        echo "$LINK_OUTPUT" >> "$FAIL_LOG"
        echo "$dir (link error)" >> "$FAIL_LOG"
        continue
    fi

    # Run the test
    if "$EXEC" > /dev/null 2>&1; then
        echo "Passed: $dir"
        echo "$dir" >> "$SUCCESS_LOG"
    else
        echo "Failed: $dir (runtime error)"
        echo "$dir (runtime error)" >> "$FAIL_LOG"
    fi
done

echo ""
echo "Summary:"
echo "Passed: $(wc -l < "$SUCCESS_LOG")"
echo "Failed: $(wc -l < "$FAIL_LOG")"
TOTAL=$(( $(wc -l < "$SUCCESS_LOG") + $(wc -l < "$FAIL_LOG") ))
echo "Total Tested: $TOTAL"

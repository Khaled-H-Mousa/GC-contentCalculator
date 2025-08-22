#!/bin/bash

# A simpler and more efficient GC Content Calculator using awk.
# Usage: ./gc_content_simple.sh input.fasta

# 1. Check if an input file was provided.
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input.fasta"
    exit 1
fi

input_file=$1

# 2. Check if the input file exists.
if [ ! -f "$input_file" ]; then
    echo "Error: File $input_file not found!"
    exit 1
fi

# 3. Use awk to process the file in a single pass.
# awk is a powerful tool that reads a file line-by-line and can execute
# actions based on patterns. It's much faster because it doesn't need
# to call external programs like `wc` or `tr` in a loop.

awk '

/^>/ {
    if (seq_length > 0) {
        gc_content = (gc_count / seq_length) * 100
        printf "Sequence Length: %d\n", seq_length
        printf "GC Content: %.2f%%\n", gc_content
        print "----------------------------------------"
    }
    print $0 
    gc_count = 0
    seq_length = 0
    next 
}

{
    gsub(/[ \t\r\n]+/, "")

    gc_count += gsub(/[GgCc]/, "&")

    seq_length += length($0)
}

END {
    if (seq_length > 0) {
        gc_content = (gc_count / seq_length) * 100
        printf "Sequence Length: %d\n", seq_length
        printf "GC Content: %.2f%%\n", gc_content
        print "----------------------------------------"
    }
}
' "$input_file"

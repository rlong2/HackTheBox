#!/bin/bash

# Define the input file and output file
INPUT_FILE="/usr/share/wordlists/rockyou.txt"
OUTPUT_FILE="/tmp/hashes.txt"
TARGET_HASH="2cb42f8734ea607eefed3b70af13bbd3"

# Clear the output file if it exists
> "$OUTPUT_FILE"

echo "Hashing $INPUT_FILE to $OUTPUT_FILE"

# Read each line from the input file
while IFS= read -r password; do
    # Compute the MD5 hash of the password
    HASH=$(echo -n "$password" | md5sum | awk '{print $1}')
    # Append the password and its hash to the output file
    echo "$password: $HASH" >> "$OUTPUT_FILE"

    # Check if the hash matches the target hash
    if [ "$HASH" == "$TARGET_HASH" ]; then
        echo "Hash found: $password"
        exit 0  # Exit the script if the hash is found
    fi
done < "$INPUT_FILE"

echo "No matching hash found"


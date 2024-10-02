#!/bin/bash
# you need to install qemu and aarch64-elf-gcc to run this script
# brew install qemu
# brew install aarch64-elf-gcc

# Check if an assembly file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <assembly_file.S>"
    exit 1
fi

mkdir -p build
ASM_FILE="$1"
BASENAME=$(basename "$ASM_FILE" .S)
ELF_FILE="./build/${BASENAME}.elf"

# Check if the assembly file exists
if [ ! -f "$ASM_FILE" ]; then
    echo "Error: Assembly file '$ASM_FILE' not found."
    exit 1
fi

# Check if linker.ld exists
if [ ! -f "./linker.ld" ]; then
    echo "Error: 'linker.ld' not found in the current directory."
    exit 1
fi

# Compile the assembly file
echo "Compiling $ASM_FILE..."
aarch64-elf-gcc -nostdlib -T linker.ld -o "$ELF_FILE" "$ASM_FILE"

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Compilation successful. Output file: $ELF_FILE"

# Run the binary in QEMU
echo "Running $ELF_FILE in QEMU..."
qemu-system-aarch64 -M virt -cpu cortex-a53 -kernel "$ELF_FILE"

# End of script

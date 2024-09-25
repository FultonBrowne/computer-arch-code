#!/bin/bash

# Check if the user has provided an ASM file as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <ASM_FILE>"
    exit 1
fi

# Get the input ASM file and strip the extension to get the base name
ASM_FILE=$1
BASE_NAME=$(basename "$ASM_FILE" .s)

# Create the build directory if it doesn't exist
BUILD_DIR="./build"
mkdir -p "$BUILD_DIR"

# Assemble the .s file into an object file in the build directory
as -o "${BUILD_DIR}/${BASE_NAME}.o" "$ASM_FILE"
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

# Link the object file to create the executable in the build directory
ld -macosx_version_min 14.0.0 -o "${BUILD_DIR}/${BASE_NAME}" "${BUILD_DIR}/${BASE_NAME}.o" \
   -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

# Run the resulting executable
echo "Running ${BUILD_DIR}/${BASE_NAME}..."
"${BUILD_DIR}/${BASE_NAME}"

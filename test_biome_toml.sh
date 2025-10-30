#!/bin/bash
# Test script for Biome CLI with TOML support
# This script demonstrates all the commands that can be used with the playground

echo "==================================="
echo "Biome CLI - TOML Integration Test"
echo "==================================="
echo ""

# Navigate to the biome directory
cd "$(dirname "$0")/submodules/biome"

echo "Building Biome CLI..."
cargo build --release -p biome_cli
echo ""

if [ $? -ne 0 ]; then
    echo "Build failed! Please check the error messages above."
    exit 1
fi

BIOME_BIN="./target/release/biome"
FLAGS="--no-errors-on-unmatched"

echo "==================================="
echo "1. Checking all files in playground"
echo "==================================="
cd playground
../$BIOME_BIN check $FLAGS *.js *.ts *.json *.css *.html *.toml
cd ..
echo ""

echo "==================================="
echo "2. Formatting TOML file (check only)"
echo "==================================="
cd playground
../$BIOME_BIN format $FLAGS sample.toml
cd ..
echo ""

echo "==================================="
echo "3. Linting TOML file"
echo "==================================="
cd playground
../$BIOME_BIN lint $FLAGS sample.toml
cd ..
echo ""

echo "==================================="
echo "4. Formatting all files (check only)"
echo "==================================="
cd playground
../$BIOME_BIN format $FLAGS *.js *.ts *.json *.css *.html *.toml
cd ..
echo ""

echo "==================================="
echo "5. Format specific file types"
echo "==================================="
echo "JavaScript files:"
cd playground
../$BIOME_BIN format $FLAGS *.js
cd ..
echo ""

echo "TypeScript files:"
cd playground
../$BIOME_BIN format $FLAGS *.ts
cd ..
echo ""

echo "JSON files:"
cd playground
../$BIOME_BIN format $FLAGS *.json
cd ..
echo ""

echo "CSS files:"
cd playground
../$BIOME_BIN format $FLAGS *.css
cd ..
echo ""

echo "TOML files:"
cd playground
../$BIOME_BIN format $FLAGS *.toml
cd ..
echo ""

echo "==================================="
echo "6. Checking version"
echo "==================================="
$BIOME_BIN --version
echo ""

echo "==================================="
echo "Test Complete!"
echo "==================================="
echo ""
echo "To format files with write mode, use:"
echo "  $BIOME_BIN format --write playground/"
echo ""
echo "To check and fix all files:"
echo "  $BIOME_BIN check --write playground/"

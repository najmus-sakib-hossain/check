# Quick Reference - Biome + Taplo Integration

## Build

```bash
cd submodules/biome
cargo build --release -p biome_cli
```

## Run Commands

### Format TOML

```bash
# Check only
./target/release/biome format --check playground/sample.toml

# Apply formatting
./target/release/biome format --write playground/sample.toml
```

### Lint TOML

```bash
./target/release/biome lint playground/sample.toml
```

### Check TOML (Lint + Format)

```bash
# Check only
./target/release/biome check playground/sample.toml

# Check and apply fixes
./target/release/biome check --write playground/sample.toml
```

### Process All Files

```bash
# Check all files in playground (includes all languages)
./target/release/biome check playground/

# Format all files
./target/release/biome format --write playground/

# Lint all files
./target/release/biome lint playground/
```

## Playground Contents

Located at: `submodules/biome/playground/`

- ✅ `sample.js` - JavaScript
- ✅ `sample.ts` - TypeScript  
- ✅ `sample.json` - JSON
- ✅ `sample.css` - CSS
- ✅ `sample.graphql` - GraphQL
- ✅ `sample.html` - HTML
- ✅ `sample.toml` - **TOML (NEW with Taplo)**

## Key Files Modified

1. `submodules/biome/Cargo.toml` - Added Taplo workspace deps
2. `submodules/biome/crates/biome_cli/Cargo.toml` - Added Taplo to biome_cli
3. `submodules/biome/crates/biome_cli/src/execute/process_file/toml.rs` - **NEW** TOML handler
4. `submodules/biome/crates/biome_cli/src/execute/process_file/format.rs` - Routes .toml files
5. `submodules/biome/crates/biome_cli/src/execute/process_file/lint_and_assist.rs` - Routes .toml files
6. `submodules/biome/crates/biome_cli/src/execute/process_file/check.rs` - Routes .toml files

## Documentation

- `SUMMARY.md` - Overview and quick start
- `TOML_INTEGRATION.md` - Detailed technical documentation
- `playground/README.md` - Playground usage guide
- `test_biome_toml.sh` - Automated test script

## Test

```bash
./test_biome_toml.sh
```

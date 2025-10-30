# TOML Support Integration in Biome CLI

## Overview

This document describes the integration of TOML formatting and linting capabilities into Biome CLI using the Taplo library. The integration allows Biome to format and lint TOML files alongside its existing support for JavaScript, TypeScript, JSON, CSS, GraphQL, and HTML.

## Changes Made

### 1. Workspace Dependencies

**File**: `submodules/biome/Cargo.toml`

Added Taplo crates as workspace dependencies:

```toml
# Taplo - TOML formatting and linting
taplo        = { version = "0.14.0", path = "../taplo/crates/taplo", features = ["serde"] }
taplo-cli    = { version = "0.10.0", path = "../taplo/crates/taplo-cli" }
taplo-common = { version = "0.6.0", path = "../taplo/crates/taplo-common" }
```

### 2. Biome CLI Dependencies

**File**: `submodules/biome/crates/biome_cli/Cargo.toml`

Added Taplo dependencies to biome_cli:

```toml
taplo                    = { workspace = true }
taplo-common             = { workspace = true }
```

### 3. TOML Processing Module

**File**: `submodules/biome/crates/biome_cli/src/execute/process_file/toml.rs` (NEW)

Created a dedicated module for TOML file processing with three main functions:

- `format_toml()`: Formats TOML files using Taplo's formatter
  - Parses TOML content
  - Checks for syntax errors
  - Applies formatting
  - Writes formatted output or reports differences

- `lint_toml()`: Lints TOML files using Taplo's parser and validator
  - Checks for syntax errors
  - Validates semantic correctness (duplicate keys, invalid structures)
  - Reports diagnostics

- `check_toml()`: Combines lint and format operations
  - First validates the file
  - Then formats it if validation passes

### 4. Integration Points

#### Format Command

**File**: `submodules/biome/crates/biome_cli/src/execute/process_file/format.rs`

Modified to detect `.toml` files and route them to Taplo:

```rust
if path.extension().map_or(false, |ext| ext == "toml") {
    return super::toml::format_toml(ctx, path);
}
```

#### Lint Command

**File**: `submodules/biome/crates/biome_cli/src/execute/process_file/lint_and_assist.rs`

Modified to detect `.toml` files and route them to Taplo:

```rust
if path.extension().map_or(false, |ext| ext == "toml") {
    return super::toml::lint_toml(ctx, path);
}
```

#### Check Command

**File**: `submodules/biome/crates/biome_cli/src/execute/process_file/check.rs`

Modified to detect `.toml` files and route them to Taplo:

```rust
if path.extension().map_or(false, |ext| ext == "toml") {
    return super::toml::check_toml(ctx, path);
}
```

#### Module Declaration

**File**: `submodules/biome/crates/biome_cli/src/execute/process_file.rs`

Added toml module:

```rust
mod toml;
```

### 5. Playground Directory

**Directory**: `submodules/biome/playground/`

Created a comprehensive testing playground with sample files for all supported languages:

- `sample.js` - JavaScript with ES6+ features
- `sample.ts` - TypeScript with types and interfaces
- `sample.json` - JSON (package.json example)
- `sample.css` - CSS with modern features
- `sample.graphql` - GraphQL schema
- `sample.html` - HTML5 document
- `sample.toml` - Comprehensive TOML examples
- `biome.json` - Biome configuration
- `README.md` - Usage documentation

## Usage Examples

### Formatting TOML Files

```bash
# Check if formatting is needed
biome format --check playground/sample.toml

# Format TOML file
biome format --write playground/sample.toml

# Format all TOML files
biome format --write playground/*.toml
```

### Linting TOML Files

```bash
# Lint TOML file
biome lint playground/sample.toml

# Lint with detailed output
biome lint --verbose playground/sample.toml
```

### Checking TOML Files (Lint + Format)

```bash
# Check TOML file
biome check playground/sample.toml

# Check and fix
biome check --write playground/sample.toml

# Check all files in playground
biome check playground/
```

## Technical Details

### File Detection

TOML files are detected by their `.toml` extension. The detection happens at the beginning of each processing function (format, lint, check) before the standard Biome workspace file handling.

### Error Handling

- **Parse Errors**: Reported as diagnostics with file path and error location
- **Semantic Errors**: Validated by Taplo's DOM validator
- **IO Errors**: Handled with appropriate error categories

### Integration Architecture

```
Biome CLI
  ├─ process_file()
  │   ├─ format()
  │   │   └─ toml::format_toml() [if .toml]
  │   ├─ lint_and_assist()
  │   │   └─ toml::lint_toml() [if .toml]
  │   └─ check_file()
  │       └─ toml::check_toml() [if .toml]
  │
  └─ Taplo Integration
      ├─ taplo::parser::parse()
      ├─ taplo::formatter::format_with_path_scopes()
      └─ DOM validation
```

## TOML Features Supported

The integration via Taplo supports all standard TOML features:

- Basic key-value pairs
- Tables and nested tables
- Arrays and table arrays (inline arrays `[[table]]`)
- Inline tables
- Multi-line strings (literal and basic)
- All data types: strings, integers, floats, booleans, dates/times
- Comments
- Unicode support

## Benefits

1. **Unified CLI**: Single command-line tool for multiple languages
2. **Consistent Experience**: Same flags and options across all file types
3. **Fast Performance**: Leverages Taplo's efficient parser and formatter
4. **Comprehensive Validation**: Both syntax and semantic checks
5. **Workspace Integration**: Uses Biome's existing path handling and reporting

## Testing

The playground directory provides comprehensive test files. To test the integration:

```bash
# Navigate to the playground
cd submodules/biome/playground

# Format all files
biome format --write .

# Lint all files
biome lint .

# Check all files
biome check --write .
```

## Future Enhancements

Potential improvements for future iterations:

1. **Schema Validation**: Integrate Taplo's schema validation for specific TOML formats
2. **Configuration**: Add TOML-specific formatting options to biome.json
3. **Custom Rules**: Implement Biome-specific linting rules for TOML
4. **Auto-fix**: Add support for automatic fixes of common TOML issues
5. **LSP Integration**: Extend Biome's LSP to support TOML files

## Dependencies

- `taplo` (v0.14.0): Core TOML parser and formatter
- `taplo-common` (v0.6.0): Common utilities for Taplo
- Located at: `../taplo/crates/taplo` and `../taplo/crates/taplo-common`

## Notes

- The integration uses workspace paths for Taplo crates, ensuring proper dependency resolution
- TOML files bypass Biome's standard workspace file handling to use Taplo directly
- Error messages maintain consistency with Biome's diagnostic system
- The implementation respects Biome's execution modes (check, write, skip-parse-errors)

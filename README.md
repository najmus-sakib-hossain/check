# Check

Dx Check is a powerful tool within the dx suite, designed to deliver the fastest formatting and linting capabilities available. It automatically formats and lints code in real-time on file changes or via Language Server Protocol (LSP) integration, ensuring high code quality and consistency across diverse projects. Supporting a wide range of programming languages, Dx Check integrates seamlessly into modern development workflows, providing instant feedback and reducing manual effort. With customizable rules, lightweight architecture, and cross-platform compatibility, it enhances productivity by catching issues early. Its extensible plugin system allows for additional tools and custom checks. You don't have to write any cli commands, just save your files and let Dx Check handle the rest. It will not only fix common fixable issue but also fix linting issue that needs manual intervention automatically.

## Supported Languages

Keep it in mind that even through dx-check makes it easy to use existing formatters and linters but it shines for its super easy plugin system that allows you to add more tools and even write your own custom checks.

| Language               | Linter       | Formatter    |
|------------------------|--------------|--------------|
| HTML                   | biome        | biome        |
| CSS                    | biome        | biome        |
| JavaScript+TypeScript  | biome        | biome        |
| JSON                   | biome        | biome        |
| YAML                   | biome        | biome        |
| Markdown               | rumdl        | rumdl        |
| TOML                   | taplo        | taplo        |
| Python                 | ruff         | ruff         |
| PHP                    | mago         | mago         |
| Go                     | gold         | gofmt.rs     |
| Rust                   | rust-clippy  | rustfmt      |
| C                      | cpp-linter-rs| cpp-linter-rs|
| C++                    | cpp-linter-rs| cpp-linter-rs|
| Java+Kotlin            | ktlint       | ktlint       |

---

## 🎉 NEW: Biome CLI + Taplo TOML Integration

### Overview

I've successfully integrated **Taplo** TOML formatting and linting into **Biome CLI**! Biome can now handle TOML files alongside JavaScript, TypeScript, JSON, CSS, GraphQL, and HTML.

### Quick Start

```bash
# Build Biome with TOML support
cd submodules/biome
cargo build --release -p biome_cli

# Test with the playground
./target/release/biome check playground/

# Format TOML files
./target/release/biome format --write playground/sample.toml

# Lint TOML files
./target/release/biome lint playground/sample.toml
```

### What's New

- ✅ **TOML Support**: Format and lint `.toml` files using Taplo
- ✅ **Playground**: Sample files for all 7 supported languages
- ✅ **Unified CLI**: Same commands work for all file types
- ✅ **Complete Integration**: Seamless Taplo integration in Biome

### Documentation

| Document | Description |
|----------|-------------|
| [SUMMARY.md](SUMMARY.md) | Project overview and usage guide |
| [TOML_INTEGRATION.md](TOML_INTEGRATION.md) | Technical implementation details |
| [QUICK_REFERENCE.md](QUICK_REFERENCE.md) | Command reference cheat sheet |
| [ARCHITECTURE.md](ARCHITECTURE.md) | Visual architecture diagrams |
| [CHECKLIST.md](CHECKLIST.md) | Implementation task list |

### Playground

The `submodules/biome/playground/` directory contains comprehensive sample files:

- `sample.js` - JavaScript
- `sample.ts` - TypeScript
- `sample.json` - JSON
- `sample.css` - CSS
- `sample.graphql` - GraphQL
- `sample.html` - HTML
- `sample.toml` - **TOML (NEW!)**

### Test It

```bash
# Run the automated test script
./test_biome_toml.sh

# Or test manually
cd submodules/biome
./target/release/biome check playground/
```

**Status:** ✅ Integration Complete and Ready for Testing!

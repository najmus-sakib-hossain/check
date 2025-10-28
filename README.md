# dx-check

dx-check is one of the tools in the dx suite, offering the fastest formatting and linting capabilities. It automatically formats and lints code on file changes or through Language Server Protocol (LSP) integration.

## Supported Languages

Additionally, dx-check supports the following languages out of the box:

| Language               | Linter       | Formatter    |
|------------------------|--------------|--------------|
| HTML                   | biome        | biome        |
| CSS                    | biome        | biome        |
| JavaScript+TypeScript  | biome        | biome        |
| JSON                   | biome        | biome        |
| YAML                   | biome        | biome        |
| Markdown               | rumdl        | N/A          |
| TOML                   | taplo        | taplo        |
| Python                 | ruff         | ruff         |
| PHP                    | mago         | mago         |
| Go                     | gold         | gofmt.rs     |
| Rust                   | rust-clippy  | rustfmt      |
| C                      | cpp-linter-rs| cpp-linter-rs|
| C++                    | cpp-linter-rs| cpp-linter-rs|
| Java+Kotlin            | ktlint       | ktlint       |

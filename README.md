# Check

Dx Check is a powerful tool within the dx suite, designed to deliver the fastest formatting and linting capabilities available. It automatically formats and lints code in real-time on file changes or via Language Server Protocol (LSP) integration, ensuring high code quality and consistency across diverse projects. Supporting a wide range of programming languages, Dx Check integrates seamlessly into modern development workflows, providing instant feedback and reducing manual effort. With customizable rules, lightweight architecture, and cross-platform compatibility, it enhances productivity by catching issues early. Its extensible plugin system allows for additional tools and custom checks. You don't have to write any cli commands, just save your files and let Dx Check handle the rest. It will not only fix common fixable issue but also fix linting issue that needs manual intervention automatically.

## Supported Languages

Keep it in mind that even through dx-check makes it easy to use existing formatters and linters but it shines for its super easy plugin system that allows you to add more tools and even write your own custom checks.

| Language               | Linter       | Formatter    | Status |
|------------------------|--------------|--------------|--------|
| HTML                   | biome        | biome        | yes    |
| CSS                    | biome        | biome        | yes    |
| JavaScript+TypeScript  | biome        | biome        | yes    |
| JSON                   | biome        | biome        | yes    |
| Markdown               | rumdl        | rumdl        | yes    |
| TOML                   | taplo        | taplo        | yes    |
| Python                 | ruff         | ruff         | yes    |
| C+Cpp                  | cpp-linter-rs| cpp-linter-rs| yes    |
| Kotlin                 | ktlint       | ktlint       | yes    |
| PHP                    | mago         | mago         | yes    |
| Go                     | gold         | gofmt.rs     | yes    |
| Rust                   | rust-clippy  | rustfmt      | no     |

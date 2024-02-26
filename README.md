<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/jeffersonroth/jjrf-data-reliability-book">
    <img src="assets/images/logo.svg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Data Reliability Engineering</h3>

  <p align="center">
    Book about data reliability engineering, data quality, and data architecture.
    <br />
    <br />
    <a href="https://jeffersonroth.github.io/jjrf-data-reliability-book/">Preview</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#development">Development</a></li>
    <li><a href="#dependencies">Dependencies</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- GETTING STARTED -->

## Getting Started

1. Clone the repo

   ```sh
   git clone https://github.com/jeffersonroth/jjrf-data-reliability-book.git
   ```

2. Serve the book locally

   ```sh
   docker compose up
   ```

3. Check the rendered book in [localhost](localhost:3000)

<!-- DEVELOPMENT -->

## Development

Before pushing your local branch:

1. Generate SVG files from the PlantUML diagrams and save them to [assets](./src/assets/).

2. Review the content in [localhost](localhost:3000)

3. Run linters

   ```sh
   markdownlint-cli2 --config ./.github/files/config.markdownlint-cli2.jsonc --fix > mdlint
   ```

4. Run link checkers

  ```sh
  find . -name \*.md -print0 | xargs -0 -n1 markdown-link-check --config ./.github/files/markdown.links.config.json > mdlink
  ```

<!-- DEPENDENCIES -->

## Dependencies

### Docker Image
>
> Docker image used to build the book in html.

* [jeffroth/mdbook-environment](https://hub.docker.com/r/jeffroth/mdbook-environment)

### mdBook Plugins
>
> mdBook plugins to generate table of contents, render Mermaid diagrams, etc.

* [mdbook](https://crates.io/crates/mdbook)
* [mdbook-toc](https://crates.io/crates/mdbook-toc)
* [mdbook-footnote](https://crates.io/crates/mdbook-footnote)
* [mdbook-emojicodes](https://crates.io/crates/mdbook-emojicodes)
* [mdbook-mermaid](https://crates.io/crates/mdbook-mermaid)
* [mdbook-plantuml](https://crates.io/crates/mdbook-plantuml)
* [mdbook-catppuccin](https://crates.io/crates/mdbook-catppuccin)
* [~~mdbook-linkcheck~~](https://crates.io/crates/mdbook-linkcheck)
* [~~mdbook-i18n~~](https://crates.io/crates/mdbook-i18n)
* [~~mdbook-admonish~~](https://crates.io/crates/mdbook-admonish)
* [~~mdbook-svgbob~~](https://crates.io/crates/mdbook-svgbob)
* [~~mdbook-man~~](https://crates.io/crates/mdbook-man)
* [~~mdbook-pdf~~](https://crates.io/crates/mdbook-pdf)
* [~~mdbox-katex~~](https://crates.io/crates/mdbook-katex)
* [~~mdbook-epub~~](https://crates.io/crates/mdbook-epub)
* [~~mdbook-template~~](https://crates.io/crates/mdbook-template)

### Math Jax
>
> Enable writing mathematical formulae in markdown format.

* [Documentation](https://bearnok.com/grva/en/knowledge/software/mathjax)
* [Playground](https://www.mdraft.net/)

### Markdown Linter
>
> CLI tool to check and apply lint rules in markdown files.

* [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2)
* [Rules](https://github.com/DavidAnson/markdownlint)

### Markdown Links Check
>
> CLI tool to validate all hyperlinks in markdown files.

* [markdown-link-check](https://github.com/tcort/markdown-link-check)

### Hand-drawn SVG Style
>
> Tool that applies different hand-drawn styles to SVG files. This project uses Ballpoint pen style.

* [instad.io](https://go.instad.io/)

### PlantUML to SVG
>
> Tool that convert PlantUML code in SVG format.

* [Official](https://www.plantuml.com/plantuml)
* [PlantText](https://www.planttext.com/)

### Mermaid
>
> Mermaid diagrams.

* [Official](https://mermaid.live/)

<!-- LICENSE -->

## License

Copyright (C) 2021 Jefferson Johannes Roth Filho. See `LICENSE` for more information.

<!-- CONTACT -->

## Contact

Jefferson Roth - <jjrothfilho@gmail.com>

Project Link: [https://github.com/jeffersonroth/jjrf-data-reliability-book](https://github.com/jeffersonroth/jjrf-data-reliability-book)

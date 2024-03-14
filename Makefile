.PHONY: admonish catppuccin preprocessors serve mdlint mdlink md

THEME_DIR = ./theme

admonish:
	mdbook-admonish install --css-dir ${THEME_DIR} .

catppuccin:
	mdbook-catppuccin install

preprocessors: admonish catppuccin

serve:
	mdbook serve --hostname 0.0.0.0

mdlint:
	markdownlint-cli2 --config ./.github/files/config.markdownlint-cli2.jsonc --fix | tee mdlint.log

mdlink:
	find . -name \*.md -print0 | xargs -0 -n1 markdown-link-check --config ./.github/files/markdown.links.config.json | tee mdlink.log

md: mdlint mdlink

THEME_DIR = ./theme

admonish:
	mdbook-admonish install --css-dir ${THEME_DIR} .

catppuccin:
	mdbook-catppuccin install

preprocessors: admonish catppuccin

serve:
	mdbook serve --hostname 0.0.0.0

mdlint:
	markdownlint-cli2 --config ./.github/files/config.markdownlint-cli2.jsonc --fix | tee mdlint

mdlink:
	find . -name \*.md -print0 | xargs -0 -n1 markdown-link-check --config ./.github/files/markdown.links.config.json | tee mdlink

md: mdlint mdlink

mdlint2:
	docker run -w /workdir -v $(PWD):/workdir davidanson/markdownlint-cli2:v0.12.1 "**/*.md" --config /workdir/.github/files/config.markdownlint-cli2.jsonc --fix | tee mdlint

mdlink2:
	find . -name \*.md -print0 | xargs -0 -I{} docker run -v ${PWD}:/tmp:ro --rm -i ghcr.io/tcort/markdown-link-check:stable /tmp/{} --config /tmp/.github/files/markdown.links.config.json | tee mdlink

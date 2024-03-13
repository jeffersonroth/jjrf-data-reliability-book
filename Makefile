THEME_DIR = ./theme

admonish:
	mdbook-admonish install --css-dir ${THEME_DIR} .

catppuccin:
	mdbook-catppuccin install

preprocessors: admonish catppuccin
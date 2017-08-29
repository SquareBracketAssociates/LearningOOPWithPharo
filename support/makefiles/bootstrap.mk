.PHONY: bootstrap help

help:
	@echo "The main makefile relies on pillar."
	@echo "Install it in this project it by running (one-shot):"
	@echo "  make bootstrap"

bootstrap:
	wget --quiet --output-document=- 'https://raw.githubusercontent.com/pillar-markup/pillar/master/download.sh' | bash -s $$*

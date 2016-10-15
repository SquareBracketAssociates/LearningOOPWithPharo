MAIN = book
OUTPUTDIRECTORY = ./build
LATEXTEMPLATE = ./support/templates/main.latex.mustache
HTMLTEMPLATE = ./support/templates/html.mustache

.DEFAULT_GOAL = help

.phony: all book pdf html clean fullclean

all: pdf html ## Build the book in all formats
book: all
pdf: $(OUTPUTDIRECTORY)/$(MAIN).pdf ## Build the PDF book
html: $(OUTPUTDIRECTORY)/$(MAIN).html ## Build the HTML book

clean: ## Cleanup intermediate build products
	latexmk -cd -c $(OUTPUTDIRECTORY)/$(MAIN) || true

fullclean: ## Cleanup everything including final build products
	rm -fr ${OUTPUTDIRECTORY}

include ./support/makefiles/prepare.mk
include ./support/makefiles/epub.mk
include ./support/makefiles/help.mk

$(OUTPUTDIRECTORY)/%.tex.json: %.pillar prepare
	./pillar export --to="LaTeX" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.tex: $(OUTPUTDIRECTORY)/%.tex.json
	./mustache --data=$< --template=${LATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	latexmk -cd -use-make $<

$(OUTPUTDIRECTORY)/%.html.json: %.pillar prepare
	./pillar export --to="HTML" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	./mustache --data=$< --template=${HTMLTEMPLATE} > $@

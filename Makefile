MAIN = book
CHAPTERS = \
	Chapters/Introduction/Introduction \
	Chapters/PlayingWithTurtles/PlayingWithTurtles \
	Chapters/SyntaxNutshell/SyntaxNutshell \
	Chapters/Katas/GramKatas \
	Chapters/Katas/GramVariation \
	Chapters/ObjectsAndClasses/ObjectsAndClasses \
	Chapters/Converter/Converter \
	Chapters/JoeTheBox/JoeTheBox \
	Chapters/SimpleLAN/SimpleLANDefinition \
	Chapters/PaperStoneScissor/PaperStoneScissor \
	Chapters/Counter/Counter \
	Chapters/DSL/DSL \
	Chapters/Solutions/Solutions \
	Chapters/OOPNutshell/OOPNutshell \
	Chapters/Tests/Tests \
	Chapters/Expressions/Expressions \
	Chapters/Wallet/Wallet

OUTPUTDIRECTORY = build
LATEXTEMPLATE = support/templates/main.latex.mustache
LATEXCHAPTERTEMPLATE = support/templates/chapter.latex.mustache
HTMLTEMPLATE = support/templates/html.mustache
HTMLCHAPTERTEMPLATE = $(HTMLTEMPLATE)

.DEFAULT_GOAL = help
.phony: all book chapters

all: pdf html ## Build everything in all formats
book: pdfbook htmlbook ## Full book only, all formats
chapters: pdfchapters htmlchapters ## Separate chapters, all formats

include support/makefiles/help.mk
include support/makefiles/prepare.mk

include support/makefiles/pdf.mk
include support/makefiles/html.mk
include support/makefiles/epub.mk

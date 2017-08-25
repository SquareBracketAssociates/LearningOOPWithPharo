MAIN = learningoop
CHAPTERS = \
	Chapters/Introduction/Introduction \
	Chapters/Tests/Tests \
	Chapters/GettingStarted/GettingStarted \
	Chapters/GettingStarted/ChallengingYourself \
	Chapters/PlayingWithTurtles/PlayingWithTurtles \
	Chapters/Counter/Counter \
	Chapters/Katas/GramKatas \
	Chapters/Katas/GramVariation \
	Chapters/Converter/Converter \
	Chapters/Converter/Converter2 \
	Chapters/Wallet/Wallet \
	Chapters/DSL/DSL \
	Chapters/TinyChat/TinyChat \
	Chapters/SnakesAndLadders/SnakesAndLadders \
	Chapters/JoeTheBox/JoeTheBox \
	Chapters/PaperStoneScissor/PaperStoneScissor \
	Chapters/DoubleDispatch/DoubleDispatch \
	Chapters/Inheritance/Inheritance \
	Chapters/Inheritance/Extending \
	Chapters/SyntaxGlimpse/SyntaxGlimpse \
	Chapters/Expressions/Expressions \
	Chapters/SimpleLAN/SimpleLANDefinition \
	Chapters/OOPNutshell/OOPNutshell \
	Chapters/BeaconAndSatellite/BeaconAndSatellite \
	Chapters/Tamagoshi/Tamagoshi \
	Chapters/MessageSending/MessageSending \
	Chapters/Solutions/Solutions \
	Chapters/GettingStarted/ChallengingYourselfSolution \
	Chapters/ObjectsAndClasses/ObjectsAndClasses \
	Chapters/SyntaxNutshell/SyntaxNutshell \

OUTPUTDIRECTORY = build
LATEXTEMPLATE = support/templates/main.latex.mustache
LATEXCHAPTERTEMPLATE = support/templates/chapter.latex.mustache
HTMLTEMPLATE = support/templates/html.mustache
HTMLCHAPTERTEMPLATE = $(HTMLTEMPLATE)

OUTPUTDIRECTORY := $(shell ./pillar introspect outputDirectory)
LATEXTEMPLATE := $(shell ./pillar introspect latexTemplate)
LATEXCHAPTERTEMPLATE := $(shell ./pillar introspect latexChapterTemplate)
HTMLTEMPLATE := $(shell ./pillar introspect htmlTemplate)
HTMLCHAPTERTEMPLATE := $(shell ./pillar introspect htmlChapterTemplate)

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

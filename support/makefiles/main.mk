MAIN := $(shell ./pillar introspect mainDocument)

# we have to cleanup pillar's answer because it resolves the outputDirectory to
# an absolute path before outputting it
OUTPUTDIRECTORY := $(patsubst $(CURDIR)/%,%,$(shell ./pillar introspect outputDirectory))

CHAPTERS := $(shell ./pillar introspect chapters)
LATEXTEMPLATE := $(shell ./pillar introspect latexTemplate)
LATEXCHAPTERTEMPLATE := $(shell ./pillar introspect latexChapterTemplate)
HTMLTEMPLATE := $(shell ./pillar introspect htmlTemplate)
HTMLCHAPTERTEMPLATE := $(shell ./pillar introspect htmlChapterTemplate)

.phony: all book chapters

all: pdf html ## Build everything in all formats
book: pdfbook htmlbook ## Full book only, all formats
chapters: pdfchapters htmlchapters ## Separate chapters, all formats

include support/makefiles/help.mk
include support/makefiles/prepare.mk
include support/makefiles/pdf.mk
include support/makefiles/html.mk
include support/makefiles/epub.mk

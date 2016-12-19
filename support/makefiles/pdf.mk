$(call check_defined, LATEXTEMPLATE, Template for main document in PDF)
$(call check_defined, LATEXCHAPTERTEMPLATE, Template for individual chapters in PDF)

.phony: pdf pdfbook pdfchapters pdf-clean

pdf: pdfbook pdfchapters ## Everything PDF
pdfbook: $(OUTPUTDIRECTORY)/$(MAIN).pdf
pdfchapters: $(CHAPTERS:%=$(OUTPUTDIRECTORY)/%.pdf)

clean: pdf-clean
pdf-clean:
	for f in $(addprefix $(OUTPUTDIRECTORY)/,$(MAIN) $(CHAPTERS)); do \
		latexmk -cd -f -c "$$f" ; \
		rm -f "$$f.tex" "$$f.tex.json" ; \
	done

$(OUTPUTDIRECTORY)/$(MAIN).tex.json: $(CHAPTERS:%=%.pillar)
$(OUTPUTDIRECTORY)/%.tex.json: %.pillar | prepare
	./pillar export --to="LaTeX" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/$(MAIN).tex: TEMPLATE = $(LATEXTEMPLATE)
$(CHAPTERS:%=$(OUTPUTDIRECTORY)/%.tex): TEMPLATE = $(LATEXCHAPTERTEMPLATE)
$(OUTPUTDIRECTORY)/%.tex: $(OUTPUTDIRECTORY)/%.tex.json $(TEMPLATE)
	./mustache --data=$< --template=$(TEMPLATE) > $@

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	latexmk -cd -use-make $<

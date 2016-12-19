$(call check_defined, HTMLTEMPLATE, Template for main document in HTML)
$(call check_defined, HTMLCHAPTERTEMPLATE, Template for individual chapters in HTML)

.phony: html htmlbook htmlchapters html-clean

html: htmlbook htmlchapters ## Everything HTML
htmlbook: $(OUTPUTDIRECTORY)/$(MAIN).html
htmlchapters: $(CHAPTERS:%=$(OUTPUTDIRECTORY)/%.html)

clean: html-clean
html-clean:
	for f in $(addprefix $(OUTPUTDIRECTORY)/,$(MAIN) $(CHAPTERS)); do \
		rm -f "$$f.html.json" ; \
	done

$(OUTPUTDIRECTORY)/$(MAIN).html.json: $(CHAPTERS:%=%.pillar)
$(OUTPUTDIRECTORY)/%.html.json: %.pillar | prepare
	./pillar export --to="HTML" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/$(MAIN).html: TEMPLATE = $(HTMLTEMPLATE)
$(CHAPTERS:%=$(OUTPUTDIRECTORY)/%.html): TEMPLATE = $(HTMLCHAPTERTEMPLATE)
$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json $(TEMPLATE)
	./mustache --data=$< --template=$(TEMPLATE) > $@

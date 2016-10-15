XHTMLTEMPLATE = ./support/templates/xhtml.mustache.template
NAVMENUTEMPLATE = ./support/templates/nav.mustache.template
TOCMENUTEMPLATE = ./support/templates/toc.mustache.template
CONTENTOPFTEMPLATE = ./support/templates/contentopf.mustache.template
TITLEPAGETEMPLATE = ./support/templates/title_page.mustache.template

.SECONDARY:

#EPUB
$(OUTPUTDIRECTORY)/%.epub: $(OUTPUTDIRECTORY)/%.content.opf
	mkdir -p $(OUTPUTDIRECTORY)/Ibook
	cp ./support/ePub_support/Mimetype $(OUTPUTDIRECTORY)/Ibook/
	cp -r ./support/ePub_support/META-INF $(OUTPUTDIRECTORY)/Ibook/
	cp ./support/style/stylesheet.css $(OUTPUTDIRECTORY)/Ibook/
	mv $(OUTPUTDIRECTORY)/$*.xhtml $(OUTPUTDIRECTORY)/Ibook/chapter.xhtml
	#Move all the file begining by the outputFile name
	bash ./support/scripts/moveFilesToIbook.sh $* $(OUTPUTDIRECTORY)/
	cd $(OUTPUTDIRECTORY)/Ibook/; zip -r ../tmp.zip *
	mv $(OUTPUTDIRECTORY)/tmp.zip $@
	rm -r $(OUTPUTDIRECTORY)/Ibook

#Navigation Menus
$(OUTPUTDIRECTORY)/%.nav.xhtml.json: %.pillar
	./pillar export --to="navmenu" --path="${<}" --outputDirectory=$(OUTPUTDIRECTORY) $<

$(OUTPUTDIRECTORY)/%.nav.xhtml: $(OUTPUTDIRECTORY)/%.nav.xhtml.json
	./mustache --data=$< --template=$(NAVMENUTEMPLATE) > $@

$(OUTPUTDIRECTORY)/%.toc.ncx.json: %.pillar
	./pillar export --to="tocmenu" --path="${<}" --outputDirectory=$(OUTPUTDIRECTORY) $<

$(OUTPUTDIRECTORY)/%.toc.ncx: $(OUTPUTDIRECTORY)/%.toc.ncx.json
	./mustache --data=$< --template=$(TOCMENUTEMPLATE) > $@

#Content.opf & title_page.xhtml
$(OUTPUTDIRECTORY)/%.content.opf: $(OUTPUTDIRECTORY)/%.xhtml $(OUTPUTDIRECTORY)/%.toc.ncx $(OUTPUTDIRECTORY)/%.nav.xhtml $(OUTPUTDIRECTORY)/%.title_page.xhtml
	./mustache --data=$<.json --template=$(CONTENTOPFTEMPLATE) > $@

$(OUTPUTDIRECTORY)/%.title_page.xhtml: $(OUTPUTDIRECTORY)/%.xhtml
	./mustache --data=$<.json --template=$(TITLEPAGETEMPLATE) > $@

#Chapter compilation
$(OUTPUTDIRECTORY)/%.xhtml.json: %.pillar
	./pillar export --to="xhtml" --path="${<}" --outputDirectory=$(OUTPUTDIRECTORY) $<

$(OUTPUTDIRECTORY)/%.xhtml: $(OUTPUTDIRECTORY)/%.xhtml.json
	./mustache --data=$< --template=$(XHTMLTEMPLATE) > $@

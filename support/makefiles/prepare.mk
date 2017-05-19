$(call check_defined, OUTPUTDIRECTORY, Directory for build products)
$(call check_defined, MAIN, Base name of the main document)
$(call check_defined, CHAPTERS, Base names of the chapters)

.phony: prepare clean wipeout download prepare-build

FIGURES := $(shell find . \
		-type f \
		-path '*/figures/*' \
		! -path './$(OUTPUTDIRECTORY)/*' \
		! -path './support/*' \
		-print)

# Install build tools & dependencies, create the build directory structure
prepare: pillar mustache prepare-build

# wrapper scripts for pillar and mustache are created together from the pillar install script
pillar mustache: | download
download: ## Install Pharo VM & image for Pillar & Mustache
	wget --quiet --output-document=- "https://raw.githubusercontent.com/pillar-markup/pillar/master/download.sh" | bash -s $$*

clean: ## Cleanup intermediate build products
	rm -f $(addprefix $(OUTPUTDIRECTORY)/, support gitHeadLocal.gin)
	for f in $(addprefix $(OUTPUTDIRECTORY)/,$(MAIN) $(CHAPTERS)); do \
		rm -f "$$(dirname $$f)/root" ; \
	done

wipeout: ## Cleanup everything including final build products
	rm -fr ${OUTPUTDIRECTORY}

# create & initialize output directory, mirroring stuff that has to match the
# repo hierarchy inside the output dir.
prepare-build: $(addprefix $(OUTPUTDIRECTORY)/, support gitHeadLocal.gin $(FIGURES))

$(OUTPUTDIRECTORY):
	mkdir -p $(OUTPUTDIRECTORY)

$(OUTPUTDIRECTORY)/support: $(OUTPUTDIRECTORY)
	ln -fs ../support $(OUTPUTDIRECTORY)

# extract versioning info for LaTeX
$(OUTPUTDIRECTORY)/gitHeadLocal.gin: $(OUTPUTDIRECTORY)
	bash support/latex/sbabook/gitinfo2.sh > $@

# this is making hardlinks (symlinks are verbose with absolute paths and
# computing relative paths is… complicated)
$(FIGURES:%=$(OUTPUTDIRECTORY)/%): $(OUTPUTDIRECTORY)/% : %
	@mkdir -p $(dir $@)
	cp $< $@

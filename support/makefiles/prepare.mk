$(call check_defined, OUTPUTDIRECTORY, Directory for build products)
$(call check_defined, MAIN, Base name of the main document)
$(call check_defined, CHAPTERS, Base names of the chapters)

# Check for spaces in the current directory
ifneq "1" "$(words $(CURDIR))"
  $(error Project path contains whitespace ($(CURDIR)))
endif

.phony: prepare clean wipeout

FIGURES := $(shell find . \
		-type f \
		-path '*/figures/*' \
		! -path './$(OUTPUTDIRECTORY)/*' \
		! -path './support/*' \
		-print)

clean: ## Cleanup intermediate build products
	rm -f $(addprefix $(OUTPUTDIRECTORY)/, support gitHeadLocal.gin)
	for f in $(addprefix $(OUTPUTDIRECTORY)/,$(MAIN) $(CHAPTERS)); do \
		rm -f "$$(dirname $$f)/root" ; \
	done

wipeout: ## Cleanup everything including final build products
	rm -fr ${OUTPUTDIRECTORY}

# create & initialize output directory, mirroring stuff that has to match the
# repo hierarchy inside the output dir.
prepare: $(addprefix $(OUTPUTDIRECTORY)/, support gitHeadLocal.gin $(FIGURES))

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

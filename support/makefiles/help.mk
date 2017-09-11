# Some shell magic to auto-document the main targets. To have a target appear in
# the output, add a short, one-line comment with a double ## on the same line as
# the target.
#
# See http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

.phony: help

help: ## Describe the main targets (this list)
	@echo "Main targets you can build:"
	@awk -F ':|## *' \
		'/^[^\t].+:.*##/ {\
			printf "  \033[36m%s\033[0m#%s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) \
	| column -s# -t
	@[ -n "$(ALTERNATEPRINTFORMATS)" ] \
		&& echo "Print format alternatives: pdf $(ALTERNATEPRINTFORMATS)"
	@echo "Combined format+volume targets: pdfbook, htmlchapters…"
	@echo "To make a single specific file/format, ask for it explicitly:"
	@echo "  make $(OUTPUTDIRECTORY)/$(firstword $(CHAPTERS)).pdf"

# Allows debugging the value of Make variables (e.g. make print-FIGURES)
debug-% : ; @echo $($*)

# Check that given variables are set and all have non-empty values,
# die with an error otherwise.
#
# Params:
#   1. Variable name(s) to test.
#   2. (optional) Error message to print.
#
# See http://stackoverflow.com/questions/10858261/abort-makefile-if-variable-not-set
check_defined = \
		$(strip $(foreach 1,$1, \
				$(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
		$(if $(value $1),, \
			$(error Undefined setting $1$(if $2, ($2))))

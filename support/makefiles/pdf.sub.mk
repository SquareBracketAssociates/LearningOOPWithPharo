export TEXINPUTS=root/support/latex//:

-include $(wildcard *.d)

%.pdf: %.tex
	latexmk -lualatex -use-make \
		-file-line-error -halt-on-error \
		-deps-out="$*.d" \
		$<

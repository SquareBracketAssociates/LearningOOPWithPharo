-include $(wildcard *.d)

%.pdf: %.tex
	TEXINPUTS=.:root/support/latex//: \
	latexmk -lualatex -use-make \
		-latexoption="--file-line-error --halt-on-error" \
		-deps-out="$*.d" \
		$<

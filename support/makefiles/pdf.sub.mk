-include $(wildcard *.d)

%.pdf: %.tex
	latexmk -lualatex -use-make \
		-latexoption="--file-line-error --halt-on-error" \
		-deps-out="$*.d" \
		$<

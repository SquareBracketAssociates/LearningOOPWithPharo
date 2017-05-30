-include $(wildcard *.d)

%.pdf: root/support/latex/%.pdf
	ln $<

%.pdf: %.tex
	TEXINPUTS=root/support/latex//: \
	latexmk -lualatex -use-make -recorder \
		-latexoption="--file-line-error --halt-on-error" \
		-deps-out="$*.d" \
		$<

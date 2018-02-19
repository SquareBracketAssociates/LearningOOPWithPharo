export TEXINPUTS=root/support/latex//:

-include $(wildcard *.d)

%.pdf: root/support/latex/%.pdf
	ln -f $< $@

%.pdf: %.tex
	latexmk -lualatex -use-make -recorder \
		-file-line-error -halt-on-error \
		-deps-out="$*.d" \
		$<

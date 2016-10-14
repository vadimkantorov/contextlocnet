contextlocnet_eccv2016_poster.pdf:
	pdflatex $(basename $@)
	bibtex $(basename $@)
	pdflatex $(basename $@)
	pdflatex $(basename $@)

clean:
	find . -name contextlocnet_eccv2016_poster.pdf -o -name '*.text.bak' -o  -name '*.aux' -o -name '*.bbl' -o -name '*.blg' -o -name '*.brf' -o -name '*.log' -o -name '*.synctex.gz' -o -name '*.out' -o -name '*.snm' -o -name '*.nav' -o -name '*.vrb' -o -name '*.toc' -o -name '*~' | xargs rm

.PHONY: clean

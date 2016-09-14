contextlocnet_eccv2016.pdf:
	pdflatex $(basename $@)
	bibtex $(basename $@)
	pdflatex $(basename $@)
	pdflatex $(basename $@)

clean:
	rm contextlocnet_eccv2016.pdf *.text.bak *.aux *.bbl *.blg *.brf *.log *.synctex.gz *.out *~

.PHONY: clean

contextlocnet_eccv2016.pdf contextlocnet_eccv2016.bbl:
	pdflatex $(basename $@)
	bibtex $(basename $@)
	pdflatex $(basename $@)
	pdflatex $(basename $@)

clean:
	rm contextlocnet_eccv2016.pdf *.text.bak *.aux *.bbl *.blg *.brf *.log *.synctex.gz *.out *~ *.tar

arxiv: contextlocnet_eccv2016.bbl
	tar -cf contextlocnet_eccv2016.tar *.tex *.bib *.bbl *.sty *.bst *.cls figures/*.tex images/*.pdf

.PHONY: clean

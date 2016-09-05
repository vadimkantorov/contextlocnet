images:
	magick -density 300 http://raw.githubusercontent.com/vadimkantorov/contextlocnet/paper/figures/model.pdf -trim +repage -resize 50% model.jpg
	magick -density 300 http://raw.githubusercontent.com/vadimkantorov/contextlocnet/paper/eccv2016_kantorov_paper.pdf[0] -trim -resize 20% thumbnail.jpg

deploy:
	@#scp index.html *.jpg di.ens.fr:/users/thetis/willow/www/research/contextlocnet
	@cp index.html *.jpg /meleze/data0/public_html/kantorov/contextlocnet
	@echo copied to https://www.rocq.inria.fr/cluster-willow/kantorov/contextlocnet

.PHONY: deploy images

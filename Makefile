images:
	wget http://raw.githubusercontent.com/vadimkantorov/contextlocnet/paper/images/model.pdf http://github.com/vadimkantorov/contextlocnet/releases/download/1.0/contextlocnet_eccv2016.pdf
	convert -density 300 model.pdf -trim +repage -resize 50% -fuzz 10% -transparent white model.png
	convert -density 300 contextlocnet_eccv2016.pdf[0] BMP3:thumbnail.bmp
	convert thumbnail.bmp -trim -resize 20% thumbnail.jpg
	rm *.pdf *.bmp

deploy:
	@#scp index.html *.jpg di.ens.fr:/users/thetis/willow/www/research/contextlocnet
	@cp index.html *.jpg *.png /meleze/data0/public_html/kantorov/contextlocnet
	@echo copied to https://www.rocq.inria.fr/cluster-willow/kantorov/contextlocnet

.PHONY: deploy images

images:
	wget http://github.com/vadimkantorov/contextlocnet/releases/download/1.0/contextlocnet_eccv2016.pdf http://raw.githubusercontent.com/vadimkantorov/contextlocnet/paper/images/model.pdf http://raw.githubusercontent.com/vadimkantorov/contextlocnet/paper/images/detectionresults_goodbad_1_compressed.pdf
	convert -density 300 detectionresults_goodbad_1_compressed.pdf -trim +repage -resize 50% detections.jpg
	convert -density 300 model.pdf -trim +repage -resize 50% -fuzz 10% -transparent white model.png
	convert -density 300 contextlocnet_eccv2016.pdf[0] BMP3:thumbnail.bmp
	convert thumbnail.bmp -trim -resize 20% thumbnail.jpg
	rm *.pdf *.bmp

view:
	@cp index.html *.jpg *.png /meleze/data0/public_html/kantorov/contextlocnet
	@echo https://www.rocq.inria.fr/cluster-willow/kantorov/contextlocnet

.PHONY: view images

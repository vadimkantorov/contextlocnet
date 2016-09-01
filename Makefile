deploy:
	@#scp index.html *.jpg di.ens.fr:/users/thetis/willow/www/research/contextlocnet
	@cp index.html *.jpg /meleze/data0/public_html/kantorov/contextlocnet
	@echo copied to https://www.rocq.inria.fr/cluster-willow/kantorov/contextlocnet

.PHONY: deploy

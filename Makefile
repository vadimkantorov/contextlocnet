deploy:
	scp -r index.html *.jpg di.ens.fr:/users/thetis/willow/www/research/contextlocnet

.PHONY: deploy

VOC2007:
  wget -P ./data/common \
    http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtrainval_06-Nov-2007.tar \
    http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar \
    http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCdevkit_08-Jun-2007.tar \
    http://koen.me/research/downloads/SelectiveSearchVOC2007trainval.mat \
    http://koen.me/research/downloads/SelectiveSearchVOC2007test.mat
  cd data/common && for f in *.tar *.tgz; do tar -xf $f; done
  
VOC2012:
  wget -P ./data/common \
    http://host.robots.ox.ac.uk:8080/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar \
    http://host.robots.ox.ac.uk:8080/eval/downloads/VOC2012test.tar \
    http://host.robots.ox.ac.uk:8080/pascal/VOC/voc2012/VOCdevkit_18-May-2011.tar \
    http://people.eecs.berkeley.edu/~rbg/fast-rcnn-data/selective_search_data.tgz
  cd data/common && for f in *.tar *.tgz; do tar -xf $f; done

VGGF:
  wget -P ./data/common \
    http://www.robots.ox.ac.uk/~vgg/software/deep_eval/releases/bvlc/VGG_CNN_F.caffemodel \
    https://gist.githubusercontent.com/ksimonyan/a32c9063ec8e1118221a/raw/6a3b8af023bae65669a4ceccd7331a5e7767aa4e/VGG_CNN_F_deploy.prototxt

all: VOC2007 VOC2012 VGGF
  
.PHONY: VOC2007 VOC2012 VGGF

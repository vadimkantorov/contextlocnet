# Information & Contact
If you use this code, please cite our work:
> @inproceedings{kantorov2016,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title = {ContextLocNet: Context-aware Deep Network Models for Weakly Supervised Localization},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;author = {Kantorov, V., Oquab, M., Cho M. and Laptev, I.},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;booktitle = {Proc. European Conference on Computer Vision (ECCV), IEEE, 2016},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;year = {2016}  
}

The results are available on the [project website](http://www.di.ens.fr/willow/research/contextlocnet) and in the paper. Please submit bugs and ask questions on [GitHub](http://github.com/vadimkantorov/contextlocnet/issues) directly, for other inquiries please contact [Vadim Kantorov](mailto:vadim.kantorov@gmail.com).

This is a joint work of [Vadim Kantorov](http://vadimkantorov.com), [Maxime Oquab](http://github.com/qassemoquab), [Minsu Cho](http://www.di.ens.fr/~mcho), and [Ivan Laptev](http://www.di.ens.fr/~laptev).

# Running the code
1. Install the dependencies: [Torch](http://github.com/torch/distro) with [cuDNN](http://developer.nvidia.com/cudnn) support; [HDF5](http://www.hdfgroup.org/HDF5/); [matio](http://github.com/tbeu/matio); [protobuf](http://github.com/google/protobuf); Luarocks packages [rapidjson](http://github.com/xpol/lua-rapidjson), [hdf5](http://github.com/deepmind/torch-hdf5), [matio](http://github.com/soumith/matio-ffi.torch), [loadcaffe](http://github.com/szagoruyko/loadcaffe).

  We strongly recommend using [wigwam](http://wigwam.in/) for this (fix the paths to `nvcc` and `libcudnn.so` before running the command):

  ```$ wigwam install torch hdf5 matio protobuf lua-rapidjson lua-hdf5 lua-matio lua-loadcaffe -DPATH_TO_NVCC="/path/to/cuda/bin/nvcc" -DPATH_TO_CUDNN_SO="/path/to/cudnn/lib64/libcudnn.so"```
2. Clone this repository and compile the ROI pooling module:

  ```
  $ git clone https://github.com/vadimkantorov/contextlocnet
  $ (cd ./contextlocnet/model && luarocks make)
  ```
3. Download the [VOC 2007](http://host.robots.ox.ac.uk/pascal/VOC/voc2007/) dataset and Koen van de Sande's [selective search windows](http://koen.me/research/selectivesearch/) for VOC 2007 (optionally download the [VOC 2012](http://host.robots.ox.ac.uk/pascal/VOC/voc2012/) and Rob Girshick's [selective search windows](https://github.com/rbgirshick/fast-rcnn/blob/master/data/scripts/fetch_fast_rcnn_models.sh)) and the [VGG-F](https://gist.github.com/ksimonyan/a32c9063ec8e1118221a) model:
  
  ```
  $ make -f data/common/Makefile download_and_extract_VOC2007 download_VGGF
  $ # make -f data/common/Makefile download_and_extract_VOC2012
  ```
4. Preprocess the VOC data and convert the VGG-F model to Torch format:

  ```
  $ th preprocess.lua VOC VGGF
  ```
5. Choose a dataset, a model (our best model is `model/contrastive_s.lua`, other choices are `model/contrastive_a.lua`, `model/additive.lua`, and `model/wsddn_repro.lua`) and train it:

  ```
  $ export MODEL=model/contrastive_s.lua
  $ export DATASET=VOC2007
  $ th train.lua
  ```
6. Test the trained model and compute CorLoc and mAP:

  ```
  $ SUBSET=trainval th test.lua
  $ th corloc.lua
  $ SUBSET=test th test.lua
  $ th detection_mAP.lua
  ```
  
# Acknowledgements & Notes
We greatly thank Hakan Bilen, Relja Arandjelović and Soumith Chintala for fruitful discussion and help.

This work would not have been possible without prior work: Hakan Bilen's [WSDDN](http://github.com/hbilen/WSDDN), Spyros Gidaris's [LocNet](http://github.com/gidariss/LocNet), Sergey Zagoruyko's [loadcaffe](http://github.com/szagoruyko/loadcaffe), Facebook FAIR's [fbnn/Optim.lua](http://github.com/facebook/fbnn/blob/master/fbnn/Optim.lua).

The code is released under the [MIT](http://github.com/vadimkantorov/contextlocnet/blob/master/LICENSE.md) license.

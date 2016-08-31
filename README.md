# Information & Contact
If you use this code, please cite our work:
> @inproceedings{kantorov2016,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title = {ContextLocNet: Context-aware Deep Network Models for Weakly Supervised Localization},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;author = {Kantorov, V., Oquab, M., Cho M. and Laptev, I.},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;booktitle = {Proc. European Conference on Computer Vision (ECCV), IEEE, 2016},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;year = {2016}  
}

The results are available on the [project website](http://www.di.ens.fr/willow/research/contextlocnet) and in the paper.

Please submit bugs and ask questions on [GitHub](http://github.com/vadimkantorov/contextlocnet/issues) directly, for other inquiries please contact [Vadim Kantorov](mailto:vadim.kantorov@gmail.com).

# Running the code
1. Install the dependencies:
  - [Torch](http://github.com/torch/distro) with cuDNN support
  - [HDF5](http://www.hdfgroup.org/HDF5/)
  - [matio](http://github.com/tbeu/matio)
  - Luarocks packages: [rapidjson](http://github.com/xpol/lua-rapidjson), [hdf5](http://github.com/deepmind/torch-hdf5), [matio](http://github.com/soumith/matio-ffi.torch). Suggested command: `$ luarocks install rapidjson hdf5 matio`.
2. Download and unpack the [VOC](http://host.robots.ox.ac.uk/pascal/VOC/) datasets and [selective search windows](http://koen.me/research/selectivesearch/):
  - VOC 2007:
    
    ```
    $ wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtrainval_06-Nov-2007.tar http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCdevkit_08-Jun-2007.tar
    $ wget http://koen.me/research/downloads/SelectiveSearchVOC2007trainval.mat http://koen.me/research/downloads/SelectiveSearchVOC2007test.mat
    ```
  - VOC 2012:
    
    ```
    $ wget http://host.robots.ox.ac.uk:8080/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar http://host.robots.ox.ac.uk:8080/eval/downloads/VOC2012test.tar http://host.robots.ox.ac.uk:8080/pascal/VOC/voc2012/VOCdevkit_18-May-2011.tar
    ```
3. Clone this repository: `$ git clone https://github.com/vadimkantorov/contextlocnet`

# Acknowledgements
The code is released under the [MIT](http://github.com/vadimkantorov/contextlocnet/blob/master/LICENSE.md) license.

# Gages through the ages GIF and stand-alone png

![alt text](./markDownImages/gages_gif.png "The 2024 map from the Gages Through the Ages gif created with this folder's pipeline.")

This RStudio .Rproj uses a `targets` pipeline to build a gif and a stand alone png of the gages from 1889 to current. 

To run this, you will need the requisite file `data/active_flow_gages_summary_wy.rds` which is created through another pipeline. See the README.md in the parent directory "gages-through-the-ages/" for more information.

In addition, you will need to install the packages listed on the `_targets.R` file, in the `tar_option_set()` list.

Run `targets::tar_make()` to build the gif and the stand alone png.
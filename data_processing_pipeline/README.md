# Data processing pipeline for underlying data in this viz.

This pipeline and viz are based on earlier work in [gages-through-ages](https://github.com/USGS-VIZLAB/gages-through-ages) but have been updated to current data and code best practices.

This is a `scipiper` pipeline built inside of a Javascript project. So, the first thing you need to do before running it, is set your working directory to this location.

`setwd("data_processing_pipeline")`

Next, this relies on the `national-flow-observations` pipeline, which is a huge long build to get all flow observations to accurately count active gages from NWIS. Please see [the national-flow-observations repo](https://github.com/USGS-R/national-flow-observations) for more information. We will be using data pulled down from the S3 bucket that the pipeline used. For this to work, you need to be on VPN!

```
library(scipiper)
scmake()
```

The following are the files that actually need to be shared with other developers to complete the visualization.

```
2_process/out/site_map.rds
2_process/out/year_data.json
2_process/out/bar_data.xml
2_process/out/urban_areas_co_1970.geojson
2_process/out/urban_areas_ga_1970.geojson
2_process/out/urban_areas_co_2018.geojson
2_process/out/urban_areas_ga_2018.geojson
2_process/out/slider_past_sites_inview.geojson
2_process/out/slider_present_sites_inview.geojson
2_process/out/states_map.svg
```

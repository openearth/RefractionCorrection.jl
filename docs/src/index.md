```@meta
CurrentModule = RefractionCorrection
```

# RefractionCorrection.jl
This is the documentation of [RefractionCorrection.jl](https://github.com/openearth/RefractionCorrection.jl).
RefractionCorrection is a Julia library to correct bathymetric pointclouds from LiDAR.


**Current features**

* Account and correct for refraction, both angle and speed
* Gathers LIDAR returns into individual pulses
* Load `.laz` pointclouds with `LazIO` library
* Writes results to new pointcloud


**Not yet implemented**
* Editing file
* Custom classes and filtering
* Water surface as single reference plane


## Contents

```@contents
Pages = ["getting_started.md", "usage.md",
"function_index.md"]
```

# RefractionCorrection

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/dev)
[![Build Status](https://travis-ci.org/openearth/RefractionCorrection.jl.svg?branch=master)](https://travis-ci.org/openearth/RefractionCorrection.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/2jlw1y0bw5nigrf7/branch/master?svg=true)](https://ci.appveyor.com/project/evetion/refractioncorrection-jl/branch/master)
[![codecov](https://codecov.io/gh/openearth/RefractionCorrection.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/openearth/RefractionCorrection.jl)

RefractionCorrection is a Julia library to correct bathymetric pointclouds from LiDAR.


## Install
The package is not yet registered. Requires Julia >= 1.3
```julia
]add https://github.com/openearth/RefractionCorrection.jl.git
```

## Example
```julia
using RefractionCorrection
using LazIO

fn_in = "pointcloud.laz"
fn_out = "corrected_pointcloud.laz"

ds = LazIO.open(fn_in)
points = collect(ds)
correct!(points)

write!(fn_out, ds, points)
```

For more examples see the docs [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/stable) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/dev)

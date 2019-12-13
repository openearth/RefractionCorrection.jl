# RefractionCorrection

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/dev)
[![Build Status](https://travis-ci.org/openearth/RefractionCorrection.jl.svg?branch=master)](https://travis-ci.org/openearth/RefractionCorrection.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/evetion/RefractionCorrection.jl?svg=true)](https://ci.appveyor.com/project/evetion/RefractionCorrection-jl)
[![codecov](https://codecov.io/gh/openearth/RefractionCorrection.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/openearth/RefractionCorrection.jl)



## Install
```julia
]add RefractionCorrection
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

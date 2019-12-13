# RefractionCorrection

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://openearth.github.io/RefractionCorrection.jl/dev)
[![Build Status](https://travis-ci.com/openearth/RefractionCorrection.jl.svg?branch=master)](https://travis-ci.com/openearth/RefractionCorrection.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/openearth/RefractionCorrection.jl?svg=true)](https://ci.appveyor.com/project/openearth/RefractionCorrection-jl)
[![Coverage](https://codecov.io/gh//.jl/branch/master/graph/badge.svg)](https://codecov.io/gh//.jl)


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

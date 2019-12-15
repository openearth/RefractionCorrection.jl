# Getting started

First install the package on Julia 1.3 or later.

```julia
]add https://github.com/openearth/RefractionCorrection.jl.git
```
A simple use-case.

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

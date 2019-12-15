using RefractionCorrection
using Documenter

makedocs(;
    modules=[RefractionCorrection],
    authors="Vasilis Alexandridis, Maarten Pronk",
    repo="https://github.com/openearth/RefractionCorrection.jl/blob/{commit}{path}#L{line}",
    sitename="RefractionCorrection.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://openearth.github.io/RefractionCorrection.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/openearth/RefractionCorrection.jl",
)

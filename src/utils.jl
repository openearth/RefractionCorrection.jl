"Convert Cartesian to Spherical coordinates"
function cart2pol(x::Real, y::Real, z::Real)
    ρ = sqrt(x^2 + y^2 + z^2)  # distance
    θ = atand(y, x)  # horizontal angle
    ϕ = acosd(z / ρ)  # incidence angle
    (ρ, θ, ϕ)
end

"Convert Spherical to Cartesian coordinates"
function pol2cart(ρ::Real, θ::Real, ϕ::Real)
    sθ, cθ = sincosd(θ)
    sϕ, cϕ = sincosd(ϕ)
    x = ρ * sϕ * cθ
    y = ρ * sϕ * sθ
    z = ρ * cϕ
    (x, y, z)
end

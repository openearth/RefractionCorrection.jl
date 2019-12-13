using LazIO

const c_air, c_water = 2.997*10^8, 2.25*10^8
const n_air_water = c_water/c_air

function correct!(ws::LazIO.LazPoint, uw::LazIO.LazPoint)
    x, y, z = correct((ws.X, ws.Y, ws.Z), (uw.X, uw.Y, uw.Z))
    uw.X = round(Int32, x)
    uw.Y = round(Int32, y)
    uw.Z = round(Int32, z)
    uw
end

"Correct an underwater point according to a watersurface point from the refraction factor by using Snell's Law."
function correct(watersurface::Tuple{Real,Real,Real}, underwater::Tuple{Real,Real,Real})
    x0, y0, z0 = watersurface
    x1, y1, z1 = underwater
    Δx, Δy, Δz = (x1-x0), (y1-y0), (z1-z0)

    if Δz >= 0.
        throw(DomainError(Δz, "The underwater point can not be equal or greater in the z dimension to the watersurface point."))
    end

    xcor, ycor, zcor = correct(Δx, Δy, Δz)

    # Define the new corrected coordinates of the points
    xnew = x0 + xcor
    ynew = y0 + ycor
    znew = z0 - zcor

    return (xnew, ynew, znew)
end


function correct(Δx::Real, Δy::Real, Δz::Real)

    # Calculate the distance of the two points (ρ), the vertical-incidence angle (ϕ) and horizontal angle (θ) between the two points
    ρ, θ, ϕ = cart2pol(Δx, Δy, -Δz)

    # Calculate the underwater angle due to the refraction effect.
    # Using Snell's Law: n(air)*sin(ϕ_air) = n(water)*sin(ϕ_water),
    # where ϕ_air: the angle of incidence (I know that the angle of the scan is 20)
    #      ϕ_water: the angle of refraction
    #      n(air): the refraction idex of medium containing the incident ray, value=1.000293
    #      n(water): the refraction idex of medium containing the transmitted ray, value=1.333
    ϕ_water = asind(n_air_water * sind(ϕ))

    # Distance under the water has been influenced by the different speed of light in the water.
    # In a specific moment, ρ = c_air * t and ρ_water = c_water * t.
    # So, by diving these two equations, the ratio (ρ1/ρ2) = n_air_water
    ρ_water = (ρ * n_air_water)

    # Calculate the correction in the 3d space using the pol2cart function
    pol2cart(ρ_water, θ, ϕ_water)
end

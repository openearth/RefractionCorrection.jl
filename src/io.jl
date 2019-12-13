using LazIO
using ProgressMeter

function correct!(points::Vector{LazIO.LazPoint})
    sort!(points, by=x->(x.gps_time, LazIO.return_number(x)))
    prevpoint = points[1]
    n = 0
    first = points[1]
    @inbounds @showprogress "Correcting " for i in eachindex(points)
        point = points[i]
        Δt = point.gps_time - prevpoint.gps_time
        nr = LazIO.number_of_returns(point)
        rn = LazIO.return_number(point)
        # println("$rn of $nr with diff $Δt at $i")
        if (nr > 1) && (rn == n+1)
            if rn == 1
                # @info "first $i"
                first = point
                point.classification = 19
            elseif Δt < 1e-7
                # @info "corr $i"
                try
                    correct!(first, point)
                    point.classification = 20
                catch e
                    @warn "Can't correct $i"
                    point.classification = 21
                end
            else
                point.classification = 22
            end

            # point.intensity /= first.intensity

            if nr == rn
                n = 0
            else
                n += 1
            end
        else
            # @info "skip $i"
            n = 0
            point.classification = 10
        end
        points[i] = point
        prevpoint = point
    end
    points
end

function write!(fn, ds, points)
    LazIO.write(fn, ds.header) do io
        for p in points
            LazIO.writepoint(io, p)
        end
    end
end

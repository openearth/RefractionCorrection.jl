using RefractionCorrection
using Test
# using LazIO

@testset "RefractionCorrection.jl" begin

    @testset "Correct file" begin
        #MAIN#
        # ds = LazIO.open(filename)
        #
        # #subset
        # pp = points[1500000:1520000]
        #
        # #Array with coordinates
        # coords = coordinates(pp,h)
        #
        # #Separate laser pulses
        # laser_pulses = laserpulses(coords)
        #
        # #Return corrected points
        # corrected_laser_pulses, indexes_corr, indexes_un_corr  = corrected_points(laser_pulses,coords)
        #
        # #write pointcloud
        # write_pointcloud(ds,h,pp,indexes_corr,indexes_un_corr)
        @test 1 == 1
    end

    @testset "Correct" begin
        minz, maxz = -6, -5
        p1 = 0, 0, maxz
        p2 = 0, 0, minz
        _, _, z = correct(p1, p2)
        @test minz < z < maxz
    end

    @testset "Polar" begin
        p = 1., 1., 1.
        x = cart2pol(p...)
        pp = pol2cart(x...)
        @test all(p .≈ pp)
    end
end

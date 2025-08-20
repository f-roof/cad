// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
// -----------------------------------------------------------------------------------
include <metal_tiles_params.scad>
// -----------------------------------------------------------------------------------
module roof_tile(length)
{
    color("maroon")
        cube([tile_width, length, tile_thick]);
}
//------------------------------------------------------------------------------------
module ridge(length, radius) // rounded at the top
{   
    difference(){
        color("maroon") cylinder (h = length, r = radius);
        translate([0, 0, -1]) cylinder (h = length +2 , r = radius - 2);
        translate ([0, -radius, 0]) cube([radius, 2 * radius, length]);
    }
}
//------------------------------------------------------------------------------------
//ridge(1000, 100);
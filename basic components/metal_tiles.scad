// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
// -----------------------------------------------------------------------------------
include <params_metal_tiles.scad>
// -----------------------------------------------------------------------------------
module roof_tile(length)
{
    cube([tile_width, length, 1]);
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
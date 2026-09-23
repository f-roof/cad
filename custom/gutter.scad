// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof

// Maker: Mihai Oltean; 
// https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
include <gutter_params.scad>
include <../basic/tolerances.scad>
//---------------------------------------------------------------------------------------
module gutter_custom(length)
{
// back vertical
    cube([length, 1, gutter_lindab_back_height]);
    // back horizontal
    translate([0, -gutter_back_horizontal_width, gutter_lindab_back_height])
        cube([length, gutter_back_horizontal_width, 1]);
    // bottom
    cube([length, gutter_lindab_bottom_width, 1]);
// front vertical
    translate([0, gutter_lindab_bottom_width, 0])
        cube([length, 1, gutter_lindab_front_height]);
// front horizontal
    translate([0, gutter_lindab_bottom_width, gutter_lindab_front_height])
        cube([length, gutter_front_horizontal_width, 1]);
}
//---------------------------------------------------------------------------------------
gutter_custom(1250);
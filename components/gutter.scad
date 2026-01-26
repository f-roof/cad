// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <gutter_params.scad>
include <../basic/tolerances.scad>
//---------------------------------------------------------------------------------------
module gutter_Lindab(length)
{
    difference(){
        color("maroon") 
            cube([length, gutter_lindab_bottom_width, gutter_lindab_back_height]);
// top cut edge
        translate ([0, gutter_lindab_bottom_width - 1, gutter_lindab_back_height -10]+[-1, 0, 0])
            rotate([4.5, 0, 0])
        cube([length + 2, gutter_lindab_bottom_width, 10]);
        // cut interior
            translate ([-tolerance, gutter_lindab_thick, gutter_lindab_thick]) cube([length + 2 * tolerance, gutter_lindab_bottom_width - 2 * gutter_lindab_thick, gutter_lindab_back_height]);
    }
}
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
//gutter_Lindab(1000);

gutter_custom(1250);
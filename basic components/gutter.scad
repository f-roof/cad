// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params_gutter.scad>
include <tolerances.scad>
//---------------------------------------------------------------------------------------
module gutter_Lindab(length)
{
    difference(){
        color("maroon") 
            cube([length, gutter_lindab_bottom_width, gutter_lindab_back_height]);
// top cut edge
        translate ([0, 0, gutter_lindab_back_height -10]+[-1, 0, 0])
            rotate([4.5, 0, 0])
        cube([length + 2, gutter_lindab_bottom_width, 10]);
        // cut interior
            translate ([-tolerance, gutter_lindab_thick, gutter_lindab_thick]) cube([length + 2 * tolerance, gutter_lindab_bottom_width - 2 * gutter_lindab_thick, gutter_lindab_back_height]);
    }
}
//---------------------------------------------------------------------------------------
gutter_Lindab(1000);
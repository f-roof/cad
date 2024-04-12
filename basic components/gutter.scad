// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params_gutter.scad>
//---------------------------------------------------------------------------------------
module gutter_Lindab(length)
{
    difference(){
        color("maroon") cube([length, gutter_lindab_top_width, gutter_lindab_back_height]);
        // front cut
        translate ([0, 0, -5]+[-1, 0, 0])
            rotate([8, 0, 0])
        cube([length + 2, 12, gutter_lindab_back_height]);
// top cut 
        translate ([0, 0, gutter_lindab_back_height -10]+[-1, 0, 0])
            rotate([4.5, 0, 0])
        cube([length + 2, gutter_lindab_top_width, 10]);
    }
}
//---------------------------------------------------------------------------------------
gutter_Lindab(1000);
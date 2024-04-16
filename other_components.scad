// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params.scad>
include <basic components/tolerances.scad>
//---------------------------------------------------------------------------------------
module stair_step(length, angle)
{
    difference(){
        color("black") cube([length, 120, 120]);
        //translate([-2, 4, 4])
        //cube([length + 4, 120 - 8, 120 - 8]);
        
        translate([-2, -0, 17.5])
        rotate([angle-90, 0, 0])
        translate([0, -0, -20])
        cube([length + 4, 250, 250]);
    }
}
//---------------------------------------------------------------------------------------
module gutter_plants_support()
{
    difference(){
        cube([gutter_support_length, gutter_support_size, gutter_support_size]);
        translate ([-tolerance, 4, 4]) cube([gutter_support_length + 2 * tolerance, gutter_support_size, gutter_support_size]);
        // make holes
        translate ([gutter_support_1st_hole, -tolerance, gutter_support_size / 2])
        rotate([-90, 0, 0])
            cylinder(h = 4 + 2 * tolerance, r = 4);
        translate ([gutter_support_2nd_hole, -tolerance, gutter_support_size / 2])
        rotate([-90, 0, 0])
            cylinder(h = 4 + 2 * tolerance, r = 4);
    }
}
//---------------------------------------------------------------------------------------
gutter_plants_support();
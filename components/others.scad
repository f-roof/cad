// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
include <../params.scad>
include <../basic/tolerances.scad>
include <../basic/gutter_params.scad>
include <../basic/screws_nuts_washers_params.scad>
//---------------------------------------------------------------------------------------
use <../basic/metal_profiles.scad>
use <../basic/screws_nuts_washers.scad>
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
module gutter_plants_L_support()
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
module gutter_plants_tube_support(length, angle)
{
    translate([0, -60, 0])
        difference(){
            rectangular_tube(length, 60, 60, 2);
            translate([0, 60, length])
                rotate([angle, 0, 0])
                    translate([-1, -98, 0])
                        cube([62, 98, 2*2*length]);
           // holes for M6
           translate([7, 60-3, length / 2])
           rotate([-90, 0, 0])
                cylinder (h = 4, r = 3);
           translate([60-7, 60-3, length / 2])
           rotate([-90, 0, 0])
                cylinder (h = 4, r = 3);
        }
}
//---------------------------------------------------------------------------------------
module gutter_plants_tube_support_with_screws()
{
    gutter_plants_tube_support(gutter_tube_support_length, (90-38));
   //  M6 screws
   translate([7, -2 - M6_nut_thick, gutter_tube_support_length / 2])
   rotate([-90, 0, 0])
        rotate([0, 0, 30]) screw_M6_hexa (100);
   translate([60-7, -2 - M6_nut_thick, gutter_tube_support_length / 2])
   rotate([-90, 0, 0])
        rotate([0, 0, 30])screw_M6_hexa (100);
}
//---------------------------------------------------------------------------------------
//gutter_plants_L_support();
//gutter_plants_tube_support(gutter_tube_support_length, (90-38));
gutter_plants_tube_support_with_screws();
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
module stair_step(length)
{
    difference(){
        color("black") cube([length, 130, 100]);
        
        translate([-1, 120, 0])
            rotate([-9.5, 0, 0])
                    cube([length + 4, 250, 250]);
        
    }
}
//---------------------------------------------------------------------------------------
module gutter_end()
{
    difference(){
        color("black") cube([25, 140, 80]);
        
        translate([-1, 120, 0])
            rotate([-9.5, 0, 0])
                    cube([25 +2, 250, 250]);
        
    }
}
//---------------------------------------------------------------------------------------
module gutter_L_support()
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
module gutter_tube_support(length, angle)
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
module gutter_tube_support_with_screws(angle)
{
    gutter_tube_support(gutter_tube_support_length, (90-angle));
   //  M6 screws
   translate([7, -2 - M6_nut_thick, gutter_tube_support_length / 2])
   rotate([-90, 0, 0])
        rotate([0, 0, 30]) screw_M6_hexa (100);
   translate([60-7, -2 - M6_nut_thick, gutter_tube_support_length / 2])
   rotate([-90, 0, 0])
        rotate([0, 0, 30])screw_M6_hexa (100);
}
//---------------------------------------------------------------------------------------
module gutter_board_support(board_length, angle, board_height = 130, board_thick = 30, 
    gutter_base = 120, gutter_height = 90, offset = 120, num_gutters = 10)
{
    difference(){
            //translate([-200, 0, 0])
            cube([board_length, board_thick, board_height]);
            /*
        translate([-80, -2, -100])
        rotate([0, -(90-angle), 0])
            cube([board_height, board_thick + 4, 2*board_height]);
          */
          translate([-165, -1, -0])
        rotate([0, angle, 0])
            cube([board_height, board_thick + 2, 2*board_height + 20]);
            
        ipotenuza = sqrt(gutter_base * gutter_base + gutter_height * gutter_height);
        //num_gutters = board_length / ipotenuza;
        for (i=[0:num_gutters - 1])
            translate([offset + i * ipotenuza, -1, board_height]) 
                rotate([0, angle, 0]) 
                    cube([gutter_base, board_thick + 2, gutter_height]);
    }
}
//---------------------------------------------------------------------------------------
gutter_board_support(board_length = 1000, angle = 38, board_height = 130, board_thick = 30, gutter_base = 120, gutter_height = 90, offset = 120, num_gutters = 8);
//gutter_L_support();
//gutter_tube_support(gutter_tube_support_length, (90-38));
//gutter_tube_support_with_screws(38);

//stair_step(120, 10);

//gutter_end();
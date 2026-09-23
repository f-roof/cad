// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof

// Maker: Mihai Oltean
// https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
include <../params.scad>
include <../basic/tolerances.scad>
include <../custom/gutter_params.scad>
include <../basic/screws_nuts_washers_params.scad>
//---------------------------------------------------------------------------------------
use <../basic/metal_profiles.scad>
use <../basic/screws_nuts_washers.scad>
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
            
        hypotenuse = sqrt(gutter_base * gutter_base + gutter_height * gutter_height);
        //num_gutters = board_length / ipotenuza;
        for (i=[0:num_gutters - 1])
            translate([offset + i * hypotenuse, -1, board_height]) 
                rotate([0, angle, 0]) 
                    cube([gutter_base, board_thick + 2, gutter_height]);
    }
}
//---------------------------------------------------------------------------------------
//gutter_board_support(board_length = 1000, angle = 38, board_height = 130, board_thick = 30, gutter_base = 120, gutter_height = 90, offset = 120, num_gutters = 8);


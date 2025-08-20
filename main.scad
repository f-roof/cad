// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
// LAST UPDATE: 2025.06.19.0
//---------------------------------------------------------------------------------------
include <params.scad>
include <house/house_params.scad>
include <trusses/truss2/truss_params.scad>

include <basic/solar_panels_params.scad>
include <basic/metal_profiles_params.scad>
include <basic/gutter_params.scad>
//---------------------------------------------------------------------------------------
use <trusses/truss2/truss.scad>
use <house/house_no_roof.scad>

use <basic/gutter.scad>
use <basic/solar_panels.scad>
use <basic/metal_profiles.scad>
use <basic/screws_nuts_washers.scad>
use <basic/metal_tiles.scad>
use <components/others.scad>
//---------------------------------------------------------------------------------------
module roof_solar_panel_side()
{
// T profiles
// first, base T
    translate([0, first_T_at, 0])
        T_40_4(6000);
    translate([0, first_T_at, -80])
        mirror([0,0,1]) T_40_4(6000);        
        
        for (i = [0 : 3])
            translate([0, 0,  0])
            translate([0, second_T_at + (solar_panel_size[1] + T_profile_thick_40 + 2 * tolerance_between_panels) * i, 0])
            T_40_4(6000)
            ;
            
    last_T_at = second_T_at + (solar_panel_size[1] + T_profile_thick_40 + 2 * tolerance_between_panels) * 3;
    translate([0, last_T_at, -80])
        mirror([0,0,1]) T_40_4(6000);        
            
// wooden bar
    translate([0, second_T_at - 40, 5])
        cube([6000, 40, 30]);
            
        // solar panels
        for (k = [0 : 3])
        for (i = [0 : 2])
            translate([0, 0, 0 + T_profile_thick_40 / 2 + tolerance_between_panels])
            translate([k * solar_panel_size[0], second_T_at + tolerance_between_panels + (solar_panel_size[1] + T_profile_thick_40 + 2 * tolerance_between_panels) * i, 0])
            //solar_panel_Hyundai()
            ;
            
         // screws
        for (k = [0 : 2])
            for (i = [0 : 3]){
                //translate([0, 0,  -10])
                translate([k * distance_between_trusses + truss_side_small_size / 2, second_T_at + (solar_panel_size[1] + T_profile_thick_40 + 2 * tolerance_between_panels) * i, 
                4.1]) mirror([0,0,1]){
                    translate([0, -10, 0])
                        screw_M8_sunken (100);
                    translate([0, 10, 0])
                        screw_M8_sunken (100);
                }
            }        
}
//---------------------------------------------------------------------------------------
module roof_tiles_side()
{
    for (i = [1 : 5]){
        translate([i * distance_between_metal_tiles, 31, 30])
            //rotate([90, 0, 0])
                roof_tile(4300)
                ;
    }
    // wood bars to put the metal roof tiles on it
    for (i = [0 : 10]){
        translate([0, i * distance_between_roof_metal_tiles_support + start_point_metal_tile, 0])
            color("yellow") 
            //cube([6000, 40, 30])
            ;
    }
    
    
    // T profiles
// first, base T
    translate([0, first_T_at, 00])
        T_40_4(6000);
    translate([0, first_T_at, -80])
        mirror([0,0,1]) 
        //T_40_4(6000)
        ;
                    
    last_T_at = second_T_at + (solar_panel_size[1] + T_profile_thick_40 + 2 * tolerance_between_panels) * 3;
    translate([0, last_T_at, 00])
        T_40_4(6000);
    translate([0, last_T_at, -80])
        mirror([0,0,1]) 
        //T_40_4(6000)
        ;        
}
//---------------------------------------------------------------------------------------
module gutter_Lindab_with_holes(length)
{
    difference(){
        gutter_Lindab(length);
        translate([(length - (distance_between_trusses - 40)) / 2 + 15, 20, -1])
            cylinder (r = 2, h= 2);
        translate([length - (length - (distance_between_trusses - 40)) / 2 - 15, 20, -1])
            cylinder (r = 2, h= 2);
        translate([(length - (distance_between_trusses - 40)) / 2 + 15, 70, -1])
            cylinder (r = 2, h= 2);
        translate([length - (length - (distance_between_trusses - 40)) / 2 - 15, 70, -1])
            cylinder (r = 2, h= 2);
    }
}
//---------------------------------------------------------------------------------------
module gutter_with_ends_and_step_support(length)
{
    gutter_Lindab_with_holes(length);
    translate ([0, 1, 1]) 
        gutter_end();
    translate ([length - 25, 1, 1]) 
        gutter_end();
        
    translate ([(length - (distance_between_trusses - 40)) / 2 + 15 - stair_step_length / 2, 1, 1]) 
        stair_step(stair_step_length)
        ;
    translate ([length - (length - (distance_between_trusses - 40)) / 2 -15 - stair_step_length / 2, 1, 1]) 
        stair_step(stair_step_length)
        ;
}
//---------------------------------------------------------------------------------------
module roof()
{  
    // trusses
    for (i = [0 : 6]){
        translate([distance_between_trusses * i, 0, 0])
            truss(angle_roof);
    }// end for i

    translate([0, 0, 0])
            rotate([angle_roof, 0, 0]) 
                roof_solar_panel_side()
                ;

        translate([0, truss_base_half_length, 2742])
            rotate([-angle_roof, 0, 0]) 
                roof_tiles_side()
                ;

    // top ridge
    translate ([0, truss_base_half_length, 2700])
       rotate([0, 90, 0])
           ridge(base_length, ridge_radius)
           ;

// solar side
       /*
// gutters supports
    for (i = [0 : num_gutters_columns_south_side]){ // num columns
        // left
        rotate([angle_roof, 0, 0])
            translate([distance_between_trusses * i + 40 + 40, 0, -80])
                rotate([0, 0, 90]) 
                gutter_board_support(board_length = 4000, 
                    angle = angle_roof, 
                    board_height = 150, 
                    board_thick = 30,
                    gutter_base = 120, 
                    gutter_height = 90);
                    // right
        rotate([angle_roof, 0, 0])
            translate([distance_between_trusses * i, 0, -80])
                rotate([0, 0, 90]) 
                gutter_board_support(board_length = 4000, 
                    angle = angle_roof, 
                    board_height = 200, 
                    board_thick = 30,
                    gutter_base = 120, 
                    gutter_height = 90);
    }
*/
// gutters for plants
/*
    for (i = [0 : num_gutters_columns_south_side - 1]){ // num columns
        translate([distance_between_trusses * i, 0, 0]){
            for (k = [0:num_gutters_rows_south_side - 1]){ // num rows
                translate([0,
                    cos(angle_roof) * gutter_lindab_radius * k, 
                    sin(angle_roof) * gutter_lindab_radius * k]
                ){
               // gutters
                translate([0,  +first_gutter_at_Y, first_gutter_at_Z])
                    translate([+20 +truss_side_small_size, -gutter_lindab_bottom_width, 0])
                        gutter_with_ends_and_step_support(gutter_length)
                    ;
                }
            }// end for k
        }
    }// end for i
*/
            
// back side
    translate([0, 2*truss_base_half_length, 0])
    mirror([0, 1, 0])
    {
       translate([30, -0, 0])
            rotate([angle_roof, 0, 0])
                    rotate([0, 0, 90]) 
                        gutter_board_support(board_length = 4300, 
                        angle = angle_roof, 
                        board_height = 130, 
                        board_thick = 30,
                        gutter_base = 120, 
                        gutter_height = 90, offset = 120,
                        num_gutters = num_gutters_rows_north_side);
                // right
        translate([distance_between_trusses + 30, 0, 0])
            rotate([angle_roof, 0, 0])
                rotate([0, 0, 90]) 
                    gutter_board_support(board_length = 4300, 
                        angle = angle_roof, 
                        board_height = 130, 
                        board_thick = 30,
                        gutter_base = 120, 
                        gutter_height = 90, offset = 120,
                        num_gutters = num_gutters_rows_north_side);

        for (k = [0:num_gutters_rows_north_side - 1]){ // num rows
                    translate([0,
                        first_gutter_at_Y + cos(angle_roof) * gutter_lindab_radius * k, 
                        first_gutter_at_Z + sin(angle_roof) * gutter_lindab_radius * k]
                    ){
                   // gutters
                        translate([-110, -gutter_lindab_bottom_width, 0])
                            mirror([0,1,0])
                            //gutter_with_ends_and_step_support(1333)
                        ;
                    }
                }// end for k
    }
//
//T5    vertical 1 at the top
    translate([-0 , truss_base_half_length, -60 - 300])
        rotate([0, -90, 0]) 
            T_50_5(3200 + 800 + 100);
    
    // vertical 2 at the middle
    translate([0, truss_dist_to_vertical_bar + truss_base_half_length - 320, -60 - 300])
        rotate([0, -90, 0]) 
            T_50_5(truss_vertical_bar_length + 60+300 +230 + 800 + 100);//1380+60+300 + 230 + 800 = 2500

            // vertical 3, at the bottom
    translate([0, 2 * truss_base_half_length + 200, -2000 - 60])
        rotate([0, -90, 0]) 
            T_50_5(2000 + 800 + 100);
    
    
// balustrada
    translate([0, 2 * truss_base_half_length + 200, 800])
        rotate([90- angle_roof, 0, 0])
            L_profile(4700, 40, 3);
//T5    vertical 2
/*
translate([distance_between_trusses + 40, 0, 0]){
    mirror([1,0,0]){
        translate([0, truss_base_half_length, 0])
        rotate([0, -90, 0]) 
        T_50_5(3700);
        
        translate([0, 2 * truss_base_half_length, -2000])
        rotate([0, -90, 0]) 
        T_50_5(3000);
    // balustrada
        translate([0, 2 * truss_base_half_length, 1000])
            rotate([90- angle_roof, 0, 0])
        L_profile(4500, 40, 3);
        }
    }
*/
}
//---------------------------------------------------------------------------------------
module house_with_roof()
{
// house
    translate([0, 0, -house_height-2 * base_beam_side]) 
        house();

    // wood frame on the top of the  house
    color("maroon") 
        translate([0, 0, -2 * base_beam_side]) 
            roof_wood_support_on_house();

        // metal frame over existing house frame
    // just to reinforce the existing base
    translate([0, 0, 0] + [0, 25, 40]){
        rotate([0, 90, 0]) 
            rectangular_tube(6000, 80, truss_side_small_size);
    }    
    // metal frame, other side
    translate([0, base_house_width - 60, 0] + [0, -25, 40]){
        rotate([0, 90, 0]) 
        rectangular_tube(6000, 60, truss_side_small_size);
    }    

    //now the real roof
    translate([0, 0, truss_base_beam_side_long + 40])
        roof();
}
//---------------------------------------------------------------------------------------
 house_with_roof();

//roof();

 //roof_solar_panel_side();

//roof_tiles_side();

//gutter_with_ends_and_step_support(1333);

//gutter_Lindab_with_holes(1333);
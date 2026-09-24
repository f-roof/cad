// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof

// Maker: Mihai Oltean
// https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
// LAST UPDATE: 2026.09.24.0
//---------------------------------------------------------------------------------------
include <params.scad>
include <house/house_params.scad>
include <trusses/truss2/truss_params.scad>

include <basic/solar_panels_params.scad>
include <basic/metal_profiles_params.scad>
include <custom/gutter_params.scad>
//---------------------------------------------------------------------------------------
use <trusses/truss2/truss.scad>
use <house/house_no_roof.scad>

use <custom/gutter.scad>
use <basic/solar_panels.scad>
use <basic/metal_profiles.scad>
use <basic/screws_nuts_washers.scad>
use <basic/metal_tiles.scad>
use <custom/others.scad>
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
            solar_panel_Hyundai()
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
module roof_garden_side()
{   
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
module gutter_with_holes(length)
{
    difference(){
        gutter_custom(length);
        
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
    gutter_with_holes(length);
    
    translate ([0, 1, 1]) 
        gutter_end();
    translate ([length - 25, 1, 1]) 
        gutter_end();
        
    translate ([(length - (distance_between_trusses - 40)) / 2 + 15 / 2, 50, 1]) 
        color("maroon")cylinder( h = 80, r = 50)
        ;
    translate ([length - (length - (distance_between_trusses - 40)) / 2 -15 / 2, 50, 1]) 
        color("maroon")cylinder( h = 80, r = 50)
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
    
// solar panels side
    translate([0, 0, 0])
            rotate([angle_roof, 0, 0]) 
                roof_solar_panel_side()
                ;
// garden side
        translate([0, truss_base_half_length, 2742])
            rotate([-angle_roof, 0, 0]) 
                roof_garden_side()
                ;

// top ridge
    translate ([0, truss_base_half_length, 2700])
       rotate([0, 90, 0])
           ridge(base_length, ridge_radius)
           ;
            
// pots (gutters) for plants
    for (i=[0:5])
        translate([i * distance_between_trusses, 0, 0]){
// gutter support
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

// gutters
                for (k = [0:num_gutters_rows_north_side - 1]){ // num rows
                            translate([0,
                                first_gutter_at_Y + cos(angle_roof) * gutter_radius * k, 
                                first_gutter_at_Z + sin(angle_roof) * gutter_radius * k]
                            ){
                                translate([-110, -gutter_bottom_width, 0])
                                    mirror([0,1,0])
                                    gutter_with_ends_and_step_support(1333)
                                ;
                            }
                        }// end for k
            }
    }// end for i
    
// railing, so that humans can climb it
    for (i=[0:5])
        translate([i * 1333, 0, 0]){
    //vertical support 1 at the top
        translate([-130, truss_base_half_length, -60 - 300])
                rectangular_tube(length = 3200 + 800 + 100, H= 50, W = 30, 3);
        
      // vertical support 2 at the middle
        translate([-130, truss_dist_to_vertical_bar + truss_base_half_length - 320, -60 - 300])
                rectangular_tube(truss_vertical_bar_length + 60+300 +230 + 800 + 100, H= 50, W = 30, 3);//1380+60+300 + 230 + 800 = 2500

    // vertical support 3, at the bottom
        translate([-130, 2 * truss_base_half_length + 200, -2000 - 60])
                rectangular_tube(2000 + 800 + 100, H= 50, W = 30, 3);
        
        
    // railing
        translate([-130, 2 * truss_base_half_length + 400, 740])
            rotate([90- angle_roof, 0, 0])
            rotate([0, 0, -90])
                L_profile(5000, 40, 3);
    }
}
//---------------------------------------------------------------------------------------
module house_with_roof()
{
// house
    translate([0, 0, -house_height-2 * base_beam_side]) 
        house();

    // wood frame on the top of the  house; this is not necesarly
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

//roof_garden_side();

//gutter_with_ends_and_step_support(1333);
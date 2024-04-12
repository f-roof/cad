// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params.scad>
//---------------------------------------------------------------------------------------
use <roof_components.scad>
use <basic components/solar_panels.scad>
use <basic components/metal_profiles.scad>
use <basic components/screws_nuts_washers.scad>
use <basic components/metal_tiles.scad>

use <house_no_roof.scad>
include <basic components/params_solar_panels.scad>
include <basic components/params_metal_profiles.scad>
include <params_house.scad>
//---------------------------------------------------------------------------------------
module roof_solar_panel_side()
{
    for (i = [0:5])
        translate([distance_between_trusses * i, 0, 0]) 
        rotate([-90, 0, 0])
            angle_beam(truss_top_chord_length, angle);
            
     // T profiles
        for (i = [0 : 3])
            translate([0, 0,  0])
            translate([0, first_T_at + (solar_panel_size[1] + T_profile_thick + 2 * tolerance_between_panels) * i, 0])
            T_40_4(6000);
            
        // solar panels
        for (k = [0 : 3])
        for (i = [0 : 2])
            translate([0, 0, 0 + T_profile_thick / 2 + tolerance_between_panels])
            translate([k * solar_panel_size[0], first_T_at + tolerance_between_panels + (solar_panel_size[1] + T_profile_thick + 2 * tolerance_between_panels) * i, 0])
            solar_panel_Hyundai()
            ;
         // screws

        for (k = [0 : 2])
        for (i = [0 : 3]){
            //translate([0, 0,  -10])
            translate([k * distance_between_trusses + truss_side_small / 2, first_T_at + (solar_panel_size[1] + T_profile_thick + 2 * tolerance_between_panels) * i, 
            4.1]) mirror([0,0,1]){
                translate([0, -10, 0])
                    M8_sunken (100);
                translate([0, 10, 0])
                    M8_sunken (100);
            }
            }        
}
//---------------------------------------------------------------------------------------
module roof_standard_tiles_side()
{
    for (i = [0 : 5]){
        translate([distance_between_trusses * i, 0, 0]) 
            translate ([truss_side_small, 0, 0])   
                rotate([0, 0, 180]) 
                    angle_beam(truss_top_chord_length, angle);
                
        translate([i * distance_between_metal_tiles, 31, start_point_metal_tile])             
            rotate([90, 0, 0])
                roof_tile(4500);
    }
    // wood bars to put the metal roof tiles on it
    for (i = [0 : 11]){
        translate([0, 0, i * distance_between_roof_metal_tiles_support + start_point_metal_tile])
            color("yellow") cube([6000, 30, 40]);
    }
}
//---------------------------------------------------------------------------------------
module roof()
{
// house
    translate([0, 0, -house_height-2 * base_beam_side]) 
        house();

    // wood frame around house
    color("maroon") translate([0, 0, -2 * base_beam_side]) roof_wood_house_support();
    
    // metal support
    
    translate([0, 0, 0] + [0, 25, 40]){
        rotate([0, 90, 0]) 
        rectangular_tube(6000, 60, truss_side_small);
    }    
    translate([0, base_house_width - 60, 0] + [0, -25, 40]){
        rotate([0, 90, 0]) 
        rectangular_tube(6000, 60, truss_side_small);
    }    
    //now the real roof
    translate([0, 0, base_bar_side_long + 40]){

        translate([0, -0, 0])
            rotate([angle, 0, 0]) 
                roof_solar_panel_side()
                ;
        translate([0, base_house_width + 0, 0])
            rotate([90-angle, 0, 0]) 
                roof_standard_tiles_side();

        for (i = [0 : 5]){
            translate([distance_between_trusses * i, -130 + 60 + 25, 0]){
                truss();
            for (k=[0:27]){
                translate([0, 
                cos(angle) * 155 * k, 
                sin(angle) * 155 * (k)]){
                    translate([-80, 0, -17.5]) 
                        //stair_step(200)
                        ;
                    }
            }
        }
    }       
       
            // gutters
        for (i = [0 : 4]){
            translate([distance_between_trusses * i, 0, 0]){
            for (k=[0:27]){
                translate([0, 
                cos(angle) * 155 * k, 
                sin(angle) * 155 * (k)]){
                    translate([20 + 50, 0, 120 - 17.5])
                        //lindab_gutter(1000)
                    ;
            }
        }
    }
}    
}

    //translate ([0, base_house_width / 2, 2700])
        //rotate([0, 90, 0])
            //ridge(base_length, ridge_radius);
            

            
//     translate ([base_length, -base_bar_extra_length - cedar_radius, base_bar_side_long]) 
    //        rotate([0, -90, 0]) 
        //    cedar(base_length, cedar_radius);
}
//---------------------------------------------------------------------------------------
roof();

//roof_solar_panel_side();

//roof_tiles_side();
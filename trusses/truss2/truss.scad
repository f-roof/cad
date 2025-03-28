// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//------------------------------------------------------------------------------------
// LAST UPDATE: 2025.03.27.0
//------------------------------------------------------------------------------------
include <truss_params.scad>
use <../../basic/metal_profiles.scad>
//-------------------------------------------------------------
module corner_60()
{
    difference(){
        cube([40, 60, 60]);
        translate([3, 3, 3])
            cube([34, 60, 60]);
        translate([20, 40, -1])
            cylinder(h = 5, r = 4);
        translate([20, -1, 40])
            rotate([-90, 0, 0])
                cylinder(h = 5, r = 4);
    }
}
//-------------------------------------------------------------
module corner_80()
{
    difference(){
        cube([40, 80, 80]);
        translate([3, 3, 3])
            cube([34, 80, 80]);
        translate([20, 40, -1])
            cylinder(h = 5, r = 4);
        translate([20, -1, 40])
            rotate([-90, 0, 0])
                cylinder(h = 5, r = 4);
    }
}
//-------------------------------------------------------------
module truss_angle_beam(length, angle)
{
    difference(){
        rectangular_tube(length, truss_top_chord_side_long, truss_side_small_size);
        
            // cut up
        translate([0, 0, length] - [1, 0, 0]) 
            rotate([-(angle), 0, 0]) 
            cube([truss_side_small_size, 2 * truss_top_chord_side_long, 2 * truss_side_small_size] + [2, 0, 0]);
            // cut down
        translate( - [1, 0, 0]) 
            rotate([-(angle), 0, 0]) 
            cube([truss_side_small_size, 3 * truss_top_chord_side_long, 4 * truss_side_small_size] + [2, 0, 0]);
            
// screw holes
// bottom holes long
        echo("screw_V_angle_long_bottom_1", screw_V_angle_long_bottom_1);
        echo("screw_V_angle_long_bottom_2", screw_V_angle_long_bottom_2);
        echo("screw_V_angle_long_bottom_3", screw_V_angle_long_bottom_3);
               
        translate([20, -1, screw_V_angle_long_bottom_1])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, -1, screw_V_angle_long_bottom_2])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, -1, screw_V_angle_long_bottom_3])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        
// bottom holes short
        echo("screw_V_angle_short_bottom_1", screw_V_angle_short_bottom_1 + 3);
        echo("screw_V_angle_short_bottom_2", screw_V_angle_short_bottom_2 + 3);
        echo("screw_V_angle_short_bottom_3", screw_V_angle_short_bottom_3 + 3);
        
        translate([20, 40, screw_V_angle_short_bottom_1 + truss_angled_height_base])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, 40, screw_V_angle_short_bottom_2 + truss_angled_height_base])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, 40, screw_V_angle_short_bottom_3 + truss_angled_height_base])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
                        
// top holes long
        echo("screw_V_angle_long_top_1", screw_V_angle_long_top_1);
        echo("screw_V_angle_long_top_2", screw_V_angle_long_top_2);
        echo("screw_V_angle_long_top_3", screw_V_angle_long_top_3);

        translate([20, -1, length - screw_V_angle_long_top_1])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, -1, length - screw_V_angle_long_top_2])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, -1, length - screw_V_angle_long_top_3])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
            
// top holes short
        echo("screw_V_angle_short_top_1", screw_V_angle_short_top_1 + 2);
        echo("screw_V_angle_short_top_2", screw_V_angle_short_top_2 + 2);
        echo("screw_V_angle_short_top_3", screw_V_angle_short_top_3 + 2);

        translate([20, 40, length - screw_V_angle_short_top_1])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, 40, length - screw_V_angle_short_top_2])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, 40, length - screw_V_angle_short_top_3])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);

    }
    
// base screws

    translate([20, -0, screw_V_angle_long_bottom_1])
        rotate([-(90+38), 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_bottom_L_1);
    translate([20, -0, screw_V_angle_long_bottom_2])
        rotate([-(90+38), 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_bottom_L_2);
    translate([20, -0, screw_V_angle_long_bottom_3])
        rotate([-(90+38), 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_bottom_L_3);
                
// top screws                
    translate([20, -0, length - screw_V_angle_long_top_1])
        rotate([-38, 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_top_L_1)
                ;
    translate([20, -0, length - screw_V_angle_long_top_2])
        rotate([-38, 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_top_L_2);
    translate([20, -0, length - screw_V_angle_long_top_3])
        rotate([-38, 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_top_L_3);
    
}
//---------------------------------------------------------------------------------------
module truss_angle_beam_interior(length, angle)
{
    difference(){
  
       rectangular_tube(length, truss_base_bar_side_long, truss_side_small_size);
            // cut up
        translate([0, 0, length] - [1, 0, 0])
            rotate([-(90-angle), 0, 0])
            cube([truss_side_small_size, 2 * truss_base_bar_side_long, 2 * truss_side_small_size] + [2, 0, 0]);
            // cut down
        translate( - [1, 0, 0]) 
            rotate([-(angle), 0, 0]) 
            cube([truss_side_small_size, 3 * truss_base_bar_side_long, 4 * truss_side_small_size] + [2, 0, 0]);
    }
}
//---------------------------------------------------------------------------------------
module truss_base_beam(length)
{
    difference(){
        rectangular_tube(length, truss_base_bar_side_long, truss_side_small_size);
        // holes for screws
        
        echo("screw_bottom_dist_1", screw_bottom_dist_1 + truss_base_external_offset);
        echo("screw_bottom_dist_2", screw_bottom_dist_2 + truss_base_external_offset);
        echo("screw_bottom_dist_3", screw_bottom_dist_3 + truss_base_external_offset);
        
        translate([20, -1, screw_bottom_dist_1 + truss_base_external_offset])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 5);
        translate([20, -1, screw_bottom_dist_2 + truss_base_external_offset])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 5);
        translate([20, -1, screw_bottom_dist_3 + truss_base_external_offset])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 5);
            
/*
        color("red"){ // mark with red; just to see it.
            rectangular_tube(truss_base_external_offset + 130, truss_base_bar_side_long, truss_side_small_size);
            translate([0, 0, length - (truss_base_external_offset + 130)])
                rectangular_tube(truss_base_external_offset + 130, truss_base_bar_side_long, truss_side_small_size);
            
        }
*/  
/*
        color("gray")
            difference(){
                cube([caprior_side_small, base_bar_side_long, length]);
                translate ([3, 3, 0] - [0,0,1]) cube([caprior_side_small - 6, base_bar_side_long - 6, length] + [0, 0, 2]);
            }
*/
    }
}
//---------------------------------------------------------------------------------------
module truss(angle)
{
// base beam            
    translate([0, -truss_base_external_offset, 0])   
        rotate([-90, 0, 0]) 
            truss_base_beam(truss_base_bar_length)
            ;

// a angle beam
     translate ([0, 0, 0]) 
        rotate([-(90-angle), 0, 0]) 
            truss_angle_beam(truss_top_chord_length, angle)
            ;
    
// other angle beam            
    translate ([truss_side_small_size, truss_base_bar_length -2 * truss_base_external_offset, 0])   
        translate ([0, 0, 0]) 
            rotate([90 - angle, 0, 0]) 
                rotate([0, 0, 180]) 
                    truss_angle_beam(truss_top_chord_length, angle)
                ;
            
// interior vertical beam; left
    translate ([0, truss_dist_to_vertical_bar, 0])
        rectangular_tube(truss_vertical_bar_length, truss_base_bar_side_long, truss_side_small_size);
        
// corners
    translate ([0, truss_dist_to_vertical_bar + 60, 0])
        corner_60();
        
    translate ([0, truss_dist_to_vertical_bar, 0])
        mirror([0, 1, 0])
            corner_60();
            
// vertical screws            
    translate([20, truss_dist_to_vertical_bar - 40, -80])
        cylinder(r = 5, h= 100); // this should have 80 in length
        
    translate([20, truss_dist_to_vertical_bar + 60 + 40, -80])
        cylinder(r = 5, h= 100);
            
// horizontal screws for vertical bar left
    translate ([0, truss_dist_to_vertical_bar, 0]){
    // bottom
        translate ([20, 80, 40])
            rotate([90, 0, 0])
                cylinder(h = 150, r = 4);
// top                
        translate ([20, 80, truss_vertical_bar_length - 40])
            rotate([90, 0, 0])
                cylinder(h = 300, r = 5);
    }
        
// interior vertical beam; right
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar - 60, 0])
        rectangular_tube(truss_vertical_bar_length, truss_base_bar_side_long, truss_side_small_size);
        
// corners
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar, 0])
        corner_60();
        
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar - 60, 0])
        mirror([0, 1, 0])
            corner_60();
// vertical screws        
    translate([20, 2 * truss_base_half_length - truss_dist_to_vertical_bar + 40, -80])
        cylinder(r = 5, h= 100);
        
    translate([20, 2 * truss_base_half_length - truss_dist_to_vertical_bar - 60 - 40, -80])
        cylinder(r = 5, h= 100);
        
// interior beam top
    translate ([0, truss_dist_to_vertical_bar, truss_vertical_bar_length + truss_base_bar_side_long - 60])
        mirror([0,0,1])
            rotate([-90, 0, 0])  
        //        color("red")
        truss_angle_beam_interior(truss_angle_beam_interior_length, angle)
        ;
        
// corners
    translate ([0, truss_dist_to_vertical_bar + 60, truss_vertical_bar_length - 80])
        corner_80();
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar - (80+60), truss_vertical_bar_length - 80])
        corner_80();
        
// screws for the interior bar
    translate ([20, truss_dist_to_vertical_bar + 60 + 40, truss_vertical_bar_length + truss_base_bar_side_long - 60 - 10])
        cylinder (h = 220, r = 5);
        
// screws right side
    translate([20, 2 * truss_base_half_length - screw_bottom_dist_1, -80])
        cylinder(r = 5, h= 250);
    translate([20, 2 * truss_base_half_length - screw_bottom_dist_2, -80])
        cylinder(r = 5, h= 310);
    translate([20, 2 * truss_base_half_length - screw_bottom_dist_3, -80])
        cylinder(r = 5, h= 400);
        
// top horizontal screws        
        
}
//---------------------------------------------------------------------------------------
truss(38);

//truss_base_beam(truss_base_bar_length);
// truss_angle_beam(truss_top_chord_length, 38);

// truss_angle_beam_interior(1000, 38);
// corner();
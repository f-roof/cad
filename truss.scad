// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//------------------------------------------------------------------------------------
include <truss_params.scad>
use <basic components/metal_profiles.scad>
//-------------------------------------------------------------
module angle_beam(length, angle)
{
    difference(){
       // tube(length);
       rectangular_tube(length, truss_top_chord_side_long, truss_side_small_size);
            // taietura sus
        translate([0, 0, truss_top_chord_length] - [1, 0, 0]) 
            rotate([-(angle), 0, 0]) 
            cube([truss_side_small_size, 2 * truss_top_chord_side_long, 2 * truss_side_small_size] + [2, 0, 0]);
            // taietura jos la unghi
        translate( - [1, 0, 0]) 
            rotate([-(angle), 0, 0]) 
            cube([truss_side_small_size, 3 * truss_top_chord_side_long, 4 * truss_side_small_size] + [2, 0, 0]);
    }
}
//---------------------------------------------------------------------------------------
module truss_base_beam(length)
{
    rectangular_tube(length, truss_base_bar_side_long, truss_side_small_size);
    color("red"){
        rectangular_tube(truss_external_offset + 130, truss_base_bar_side_long, truss_side_small_size);
        translate([0, 0, length - (truss_external_offset + 130)])
            rectangular_tube(truss_external_offset + 130, truss_base_bar_side_long, truss_side_small_size);
        
    }
/*
    color("gray")
        difference(){
            cube([caprior_side_small, base_bar_side_long, length]);
            translate ([3, 3, 0] - [0,0,1]) cube([caprior_side_small - 6, base_bar_side_long - 6, length] + [0, 0, 2]);
        }
*/
}
//---------------------------------------------------------------------------------------
module truss(angle)
{
// one beam
     translate ([0, 0, 0]) 
        rotate([-(90-angle), 0, 0]) 
            angle_beam(truss_top_chord_length, angle);
    
// other beam            
    translate ([truss_side_small_size, truss_base_bar_length -2 * truss_external_offset, 0])   
        translate ([0, 0, 0]) 
            rotate([90 - angle, 0, 0]) 
                rotate([0, 0, 180]) 
                angle_beam(truss_top_chord_length, angle)
                ;
            
// base beam            
    translate([0, -truss_external_offset, 0])   
        rotate([-90, 0, 0]) 
            truss_base_beam(truss_base_bar_length)
            ;
            
// interior left 1 
    translate ([0, 1765 + 130, 0])
        rectangular_tube(1380, truss_base_bar_side_long, truss_side_small_size);
// interior right
    translate ([0, 4942 + 130, 0])
        rectangular_tube(1380, truss_base_bar_side_long, truss_side_small_size);
// interior top
        translate ([0, 1765 + 130, 1380 + truss_base_bar_side_long]) rotate([-90, 0, 0])  
        color("red")
        rectangular_tube(3237, truss_base_bar_side_long, truss_side_small_size);
}
//---------------------------------------------------------------------------------------
truss(38);


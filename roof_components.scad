// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//------------------------------------------------------------------------------------
include <params.scad>
include <basic components/params_gutter.scad>
use <basic components/metal_profiles.scad>
//-------------------------------------------------------------
module ridge(length, radius) // rounded at the top
{   
    difference(){
        color("maroon") cylinder (h = length, r = radius);
        translate([0, 0, -1]) cylinder (h = length +2 , r = radius - 2);
        translate ([0, -radius, 0]) cube([radius, 2 * radius, length]);
    }
}
//------------------------------------------------------------------------------------
module angle_beam(length, rotation_angle)
{
    difference(){
       // tube(length);
       rectangular_tube(length, truss_side_long, truss_side_small);
            // taietura sus
        translate([0, 0, truss_top_chord_length] - [1, 0, 0]) 
            rotate([-(rotation_angle), 0, 0]) 
            cube([truss_side_small, 2 * truss_side_long, 2 * truss_side_small] + [2, 0, 0]);
            // taietura jos la unghi
        translate( - [1, 0, 0]) 
            rotate([-(rotation_angle), 0, 0]) 
            cube([truss_side_small, 3 * truss_side_long, 4 * truss_side_small] + [2, 0, 0]);
    }
}
//---------------------------------------------------------------------------------------
module base_bar(length)
{
    rectangular_tube(length, base_bar_side_long, truss_side_small);
    color("red"){
        rectangular_tube(offset + 130, base_bar_side_long, truss_side_small);
        translate([0, 0, length - (offset + 130)])
            rectangular_tube(offset + 130, base_bar_side_long, truss_side_small);
        
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
module truss_base_beam()
{
    base_bar(base_bar_length);
}
//---------------------------------------------------------------------------------------
module truss()
{

// one beam
     translate ([0, 0, 0]) 
        rotate([-(90-angle), 0, 0]) 
            angle_beam(truss_top_chord_length, angle);
    
// other beam            
    translate ([truss_side_small, base_bar_length -2 * offset, 0])   
        translate ([0, 0, 0]) 
            rotate([90-angle, 0, 0]) 
                rotate([0, 0, 180]) 
                angle_beam(truss_top_chord_length, angle)
                ;
            
// base beam            
    translate([0, -offset, 0])   
        rotate([-90, 0, 0]) 
            truss_base_beam()
            ;
            
// interior left 1 
    translate ([0, 1765 + 130, 0])
        rectangular_tube(1380, base_bar_side_long, truss_side_small);
// interior right
    translate ([0, 4942 + 130, 0])
        rectangular_tube(1380, base_bar_side_long, truss_side_small);
// interior top
        translate ([0, 1765 + 130, 1380 + base_bar_side_long]) rotate([-90, 0, 0])  
        color("red")
        rectangular_tube(3237, base_bar_side_long, truss_side_small);

}
//---------------------------------------------------------------------------------------
module cedar(length, radius)
{
    difference(){
        color("maroon") cylinder(h = length, r = radius);
        translate([0, 0, -1]) cylinder(h = length + 2, r = radius - 1);
        translate([0, -radius, -1]) cube([radius, 2 * radius, length + 2]);
    }
}
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
module stair_step(length)
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
truss();

gutter_Lindab(1000);
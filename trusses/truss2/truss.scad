// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//------------------------------------------------------------------------------------
// LAST UPDATE: 2025.10.02.0
//------------------------------------------------------------------------------------
include <truss_params.scad>
use <../../basic/metal_profiles.scad>
use <../../basic/corners.scad>
use <../../basic/screws_nuts_washers.scad>
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
// bottom holes long edge
        echo("screw_V_angle_long_bottom_dist_1", screw_V_angle_long_bottom_dist_1);
        echo("screw_V_angle_long_bottom_dist_2", screw_V_angle_long_bottom_dist_2);
        echo("screw_V_angle_long_bottom_dist_3", screw_V_angle_long_bottom_dist_3);
               
        translate([20, -1, screw_V_angle_long_bottom_dist_1])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, -1, screw_V_angle_long_bottom_dist_2])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, -1, screw_V_angle_long_bottom_dist_3])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        
// bottom holes short edge
        echo("screw_V_angle_short_bottom_dist_1", screw_V_angle_short_bottom_dist_1 + 3.84);
        echo("screw_V_angle_short_bottom_dist_2", screw_V_angle_short_bottom_dist_2 + 3.84);
        echo("screw_V_angle_short_bottom_dist_3", screw_V_angle_short_bottom_dist_3 + 3.84);
        
        translate([20, 40, screw_V_angle_short_bottom_dist_1 + truss_angled_height_bottom])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, 40, screw_V_angle_short_bottom_dist_2 + truss_angled_height_bottom])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, 40, screw_V_angle_short_bottom_dist_3 + truss_angled_height_bottom])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
                        
// top holes long edge
        echo("screw_V_angle_long_top_dist_1", screw_V_angle_long_top_dist_1);
        echo("screw_V_angle_long_top_dist_2", screw_V_angle_long_top_dist_2);
        echo("screw_V_angle_long_top_dist_3", screw_V_angle_long_top_dist_3);

        translate([20, -1, length - screw_V_angle_long_top_dist_1])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
        translate([20, -1, length - screw_V_angle_long_top_dist_2])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, -1, length - screw_V_angle_long_top_dist_3])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
          
// top holes short edge
        echo("screw_V_angle_short_top_dist_1", screw_V_angle_short_top_dist_1 + 2.34);
        echo("screw_V_angle_short_top_dist_2", screw_V_angle_short_top_dist_2 + 2.34);
        echo("screw_V_angle_short_top_dist_3", screw_V_angle_short_top_dist_3 + 2.34);

        translate([20, 40, length - screw_V_angle_short_top_dist_1 - truss_angled_height_top])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
           
        translate([20, 40, length - screw_V_angle_short_top_dist_2 - truss_angled_height_top])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
        translate([20, 40, length - screw_V_angle_short_top_dist_3 - truss_angled_height_top])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5);
            
// middle horizontal long edge
        echo("screw_H_angle_long_middle_dist", screw_H_angle_long_middle_dist);
         translate([20, -1, screw_H_angle_long_middle_dist])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
            
// middle horizontal short edge
        echo("screw_H_angle_short_middle_dist", screw_H_angle_short_middle_dist + 3.84);
         translate([20, 40, screw_H_angle_short_middle_dist + truss_angled_height_bottom])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
            
// middle vertical long edge
    echo("screw_V_angle_long_middle_dist", screw_V_angle_long_middle_dist);
    translate([20, -1, screw_V_angle_long_middle_dist])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;
            
// middle vertical short edge
    echo("screw_V_angle_short_middle_dist", screw_V_angle_short_middle_dist + 3.84);
        translate([20, 40, screw_V_angle_short_middle_dist + truss_angled_height_bottom])
            rotate([-90, 0, 0])
            cylinder(h = 42, r = 5)
            ;            
    }
    
// base screws

    echo(screw_V_bottom_L_1=screw_V_bottom_L_1);
    translate([20, -0, screw_V_angle_long_bottom_dist_1])
        rotate([-(90+38), 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_bottom_L_1);
    echo(screw_V_bottom_L_2=screw_V_bottom_L_2);
    translate([20, -0, screw_V_angle_long_bottom_dist_2])
        rotate([-(90+38), 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_bottom_L_2);
    echo(screw_V_bottom_L_3=screw_V_bottom_L_3);
    translate([20, -0, screw_V_angle_long_bottom_dist_3])
        rotate([-(90+38), 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_V_bottom_L_3);
                
// top screws   
    echo(screw_H_top_L_1=screw_H_top_L_1);
    translate([20, -0, length - screw_V_angle_long_top_dist_1])
        rotate([-38, 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_H_top_L_1)
                ;
 
    echo(screw_H_top_L_2=screw_H_top_L_2);
    translate([20, -0, length - screw_V_angle_long_top_dist_2])
        rotate([-38, 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_H_top_L_2);
                
    echo(screw_H_top_L_3=screw_H_top_L_3);
    translate([20, -0, length - screw_V_angle_long_top_dist_3])
        rotate([-38, 0, 0])
            translate([0, -0, -30])
                cylinder(r = 5, h= screw_H_top_L_3)
                ;
}
//---------------------------------------------------------------------------------------
module truss_interior_horizontal_bar(length, angle)
{
    difference(){
       rectangular_tube(length, truss_base_beam_side_long, truss_side_small_size);
            // cut up
        translate([0, 0, length] - [1, 0, 0])
            rotate([-(90-angle), 0, 0])
            cube([truss_side_small_size, 2 * truss_base_beam_side_long, 2 * truss_side_small_size] + [2, 0, 0]);
            // cut down
        translate( - [1, 0, 0]) 
            rotate([-(angle), 0, 0]) 
            cube([truss_side_small_size, 3 * truss_base_beam_side_long, 4 * truss_side_small_size] + [2, 0, 0]);
// hole bottom
        echo("truss_horizontal_interior_beam_bottom_hole", truss_horizontal_interior_beam_bottom_hole);
            translate([20, 0, truss_horizontal_interior_beam_bottom_hole] - [0, 1, 0]) 
                rotate([-90, 0, 0]) cylinder(h = 10, r = 5);
// hole top
        echo("truss_horizontal_interior_beam_top_hole", truss_horizontal_interior_beam_top_hole + 3.84);
        translate([20, 50, truss_horizontal_interior_beam_top_hole + 60/tan(38)] - [0, 1, 0]) 
            rotate([-90, 0, 0]) cylinder(h = 62, r = 5);    
    }
}
//---------------------------------------------------------------------------------------
module truss_base_beam(length)
{
    difference(){
        echo(truss_base_beam = length);
        rectangular_tube(length, truss_base_beam_side_long, truss_side_small_size);
        // holes for screws
        
        echo("screw_base_dist_1", screw_bottom_dist_1 + truss_base_external_offset);
        echo("screw_base_dist_2", screw_bottom_dist_2 + truss_base_external_offset);
        echo("screw_base_dist_3", screw_bottom_dist_3 + truss_base_external_offset);
        
        translate([20, -1, screw_bottom_dist_1 + truss_base_external_offset])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 5);
        translate([20, -1, screw_bottom_dist_2 + truss_base_external_offset])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 5);
        translate([20, -1, screw_bottom_dist_3 + truss_base_external_offset])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 5);
            
        echo("screw_base_to_vertical_bar_1", truss_dist_to_vertical_bar + truss_base_external_offset - 40);
        echo("screw_base_to_vertical_bar_2", truss_dist_to_vertical_bar + truss_base_external_offset + 60 + 40);

        translate([20, -1, truss_dist_to_vertical_bar + truss_base_external_offset - 40])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 4);
        translate([20, -1, truss_dist_to_vertical_bar + truss_base_external_offset + 60 + 40])
            rotate([-90, 0, 0])
            cylinder(h = 62, r = 4);
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
        rectangular_tube(truss_vertical_bar_length, truss_base_beam_side_long, truss_side_small_size);
        
// corners
    translate ([0, truss_dist_to_vertical_bar + 60, 0])
        corner_60();
        
    translate ([0, truss_dist_to_vertical_bar, 0])
        mirror([0, 1, 0])
            corner_60();
            
// vertical screws            
    translate([20, truss_dist_to_vertical_bar - 40, -70])
        cylinder(r = 5, h= 80); // this should have 80 in length
        
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
        rectangular_tube(truss_vertical_bar_length, truss_base_beam_side_long, truss_side_small_size);
        
// corners at the base of vertical bars
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar, 0])
        corner_60();
        
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar - 60, 0])
        mirror([0, 1, 0])
            corner_60();
            
// vertical screws
    translate([20, 2 * truss_base_half_length - truss_dist_to_vertical_bar + 40, -70])
        cylinder(r = 5, h= 80);
        
    translate([20, 2 * truss_base_half_length - truss_dist_to_vertical_bar - 60 - 40, -70])
        cylinder(r = 5, h= 80);
        
// interior beam horizontal
    translate ([0, truss_dist_to_vertical_bar, truss_vertical_bar_length + truss_base_beam_side_long - 60])
        mirror([0,0,1])
            rotate([-90, 0, 0])  
                color("red")
        truss_interior_horizontal_bar(truss_interior_bar_length, angle)
        ;
        
// corners at the top of vertical bars
    translate ([0, truss_dist_to_vertical_bar + 60, truss_vertical_bar_length])
        rotate([-90, 0, 0]) 
        corner_80()
        ;
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar - (80+60), truss_vertical_bar_length - 80])
        corner_80();
        
// screws for the interior bar
    translate ([20, truss_dist_to_vertical_bar + 60 + 40, truss_vertical_bar_length + truss_base_beam_side_long - 60 - 10])
        cylinder (h = 220, r = 5);
        
// screws, base, right side
    translate([20, 2 * truss_base_half_length - screw_bottom_dist_1, -80])
        cylinder(r = 5, h= 250);
    translate([20, 2 * truss_base_half_length - screw_bottom_dist_2, -80])
        cylinder(r = 5, h= 310);
    translate([20, 2 * truss_base_half_length - screw_bottom_dist_3, -80])
        cylinder(r = 5, h= 400);
        
}
//---------------------------------------------------------------------------------------
truss(38);

//truss_angle_beam(truss_top_chord_length, 38);

 //truss_base_beam(truss_base_bar_length);
// truss_angle_beam(truss_top_chord_length, 38);

//truss_interior_horizontal_bar(truss_interior_bar_length, 38);
// corner();
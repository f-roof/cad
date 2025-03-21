// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//------------------------------------------------------------------------------------
// LAST UPDATE: 2024.12.30.0
//------------------------------------------------------------------------------------
include <truss_params.scad>
use <../basic/metal_profiles.scad>
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
    }
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
    
    
        color("red"){ // mark with red; just to see it.
            rectangular_tube(truss_base_external_offset + 130, truss_base_bar_side_long, truss_side_small_size);
            translate([0, 0, length - (truss_base_external_offset + 130)])
                rectangular_tube(truss_base_external_offset + 130, truss_base_bar_side_long, truss_side_small_size);
            
        }
        
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
/*
module truss_lateral_plate_top(angle)
{
    //linear_extrude(height = 5)
//   polygon(points=[[0, 0], [lateral_top_base, 0], [200, lateral_top_top], [0, //lateral_top_top]], paths=[[0,1,2,3]]);

    difference(){
        cube([plate_top_base, plate_height, plate_thick]);
        translate([0, 0, -1]){
        // angles cuts
            rotate([0, 0, angle])
                cube([plate_top_base, plate_height, plate_thick + 2]);
            translate([plate_top_base, 0, 0])
                rotate([0, 0, 90-angle])
                    cube([plate_height, plate_top_base, plate_thick + 2]);
            // holes
            translate([40, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_top_base / 2 - plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_top_base / 2 - plate_distance_to_hole, 70, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_top_base, 0, 0])
                mirror([1, 0, 0]){
                translate([40, plate_distance_to_hole, 0])
                    cylinder(h = plate_thick + 2, r = 5);
                translate([plate_top_base / 2 - plate_distance_to_hole, plate_distance_to_hole, 0])
                    cylinder(h = plate_thick + 2, r = 5);
                translate([plate_top_base / 2 - plate_distance_to_hole, 70, 0])
                    cylinder(h = plate_thick + 2, r = 5);
            }
        }
    }
}
//---------------------------------------------------------------------------------------
module truss_lateral_plate_bottom(angle)
{
    //linear_extrude(height = 5)
//   polygon(points=[[0, 0], [lateral_top_base, 0], [200, lateral_top_top], [0, //lateral_top_top]], paths=[[0,1,2,3]]);

    difference(){
        cube([plate_bottom_base, plate_height, plate_thick]);
        translate([0, 0, -1]){
        // angles cut
            translate([plate_bottom_base, 0, 0])
                rotate([0, 0, 90-angle])
                    cube([plate_height, plate_bottom_base, plate_thick + 2]);
        // holes
            translate([plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_distance_to_hole, plate_height - plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);

            translate([truss_base_bar_side_long + plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([truss_base_bar_side_long + plate_distance_to_hole, plate_height - plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);

                translate([truss_base_bar_side_long + plate_distance_to_hole + 50, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
        }
    }
}
//---------------------------------------------------------------------------------------
*/
module truss_lateral_plate()
{
    difference(){
        cube([plate_length, plate_height, plate_thick]);
        translate([0, 0, -1]){
            // holes
            translate([plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_length - plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_distance_to_hole, plate_height - plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
            translate([plate_length - plate_distance_to_hole, plate_height - plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5);
        }
    }
}
//---------------------------------------------------------------------------------------
module truss_lateral_plate_T_holes()
{
    difference(){
        cube([plate_length, plate_height, plate_thick]);
        translate([0, 0, -1]){
            // holes
            translate([plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5)
                ;
            translate([plate_length - plate_distance_to_hole, plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5)
                ;
            translate([plate_length / 2, plate_height - plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5)
                ;
            translate([plate_length / 2 , plate_height - 3 * plate_distance_to_hole, 0])
                cylinder(h = plate_thick + 2, r = 5)
                ;
        }
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
            
            
// interior beam left 1 
    translate ([0, 1765 + 130, 0])
        rectangular_tube(1380, truss_base_bar_side_long, truss_side_small_size);
// interior beam right
    translate ([0, 4942 + 130, 0])
        rectangular_tube(1380, truss_base_bar_side_long, truss_side_small_size);
// interior beam top
    translate ([0, 1765 + 130, 1380 + truss_base_bar_side_long - 60]) 
        mirror([0,0,1])
            rotate([-90, 0, 0])  
        //        color("red")
        truss_angle_beam_interior(3237, angle);
        
// PLATES
// top plate
    translate([0, truss_base_half_length - plate_length / 2, truss_height - plate_height]) 
    translate([-plate_thick, 0, 0]) 
    rotate([0, 90, 0])
        rotate([0, 0, 90]) 
            truss_lateral_plate();
            
    translate([0, truss_base_half_length - plate_length / 2, truss_height - plate_height]) 
    translate([truss_side_small_size, 0, 0]) 
    rotate([0, 90, 0]) 
        rotate([0, 0, 90]) 
            truss_lateral_plate();
            
// bottom plates; left
    translate([0, plate_height + 30, -truss_base_bar_side_long / 2]) 
        mirror([0, 1, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate();  
            
    translate([truss_side_small_size, plate_height + 30, -truss_base_bar_side_long /2]) 
        mirror([0, 1, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate();
            
// bottom plate; right
    translate([0, truss_base_bar_length - (2*truss_base_external_offset + 30), -truss_base_bar_side_long / 2]) 
        mirror([0, 1, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate();  
            
    translate([truss_side_small_size, truss_base_bar_length - (2*truss_base_external_offset + 30), -truss_base_bar_side_long /2]) 
        mirror([0, 1, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate();
            
// angled, at the middle (approx)            
    translate([0, 1765 + plate_height + 30, -truss_base_bar_side_long / 2 + 1380]) 
        mirror([0, 1, 0])
        rotate([-angle, 0, 0])
        rotate([0, -90, 0]) 
            
            truss_lateral_plate();  
            
    translate([truss_side_small_size, plate_height + 30, -truss_base_bar_side_long /2]) 
        mirror([0, 1, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate();
            
           

// bottom plates; left vertical
    translate([0, 1765 + 130 , -truss_base_bar_side_long / 2]) 
        mirror([0, 1, 0])
        rotate([90, 0, 0])
        rotate([0, -90, 0])
            truss_lateral_plate_T_holes();  
            
    translate([truss_side_small_size, 1765 + 130, -truss_base_bar_side_long /2]) 
        mirror([0, 1, 0])
        rotate([90, 0, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate_T_holes();

// bottom plates; right vertical
    translate([0, truss_base_bar_length - (2* truss_base_external_offset +1765 + 130) - plate_length , -truss_base_bar_side_long / 2]) 
        mirror([0, 1, 0])
        rotate([90, 0, 0])
        rotate([0, -90, 0])
            truss_lateral_plate_T_holes();  
            
    translate([truss_side_small_size, truss_base_bar_length - (2*truss_base_external_offset + 1765 + 130) - plate_length, -truss_base_bar_side_long /2]) 
        mirror([0, 1, 0])
        rotate([90, 0, 0])
        rotate([0, -90, 0]) 
            truss_lateral_plate_T_holes();
}
//---------------------------------------------------------------------------------------
truss(38);

// truss_angle_beam_interior(1000, 38);
// truss_angle_beam(truss_top_chord_length, 38);
 // truss_lateral_plate();
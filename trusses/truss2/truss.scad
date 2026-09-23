// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof

// Maker: Mihai Oltean
// https://mihaioltean.github.io
//------------------------------------------------------------------------------------
// LAST UPDATE: 2026.09.23.0
//------------------------------------------------------------------------------------
include <truss_params.scad>
use <../../basic/metal_profiles.scad>
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
    }
}
//---------------------------------------------------------------------------------------
module truss_base_beam(length)
{
    difference(){
        echo(truss_base_beam = length);
        rectangular_tube(length, truss_base_beam_side_long, truss_side_small_size);
    }
}
//---------------------------------------------------------------------------------------
module truss(roof_angle)
{
// base beam            
    translate([0, -truss_base_external_offset, 0])   
        rotate([-90, 0, 0]) 
            truss_base_beam(truss_base_bar_length)
            ;

// a angle beam
     translate ([0, 0, 0]) 
        rotate([-(90-roof_angle), 0, 0]) 
            truss_angle_beam(truss_top_chord_length, roof_angle)
            ;
    
// other angle beam            
    translate ([truss_side_small_size, truss_base_bar_length -2 * truss_base_external_offset, 0])   
        translate ([0, 0, 0]) 
            rotate([90 - roof_angle, 0, 0]) 
                rotate([0, 0, 180]) 
                    truss_angle_beam(truss_top_chord_length, roof_angle)
                ;
            
// interior vertical beam; left
    translate ([0, truss_dist_to_vertical_bar, 0])
        rectangular_tube(truss_vertical_bar_length, truss_base_beam_side_long, truss_side_small_size);
                    
// interior vertical beam; right
    translate ([0, 2 * truss_base_half_length - truss_dist_to_vertical_bar - 60, 0])
        rectangular_tube(truss_vertical_bar_length, truss_base_beam_side_long, truss_side_small_size);
                            
// interior beam horizontal
    translate ([0, truss_dist_to_vertical_bar, truss_vertical_bar_length + truss_base_beam_side_long - 60])
        mirror([0,0,1])
            rotate([-90, 0, 0])  
                color("red")
        truss_interior_horizontal_bar(truss_interior_bar_length, roof_angle)
        ;        
}
//---------------------------------------------------------------------------------------
//truss(roof_angle = 38);

//truss_angle_beam(truss_top_chord_length, 38);

 //truss_base_beam(truss_base_bar_length);
// truss_angle_beam(truss_top_chord_length, 38);

//truss_interior_horizontal_bar(truss_interior_bar_length, 38);
// corner();
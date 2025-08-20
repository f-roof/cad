// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
// -----------------------------------------------------------------------------------
include <house_params.scad>
//---------------------------------------------------------------------------------------
module house()
{
    color("green")
        cube([base_length, base_house_width, house_height]);
}
//---------------------------------------------------------------------------------------
module roof_wood_support_on_house()
{
// long side
    translate ([0, 0, base_beam_side]) 
        cube([base_length, base_beam_side, base_beam_side]);
    
    translate ([0, 0, base_beam_side]) 
        translate ([0, base_house_width - base_beam_side, 0]) 
            cube([base_length, base_beam_side, base_beam_side]);
        
   // short side     
    translate ([0, 0, 0]) 
        cube([base_beam_side, base_house_width, base_beam_side]);
    translate ([base_length - base_beam_side, 0, 0]) 
        cube([base_beam_side, base_house_width, base_beam_side]);    
}
//---------------------------------------------------------------------------------------
roof_wood_support_on_house(); // this was already there
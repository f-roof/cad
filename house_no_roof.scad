// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
// -----------------------------------------------------------------------------------
include <params_house.scad>
include <params.scad>
//---------------------------------------------------------------------------------------
module house()
{
    cube([base_length, base_house_width, house_height]);
}
//---------------------------------------------------------------------------------------
module roof_wood_house_support()
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

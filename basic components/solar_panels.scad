// F-Roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
// -----------------------------------------------------------------------------------
include <params_solar_panels.scad>
//---------------------------------------------------------------------------------------
module solar_panel_Hyundai()
{
    color("silver") cube(solar_panel_size);
    translate([10, 10, solar_panel_size[2]]) 
        color("black") 
            cube([solar_panel_size[0], solar_panel_size[1], 2] - [20, 20, 0]);
}
//---------------------------------------------------------------------------------------

// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
// -----------------------------------------------------------------------------------
include <screws_nuts_washers_params.scad>
include <tolerances.scad>
//------------------------------------------------------------------------------------
module sunken_screw (screw_radius, screw_length, head_radius, head_thick)
{
	color ("silver")
	difference(){
		union(){
			cylinder (h = head_thick, r1 = head_radius, r2 = screw_radius, $fn = 30);
			cylinder (h = screw_length, r = screw_radius, $fn = 30);
		}
		translate ([-head_radius, -0.75, 0] - display_tolerance_z) cube([2 * head_radius, 1.5, head_thick - 0.5 + display_tolerance]);
	}
}
//------------------------------------------------------------------------------------
module M8_sunken(length)
{
	sunken_screw(M8_screw_radius, length, M8_nut_radius, M8_nut_thick);
}
//------------------------------------------------------------------------------------
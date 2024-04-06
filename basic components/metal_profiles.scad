// F-Roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params_metal_profiles.scad>
//---------------------------------------------------------------------------------------
module rectangular_tube(length, H, W)
{
    color("gray") 
    difference(){
        cube([W, H, length]);
        translate ([3, 3, 0] - [0,0,1]) cube([W - 6, H - 6, length] + [0, 0, 2]);
    }
}
//---------------------------------------------------------------------------------------
module T_40_4(length)
{
    translate ([0, -20, 0]){
        difference(){
        // base wall
            cube([length, 40, T_profile_thick]);
            /*
            for (k = [0 : 6]){
                translate ([k * distance_between_capriori + caprior_side_small / 2, 10, 0]) cylinder(h = T_profile_thick + 2, r = 4);
                translate ([k * distance_between_capriori + caprior_side_small / 2, 30, 0]) cylinder(h = T_profile_thick + 2, r = 4);
            }
            */
        }
        // vertical wall
        translate ([0, 20 - T_profile_thick / 2, 0]) cube([length, T_profile_thick, 40]);
    }
}
//---------------------------------------------------------------------------------------

T_40_4(1000);
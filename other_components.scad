// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
module stair_step(length, angle)
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

// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//------------------------------------------------------------------------------------
// LAST UPDATE: 2025.04.08.0
//------------------------------------------------------------------------------------
module corner_60()
{
    difference(){
        cube([40, 60, 60]);
        translate([3, 3, 3])
            cube([34, 60, 60]);
        translate([20, 40, -1])
            cylinder(h = 5, r = 4);
        translate([20, -1, 40])
            rotate([-90, 0, 0])
                cylinder(h = 5, r = 4);
    }
}
//-------------------------------------------------------------
module corner_80()
{
    difference(){
        cube([40, 80, 80]);
        translate([3, 3, 3])
            cube([34, 80, 80]);
        translate([20, 40, -1])
            cylinder(h = 5, r = 4);
        translate([20, -1, 40])
            rotate([-90, 0, 0])
                cylinder(h = 5, r = 4);
    }
}
//-------------------------------------------------------------
module corner_80_half_angle(angle)
{
    length = 80 / tan(angle);
    difference(){
        cube([40, length, 80]);
        rotate([angle, 0, 0]) translate([-1, 0, 0]) cube([42, 110, 80]);
        translate([3, 3, 3])
            cube([34, length, 80]);
        translate([20, 40, -1])
            cylinder(h = 5, r = 4);
        translate([20, -1, 40])
            rotate([-90, 0, 0])
                cylinder(h = 5, r = 4);
    }
}
//-------------------------------------------------------------
module corner_80_angle(angle)
{
    corner_80_half_angle(52);
        rotate([-2*(90-angle), 0, 0 ])
        mirror([0,1,0])
            corner_80_half_angle(52);
}
//-------------------------------------------------------------
corner_80_angle(52);
//corner_80_half_angle(52);
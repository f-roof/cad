// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params_house.scad>
include <basic components/params_metal_tiles.scad>
//---------------------------------------------------------------------------------------
angle_roof = 38;

gutter_length = 1000;
distance_between_trusses = gutter_length + 80;
tolerance_between_panels = 2;
first_T_at = 900;

distance_between_metal_tiles = tile_width - 50;
distance_between_roof_metal_tiles_support = 400;
start_point_metal_tile = 100;

ridge_radius = 100;

gutter_support_length = 240;
gutter_support_size = 40;
gutter_support_1st_hole = 84;
gutter_support_2nd_hole = 230;
//---------------------------------------------------------------------------------------
// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
include <basic/metal_tiles_params.scad>
include <basic/gutter_params.scad>
//---------------------------------------------------------------------------------------
angle_roof = 38;

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

num_gutters_rows_south_side = 5;
num_gutters_columns_south_side = 6;

first_gutter_at_Y = cos(angle_roof) * 30;
first_gutter_at_Z = sin(angle_roof) * 30;
//---------------------------------------------------------------------------------------
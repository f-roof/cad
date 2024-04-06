// F-Roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params_house.scad>
include <basic components/params_metal_tiles.scad>
//---------------------------------------------------------------------------------------
base_bar_half_span = 3380 + 130.08;
base_beam_side = 150;

caprior_length = 4454;
caprior_side_long = 80;
caprior_side_small = 40;

base_bar_side_long = 60;
//base_bar_extra_length = 500;
offset = 400;
base_bar_length = 2 * base_bar_half_span + 2 * offset;

//caprior_offset = 80;
//roof_extension = 200;

angle = 38;
base_extension = 500;
caprior_base_length = base_house_width;

jgheab_length = 1000;
distance_between_capriori = jgheab_length + 100;
tolerance_between_panels = 2;
first_T_at = 900;



distance_between_metal_tiles = tile_width - 50;
distance_between_roof_late = 400;
start_point_metal_tile = 100;

cedar_radius = 50;

ridge_radius = 100;
//---------------------------------------------------------------------------------------
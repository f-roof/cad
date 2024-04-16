// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://tcreate.org
//---------------------------------------------------------------------------------------
include <params_house.scad>
//---------------------------------------------------------------------------------------
base_bar_half_span = 3380 + 130.08;

truss_top_chord_length = 4454;
truss_base_bar_side_long = 60;
truss_top_chord_side_long = 80;
truss_side_small = 40; // this is the same for base and chord

truss_external_offset = 400;
truss_base_bar_length = 2 * base_bar_half_span + 2 * truss_external_offset;
//---------------------------------------------------------------------------------------
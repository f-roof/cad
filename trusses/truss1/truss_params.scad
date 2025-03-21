// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
base_bar_half_span = 3380 + 130.08;

truss_top_chord_length = 4454;
truss_base_bar_side_long = 60;
truss_top_chord_side_long = 80;
truss_side_small_size = 40; // this is the same for base and chord

truss_height = 2742; // sin(38)*truss_top_chord_length
truss_base_half_length = 3509.8; // cos(38)*truss_top_chord_length

truss_base_external_offset = 400;
truss_base_bar_length = 2 * base_bar_half_span + 2 * truss_base_external_offset;

plate_distance_to_hole = 15;
plate_height = 100;
plate_length = 4 * plate_distance_to_hole;
plate_thick = 5;
//---------------------------------------------------------------------------------------
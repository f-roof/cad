// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
truss_base_external_offset = 400;
truss_angled_chord_base = 130; // 80/sin(38);
//truss_angled_chord_base_minus_3 = 125; // 77/sin(38);
truss_angled_height_base = 102.39; //98.55; // 80*tan(52);

truss_base_half_length = 3380 + truss_angled_chord_base; // without external offset

truss_top_chord_length = 4454;
truss_base_bar_side_long = 60;
truss_top_chord_side_long = 80;
truss_side_small_size = 40; // this is the same for base and chord

truss_height = 2742; // sin(38)*truss_top_chord_length

truss_dist_to_vertical_bar = 1765 + truss_angled_chord_base;
truss_vertical_bar_length = 1380;
truss_angle_beam_interior_length = 3237;

truss_base_bar_length = 2 * truss_base_half_length + 2 * truss_base_external_offset;

plate_distance_to_hole = 15;
plate_height = 100;
plate_length = 4 * plate_distance_to_hole;
plate_thick = 5;

screw_V_base_1 = 160;
screw_V_base_2 = 260;
screw_V_base_3 = 360;

screw_V_angle_long_bottom_1 = screw_V_base_1  / cos(38);
screw_V_angle_long_bottom_2 = screw_V_base_2 / cos(38);
screw_V_angle_long_bottom_3 = screw_V_base_3 / cos(38);

screw_V_angle_short_bottom_1 = (screw_V_base_1 - truss_angled_chord_base) / cos(38);
screw_V_angle_short_bottom_2 = (screw_V_base_2 - truss_angled_chord_base) / cos(38);
screw_V_angle_short_bottom_3 = (screw_V_base_3 - truss_angled_chord_base) / cos(38);
//---------------------------------------------------------------------------------------
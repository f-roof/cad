// F-Roof: A multi-function single-layer roof
// https://github.com/f-roof
// Author: Mihai Oltean; https://mihaioltean.github.io
//---------------------------------------------------------------------------------------
truss_base_external_offset = 400;
truss_angled_chord_bottom = 130; // 80/sin(38);
truss_angled_chord_top = 101.52; // 80/sin(52);
//truss_angled_chord_base_minus_3 = 125; // 77/sin(38);
truss_angled_height_bottom = 102.39; // 80*tan(38);
truss_angled_height_top = 62.5; // 80*tan(52);

truss_base_half_length = 3380 + truss_angled_chord_bottom; // without external offset

truss_top_chord_length = 4454;
truss_top_chord_short_length = truss_top_chord_length - 80/tan(38) - 80 / tan(52);
//echo(truss_top_chord_short_length=truss_top_chord_short_length);

truss_base_beam_side_long = 60;
truss_top_chord_side_long = 80;
truss_side_small_size = 40; // this is the same for base and chord

truss_height = 2742; // sin(38)*truss_top_chord_length

truss_dist_to_vertical_bar = 1765 + truss_angled_chord_bottom;
truss_vertical_bar_length = 1380;
truss_interior_bar_length = 3229;

echo("base bar length=", 2*truss_base_half_length + 2*truss_base_external_offset); 

echo("distance between vertical bars=", 2*(truss_base_half_length - truss_dist_to_vertical_bar)); // 

truss_base_bar_length = 2 * truss_base_half_length + 2 * truss_base_external_offset;

plate_distance_to_hole = 15;
plate_height = 100;
plate_length = 4 * plate_distance_to_hole;
plate_thick = 5;

// bottom
screw_bottom_dist_1 = 190;
screw_bottom_dist_2 = 260;
screw_bottom_dist_3 = 360;

screw_V_bottom_L_1 = 250;
screw_V_bottom_L_2 = 320;
screw_V_bottom_L_3 = 400;

screw_V_angle_long_bottom_dist_1 = screw_bottom_dist_1 / cos(38);
screw_V_angle_long_bottom_dist_2 = screw_bottom_dist_2 / cos(38);
screw_V_angle_long_bottom_dist_3 = screw_bottom_dist_3 / cos(38);

screw_V_angle_short_bottom_dist_1 = (screw_bottom_dist_1 - truss_angled_chord_bottom) / cos(38);
screw_V_angle_short_bottom_dist_2 = (screw_bottom_dist_2 - truss_angled_chord_bottom) / cos(38);
screw_V_angle_short_bottom_dist_3 = (screw_bottom_dist_3 - truss_angled_chord_bottom) / cos(38);

// top
screw_V_top_dist_1 = 140;
screw_V_top_dist_2 = 190;
screw_V_top_dist_3 = 230;

screw_H_top_L_1 = 400;
screw_H_top_L_2 = 460;
screw_H_top_L_3 = 650;

screw_V_angle_long_top_dist_1 = screw_V_top_dist_1 / cos(52);
screw_V_angle_long_top_dist_2 = screw_V_top_dist_2 / cos(52);
screw_V_angle_long_top_dist_3 = screw_V_top_dist_3 / cos(52);

screw_V_angle_short_top_dist_1 = (screw_V_top_dist_1 - truss_angled_chord_top) / cos(52);
screw_V_angle_short_top_dist_2 = (screw_V_top_dist_2 - truss_angled_chord_top) / cos(52);
screw_V_angle_short_top_dist_3 = (screw_V_top_dist_3 - truss_angled_chord_top) / cos(52);

screw_H_angle_long_middle_dist = 2180;
screw_H_angle_short_middle_dist = 2178;
screw_V_angle_long_middle_dist = 2530;
screw_V_angle_short_middle_dist = 2367;

truss_horizontal_interior_beam_bottom_hole = 100;
truss_horizontal_interior_beam_top_hole = 100 - 60 /tan(38);
//---------------------------------------------------------------------------------------

; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 28m 25s; total estimated time: 34m 40s
; total layer number: 35
; total filament length [mm] : 7528.74
; total filament volume [cm^3] : 18108.75
; total filament weight [g] : 22.82
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 7.00
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == \"PETG\"}\nM109 S260\n{elsif filament_type[next_extruder] == \"PVA\"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; farthest_point_timelapse = 1
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 5
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 0
; filament_cost = 19.99
; filament_density = 1.26
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA00
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 30
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0,280,280,280,280,0,280,280,280,280,0,280,280,280,280,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of \"timelapse_record_flag\"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_force_Y = 0
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 4
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R34
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P1 R34
G1 E50 F200
M400
M104 S220
G92 E0
M73 P14 R29
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P15 R29
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
M73 P16 R29
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X33.7 Y107.25 I188.6 J41.5
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
M73 P16 R28
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/35
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X36.652 Y108.203 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X41.721 Y106.107 I5.059 J5.059 E.20965
G1 X42.199 Y106.107 E.0178
G1 X214.292 Y106.108 E6.40982
G3 X221.443 Y113.271 I-.003 J7.154 E.41879
G1 X221.443 Y138.729 E.94821
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.279 Y145.893 I-7.154 J.01 E.41929
G1 X41.721 Y145.893 E6.42713
G3 X34.557 Y138.729 I-.01 J-7.154 E.41929
G1 X34.557 Y113.271 E.94821
G3 X36.61 Y108.245 I7.154 J-.01 E.20741
M204 S6000
M73 P17 R28
G1 X36.328 Y107.878 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X41.71 Y105.65 I5.378 J5.378 E.22265
G1 X42.199 Y105.65 E.01821
G1 X214.303 Y105.651 E6.41023
G3 X221.9 Y113.26 I-.008 J7.605 E.4448
G1 X221.9 Y138.74 E.94904
G3 X214.29 Y146.35 I-7.605 J.004 E.44529
G1 X41.71 Y146.35 E6.42796
G3 X34.1 Y138.74 I-.004 J-7.605 E.44529
G1 X34.1 Y113.26 E.94904
G3 X36.285 Y107.92 I7.605 J-.004 E.22041
; WIPE_START
G1 X36.879 Y107.375 E-.30613
G1 X37.478 Y106.931 E-.2834
G1 X37.863 Y106.701 E-.17047
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X45.493 Y106.875 Z.6 F30000
G1 X220.834 Y110.88 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50001
G1 F6300
M204 S500
G1 X217.038 Y107.084 E.19998
G1 X216.884 Y107.011 E.00632
G1 X216.26 Y106.788 E.02469
G1 X216.04 Y106.733 E.00845
G1 X220.817 Y111.51 E.25163
G3 X220.981 Y112.319 I-4.024 J1.233 E.03082
G1 X215.231 Y106.569 E.30288
G2 X214.523 Y106.508 I-.666 J3.567 E.02651
G1 X221.042 Y113.027 E.34341
G3 X221.054 Y113.686 I-6.695 J.456 E.02455
G1 X213.864 Y106.496 E.37873
G1 X213.218 Y106.496 E.02408
G1 X221.054 Y114.333 E.41278
G1 X221.054 Y114.979 E.02408
G1 X212.572 Y106.496 E.44683
M73 P18 R28
G1 X211.925 Y106.496 E.02408
G1 X221.054 Y115.625 E.48088
G1 X221.054 Y116.272 E.02408
G1 X211.279 Y106.496 E.51494
G1 X210.632 Y106.496 E.02408
G1 X221.054 Y116.918 E.54899
G1 X221.054 Y117.565 E.02408
G1 X209.986 Y106.496 E.58304
G1 X209.339 Y106.496 E.02408
G1 X221.054 Y118.211 E.61709
G1 X221.054 Y118.858 E.02408
G1 X208.693 Y106.496 E.65114
G1 X208.047 Y106.496 E.02408
G1 X221.054 Y119.504 E.68519
G1 X221.054 Y120.15 E.02408
G1 X207.4 Y106.496 E.71924
G1 X206.754 Y106.496 E.02408
G1 X221.054 Y120.797 E.75329
G1 X221.054 Y121.443 E.02408
G1 X206.107 Y106.496 E.78734
G1 X205.461 Y106.496 E.02408
G1 X221.054 Y122.09 E.82139
G1 X221.054 Y122.736 E.02408
G1 X204.814 Y106.496 E.85544
G1 X204.168 Y106.496 E.02408
G1 X221.054 Y123.383 E.88949
G1 X221.054 Y124.029 E.02408
G1 X203.522 Y106.496 E.92354
G1 X202.875 Y106.496 E.02408
G1 X221.054 Y124.675 E.95759
G1 X221.054 Y125.322 E.02408
G1 X202.229 Y106.496 E.99164
G1 X201.582 Y106.496 E.02408
G1 X221.054 Y125.968 E1.0257
G1 X221.054 Y126.615 E.02408
G1 X200.936 Y106.496 E1.05975
G1 X200.29 Y106.496 E.02408
G1 X221.054 Y127.261 E1.0938
G1 X221.054 Y127.907 E.02408
G1 X199.643 Y106.496 E1.12785
G1 X198.997 Y106.496 E.02408
G1 X221.054 Y128.554 E1.1619
G1 X221.054 Y129.2 E.02408
G1 X198.35 Y106.496 E1.19595
G1 X197.704 Y106.496 E.02408
G1 X221.054 Y129.847 E1.23
G1 X221.054 Y130.493 E.02408
G1 X197.057 Y106.496 E1.26405
G1 X196.411 Y106.496 E.02408
G1 X221.054 Y131.14 E1.2981
G1 X221.054 Y131.786 E.02408
G1 X195.765 Y106.496 E1.33215
G1 X195.118 Y106.496 E.02408
G1 X221.054 Y132.432 E1.3662
M73 P19 R28
G1 X221.054 Y133.079 E.02408
G1 X194.472 Y106.496 E1.40025
G1 X193.825 Y106.496 E.02408
G1 X221.054 Y133.725 E1.4343
G1 X221.054 Y134.372 E.02408
G1 X193.179 Y106.496 E1.46835
G1 X192.532 Y106.496 E.02408
G1 X221.054 Y135.018 E1.5024
G1 X221.054 Y135.665 E.02408
G1 X191.886 Y106.496 E1.53646
G1 X191.24 Y106.496 E.02408
G1 X221.054 Y136.311 E1.57051
G1 X221.054 Y136.957 E.02408
G1 X190.593 Y106.496 E1.60456
G1 X189.947 Y106.496 E.02408
G1 X221.054 Y137.604 E1.63861
G1 X221.054 Y138.25 E.02408
G1 X189.3 Y106.496 E1.67266
G1 X188.654 Y106.496 E.02408
G1 X221.046 Y138.888 E1.70627
G3 X221.008 Y139.496 I-3.112 J.109 E.02273
G1 X188.007 Y106.496 E1.7383
G1 X187.361 Y106.496 E.02408
G1 X220.924 Y140.059 E1.76796
G1 X220.796 Y140.577 E.01987
G1 X186.715 Y106.496 E1.79522
G1 X186.068 Y106.496 E.02408
G1 X220.636 Y141.064 E1.82085
M73 P19 R27
G3 X220.449 Y141.524 I-2.428 J-.716 E.01852
G1 X185.422 Y106.496 E1.84509
G1 X184.775 Y106.496 E.02408
G1 X220.239 Y141.96 E1.86808
G1 X219.997 Y142.364 E.01755
G1 X184.129 Y106.496 E1.88937
G1 X183.482 Y106.496 E.02408
G1 X219.733 Y142.747 E1.90951
G3 X219.45 Y143.11 I-2.017 J-1.281 E.01718
G1 X182.836 Y106.496 E1.92864
G1 X182.19 Y106.496 E.02408
G1 X219.143 Y143.45 E1.94653
G3 X218.811 Y143.764 I-1.738 J-1.501 E.01706
G1 X181.543 Y106.496 E1.9631
G1 X180.897 Y106.496 E.02408
G1 X218.462 Y144.061 E1.97874
G1 X218.09 Y144.336 E.01721
G1 X180.25 Y106.496 E1.99324
G1 X179.604 Y106.496 E.02408
G1 X217.69 Y144.582 E2.00618
G3 X217.269 Y144.807 I-1.354 J-2.026 E.01782
G1 X178.957 Y106.496 E2.01805
G1 X178.311 Y106.496 E.02408
G1 X216.825 Y145.01 E2.02873
G1 X216.349 Y145.18 E.01883
G1 X177.665 Y106.496 E2.03771
G1 X177.018 Y106.496 E.02408
G1 X215.839 Y145.317 E2.04491
G3 X215.296 Y145.421 I-.789 J-2.658 E.02062
G1 X176.372 Y106.496 E2.05037
G1 X175.725 Y106.496 E.02408
G1 X214.712 Y145.483 E2.05363
G3 X214.087 Y145.504 I-.533 J-6.344 E.02329
G1 X175.079 Y106.496 E2.05478
G1 X174.433 Y106.496 E.02408
G1 X213.441 Y145.504 E2.05478
G1 X212.794 Y145.504 E.02408
G1 X173.786 Y106.496 E2.05478
G1 X173.14 Y106.496 E.02408
G1 X212.148 Y145.504 E2.05478
G1 X211.502 Y145.504 E.02408
G1 X172.493 Y106.496 E2.05478
G1 X171.847 Y106.496 E.02408
G1 X210.855 Y145.504 E2.05478
G1 X210.209 Y145.504 E.02408
G1 X171.2 Y106.496 E2.05478
G1 X170.554 Y106.496 E.02408
G1 X209.562 Y145.504 E2.05478
G1 X208.916 Y145.504 E.02408
G1 X169.908 Y106.496 E2.05478
G1 X169.261 Y106.496 E.02408
G1 X208.269 Y145.504 E2.05478
M73 P20 R27
G1 X207.623 Y145.504 E.02408
G1 X168.615 Y106.496 E2.05478
G1 X167.968 Y106.496 E.02408
G1 X206.977 Y145.504 E2.05478
G1 X206.33 Y145.504 E.02408
G1 X167.322 Y106.496 E2.05478
G1 X166.675 Y106.496 E.02408
G1 X205.684 Y145.504 E2.05478
G1 X205.037 Y145.504 E.02408
G1 X166.029 Y106.496 E2.05478
G1 X165.383 Y106.496 E.02408
G1 X204.391 Y145.504 E2.05478
G1 X203.745 Y145.504 E.02408
G1 X164.736 Y106.496 E2.05478
G1 X164.09 Y106.496 E.02408
G1 X203.098 Y145.504 E2.05478
G1 X202.452 Y145.504 E.02408
G1 X163.443 Y106.496 E2.05478
G1 X162.797 Y106.496 E.02408
G1 X201.805 Y145.504 E2.05478
G1 X201.159 Y145.504 E.02408
G1 X162.15 Y106.496 E2.05478
G1 X161.504 Y106.496 E.02408
G1 X200.512 Y145.504 E2.05478
G1 X199.866 Y145.504 E.02408
G1 X160.858 Y106.496 E2.05478
G1 X160.211 Y106.496 E.02408
G1 X199.22 Y145.504 E2.05478
G1 X198.573 Y145.504 E.02408
G1 X159.565 Y106.496 E2.05478
G1 X158.918 Y106.496 E.02408
G1 X197.927 Y145.504 E2.05478
G1 X197.28 Y145.504 E.02408
G1 X158.272 Y106.496 E2.05478
G1 X157.625 Y106.496 E.02408
G1 X196.634 Y145.504 E2.05478
G1 X195.987 Y145.504 E.02408
G1 X156.979 Y106.496 E2.05478
G1 X156.333 Y106.496 E.02408
G1 X195.341 Y145.504 E2.05478
G1 X194.695 Y145.504 E.02408
G1 X155.686 Y106.496 E2.05478
G1 X155.04 Y106.496 E.02408
G1 X194.048 Y145.504 E2.05478
G1 X193.402 Y145.504 E.02408
G1 X154.393 Y106.496 E2.05478
G1 X153.747 Y106.496 E.02408
G1 X192.755 Y145.504 E2.05478
G1 X192.109 Y145.504 E.02408
G1 X153.1 Y106.496 E2.05478
G1 X152.454 Y106.496 E.02408
G1 X191.462 Y145.504 E2.05478
G1 X190.816 Y145.504 E.02408
G1 X151.808 Y106.496 E2.05478
G1 X151.161 Y106.496 E.02408
G1 X190.17 Y145.504 E2.05478
G1 X189.523 Y145.504 E.02408
G1 X150.515 Y106.496 E2.05478
M73 P21 R27
G1 X149.868 Y106.496 E.02408
G1 X188.877 Y145.504 E2.05478
G1 X188.23 Y145.504 E.02408
G1 X149.222 Y106.496 E2.05478
G1 X148.576 Y106.496 E.02408
G1 X187.584 Y145.504 E2.05478
G1 X186.938 Y145.504 E.02408
G1 X147.929 Y106.496 E2.05478
G1 X147.283 Y106.496 E.02408
G1 X186.291 Y145.504 E2.05478
G1 X185.645 Y145.504 E.02408
G1 X146.636 Y106.496 E2.05478
G1 X145.99 Y106.496 E.02408
G1 X184.998 Y145.504 E2.05478
G1 X184.352 Y145.504 E.02408
G1 X145.343 Y106.496 E2.05478
G1 X144.697 Y106.496 E.02408
G1 X183.705 Y145.504 E2.05478
G1 X183.059 Y145.504 E.02408
G1 X144.051 Y106.496 E2.05478
G1 X143.404 Y106.496 E.02408
G1 X182.413 Y145.504 E2.05478
G1 X181.766 Y145.504 E.02408
G1 X142.758 Y106.496 E2.05478
G1 X142.111 Y106.496 E.02408
G1 X181.12 Y145.504 E2.05478
G1 X180.473 Y145.504 E.02408
G1 X141.465 Y106.496 E2.05478
G1 X140.818 Y106.496 E.02408
G1 X179.827 Y145.504 E2.05478
G1 X179.18 Y145.504 E.02408
G1 X140.172 Y106.496 E2.05478
G1 X139.526 Y106.496 E.02408
G1 X178.534 Y145.504 E2.05478
G1 X177.888 Y145.504 E.02408
G1 X138.879 Y106.496 E2.05478
G1 X138.233 Y106.496 E.02408
G1 X177.241 Y145.504 E2.05478
G1 X176.595 Y145.504 E.02408
G1 X137.586 Y106.496 E2.05478
G1 X136.94 Y106.496 E.02408
G1 X175.948 Y145.504 E2.05478
G1 X175.302 Y145.504 E.02408
G1 X136.293 Y106.496 E2.05478
G1 X135.647 Y106.496 E.02408
G1 X174.655 Y145.504 E2.05478
G1 X174.009 Y145.504 E.02408
G1 X135.001 Y106.496 E2.05478
G1 X134.354 Y106.496 E.02408
G1 X173.363 Y145.504 E2.05478
G1 X172.716 Y145.504 E.02408
G1 X133.708 Y106.496 E2.05478
G1 X133.061 Y106.496 E.02408
G1 X172.07 Y145.504 E2.05478
G1 X171.423 Y145.504 E.02408
G1 X132.415 Y106.496 E2.05478
M73 P22 R27
G1 X131.768 Y106.496 E.02408
G1 X170.777 Y145.504 E2.05478
G1 X170.131 Y145.504 E.02408
G1 X131.122 Y106.496 E2.05478
G1 X130.476 Y106.496 E.02408
G1 X169.484 Y145.504 E2.05478
G1 X168.838 Y145.504 E.02408
G1 X129.829 Y106.496 E2.05478
G1 X129.183 Y106.496 E.02408
G1 X168.191 Y145.504 E2.05478
M73 P22 R26
G1 X167.545 Y145.504 E.02408
G1 X128.536 Y106.496 E2.05478
G1 X127.89 Y106.496 E.02408
G1 X166.898 Y145.504 E2.05478
G1 X166.252 Y145.504 E.02408
G1 X127.243 Y106.496 E2.05479
G1 X126.597 Y106.496 E.02408
G1 X165.606 Y145.504 E2.05479
G1 X164.959 Y145.504 E.02408
G1 X125.951 Y106.496 E2.05479
G1 X125.304 Y106.496 E.02408
G1 X164.313 Y145.504 E2.05479
G1 X163.666 Y145.504 E.02408
G1 X124.658 Y106.496 E2.05479
G1 X124.011 Y106.496 E.02408
G1 X163.02 Y145.504 E2.05479
G1 X162.373 Y145.504 E.02408
G1 X123.365 Y106.496 E2.05479
G1 X122.718 Y106.496 E.02408
G1 X161.727 Y145.504 E2.05479
G1 X161.081 Y145.504 E.02408
G1 X122.072 Y106.496 E2.05479
G1 X121.426 Y106.496 E.02408
G1 X160.434 Y145.504 E2.05479
G1 X159.788 Y145.504 E.02408
G1 X120.779 Y106.496 E2.05479
G1 X120.133 Y106.496 E.02408
G1 X159.141 Y145.504 E2.05479
G1 X158.495 Y145.504 E.02408
G1 X119.486 Y106.496 E2.05479
G1 X118.84 Y106.496 E.02408
G1 X157.848 Y145.504 E2.05479
G1 X157.202 Y145.504 E.02408
G1 X118.194 Y106.496 E2.05479
G1 X117.547 Y106.496 E.02408
G1 X156.556 Y145.504 E2.05479
G1 X155.909 Y145.504 E.02408
G1 X116.901 Y106.496 E2.05479
G1 X116.254 Y106.496 E.02408
G1 X155.263 Y145.504 E2.05479
G1 X154.616 Y145.504 E.02408
G1 X115.608 Y106.496 E2.05479
G1 X114.961 Y106.496 E.02408
G1 X153.97 Y145.504 E2.05479
G1 X153.324 Y145.504 E.02408
G1 X114.315 Y106.496 E2.05479
G1 X113.669 Y106.496 E.02408
G1 X152.677 Y145.504 E2.05479
M73 P23 R26
G1 X152.031 Y145.504 E.02408
G1 X113.022 Y106.496 E2.05479
G1 X112.376 Y106.496 E.02408
G1 X151.384 Y145.504 E2.05479
G1 X150.738 Y145.504 E.02408
G1 X111.729 Y106.496 E2.05479
G1 X111.083 Y106.496 E.02408
G1 X150.091 Y145.504 E2.05479
G1 X149.445 Y145.504 E.02408
G1 X110.436 Y106.496 E2.05479
G1 X109.79 Y106.496 E.02408
G1 X148.799 Y145.504 E2.05479
G1 X148.152 Y145.504 E.02408
G1 X109.144 Y106.496 E2.05479
G1 X108.497 Y106.496 E.02408
G1 X147.506 Y145.504 E2.05479
G1 X146.859 Y145.504 E.02408
G1 X107.851 Y106.496 E2.05479
G1 X107.204 Y106.496 E.02408
G1 X146.213 Y145.504 E2.05479
G1 X145.566 Y145.504 E.02408
G1 X106.558 Y106.496 E2.05479
G1 X105.911 Y106.496 E.02408
G1 X144.92 Y145.504 E2.05479
G1 X144.274 Y145.504 E.02408
G1 X105.265 Y106.496 E2.05479
G1 X104.619 Y106.496 E.02408
G1 X143.627 Y145.504 E2.05479
G1 X142.981 Y145.504 E.02408
G1 X103.972 Y106.496 E2.05479
G1 X103.326 Y106.496 E.02408
G1 X142.334 Y145.504 E2.05479
G1 X141.688 Y145.504 E.02408
G1 X102.679 Y106.496 E2.05479
G1 X102.033 Y106.496 E.02408
G1 X141.042 Y145.504 E2.05479
G1 X140.395 Y145.504 E.02408
G1 X101.386 Y106.496 E2.05479
G1 X100.74 Y106.496 E.02408
G1 X139.749 Y145.504 E2.05479
G1 X139.102 Y145.504 E.02408
G1 X100.094 Y106.496 E2.05479
G1 X99.447 Y106.496 E.02408
G1 X138.456 Y145.504 E2.05479
G1 X137.809 Y145.504 E.02408
G1 X98.801 Y106.496 E2.05479
G1 X98.154 Y106.496 E.02408
G1 X137.163 Y145.504 E2.05479
G1 X136.517 Y145.504 E.02408
G1 X97.508 Y106.496 E2.05479
G1 X96.861 Y106.496 E.02408
G1 X135.87 Y145.504 E2.05479
G1 X135.224 Y145.504 E.02408
G1 X96.215 Y106.496 E2.05479
G1 X95.569 Y106.496 E.02408
G1 X134.577 Y145.504 E2.05479
M73 P24 R26
G1 X133.931 Y145.504 E.02408
G1 X94.922 Y106.496 E2.05479
G1 X94.276 Y106.496 E.02408
G1 X133.284 Y145.504 E2.05479
G1 X132.638 Y145.504 E.02408
G1 X93.629 Y106.496 E2.05479
G1 X92.983 Y106.496 E.02408
G1 X131.992 Y145.504 E2.05479
G1 X131.345 Y145.504 E.02408
G1 X92.337 Y106.496 E2.05479
G1 X91.69 Y106.496 E.02408
G1 X130.699 Y145.504 E2.05479
G1 X130.052 Y145.504 E.02408
G1 X91.044 Y106.496 E2.05479
G1 X90.397 Y106.496 E.02408
G1 X129.406 Y145.504 E2.05479
G1 X128.759 Y145.504 E.02408
G1 X89.751 Y106.496 E2.05479
G1 X89.104 Y106.496 E.02408
G1 X128.113 Y145.504 E2.05479
G1 X127.467 Y145.504 E.02408
G1 X88.458 Y106.496 E2.05479
G1 X87.812 Y106.496 E.02408
G1 X126.82 Y145.504 E2.05479
G1 X126.174 Y145.504 E.02408
G1 X87.165 Y106.496 E2.05479
G1 X86.519 Y106.496 E.02408
G1 X125.527 Y145.504 E2.05479
G1 X124.881 Y145.504 E.02408
G1 X85.872 Y106.496 E2.05479
G1 X85.226 Y106.496 E.02408
G1 X124.235 Y145.504 E2.05479
G1 X123.588 Y145.504 E.02408
G1 X84.579 Y106.496 E2.05479
G1 X83.933 Y106.496 E.02408
G1 X122.942 Y145.504 E2.05479
G1 X122.295 Y145.504 E.02408
G1 X83.287 Y106.496 E2.05479
G1 X82.64 Y106.496 E.02408
G1 X121.649 Y145.504 E2.05479
G1 X121.002 Y145.504 E.02408
G1 X81.994 Y106.496 E2.05479
G1 X81.347 Y106.496 E.02408
G1 X120.356 Y145.504 E2.05479
G1 X119.71 Y145.504 E.02408
G1 X80.701 Y106.496 E2.05479
G1 X80.054 Y106.496 E.02408
G1 X119.063 Y145.504 E2.05479
G1 X118.417 Y145.504 E.02408
G1 X79.408 Y106.496 E2.05479
G1 X78.762 Y106.496 E.02408
G1 X117.77 Y145.504 E2.05479
G1 X117.124 Y145.504 E.02408
G1 X78.115 Y106.496 E2.05479
G1 X77.469 Y106.496 E.02408
G1 X116.477 Y145.504 E2.05479
M73 P25 R26
G1 X115.831 Y145.504 E.02408
G1 X76.822 Y106.496 E2.05479
M73 P25 R25
G1 X76.176 Y106.496 E.02408
G1 X115.185 Y145.504 E2.05479
G1 X114.538 Y145.504 E.02408
G1 X75.529 Y106.496 E2.0548
G1 X74.883 Y106.496 E.02408
G1 X113.892 Y145.504 E2.0548
G1 X113.245 Y145.504 E.02408
G1 X74.237 Y106.496 E2.0548
G1 X73.59 Y106.496 E.02408
G1 X112.599 Y145.504 E2.0548
G1 X111.952 Y145.504 E.02408
G1 X72.944 Y106.496 E2.0548
G1 X72.297 Y106.496 E.02408
G1 X111.306 Y145.504 E2.0548
G1 X110.66 Y145.504 E.02408
G1 X71.651 Y106.496 E2.0548
G1 X71.004 Y106.496 E.02408
G1 X110.013 Y145.504 E2.0548
G1 X109.367 Y145.504 E.02408
G1 X70.358 Y106.496 E2.0548
G1 X69.712 Y106.496 E.02408
G1 X108.72 Y145.504 E2.0548
G1 X108.074 Y145.504 E.02408
G1 X69.065 Y106.496 E2.0548
G1 X68.419 Y106.496 E.02408
G1 X107.428 Y145.504 E2.0548
G1 X106.781 Y145.504 E.02408
G1 X67.772 Y106.496 E2.0548
G1 X67.126 Y106.496 E.02408
G1 X106.135 Y145.504 E2.0548
G1 X105.488 Y145.504 E.02408
G1 X66.479 Y106.496 E2.0548
G1 X65.833 Y106.496 E.02408
G1 X104.842 Y145.504 E2.0548
G1 X104.195 Y145.504 E.02408
G1 X65.187 Y106.496 E2.0548
G1 X64.54 Y106.496 E.02408
G1 X103.549 Y145.504 E2.0548
G1 X102.903 Y145.504 E.02408
G1 X63.894 Y106.496 E2.0548
G1 X63.247 Y106.496 E.02408
G1 X102.256 Y145.504 E2.0548
G1 X101.61 Y145.504 E.02408
G1 X62.601 Y106.496 E2.0548
G1 X61.955 Y106.496 E.02408
G1 X100.963 Y145.504 E2.0548
G1 X100.317 Y145.504 E.02408
G1 X61.308 Y106.496 E2.0548
G1 X60.662 Y106.496 E.02408
G1 X99.67 Y145.504 E2.0548
G1 X99.024 Y145.504 E.02408
G1 X60.015 Y106.496 E2.0548
G1 X59.369 Y106.496 E.02408
G1 X98.378 Y145.504 E2.0548
M73 P26 R25
G1 X97.731 Y145.504 E.02408
G1 X58.722 Y106.496 E2.0548
G1 X58.076 Y106.496 E.02408
G1 X97.085 Y145.504 E2.0548
G1 X96.438 Y145.504 E.02408
G1 X57.43 Y106.496 E2.0548
G1 X56.783 Y106.496 E.02408
G1 X95.792 Y145.504 E2.0548
G1 X95.145 Y145.504 E.02408
G1 X56.137 Y106.496 E2.0548
G1 X55.49 Y106.496 E.02408
G1 X94.499 Y145.504 E2.0548
G1 X93.853 Y145.504 E.02408
G1 X54.844 Y106.496 E2.0548
G1 X54.197 Y106.496 E.02408
G1 X93.206 Y145.504 E2.0548
G1 X92.56 Y145.504 E.02408
G1 X53.551 Y106.496 E2.0548
G1 X52.905 Y106.496 E.02408
G1 X91.913 Y145.504 E2.0548
G1 X91.267 Y145.504 E.02408
G1 X52.258 Y106.496 E2.0548
G1 X51.612 Y106.496 E.02408
G1 X90.621 Y145.504 E2.0548
G1 X89.974 Y145.504 E.02408
G1 X50.965 Y106.496 E2.0548
G1 X50.319 Y106.496 E.02408
G1 X89.328 Y145.504 E2.0548
G1 X88.681 Y145.504 E.02408
G1 X49.672 Y106.496 E2.0548
G1 X49.026 Y106.496 E.02408
G1 X88.035 Y145.504 E2.0548
G1 X87.388 Y145.504 E.02408
G1 X48.38 Y106.496 E2.0548
G1 X47.733 Y106.496 E.02408
G1 X86.742 Y145.504 E2.0548
G1 X86.096 Y145.504 E.02408
G1 X47.087 Y106.496 E2.0548
G1 X46.44 Y106.496 E.02408
G1 X85.449 Y145.504 E2.0548
G1 X84.803 Y145.504 E.02408
G1 X45.794 Y106.496 E2.0548
G1 X45.147 Y106.496 E.02408
G1 X84.156 Y145.504 E2.0548
G1 X83.51 Y145.504 E.02408
G1 X44.501 Y106.496 E2.0548
G1 X43.855 Y106.496 E.02408
G1 X82.863 Y145.504 E2.0548
G1 X82.217 Y145.504 E.02408
G1 X43.208 Y106.496 E2.0548
G1 X42.562 Y106.496 E.02408
G1 X81.571 Y145.504 E2.0548
G1 X80.924 Y145.504 E.02408
G1 X41.915 Y106.496 E2.0548
G2 X41.291 Y106.517 I-.093 J6.361 E.0233
G1 X80.278 Y145.504 E2.05366
G1 X79.631 Y145.504 E.02408
G1 X40.706 Y106.579 E2.05041
M73 P27 R25
G2 X40.162 Y106.682 I.251 J2.807 E.02063
G1 X78.985 Y145.504 E2.04498
G1 X78.338 Y145.504 E.02408
G1 X39.653 Y106.819 E2.03777
G1 X39.177 Y106.989 E.01883
G1 X77.692 Y145.504 E2.0288
G1 X77.046 Y145.504 E.02408
G1 X38.733 Y107.192 E2.01812
G2 X38.312 Y107.417 I.933 J2.252 E.01782
G1 X76.399 Y145.504 E2.00626
G1 X75.753 Y145.504 E.02408
G1 X37.911 Y107.663 E1.99332
G1 X37.54 Y107.938 E.01721
G1 X75.106 Y145.504 E1.97882
G1 X74.46 Y145.504 E.02408
G1 X37.19 Y108.235 E1.9632
G2 X36.858 Y108.549 I1.429 J1.844 E.01706
G1 X73.814 Y145.504 E1.94664
G1 X73.167 Y145.504 E.02408
G1 X36.551 Y108.888 E1.92878
G2 X36.268 Y109.252 I1.707 J1.618 E.01719
G1 X72.521 Y145.504 E1.90962
G1 X71.874 Y145.504 E.02408
G1 X36.004 Y109.634 E1.88949
G1 X35.762 Y110.038 E.01755
G1 X71.228 Y145.504 E1.8682
G1 X70.581 Y145.504 E.02408
G1 X35.552 Y110.475 E1.84521
G2 X35.365 Y110.934 I2.24 J1.176 E.01851
G1 X69.935 Y145.504 E1.82098
G1 X69.289 Y145.504 E.02408
G1 X35.205 Y111.421 E1.79536
G1 X35.076 Y111.938 E.01986
G1 X68.642 Y145.504 E1.76811
G1 X67.996 Y145.504 E.02408
G1 X34.993 Y112.501 E1.73845
G2 X34.954 Y113.109 I3.072 J.5 E.02272
G1 X67.349 Y145.504 E1.70643
G1 X66.703 Y145.504 E.02408
G1 X34.946 Y113.747 E1.67282
G1 X34.946 Y114.394 E.02408
G1 X66.056 Y145.504 E1.63877
G1 X65.41 Y145.504 E.02408
G1 X34.946 Y115.04 E1.60472
G1 X34.946 Y115.686 E.02408
G1 X64.764 Y145.504 E1.57067
G1 X64.117 Y145.504 E.02408
G1 X34.946 Y116.333 E1.53662
G1 X34.946 Y116.979 E.02408
G1 X63.471 Y145.504 E1.50257
G1 X62.824 Y145.504 E.02408
G1 X34.946 Y117.626 E1.46852
M73 P27 R24
G1 X34.946 Y118.272 E.02408
G1 X62.178 Y145.504 E1.43447
G1 X61.531 Y145.504 E.02408
G1 X34.946 Y118.918 E1.40042
M73 P28 R24
G1 X34.946 Y119.565 E.02408
G1 X60.885 Y145.504 E1.36637
G1 X60.239 Y145.504 E.02408
G1 X34.946 Y120.211 E1.33232
G1 X34.946 Y120.858 E.02408
G1 X59.592 Y145.504 E1.29827
G1 X58.946 Y145.504 E.02408
G1 X34.946 Y121.504 E1.26422
G1 X34.946 Y122.151 E.02408
G1 X58.299 Y145.504 E1.23017
G1 X57.653 Y145.504 E.02408
G1 X34.946 Y122.797 E1.19612
G1 X34.946 Y123.443 E.02408
G1 X57.007 Y145.504 E1.16207
G1 X56.36 Y145.504 E.02408
G1 X34.946 Y124.09 E1.12802
G1 X34.946 Y124.736 E.02408
G1 X55.714 Y145.504 E1.09397
G1 X55.067 Y145.504 E.02408
G1 X34.946 Y125.383 E1.05992
G1 X34.946 Y126.029 E.02408
G1 X54.421 Y145.504 E1.02586
G1 X53.774 Y145.504 E.02408
G1 X34.946 Y126.676 E.99181
G1 X34.946 Y127.322 E.02408
G1 X53.128 Y145.504 E.95776
G1 X52.482 Y145.504 E.02408
G1 X34.946 Y127.968 E.92371
G1 X34.946 Y128.615 E.02408
G1 X51.835 Y145.504 E.88966
G1 X51.189 Y145.504 E.02408
G1 X34.946 Y129.261 E.85561
G1 X34.946 Y129.908 E.02408
G1 X50.542 Y145.504 E.82156
G1 X49.896 Y145.504 E.02408
G1 X34.946 Y130.554 E.78751
G1 X34.946 Y131.201 E.02408
G1 X49.249 Y145.504 E.75346
G1 X48.603 Y145.504 E.02408
G1 X34.946 Y131.847 E.71941
G1 X34.946 Y132.493 E.02408
G1 X47.957 Y145.504 E.68536
G1 X47.31 Y145.504 E.02408
G1 X34.946 Y133.14 E.65131
G1 X34.946 Y133.786 E.02408
G1 X46.664 Y145.504 E.61726
G1 X46.017 Y145.504 E.02408
G1 X34.946 Y134.433 E.58321
G1 X34.946 Y135.079 E.02408
G1 X45.371 Y145.504 E.54916
G1 X44.724 Y145.504 E.02408
G1 X34.946 Y135.725 E.51511
G1 X34.946 Y136.372 E.02408
G1 X44.078 Y145.504 E.48106
G1 X43.432 Y145.504 E.02408
G1 X34.946 Y137.018 E.44701
G1 X34.946 Y137.665 E.02408
G1 X42.785 Y145.504 E.41296
G1 X42.139 Y145.504 E.02408
G1 X34.946 Y138.311 E.37891
G2 X34.958 Y138.97 I6.703 J.204 E.02455
G1 X41.48 Y145.492 E.34356
G3 X40.773 Y145.431 I-.043 J-3.627 E.02649
G1 X35.019 Y139.677 E.30307
G2 X35.182 Y140.487 I4.185 J-.421 E.0308
G1 X39.962 Y145.267 E.2518
M73 P29 R24
G3 X38.967 Y144.919 I1.853 J-6.887 E.03929
G1 X35.531 Y141.483 E.181
G2 X36.902 Y143.5 I6.002 J-2.604 E.09137
G1 X38.095 Y144.692 E.06283
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X36.902 Y143.5 E-.64097
G1 X36.692 Y143.268 E-.11903
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/35
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I1.217 J-.008 P1  F30000
G1 X36.471 Y108.021 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.237 J5.237 E.19317
G1 X214.324 Y105.854 E5.72578
G3 X221.698 Y113.265 I-.03 J7.404 E.38501
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.429 Y108.064 I7.406 J-.007 E.19119
M204 S250
G1 X36.192 Y107.742 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.51 J5.51 E.18814
G1 X214.334 Y105.462 E5.3044
G3 X222.09 Y113.255 I-.035 J7.791 E.37504
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.001 J-7.797 E.37623
G1 X33.91 Y113.255 E.78322
G3 X36.15 Y107.785 I7.793 J-.002 E.1863
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.31322
G1 X37.372 Y106.773 E-.29052
G1 X37.725 Y106.562 E-.15626
; WIPE_END
G1 E-.04 F1800
G1 X37.794 Y107.168 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42087
G1 F15000
G1 X36.691 Y108.271 E.04805
G2 X35.47 Y109.92 I5.684 J5.482 E.06337
G1 X35.375 Y110.121 E.00684
G1 X38.571 Y106.925 E.13919
G3 X39.48 Y106.551 I2.353 J4.424 E.03031
G1 X35.001 Y111.03 E.19506
G2 X34.798 Y111.767 I3.643 J1.399 E.02359
G1 X40.217 Y106.348 E.23602
G3 X40.857 Y106.243 I.856 J3.196 E.02001
G1 X34.693 Y112.407 E.2685
G2 X34.649 Y112.985 I2.913 J.509 E.01787
G1 X41.435 Y106.199 E.29555
G3 X41.984 Y106.185 I.418 J5.577 E.01691
G1 X34.635 Y113.534 E.32007
G1 X34.635 Y114.068 E.01646
G1 X42.518 Y106.185 E.34335
G1 X43.053 Y106.185 E.01646
G1 X34.635 Y114.603 E.36663
G1 X34.635 Y115.137 E.01646
G1 X43.587 Y106.185 E.38991
G1 X44.122 Y106.185 E.01646
G1 X34.635 Y115.672 E.41319
G1 X34.635 Y116.206 E.01646
G1 X44.656 Y106.185 E.43647
G1 X45.191 Y106.185 E.01646
G1 X34.635 Y116.741 E.45975
G1 X34.635 Y117.275 E.01646
G1 X45.725 Y106.185 E.48303
G1 X46.26 Y106.185 E.01646
G1 X34.635 Y117.81 E.50631
G1 X34.635 Y118.344 E.01646
G1 X46.794 Y106.185 E.52959
G1 X47.329 Y106.185 E.01646
G1 X34.635 Y118.879 E.55287
G1 X34.635 Y119.413 E.01646
G1 X47.863 Y106.185 E.57615
G1 X48.398 Y106.185 E.01646
G1 X34.635 Y119.948 E.59943
G1 X34.635 Y120.482 E.01646
G1 X48.932 Y106.185 E.62271
G1 X49.467 Y106.185 E.01646
G1 X34.635 Y121.017 E.64599
G1 X34.635 Y121.551 E.01646
G1 X50.001 Y106.185 E.66927
G1 X50.536 Y106.185 E.01646
G1 X34.635 Y122.086 E.69255
G1 X34.635 Y122.62 E.01646
G1 X51.07 Y106.185 E.71583
G1 X51.605 Y106.185 E.01646
G1 X34.635 Y123.155 E.73911
G1 X34.635 Y123.689 E.01646
G1 X52.139 Y106.185 E.76239
G1 X52.674 Y106.185 E.01646
G1 X34.635 Y124.224 E.78567
G1 X34.635 Y124.758 E.01646
G1 X53.208 Y106.185 E.80895
G1 X53.743 Y106.185 E.01646
G1 X34.635 Y125.293 E.83223
G1 X34.635 Y125.827 E.01646
G1 X54.277 Y106.185 E.85551
G1 X54.812 Y106.185 E.01646
G1 X34.635 Y126.362 E.87879
G1 X34.635 Y126.896 E.01646
G1 X55.346 Y106.185 E.90207
G1 X55.881 Y106.185 E.01646
G1 X34.635 Y127.431 E.92535
G1 X34.635 Y127.965 E.01646
G1 X56.415 Y106.185 E.94863
G1 X56.95 Y106.185 E.01646
G1 X34.635 Y128.5 E.97191
G1 X34.635 Y129.034 E.01646
G1 X57.484 Y106.185 E.99519
G1 X58.019 Y106.185 E.01646
G1 X34.635 Y129.569 E1.01847
G1 X34.635 Y130.103 E.01646
G1 X58.553 Y106.186 E1.04175
G1 X59.088 Y106.186 E.01646
G1 X34.635 Y130.638 E1.06503
G1 X34.635 Y131.172 E.01646
G1 X59.622 Y106.186 E1.08831
G1 X60.157 Y106.186 E.01646
G1 X34.635 Y131.707 E1.11159
G1 X34.635 Y132.241 E.01646
G1 X60.691 Y106.186 E1.13487
G1 X61.226 Y106.186 E.01646
G1 X34.635 Y132.776 E1.15815
G1 X34.635 Y133.31 E.01646
G1 X61.76 Y106.186 E1.18143
G1 X62.295 Y106.186 E.01646
G1 X34.635 Y133.845 E1.20471
G1 X34.635 Y134.379 E.01646
G1 X62.829 Y106.186 E1.22799
G1 X63.364 Y106.186 E.01646
G1 X34.635 Y134.914 E1.25127
G1 X34.635 Y135.448 E.01646
G1 X63.898 Y106.186 E1.27455
G1 X64.433 Y106.186 E.01646
G1 X34.635 Y135.983 E1.29783
G1 X34.635 Y136.517 E.01646
G1 X64.967 Y106.186 E1.32111
G1 X65.502 Y106.186 E.01646
G1 X34.635 Y137.052 E1.34439
G1 X34.635 Y137.586 E.01646
G1 X66.036 Y106.186 E1.36767
G1 X66.571 Y106.186 E.01646
G1 X34.635 Y138.121 E1.39095
G1 X34.635 Y138.655 E.01646
G1 X67.105 Y106.186 E1.41423
G1 X67.64 Y106.186 E.01646
G1 X34.657 Y139.168 E1.43656
G2 X34.702 Y139.657 I2.507 J.014 E.01515
G1 X68.174 Y106.186 E1.45787
G1 X68.709 Y106.186 E.01646
G1 X34.771 Y140.123 E1.47814
G2 X34.878 Y140.551 I2.243 J-.332 E.0136
G1 X69.243 Y106.186 E1.49678
G1 X69.778 Y106.186 E.01646
G1 X34.999 Y140.964 E1.51478
G1 X35.14 Y141.358 E.01288
G1 X70.312 Y106.186 E1.53193
G1 X70.847 Y106.186 E.01646
G1 X35.304 Y141.728 E1.54806
G2 X35.477 Y142.09 I1.918 J-.692 E.01237
G1 X71.381 Y106.186 E1.56382
G1 X71.916 Y106.186 E.01646
G1 X35.677 Y142.424 E1.57838
G2 X35.884 Y142.752 I1.764 J-.887 E.01195
G1 X72.45 Y106.186 E1.59263
G1 X72.985 Y106.186 E.01646
G1 X36.112 Y143.058 E1.606
G2 X36.351 Y143.354 I1.616 J-1.065 E.01172
G1 X73.519 Y106.186 E1.61886
G1 X74.054 Y106.186 E.01646
G1 X36.605 Y143.634 E1.63107
G2 X36.875 Y143.899 I1.478 J-1.239 E.01166
G1 X74.588 Y106.186 E1.64259
G1 X75.123 Y106.186 E.01646
G1 X37.156 Y144.153 E1.65366
G2 X37.456 Y144.386 I1.335 J-1.408 E.01175
G1 X75.657 Y106.186 E1.66383
G1 X76.192 Y106.186 E.01646
G1 X37.763 Y144.614 E1.67375
G2 X38.096 Y144.815 I1.184 J-1.582 E.01201
G1 X76.726 Y106.186 E1.68252
G1 X77.261 Y106.186 E.01646
G1 X38.436 Y145.01 E1.69102
G1 X38.799 Y145.182 E.01236
G1 X77.795 Y106.186 E1.69849
M73 P30 R24
G1 X78.33 Y106.186 E.01646
G1 X39.176 Y145.34 E1.70536
G1 X39.569 Y145.481 E.01288
G1 X78.864 Y106.186 E1.7115
G1 X79.399 Y106.186 E.01646
G1 X39.99 Y145.595 E1.71646
G2 X40.426 Y145.693 I.719 J-2.164 E.01379
G1 X79.933 Y106.186 E1.72075
G1 X80.468 Y106.186 E.01646
G1 X40.891 Y145.762 E1.72376
G2 X41.39 Y145.798 I.432 J-2.512 E.01542
G1 X81.002 Y106.186 E1.72533
G1 X81.537 Y106.186 E.01646
G1 X41.908 Y145.815 E1.72604
G1 X42.442 Y145.815 E.01646
G1 X82.071 Y106.186 E1.72604
G1 X82.606 Y106.186 E.01646
G1 X42.977 Y145.815 E1.72604
G1 X43.511 Y145.815 E.01646
G1 X83.14 Y106.186 E1.72604
G1 X83.675 Y106.186 E.01646
G1 X44.046 Y145.815 E1.72604
G1 X44.58 Y145.815 E.01646
G1 X84.209 Y106.186 E1.72604
G1 X84.744 Y106.186 E.01646
G1 X45.115 Y145.815 E1.72604
G1 X45.649 Y145.815 E.01646
G1 X85.278 Y106.186 E1.72604
G1 X85.813 Y106.186 E.01646
G1 X46.184 Y145.815 E1.72604
G1 X46.718 Y145.815 E.01646
G1 X86.347 Y106.186 E1.72604
G1 X86.882 Y106.186 E.01646
G1 X47.253 Y145.815 E1.72604
G1 X47.787 Y145.815 E.01646
G1 X87.416 Y106.186 E1.72604
G1 X87.95 Y106.186 E.01646
G1 X48.322 Y145.815 E1.72604
G1 X48.856 Y145.815 E.01646
G1 X88.485 Y106.186 E1.72604
G1 X89.019 Y106.186 E.01646
G1 X49.391 Y145.815 E1.72604
G1 X49.925 Y145.815 E.01646
G1 X89.554 Y106.186 E1.72604
G1 X90.088 Y106.186 E.01646
G1 X50.46 Y145.815 E1.72604
G1 X50.994 Y145.815 E.01646
G1 X90.623 Y106.186 E1.72604
G1 X91.157 Y106.186 E.01646
G1 X51.529 Y145.815 E1.72604
G1 X52.063 Y145.815 E.01646
G1 X91.692 Y106.186 E1.72604
G1 X92.226 Y106.186 E.01646
G1 X52.598 Y145.815 E1.72604
G1 X53.132 Y145.815 E.01646
G1 X92.761 Y106.186 E1.72604
G1 X93.295 Y106.186 E.01646
G1 X53.667 Y145.815 E1.72604
G1 X54.201 Y145.815 E.01646
G1 X93.83 Y106.186 E1.72604
G1 X94.364 Y106.186 E.01646
G1 X54.736 Y145.815 E1.72604
G1 X55.27 Y145.815 E.01646
G1 X94.899 Y106.186 E1.72604
G1 X95.433 Y106.186 E.01646
G1 X55.805 Y145.815 E1.72604
G1 X56.339 Y145.815 E.01646
G1 X95.968 Y106.186 E1.72604
G1 X96.502 Y106.186 E.01646
G1 X56.874 Y145.815 E1.72604
G1 X57.408 Y145.815 E.01646
G1 X97.037 Y106.186 E1.72604
G1 X97.571 Y106.186 E.01646
G1 X57.943 Y145.815 E1.72604
G1 X58.477 Y145.815 E.01646
G1 X98.106 Y106.186 E1.72604
G1 X98.64 Y106.186 E.01646
G1 X59.012 Y145.815 E1.72604
G1 X59.546 Y145.815 E.01646
G1 X99.175 Y106.186 E1.72603
G1 X99.709 Y106.186 E.01646
G1 X60.081 Y145.815 E1.72603
G1 X60.615 Y145.815 E.01646
G1 X100.244 Y106.186 E1.72603
G1 X100.778 Y106.186 E.01646
G1 X61.15 Y145.815 E1.72603
G1 X61.684 Y145.815 E.01646
G1 X101.313 Y106.186 E1.72603
G1 X101.847 Y106.186 E.01646
G1 X62.219 Y145.815 E1.72603
G1 X62.753 Y145.815 E.01646
G1 X102.382 Y106.186 E1.72603
G1 X102.916 Y106.186 E.01646
G1 X63.288 Y145.815 E1.72603
G1 X63.822 Y145.815 E.01646
G1 X103.451 Y106.186 E1.72603
G1 X103.985 Y106.186 E.01646
G1 X64.357 Y145.815 E1.72603
G1 X64.891 Y145.815 E.01646
G1 X104.52 Y106.186 E1.72603
G1 X105.054 Y106.186 E.01646
G1 X65.426 Y145.815 E1.72603
G1 X65.96 Y145.815 E.01646
G1 X105.589 Y106.186 E1.72603
G1 X106.123 Y106.186 E.01646
G1 X66.495 Y145.815 E1.72603
G1 X67.029 Y145.815 E.01646
G1 X106.658 Y106.186 E1.72603
G1 X107.192 Y106.186 E.01646
G1 X67.564 Y145.815 E1.72603
G1 X68.098 Y145.815 E.01646
G1 X107.727 Y106.186 E1.72603
G1 X108.261 Y106.186 E.01646
G1 X68.633 Y145.815 E1.72603
G1 X69.167 Y145.815 E.01646
G1 X108.796 Y106.186 E1.72603
G1 X109.33 Y106.186 E.01646
G1 X69.702 Y145.815 E1.72603
G1 X70.236 Y145.815 E.01646
G1 X109.865 Y106.186 E1.72603
G1 X110.399 Y106.186 E.01646
G1 X70.771 Y145.815 E1.72603
G1 X71.305 Y145.815 E.01646
G1 X110.934 Y106.186 E1.72603
G1 X111.468 Y106.186 E.01646
G1 X71.84 Y145.815 E1.72603
G1 X72.374 Y145.815 E.01646
G1 X112.003 Y106.186 E1.72603
G1 X112.537 Y106.186 E.01646
G1 X72.909 Y145.815 E1.72603
G1 X73.443 Y145.815 E.01646
G1 X113.072 Y106.186 E1.72603
G1 X113.606 Y106.186 E.01646
G1 X73.978 Y145.815 E1.72603
G1 X74.512 Y145.815 E.01646
G1 X114.141 Y106.186 E1.72603
M73 P30 R23
G1 X114.675 Y106.186 E.01646
G1 X75.047 Y145.815 E1.72603
G1 X75.581 Y145.815 E.01646
G1 X115.21 Y106.186 E1.72603
G1 X115.744 Y106.186 E.01646
G1 X76.116 Y145.815 E1.72603
G1 X76.65 Y145.815 E.01646
G1 X116.279 Y106.186 E1.72603
G1 X116.813 Y106.186 E.01646
G1 X77.185 Y145.815 E1.72603
G1 X77.719 Y145.815 E.01646
G1 X117.348 Y106.186 E1.72603
G1 X117.882 Y106.186 E.01646
G1 X78.254 Y145.815 E1.72603
G1 X78.788 Y145.815 E.01646
G1 X118.417 Y106.186 E1.72603
G1 X118.951 Y106.186 E.01646
G1 X79.323 Y145.815 E1.72603
G1 X79.857 Y145.815 E.01646
G1 X119.486 Y106.186 E1.72603
G1 X120.02 Y106.186 E.01646
G1 X80.392 Y145.815 E1.72603
G1 X80.926 Y145.815 E.01646
G1 X120.555 Y106.186 E1.72602
G1 X121.089 Y106.186 E.01646
G1 X81.461 Y145.815 E1.72602
G1 X81.995 Y145.815 E.01646
G1 X121.624 Y106.186 E1.72602
G1 X122.158 Y106.186 E.01646
G1 X82.53 Y145.815 E1.72602
M73 P31 R23
G1 X83.064 Y145.815 E.01646
G1 X122.693 Y106.186 E1.72602
G1 X123.227 Y106.186 E.01646
G1 X83.599 Y145.815 E1.72602
G1 X84.133 Y145.815 E.01646
G1 X123.762 Y106.186 E1.72602
G1 X124.296 Y106.186 E.01646
G1 X84.668 Y145.815 E1.72602
G1 X85.202 Y145.815 E.01646
G1 X124.831 Y106.186 E1.72602
G1 X125.365 Y106.186 E.01646
G1 X85.737 Y145.815 E1.72602
G1 X86.271 Y145.815 E.01646
G1 X125.9 Y106.186 E1.72602
G1 X126.434 Y106.186 E.01646
G1 X86.806 Y145.815 E1.72602
G1 X87.34 Y145.815 E.01646
G1 X126.969 Y106.186 E1.72602
G1 X127.503 Y106.186 E.01646
G1 X87.875 Y145.815 E1.72602
G1 X88.409 Y145.815 E.01646
G1 X128.038 Y106.186 E1.72602
G1 X128.572 Y106.186 E.01646
G1 X88.944 Y145.815 E1.72602
G1 X89.478 Y145.815 E.01646
G1 X129.107 Y106.186 E1.72602
G1 X129.641 Y106.186 E.01646
G1 X90.013 Y145.815 E1.72602
G1 X90.547 Y145.815 E.01646
G1 X130.176 Y106.186 E1.72602
G1 X130.71 Y106.186 E.01646
G1 X91.082 Y145.815 E1.72602
G1 X91.616 Y145.815 E.01646
G1 X131.245 Y106.186 E1.72602
G1 X131.779 Y106.186 E.01646
G1 X92.151 Y145.815 E1.72602
G1 X92.685 Y145.815 E.01646
G1 X132.314 Y106.186 E1.72602
G1 X132.848 Y106.186 E.01646
G1 X93.22 Y145.815 E1.72602
G1 X93.754 Y145.815 E.01646
G1 X133.383 Y106.186 E1.72602
G1 X133.917 Y106.186 E.01646
G1 X94.289 Y145.815 E1.72602
G1 X94.823 Y145.815 E.01646
G1 X134.452 Y106.186 E1.72602
G1 X134.986 Y106.186 E.01646
G1 X95.358 Y145.815 E1.72602
G1 X95.892 Y145.815 E.01646
G1 X135.521 Y106.186 E1.72602
G1 X136.055 Y106.186 E.01646
G1 X96.427 Y145.815 E1.72602
G1 X96.961 Y145.815 E.01646
G1 X136.59 Y106.186 E1.72602
G1 X137.124 Y106.186 E.01646
G1 X97.496 Y145.815 E1.72602
G1 X98.03 Y145.815 E.01646
G1 X137.659 Y106.186 E1.72602
G1 X138.193 Y106.186 E.01646
G1 X98.565 Y145.815 E1.72602
G1 X99.099 Y145.815 E.01646
G1 X138.728 Y106.186 E1.72602
G1 X139.262 Y106.186 E.01646
G1 X99.634 Y145.815 E1.72602
G1 X100.168 Y145.815 E.01646
G1 X139.797 Y106.186 E1.72602
G1 X140.331 Y106.186 E.01646
G1 X100.703 Y145.815 E1.72601
G1 X101.237 Y145.815 E.01646
G1 X140.866 Y106.186 E1.72601
G1 X141.4 Y106.186 E.01646
G1 X101.772 Y145.815 E1.72601
G1 X102.306 Y145.815 E.01646
G1 X141.935 Y106.186 E1.72601
G1 X142.469 Y106.186 E.01646
G1 X102.841 Y145.815 E1.72601
G1 X103.375 Y145.815 E.01646
G1 X143.004 Y106.186 E1.72601
G1 X143.538 Y106.186 E.01646
G1 X103.91 Y145.815 E1.72601
G1 X104.444 Y145.815 E.01646
G1 X144.073 Y106.186 E1.72601
G1 X144.607 Y106.186 E.01646
G1 X104.979 Y145.815 E1.72601
G1 X105.513 Y145.815 E.01646
G1 X145.142 Y106.186 E1.72601
G1 X145.676 Y106.186 E.01646
G1 X106.048 Y145.815 E1.72601
G1 X106.582 Y145.815 E.01646
G1 X146.211 Y106.186 E1.72601
G1 X146.745 Y106.186 E.01646
G1 X107.117 Y145.815 E1.72601
G1 X107.651 Y145.815 E.01646
G1 X147.28 Y106.186 E1.72601
G1 X147.814 Y106.186 E.01646
G1 X108.186 Y145.815 E1.72601
G1 X108.72 Y145.815 E.01646
G1 X148.349 Y106.187 E1.72601
G1 X148.883 Y106.187 E.01646
G1 X109.255 Y145.815 E1.72601
G1 X109.789 Y145.815 E.01646
G1 X149.418 Y106.187 E1.72601
G1 X149.952 Y106.187 E.01646
G1 X110.324 Y145.815 E1.72601
G1 X110.858 Y145.815 E.01646
G1 X150.487 Y106.187 E1.72601
G1 X151.021 Y106.187 E.01646
G1 X111.393 Y145.815 E1.72601
G1 X111.927 Y145.815 E.01646
G1 X151.556 Y106.187 E1.72601
G1 X152.09 Y106.187 E.01646
G1 X112.462 Y145.815 E1.72601
G1 X112.996 Y145.815 E.01646
G1 X152.625 Y106.187 E1.72601
G1 X153.159 Y106.187 E.01646
G1 X113.531 Y145.815 E1.72601
G1 X114.065 Y145.815 E.01646
G1 X153.694 Y106.187 E1.72601
G1 X154.228 Y106.187 E.01646
G1 X114.6 Y145.815 E1.72601
G1 X115.134 Y145.815 E.01646
G1 X154.763 Y106.187 E1.72601
G1 X155.297 Y106.187 E.01646
G1 X115.669 Y145.815 E1.72601
G1 X116.203 Y145.815 E.01646
G1 X155.832 Y106.187 E1.72601
G1 X156.366 Y106.187 E.01646
G1 X116.738 Y145.815 E1.72601
G1 X117.272 Y145.815 E.01646
G1 X156.9 Y106.187 E1.72601
G1 X157.435 Y106.187 E.01646
G1 X117.807 Y145.815 E1.72601
G1 X118.341 Y145.815 E.01646
G1 X157.969 Y106.187 E1.72601
G1 X158.504 Y106.187 E.01646
G1 X118.876 Y145.815 E1.72601
G1 X119.41 Y145.815 E.01646
G1 X159.038 Y106.187 E1.72601
G1 X159.573 Y106.187 E.01646
G1 X119.945 Y145.815 E1.72601
G1 X120.479 Y145.815 E.01646
G1 X160.107 Y106.187 E1.72601
G1 X160.642 Y106.187 E.01646
G1 X121.014 Y145.815 E1.72601
G1 X121.548 Y145.815 E.01646
G1 X161.176 Y106.187 E1.72601
G1 X161.711 Y106.187 E.01646
G1 X122.083 Y145.815 E1.726
G1 X122.617 Y145.815 E.01646
G1 X162.245 Y106.187 E1.726
G1 X162.78 Y106.187 E.01646
G1 X123.152 Y145.815 E1.726
G1 X123.686 Y145.815 E.01646
G1 X163.314 Y106.187 E1.726
G1 X163.849 Y106.187 E.01646
G1 X124.221 Y145.815 E1.726
G1 X124.755 Y145.815 E.01646
G1 X164.383 Y106.187 E1.726
G1 X164.918 Y106.187 E.01646
G1 X125.29 Y145.815 E1.726
M73 P32 R23
G1 X125.824 Y145.815 E.01646
G1 X165.452 Y106.187 E1.726
G1 X165.987 Y106.187 E.01646
G1 X126.359 Y145.815 E1.726
G1 X126.893 Y145.815 E.01646
G1 X166.521 Y106.187 E1.726
G1 X167.056 Y106.187 E.01646
G1 X127.428 Y145.815 E1.726
G1 X127.962 Y145.815 E.01646
G1 X167.59 Y106.187 E1.726
G1 X168.125 Y106.187 E.01646
G1 X128.497 Y145.815 E1.726
G1 X129.031 Y145.815 E.01646
G1 X168.659 Y106.187 E1.726
G1 X169.194 Y106.187 E.01646
G1 X129.566 Y145.815 E1.726
G1 X130.1 Y145.815 E.01646
G1 X169.728 Y106.187 E1.726
G1 X170.263 Y106.187 E.01646
G1 X130.635 Y145.815 E1.726
G1 X131.169 Y145.815 E.01646
G1 X170.797 Y106.187 E1.726
G1 X171.332 Y106.187 E.01646
G1 X131.704 Y145.815 E1.726
G1 X132.238 Y145.815 E.01646
G1 X171.866 Y106.187 E1.726
G1 X172.401 Y106.187 E.01646
G1 X132.773 Y145.815 E1.726
G1 X133.307 Y145.815 E.01646
G1 X172.935 Y106.187 E1.726
G1 X173.47 Y106.187 E.01646
G1 X133.842 Y145.815 E1.726
G1 X134.376 Y145.815 E.01646
G1 X174.004 Y106.187 E1.726
G1 X174.539 Y106.187 E.01646
G1 X134.911 Y145.815 E1.726
G1 X135.445 Y145.815 E.01646
G1 X175.073 Y106.187 E1.726
G1 X175.608 Y106.187 E.01646
G1 X135.98 Y145.815 E1.726
G1 X136.514 Y145.815 E.01646
G1 X176.142 Y106.187 E1.726
G1 X176.677 Y106.187 E.01646
G1 X137.049 Y145.815 E1.726
G1 X137.583 Y145.815 E.01646
G1 X177.211 Y106.187 E1.726
G1 X177.746 Y106.187 E.01646
G1 X138.118 Y145.815 E1.726
G1 X138.652 Y145.815 E.01646
G1 X178.28 Y106.187 E1.726
G1 X178.815 Y106.187 E.01646
G1 X139.187 Y145.815 E1.726
G1 X139.721 Y145.815 E.01646
G1 X179.349 Y106.187 E1.726
G1 X179.884 Y106.187 E.01646
G1 X140.256 Y145.815 E1.726
G1 X140.79 Y145.815 E.01646
G1 X180.418 Y106.187 E1.726
G1 X180.953 Y106.187 E.01646
G1 X141.325 Y145.815 E1.726
G1 X141.86 Y145.815 E.01646
G1 X181.487 Y106.187 E1.72599
G1 X182.022 Y106.187 E.01646
G1 X142.394 Y145.815 E1.72599
G1 X142.929 Y145.815 E.01646
G1 X182.556 Y106.187 E1.72599
G1 X183.091 Y106.187 E.01646
G1 X143.463 Y145.815 E1.72599
G1 X143.998 Y145.815 E.01646
G1 X183.625 Y106.187 E1.72599
G1 X184.16 Y106.187 E.01646
G1 X144.532 Y145.815 E1.72599
G1 X145.067 Y145.815 E.01646
G1 X184.694 Y106.187 E1.72599
G1 X185.229 Y106.187 E.01646
G1 X145.601 Y145.815 E1.72599
G1 X146.136 Y145.815 E.01646
G1 X185.763 Y106.187 E1.72599
G1 X186.298 Y106.187 E.01646
G1 X146.67 Y145.815 E1.72599
G1 X147.205 Y145.815 E.01646
G1 X186.832 Y106.187 E1.72599
G1 X187.367 Y106.187 E.01646
G1 X147.739 Y145.815 E1.72599
G1 X148.274 Y145.815 E.01646
G1 X187.901 Y106.187 E1.72599
G1 X188.436 Y106.187 E.01646
G1 X148.808 Y145.815 E1.72599
G1 X149.343 Y145.815 E.01646
G1 X188.97 Y106.187 E1.72599
G1 X189.505 Y106.187 E.01646
G1 X149.877 Y145.815 E1.72599
G1 X150.412 Y145.815 E.01646
G1 X190.039 Y106.187 E1.72599
G1 X190.574 Y106.187 E.01646
G1 X150.946 Y145.815 E1.72599
G1 X151.481 Y145.815 E.01646
G1 X191.108 Y106.187 E1.72599
G1 X191.643 Y106.187 E.01646
G1 X152.015 Y145.815 E1.72599
G1 X152.55 Y145.815 E.01646
G1 X192.177 Y106.187 E1.72599
G1 X192.712 Y106.187 E.01646
G1 X153.084 Y145.815 E1.72599
G1 X153.619 Y145.815 E.01646
G1 X193.246 Y106.187 E1.72599
G1 X193.781 Y106.187 E.01646
G1 X154.153 Y145.815 E1.72599
G1 X154.688 Y145.815 E.01646
G1 X194.315 Y106.187 E1.72599
G1 X194.85 Y106.187 E.01646
G1 X155.222 Y145.815 E1.72599
G1 X155.757 Y145.815 E.01646
G1 X195.384 Y106.187 E1.72599
G1 X195.919 Y106.187 E.01646
G1 X156.291 Y145.815 E1.72599
G1 X156.826 Y145.815 E.01646
G1 X196.453 Y106.187 E1.72599
G1 X196.988 Y106.187 E.01646
G1 X157.36 Y145.815 E1.72599
G1 X157.895 Y145.815 E.01646
G1 X197.522 Y106.187 E1.72599
G1 X198.057 Y106.187 E.01646
G1 X158.429 Y145.815 E1.72599
G1 X158.964 Y145.815 E.01646
G1 X198.591 Y106.187 E1.72599
G1 X199.126 Y106.187 E.01646
G1 X159.498 Y145.815 E1.72599
G1 X160.033 Y145.815 E.01646
G1 X199.66 Y106.187 E1.72599
G1 X200.195 Y106.187 E.01646
G1 X160.567 Y145.815 E1.72599
G1 X161.102 Y145.815 E.01646
G1 X200.729 Y106.187 E1.72599
G1 X201.264 Y106.187 E.01646
G1 X161.636 Y145.815 E1.72599
G1 X162.171 Y145.815 E.01646
G1 X201.798 Y106.187 E1.72599
G1 X202.333 Y106.187 E.01646
G1 X162.705 Y145.815 E1.72598
G1 X163.24 Y145.815 E.01646
G1 X202.867 Y106.187 E1.72598
G1 X203.402 Y106.187 E.01646
G1 X163.774 Y145.815 E1.72598
G1 X164.309 Y145.815 E.01646
G1 X203.936 Y106.187 E1.72598
G1 X204.471 Y106.187 E.01646
G1 X164.843 Y145.815 E1.72598
G1 X165.378 Y145.815 E.01646
G1 X205.005 Y106.187 E1.72598
G1 X205.54 Y106.187 E.01646
G1 X165.912 Y145.815 E1.72598
G1 X166.447 Y145.815 E.01646
G1 X206.074 Y106.187 E1.72598
G1 X206.609 Y106.187 E.01646
G1 X166.981 Y145.815 E1.72598
G1 X167.516 Y145.815 E.01646
G1 X207.143 Y106.187 E1.72598
G1 X207.678 Y106.187 E.01646
G1 X168.05 Y145.815 E1.72598
M73 P33 R23
G1 X168.585 Y145.815 E.01646
G1 X208.212 Y106.187 E1.72598
G1 X208.747 Y106.187 E.01646
G1 X169.119 Y145.815 E1.72598
G1 X169.654 Y145.815 E.01646
G1 X209.281 Y106.187 E1.72598
G1 X209.816 Y106.187 E.01646
G1 X170.188 Y145.815 E1.72598
G1 X170.723 Y145.815 E.01646
G1 X210.35 Y106.187 E1.72598
G1 X210.885 Y106.187 E.01646
G1 X171.257 Y145.815 E1.72598
G1 X171.792 Y145.815 E.01646
G1 X211.419 Y106.187 E1.72598
G1 X211.954 Y106.187 E.01646
G1 X172.326 Y145.815 E1.72598
G1 X172.861 Y145.815 E.01646
G1 X212.488 Y106.187 E1.72598
G1 X213.023 Y106.187 E.01646
G1 X173.395 Y145.815 E1.72598
G1 X173.93 Y145.815 E.01646
G1 X213.557 Y106.187 E1.72598
G1 X214.092 Y106.187 E.01646
G1 X174.464 Y145.815 E1.72598
G1 X174.999 Y145.815 E.01646
G1 X214.612 Y106.202 E1.72535
G3 X215.11 Y106.238 I.066 J2.546 E.01541
G1 X175.533 Y145.815 E1.72377
G1 X176.068 Y145.815 E.01646
G1 X215.575 Y106.307 E1.72077
G3 X216.011 Y106.406 I-.283 J2.263 E.01378
G1 X176.602 Y145.815 E1.71647
G1 X177.137 Y145.815 E.01646
G1 X216.432 Y106.52 E1.7115
G1 X216.825 Y106.661 E.01288
G1 X177.671 Y145.815 E1.70537
G1 X178.206 Y145.815 E.01646
G1 X217.202 Y106.818 E1.6985
G1 X217.565 Y106.99 E.01236
G1 X178.74 Y145.815 E1.69102
G1 X179.275 Y145.815 E.01646
G1 X217.904 Y107.185 E1.68252
G3 X218.237 Y107.387 I-.857 J1.792 E.01201
G1 X179.809 Y145.815 E1.67374
G1 X180.344 Y145.815 E.01646
G1 X218.544 Y107.614 E1.66383
G3 X218.845 Y107.848 I-1.035 J1.642 E.01175
G1 X180.878 Y145.815 E1.65365
G1 X181.413 Y145.815 E.01646
G1 X219.125 Y108.102 E1.64258
G3 X219.395 Y108.366 I-1.209 J1.504 E.01166
G1 X181.947 Y145.815 E1.63106
G1 X182.482 Y145.815 E.01646
G1 X219.65 Y108.647 E1.61885
G3 X219.889 Y108.942 I-1.379 J1.361 E.01172
G1 X183.016 Y145.815 E1.60599
G1 X183.551 Y145.815 E.01646
G1 X220.116 Y109.249 E1.59262
G3 X220.323 Y109.576 I-1.56 J1.216 E.01195
G1 X184.085 Y145.815 E1.57836
G1 X184.62 Y145.815 E.01646
G1 X220.524 Y109.911 E1.56381
G3 X220.696 Y110.273 I-1.743 J1.052 E.01237
G1 X185.154 Y145.815 E1.54804
G1 X185.689 Y145.815 E.01646
G1 X220.86 Y110.643 E1.5319
G1 X221.001 Y111.037 E.01288
G1 X186.223 Y145.815 E1.51476
G1 X186.758 Y145.815 E.01646
G1 X221.122 Y111.45 E1.49675
G3 X221.229 Y111.878 I-2.11 J.753 E.0136
G1 X187.292 Y145.815 E1.47811
G1 X187.827 Y145.815 E.01646
G1 X221.298 Y112.344 E1.45784
G3 X221.343 Y112.833 I-2.463 J.475 E.01516
G1 X188.361 Y145.815 E1.43653
G1 X188.896 Y145.815 E.01646
G1 X221.365 Y113.346 E1.41419
G1 X221.365 Y113.88 E.01646
G1 X189.43 Y145.815 E1.39091
G1 X189.965 Y145.815 E.01646
G1 X221.365 Y114.415 E1.36763
G1 X221.365 Y114.949 E.01646
G1 X190.499 Y145.815 E1.34435
G1 X191.034 Y145.815 E.01646
G1 X221.365 Y115.484 E1.32107
G1 X221.365 Y116.018 E.01646
G1 X191.568 Y145.815 E1.29779
G1 X192.103 Y145.815 E.01646
G1 X221.365 Y116.553 E1.27451
G1 X221.365 Y117.087 E.01646
G1 X192.637 Y145.815 E1.25123
G1 X193.172 Y145.815 E.01646
G1 X221.365 Y117.622 E1.22795
G1 X221.365 Y118.156 E.01646
G1 X193.706 Y145.815 E1.20467
G1 X194.241 Y145.815 E.01646
G1 X221.365 Y118.691 E1.18139
G1 X221.365 Y119.225 E.01646
G1 X194.775 Y145.815 E1.15811
G1 X195.31 Y145.815 E.01646
G1 X221.365 Y119.76 E1.13483
G1 X221.365 Y120.294 E.01646
G1 X195.844 Y145.815 E1.11155
G1 X196.379 Y145.815 E.01646
G1 X221.365 Y120.829 E1.08827
G1 X221.365 Y121.363 E.01646
G1 X196.913 Y145.815 E1.06499
G1 X197.448 Y145.815 E.01646
G1 X221.365 Y121.898 E1.04171
G1 X221.365 Y122.432 E.01646
G1 X197.982 Y145.815 E1.01843
M73 P33 R22
G1 X198.517 Y145.815 E.01646
G1 X221.365 Y122.967 E.99515
G1 X221.365 Y123.501 E.01646
G1 X199.051 Y145.815 E.97186
G1 X199.586 Y145.815 E.01646
G1 X221.365 Y124.036 E.94858
G1 X221.365 Y124.57 E.01646
G1 X200.12 Y145.815 E.9253
G1 X200.655 Y145.815 E.01646
G1 X221.365 Y125.105 E.90202
G1 X221.365 Y125.639 E.01646
G1 X201.189 Y145.815 E.87874
G1 X201.724 Y145.815 E.01646
G1 X221.365 Y126.174 E.85546
G1 X221.365 Y126.708 E.01646
G1 X202.258 Y145.815 E.83218
G1 X202.793 Y145.815 E.01646
G1 X221.365 Y127.243 E.8089
G1 X221.365 Y127.777 E.01646
G1 X203.327 Y145.815 E.78562
G1 X203.862 Y145.815 E.01646
G1 X221.365 Y128.312 E.76234
G1 X221.365 Y128.846 E.01646
G1 X204.396 Y145.815 E.73906
G1 X204.931 Y145.815 E.01646
G1 X221.365 Y129.381 E.71578
G1 X221.365 Y129.915 E.01646
G1 X205.465 Y145.815 E.6925
G1 X206 Y145.815 E.01646
G1 X221.365 Y130.45 E.66922
G1 X221.365 Y130.984 E.01646
G1 X206.534 Y145.815 E.64594
G1 X207.069 Y145.815 E.01646
G1 X221.365 Y131.519 E.62266
G1 X221.365 Y132.053 E.01646
G1 X207.603 Y145.815 E.59938
G1 X208.138 Y145.815 E.01646
G1 X221.365 Y132.588 E.5761
G1 X221.365 Y133.122 E.01646
G1 X208.672 Y145.815 E.55282
G1 X209.207 Y145.815 E.01646
G1 X221.365 Y133.657 E.52954
G1 X221.365 Y134.191 E.01646
G1 X209.741 Y145.815 E.50626
G1 X210.276 Y145.815 E.01646
G1 X221.365 Y134.726 E.48298
G1 X221.365 Y135.26 E.01646
G1 X210.81 Y145.815 E.4597
G1 X211.345 Y145.815 E.01646
G1 X221.365 Y135.795 E.43642
G1 X221.365 Y136.329 E.01646
G1 X211.879 Y145.815 E.41314
G1 X212.414 Y145.815 E.01646
G1 X221.365 Y136.864 E.38986
G1 X221.365 Y137.398 E.01646
G1 X212.948 Y145.815 E.36658
G1 X213.483 Y145.815 E.01646
G1 X221.365 Y137.933 E.3433
G1 X221.365 Y138.467 E.01646
G1 X214.017 Y145.815 E.32002
G2 X214.566 Y145.8 I.13 J-5.591 E.01691
G1 X221.35 Y139.016 E.2955
G3 X221.307 Y139.594 I-2.957 J.068 E.01788
G1 X215.144 Y145.757 E.26844
G2 X215.784 Y145.651 I-.218 J-3.309 E.02002
G1 X221.201 Y140.234 E.23594
G3 X220.998 Y140.972 I-3.847 J-.663 E.0236
M73 P34 R22
G1 X216.522 Y145.448 E.19496
G2 X217.431 Y145.073 I-1.447 J-4.802 E.03033
G1 X220.624 Y141.881 E.13905
G3 X219.298 Y143.741 I-6.195 J-3.013 E.07067
G1 X218.209 Y144.83 E.04744
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X219.298 Y143.741 E-.58534
G1 X219.606 Y143.4 E-.17466
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/35
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.8 I.231 J-1.195 P1  F30000
G1 X36.471 Y108.021 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.237 J5.237 E.19318
G1 X214.336 Y105.855 E5.72615
G3 X221.698 Y113.265 I-.041 J7.403 E.38463
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G1 X40.939 Y146.106 E.02576
G3 X34.302 Y138.735 I.766 J-7.364 E.36055
G1 X34.302 Y113.265 E.8449
G3 X36.429 Y108.064 I7.406 J-.007 E.19118
M204 S250
G1 X36.194 Y107.744 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.515 J5.515 E.1881
G1 X214.355 Y105.463 E5.30505
G3 X222.09 Y113.255 I-.055 J7.79 E.37438
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G1 X40.882 Y146.494 E.02534
G3 X33.91 Y138.745 I.822 J-7.75 E.35085
G1 X33.91 Y113.255 E.78322
G3 X36.152 Y107.787 I7.799 J.004 E.18625
; WIPE_START
M204 S10000
G1 X36.758 Y107.229 E-.31316
G1 X37.372 Y106.773 E-.29054
G1 X37.725 Y106.562 E-.1563
; WIPE_END
G1 E-.04 F1800
G1 X37.28 Y114.181 Z1 F30000
G1 X35.618 Y142.656 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42087
G1 F15000
G1 X36.721 Y143.759 E.04806
G2 X38.37 Y144.979 I5.483 J-5.684 E.06336
G1 X38.571 Y145.075 E.00684
G1 X35.375 Y141.879 E.13919
G3 X35.001 Y140.97 I4.426 J-2.354 E.03031
G1 X39.48 Y145.449 E.19506
G2 X40.217 Y145.652 I1.399 J-3.644 E.02359
G1 X34.798 Y140.233 E.23602
G3 X34.693 Y139.593 I3.199 J-.857 E.02001
G1 X40.857 Y145.757 E.2685
G2 X41.435 Y145.801 I.509 J-2.911 E.01787
G1 X34.649 Y139.015 E.29555
G3 X34.635 Y138.466 I5.576 J-.418 E.01691
G1 X41.984 Y145.815 E.32007
G1 X42.518 Y145.815 E.01646
G1 X34.635 Y137.932 E.34335
G1 X34.635 Y137.397 E.01646
G1 X43.053 Y145.815 E.36663
G1 X43.587 Y145.815 E.01646
G1 X34.635 Y136.863 E.38991
G1 X34.635 Y136.328 E.01646
G1 X44.122 Y145.815 E.41319
G1 X44.656 Y145.815 E.01646
G1 X34.635 Y135.794 E.43647
G1 X34.635 Y135.259 E.01646
G1 X45.191 Y145.815 E.45975
G1 X45.725 Y145.815 E.01646
G1 X34.635 Y134.725 E.48303
G1 X34.635 Y134.19 E.01646
G1 X46.26 Y145.815 E.50631
G1 X46.794 Y145.815 E.01646
G1 X34.635 Y133.656 E.52959
G1 X34.635 Y133.121 E.01646
G1 X47.329 Y145.815 E.55287
G1 X47.863 Y145.815 E.01646
G1 X34.635 Y132.587 E.57615
G1 X34.635 Y132.052 E.01646
G1 X48.398 Y145.815 E.59943
G1 X48.932 Y145.815 E.01646
G1 X34.635 Y131.518 E.62271
G1 X34.635 Y130.983 E.01646
G1 X49.467 Y145.815 E.64599
G1 X50.001 Y145.815 E.01646
G1 X34.635 Y130.449 E.66927
G1 X34.635 Y129.914 E.01646
G1 X50.536 Y145.815 E.69255
G1 X51.07 Y145.815 E.01646
G1 X34.635 Y129.38 E.71583
G1 X34.635 Y128.845 E.01646
G1 X51.605 Y145.815 E.73911
G1 X52.139 Y145.815 E.01646
G1 X34.635 Y128.311 E.76239
G1 X34.635 Y127.776 E.01646
G1 X52.674 Y145.815 E.78567
G1 X53.208 Y145.815 E.01646
G1 X34.635 Y127.242 E.80895
G1 X34.635 Y126.707 E.01646
G1 X53.743 Y145.815 E.83223
G1 X54.277 Y145.815 E.01646
G1 X34.635 Y126.173 E.85551
G1 X34.635 Y125.638 E.01646
G1 X54.812 Y145.815 E.87879
G1 X55.346 Y145.815 E.01646
G1 X34.635 Y125.104 E.90207
G1 X34.635 Y124.569 E.01646
G1 X55.881 Y145.815 E.92535
G1 X56.415 Y145.815 E.01646
G1 X34.635 Y124.035 E.94864
G1 X34.635 Y123.5 E.01646
G1 X56.95 Y145.815 E.97192
G1 X57.484 Y145.815 E.01646
G1 X34.635 Y122.966 E.9952
G1 X34.635 Y122.431 E.01646
G1 X58.019 Y145.815 E1.01848
G1 X58.553 Y145.815 E.01646
G1 X34.635 Y121.897 E1.04176
G1 X34.635 Y121.362 E.01646
G1 X59.088 Y145.815 E1.06504
G1 X59.622 Y145.815 E.01646
G1 X34.635 Y120.828 E1.08832
G1 X34.635 Y120.293 E.01646
G1 X60.157 Y145.815 E1.1116
G1 X60.691 Y145.815 E.01646
G1 X34.635 Y119.759 E1.13488
G1 X34.635 Y119.224 E.01646
G1 X61.226 Y145.815 E1.15816
G1 X61.76 Y145.815 E.01646
G1 X34.635 Y118.69 E1.18144
G1 X34.635 Y118.155 E.01646
G1 X62.295 Y145.815 E1.20472
G1 X62.829 Y145.815 E.01646
G1 X34.635 Y117.621 E1.228
G1 X34.635 Y117.086 E.01646
G1 X63.364 Y145.815 E1.25128
G1 X63.898 Y145.815 E.01646
G1 X34.635 Y116.552 E1.27456
G1 X34.635 Y116.017 E.01646
G1 X64.433 Y145.815 E1.29784
G1 X64.967 Y145.815 E.01646
G1 X34.635 Y115.483 E1.32112
G1 X34.635 Y114.948 E.01646
G1 X65.502 Y145.815 E1.3444
G1 X66.036 Y145.815 E.01646
G1 X34.635 Y114.414 E1.36768
G1 X34.635 Y113.879 E.01646
G1 X66.571 Y145.815 E1.39096
G1 X67.105 Y145.815 E.01646
G1 X34.635 Y113.345 E1.41424
G3 X34.657 Y112.832 I5.23 J-.036 E.01581
G1 X67.64 Y145.815 E1.43658
G1 X68.174 Y145.815 E.01646
G1 X34.702 Y112.343 E1.45788
G1 X34.771 Y111.877 E.01449
G1 X68.709 Y145.815 E1.47816
G1 X69.243 Y145.815 E.01646
G1 X34.878 Y111.449 E1.49679
G3 X34.999 Y111.036 I2.161 J.409 E.01329
G1 X69.778 Y145.815 E1.5148
G1 X70.312 Y145.815 E.01646
G1 X35.14 Y110.642 E1.53194
G3 X35.304 Y110.272 I1.962 J.648 E.0125
G1 X70.847 Y145.815 E1.54807
G1 X71.381 Y145.815 E.01646
G1 X35.477 Y109.91 E1.56383
G1 X35.678 Y109.577 E.01199
G1 X71.916 Y145.815 E1.57833
G1 X72.45 Y145.815 E.01646
G1 X35.884 Y109.248 E1.59265
G1 X36.112 Y108.941 E.01177
G1 X72.985 Y145.815 E1.60602
G1 X73.519 Y145.815 E.01646
G1 X36.351 Y108.646 E1.61888
G1 X36.605 Y108.366 E.01165
G1 X74.054 Y145.815 E1.63109
G1 X74.588 Y145.815 E.01646
G1 X36.875 Y108.101 E1.64261
G1 X37.156 Y107.847 E.01165
G1 X75.123 Y145.815 E1.65368
G1 X75.657 Y145.815 E.01646
G1 X37.456 Y107.614 E1.66385
G1 X37.763 Y107.386 E.01177
G1 X76.192 Y145.815 E1.67377
G1 X76.726 Y145.815 E.01646
G1 X38.096 Y107.185 E1.68254
G3 X38.436 Y106.99 I1.114 J1.548 E.01208
G1 X77.261 Y145.815 E1.69102
G1 X77.795 Y145.815 E.01646
G1 X38.8 Y106.82 E1.69844
G3 X39.176 Y106.66 I1.036 J1.918 E.01257
G1 X78.33 Y145.815 E1.70538
G1 X78.864 Y145.815 E.01646
G1 X39.569 Y106.519 E1.71151
G3 X39.99 Y106.405 I.789 J2.079 E.01344
G1 X79.399 Y145.815 E1.71648
G1 X79.933 Y145.815 E.01646
G1 X40.426 Y106.307 E1.72077
G1 X40.891 Y106.238 E.01449
G1 X80.468 Y145.815 E1.72378
G1 X81.003 Y145.815 E.01646
G1 X41.39 Y106.202 E1.72535
G3 X41.908 Y106.185 I.426 J5.266 E.01597
G1 X81.537 Y145.815 E1.72606
G1 X82.072 Y145.815 E.01646
G1 X42.442 Y106.185 E1.72606
G1 X42.977 Y106.185 E.01646
G1 X82.606 Y145.815 E1.72606
G1 X83.141 Y145.815 E.01646
G1 X43.511 Y106.185 E1.72606
G1 X44.046 Y106.185 E.01646
G1 X83.675 Y145.815 E1.72606
G1 X84.21 Y145.815 E.01646
G1 X44.58 Y106.185 E1.72606
G1 X45.115 Y106.185 E.01646
G1 X84.744 Y145.815 E1.72606
G1 X85.279 Y145.815 E.01646
G1 X45.649 Y106.185 E1.72606
G1 X46.184 Y106.185 E.01646
G1 X85.813 Y145.815 E1.72606
G1 X86.348 Y145.815 E.01646
G1 X46.718 Y106.185 E1.72606
G1 X47.253 Y106.185 E.01646
G1 X86.882 Y145.815 E1.72606
G1 X87.417 Y145.815 E.01646
G1 X47.787 Y106.185 E1.72606
G1 X48.322 Y106.185 E.01646
G1 X87.951 Y145.815 E1.72606
G1 X88.486 Y145.815 E.01646
G1 X48.856 Y106.185 E1.72606
G1 X49.391 Y106.185 E.01646
G1 X89.02 Y145.815 E1.72606
G1 X89.555 Y145.815 E.01646
G1 X49.925 Y106.185 E1.72606
G1 X50.46 Y106.185 E.01646
G1 X90.089 Y145.815 E1.72606
G1 X90.624 Y145.815 E.01646
G1 X50.994 Y106.185 E1.72606
G1 X51.529 Y106.185 E.01646
G1 X91.158 Y145.815 E1.72606
G1 X91.693 Y145.815 E.01646
G1 X52.063 Y106.185 E1.72606
G1 X52.598 Y106.185 E.01646
G1 X92.227 Y145.815 E1.72606
G1 X92.762 Y145.815 E.01646
G1 X53.132 Y106.185 E1.72606
G1 X53.667 Y106.185 E.01646
G1 X93.296 Y145.815 E1.72606
M73 P35 R22
G1 X93.831 Y145.815 E.01646
G1 X54.201 Y106.185 E1.72605
G1 X54.736 Y106.186 E.01646
G1 X94.365 Y145.815 E1.72605
G1 X94.9 Y145.815 E.01646
G1 X55.27 Y106.186 E1.72605
G1 X55.805 Y106.186 E.01646
G1 X95.434 Y145.815 E1.72605
G1 X95.969 Y145.815 E.01646
G1 X56.339 Y106.186 E1.72605
G1 X56.874 Y106.186 E.01646
G1 X96.503 Y145.815 E1.72605
G1 X97.038 Y145.815 E.01646
G1 X57.408 Y106.186 E1.72605
G1 X57.943 Y106.186 E.01646
G1 X97.572 Y145.815 E1.72605
G1 X98.107 Y145.815 E.01646
G1 X58.477 Y106.186 E1.72605
G1 X59.012 Y106.186 E.01646
G1 X98.641 Y145.815 E1.72605
G1 X99.176 Y145.815 E.01646
G1 X59.546 Y106.186 E1.72605
G1 X60.081 Y106.186 E.01646
G1 X99.71 Y145.815 E1.72605
G1 X100.245 Y145.815 E.01646
G1 X60.615 Y106.186 E1.72605
G1 X61.15 Y106.186 E.01646
G1 X100.779 Y145.815 E1.72605
G1 X101.314 Y145.815 E.01646
G1 X61.685 Y106.186 E1.72605
G1 X62.219 Y106.186 E.01646
G1 X101.848 Y145.815 E1.72605
G1 X102.383 Y145.815 E.01646
G1 X62.754 Y106.186 E1.72605
G1 X63.288 Y106.186 E.01646
G1 X102.917 Y145.815 E1.72605
G1 X103.452 Y145.815 E.01646
G1 X63.823 Y106.186 E1.72605
G1 X64.357 Y106.186 E.01646
G1 X103.986 Y145.815 E1.72605
G1 X104.521 Y145.815 E.01646
G1 X64.892 Y106.186 E1.72605
G1 X65.426 Y106.186 E.01646
G1 X105.055 Y145.815 E1.72605
G1 X105.59 Y145.815 E.01646
G1 X65.961 Y106.186 E1.72605
G1 X66.495 Y106.186 E.01646
G1 X106.124 Y145.815 E1.72605
G1 X106.659 Y145.815 E.01646
G1 X67.03 Y106.186 E1.72605
G1 X67.564 Y106.186 E.01646
G1 X107.193 Y145.815 E1.72605
G1 X107.728 Y145.815 E.01646
G1 X68.099 Y106.186 E1.72605
G1 X68.633 Y106.186 E.01646
G1 X108.262 Y145.815 E1.72605
G1 X108.797 Y145.815 E.01646
G1 X69.168 Y106.186 E1.72605
G1 X69.702 Y106.186 E.01646
G1 X109.331 Y145.815 E1.72605
G1 X109.866 Y145.815 E.01646
G1 X70.237 Y106.186 E1.72604
G1 X70.771 Y106.186 E.01646
G1 X110.4 Y145.815 E1.72604
G1 X110.935 Y145.815 E.01646
G1 X71.306 Y106.186 E1.72604
G1 X71.84 Y106.186 E.01646
G1 X111.469 Y145.815 E1.72604
G1 X112.004 Y145.815 E.01646
G1 X72.375 Y106.186 E1.72604
G1 X72.909 Y106.186 E.01646
G1 X112.538 Y145.815 E1.72604
G1 X113.073 Y145.815 E.01646
G1 X73.444 Y106.186 E1.72604
G1 X73.978 Y106.186 E.01646
G1 X113.607 Y145.815 E1.72604
G1 X114.142 Y145.815 E.01646
G1 X74.513 Y106.186 E1.72604
G1 X75.047 Y106.186 E.01646
G1 X114.676 Y145.815 E1.72604
G1 X115.211 Y145.815 E.01646
G1 X75.582 Y106.186 E1.72604
G1 X76.116 Y106.186 E.01646
G1 X115.745 Y145.815 E1.72604
G1 X116.28 Y145.815 E.01646
G1 X76.651 Y106.186 E1.72604
G1 X77.185 Y106.186 E.01646
G1 X116.814 Y145.815 E1.72604
G1 X117.349 Y145.815 E.01646
G1 X77.72 Y106.186 E1.72604
G1 X78.254 Y106.186 E.01646
G1 X117.883 Y145.815 E1.72604
G1 X118.418 Y145.815 E.01646
G1 X78.789 Y106.186 E1.72604
G1 X79.323 Y106.186 E.01646
G1 X118.952 Y145.815 E1.72604
G1 X119.487 Y145.815 E.01646
G1 X79.858 Y106.186 E1.72604
G1 X80.392 Y106.186 E.01646
G1 X120.021 Y145.815 E1.72604
G1 X120.556 Y145.815 E.01646
G1 X80.927 Y106.186 E1.72604
G1 X81.461 Y106.186 E.01646
G1 X121.09 Y145.815 E1.72604
G1 X121.625 Y145.815 E.01646
G1 X81.996 Y106.186 E1.72604
G1 X82.53 Y106.186 E.01646
G1 X122.159 Y145.815 E1.72604
G1 X122.694 Y145.815 E.01646
G1 X83.065 Y106.186 E1.72604
G1 X83.599 Y106.186 E.01646
G1 X123.228 Y145.815 E1.72604
G1 X123.763 Y145.815 E.01646
G1 X84.134 Y106.186 E1.72604
G1 X84.668 Y106.186 E.01646
G1 X124.297 Y145.815 E1.72604
G1 X124.832 Y145.815 E.01646
G1 X85.203 Y106.186 E1.72604
G1 X85.737 Y106.186 E.01646
G1 X125.366 Y145.815 E1.72603
G1 X125.901 Y145.815 E.01646
G1 X86.272 Y106.186 E1.72603
G1 X86.806 Y106.186 E.01646
G1 X126.435 Y145.815 E1.72603
G1 X126.97 Y145.815 E.01646
G1 X87.341 Y106.186 E1.72603
G1 X87.875 Y106.186 E.01646
G1 X127.504 Y145.815 E1.72603
G1 X128.039 Y145.815 E.01646
G1 X88.41 Y106.186 E1.72603
G1 X88.945 Y106.186 E.01646
G1 X128.573 Y145.815 E1.72603
G1 X129.108 Y145.815 E.01646
G1 X89.479 Y106.186 E1.72603
G1 X90.014 Y106.186 E.01646
G1 X129.642 Y145.815 E1.72603
G1 X130.177 Y145.815 E.01646
G1 X90.548 Y106.186 E1.72603
G1 X91.083 Y106.186 E.01646
G1 X130.711 Y145.815 E1.72603
G1 X131.246 Y145.815 E.01646
G1 X91.617 Y106.186 E1.72603
G1 X92.152 Y106.186 E.01646
G1 X131.78 Y145.815 E1.72603
G1 X132.315 Y145.815 E.01646
G1 X92.686 Y106.186 E1.72603
G1 X93.221 Y106.186 E.01646
G1 X132.849 Y145.815 E1.72603
G1 X133.384 Y145.815 E.01646
G1 X93.755 Y106.186 E1.72603
G1 X94.29 Y106.186 E.01646
G1 X133.918 Y145.815 E1.72603
G1 X134.453 Y145.815 E.01646
G1 X94.824 Y106.186 E1.72603
G1 X95.359 Y106.186 E.01646
G1 X134.987 Y145.815 E1.72603
G1 X135.522 Y145.815 E.01646
G1 X95.893 Y106.186 E1.72603
G1 X96.428 Y106.186 E.01646
G1 X136.056 Y145.815 E1.72603
M73 P36 R22
G1 X136.591 Y145.815 E.01646
G1 X96.962 Y106.186 E1.72603
G1 X97.497 Y106.186 E.01646
G1 X137.125 Y145.815 E1.72603
G1 X137.66 Y145.815 E.01646
G1 X98.031 Y106.186 E1.72603
G1 X98.566 Y106.186 E.01646
G1 X138.194 Y145.815 E1.72603
G1 X138.729 Y145.815 E.01646
G1 X99.1 Y106.186 E1.72603
G1 X99.635 Y106.186 E.01646
G1 X139.263 Y145.815 E1.72603
G1 X139.798 Y145.815 E.01646
G1 X100.169 Y106.186 E1.72603
G1 X100.704 Y106.186 E.01646
G1 X140.332 Y145.815 E1.72603
G1 X140.867 Y145.815 E.01646
G1 X101.238 Y106.186 E1.72603
G1 X101.773 Y106.186 E.01646
G1 X141.401 Y145.815 E1.72603
G1 X141.936 Y145.815 E.01646
G1 X102.307 Y106.186 E1.72602
G1 X102.842 Y106.186 E.01646
G1 X142.47 Y145.815 E1.72602
G1 X143.005 Y145.815 E.01646
G1 X103.376 Y106.186 E1.72602
G1 X103.911 Y106.186 E.01646
G1 X143.539 Y145.815 E1.72602
G1 X144.074 Y145.815 E.01646
G1 X104.445 Y106.186 E1.72602
G1 X104.98 Y106.186 E.01646
G1 X144.608 Y145.815 E1.72602
G1 X145.143 Y145.815 E.01646
G1 X105.514 Y106.186 E1.72602
G1 X106.049 Y106.186 E.01646
G1 X145.677 Y145.815 E1.72602
G1 X146.212 Y145.815 E.01646
G1 X106.583 Y106.186 E1.72602
G1 X107.118 Y106.186 E.01646
G1 X146.746 Y145.815 E1.72602
G1 X147.281 Y145.815 E.01646
G1 X107.652 Y106.186 E1.72602
G1 X108.187 Y106.186 E.01646
G1 X147.815 Y145.815 E1.72602
G1 X148.35 Y145.815 E.01646
G1 X108.721 Y106.186 E1.72602
G1 X109.256 Y106.186 E.01646
G1 X148.884 Y145.815 E1.72602
G1 X149.419 Y145.815 E.01646
G1 X109.79 Y106.186 E1.72602
G1 X110.325 Y106.186 E.01646
G1 X149.953 Y145.815 E1.72602
G1 X150.488 Y145.815 E.01646
G1 X110.859 Y106.186 E1.72602
G1 X111.394 Y106.186 E.01646
G1 X151.022 Y145.815 E1.72602
G1 X151.557 Y145.815 E.01646
G1 X111.928 Y106.186 E1.72602
G1 X112.463 Y106.186 E.01646
G1 X152.091 Y145.815 E1.72602
G1 X152.626 Y145.815 E.01646
G1 X112.997 Y106.186 E1.72602
G1 X113.532 Y106.186 E.01646
G1 X153.16 Y145.815 E1.72602
G1 X153.695 Y145.815 E.01646
G1 X114.066 Y106.186 E1.72602
G1 X114.601 Y106.186 E.01646
G1 X154.229 Y145.815 E1.72602
G1 X154.764 Y145.815 E.01646
G1 X115.135 Y106.186 E1.72602
G1 X115.67 Y106.186 E.01646
G1 X155.298 Y145.815 E1.72602
G1 X155.833 Y145.815 E.01646
G1 X116.204 Y106.186 E1.72602
G1 X116.739 Y106.186 E.01646
G1 X156.367 Y145.815 E1.72602
G1 X156.902 Y145.815 E.01646
G1 X117.274 Y106.186 E1.72602
G1 X117.808 Y106.186 E.01646
G1 X157.436 Y145.815 E1.72601
G1 X157.971 Y145.815 E.01646
G1 X118.343 Y106.186 E1.72601
G1 X118.877 Y106.186 E.01646
G1 X158.505 Y145.815 E1.72601
G1 X159.04 Y145.815 E.01646
G1 X119.412 Y106.186 E1.72601
G1 X119.946 Y106.186 E.01646
G1 X159.574 Y145.815 E1.72601
G1 X160.109 Y145.815 E.01646
G1 X120.481 Y106.186 E1.72601
G1 X121.015 Y106.186 E.01646
G1 X160.643 Y145.815 E1.72601
G1 X161.178 Y145.815 E.01646
G1 X121.55 Y106.186 E1.72601
M73 P36 R21
G1 X122.084 Y106.186 E.01646
G1 X161.712 Y145.815 E1.72601
G1 X162.247 Y145.815 E.01646
G1 X122.619 Y106.186 E1.72601
G1 X123.153 Y106.186 E.01646
G1 X162.781 Y145.815 E1.72601
G1 X163.316 Y145.815 E.01646
G1 X123.688 Y106.186 E1.72601
G1 X124.222 Y106.187 E.01646
G1 X163.85 Y145.815 E1.72601
G1 X164.385 Y145.815 E.01646
G1 X124.757 Y106.187 E1.72601
G1 X125.291 Y106.187 E.01646
G1 X164.919 Y145.815 E1.72601
G1 X165.454 Y145.815 E.01646
G1 X125.826 Y106.187 E1.72601
G1 X126.36 Y106.187 E.01646
G1 X165.988 Y145.815 E1.72601
G1 X166.523 Y145.815 E.01646
G1 X126.895 Y106.187 E1.72601
G1 X127.429 Y106.187 E.01646
G1 X167.057 Y145.815 E1.72601
G1 X167.592 Y145.815 E.01646
G1 X127.964 Y106.187 E1.72601
G1 X128.498 Y106.187 E.01646
G1 X168.126 Y145.815 E1.72601
G1 X168.661 Y145.815 E.01646
G1 X129.033 Y106.187 E1.72601
G1 X129.567 Y106.187 E.01646
G1 X169.195 Y145.815 E1.72601
G1 X169.73 Y145.815 E.01646
G1 X130.102 Y106.187 E1.72601
G1 X130.636 Y106.187 E.01646
G1 X170.264 Y145.815 E1.72601
G1 X170.799 Y145.815 E.01646
G1 X131.171 Y106.187 E1.72601
G1 X131.705 Y106.187 E.01646
G1 X171.333 Y145.815 E1.72601
G1 X171.868 Y145.815 E.01646
G1 X132.24 Y106.187 E1.72601
G1 X132.774 Y106.187 E.01646
G1 X172.402 Y145.815 E1.72601
G1 X172.937 Y145.815 E.01646
G1 X133.309 Y106.187 E1.72601
G1 X133.843 Y106.187 E.01646
G1 X173.471 Y145.815 E1.726
G1 X174.006 Y145.815 E.01646
G1 X134.378 Y106.187 E1.726
G1 X134.912 Y106.187 E.01646
G1 X174.54 Y145.815 E1.726
G1 X175.075 Y145.815 E.01646
G1 X135.447 Y106.187 E1.726
G1 X135.981 Y106.187 E.01646
G1 X175.609 Y145.815 E1.726
G1 X176.144 Y145.815 E.01646
G1 X136.516 Y106.187 E1.726
G1 X137.05 Y106.187 E.01646
G1 X176.678 Y145.815 E1.726
G1 X177.213 Y145.815 E.01646
G1 X137.585 Y106.187 E1.726
G1 X138.119 Y106.187 E.01646
G1 X177.747 Y145.815 E1.726
G1 X178.282 Y145.815 E.01646
G1 X138.654 Y106.187 E1.726
G1 X139.188 Y106.187 E.01646
G1 X178.816 Y145.815 E1.726
M73 P37 R21
G1 X179.351 Y145.815 E.01646
G1 X139.723 Y106.187 E1.726
G1 X140.257 Y106.187 E.01646
G1 X179.885 Y145.815 E1.726
G1 X180.42 Y145.815 E.01646
G1 X140.792 Y106.187 E1.726
G1 X141.326 Y106.187 E.01646
G1 X180.954 Y145.815 E1.726
G1 X181.489 Y145.815 E.01646
G1 X141.861 Y106.187 E1.726
G1 X142.395 Y106.187 E.01646
G1 X182.023 Y145.815 E1.726
G1 X182.558 Y145.815 E.01646
G1 X142.93 Y106.187 E1.726
G1 X143.464 Y106.187 E.01646
G1 X183.092 Y145.815 E1.726
G1 X183.627 Y145.815 E.01646
G1 X143.999 Y106.187 E1.726
G1 X144.534 Y106.187 E.01646
G1 X184.161 Y145.815 E1.726
G1 X184.696 Y145.815 E.01646
G1 X145.068 Y106.187 E1.726
G1 X145.603 Y106.187 E.01646
G1 X185.23 Y145.815 E1.726
G1 X185.765 Y145.815 E.01646
G1 X146.137 Y106.187 E1.726
G1 X146.672 Y106.187 E.01646
G1 X186.299 Y145.815 E1.726
G1 X186.834 Y145.815 E.01646
G1 X147.206 Y106.187 E1.726
G1 X147.741 Y106.187 E.01646
G1 X187.368 Y145.815 E1.726
G1 X187.903 Y145.815 E.01646
G1 X148.275 Y106.187 E1.726
G1 X148.81 Y106.187 E.01646
G1 X188.437 Y145.815 E1.726
G1 X188.972 Y145.815 E.01646
G1 X149.344 Y106.187 E1.726
G1 X149.879 Y106.187 E.01646
G1 X189.506 Y145.815 E1.72599
G1 X190.041 Y145.815 E.01646
G1 X150.413 Y106.187 E1.72599
G1 X150.948 Y106.187 E.01646
G1 X190.575 Y145.815 E1.72599
G1 X191.11 Y145.815 E.01646
G1 X151.482 Y106.187 E1.72599
G1 X152.017 Y106.187 E.01646
G1 X191.644 Y145.815 E1.72599
G1 X192.179 Y145.815 E.01646
G1 X152.551 Y106.187 E1.72599
G1 X153.086 Y106.187 E.01646
G1 X192.713 Y145.815 E1.72599
G1 X193.248 Y145.815 E.01646
G1 X153.62 Y106.187 E1.72599
G1 X154.155 Y106.187 E.01646
G1 X193.782 Y145.815 E1.72599
G1 X194.317 Y145.815 E.01646
G1 X154.689 Y106.187 E1.72599
G1 X155.224 Y106.187 E.01646
G1 X194.851 Y145.815 E1.72599
G1 X195.386 Y145.815 E.01646
G1 X155.758 Y106.187 E1.72599
G1 X156.293 Y106.187 E.01646
G1 X195.92 Y145.815 E1.72599
G1 X196.455 Y145.815 E.01646
G1 X156.827 Y106.187 E1.72599
G1 X157.362 Y106.187 E.01646
G1 X196.989 Y145.815 E1.72599
G1 X197.524 Y145.815 E.01646
G1 X157.896 Y106.187 E1.72599
G1 X158.431 Y106.187 E.01646
G1 X198.058 Y145.815 E1.72599
G1 X198.593 Y145.815 E.01646
G1 X158.965 Y106.187 E1.72599
G1 X159.5 Y106.187 E.01646
G1 X199.127 Y145.815 E1.72599
G1 X199.662 Y145.815 E.01646
G1 X160.034 Y106.187 E1.72599
G1 X160.569 Y106.187 E.01646
G1 X200.196 Y145.815 E1.72599
G1 X200.731 Y145.815 E.01646
G1 X161.103 Y106.187 E1.72599
G1 X161.638 Y106.187 E.01646
G1 X201.265 Y145.815 E1.72599
G1 X201.8 Y145.815 E.01646
G1 X162.172 Y106.187 E1.72599
G1 X162.707 Y106.187 E.01646
G1 X202.334 Y145.815 E1.72599
G1 X202.869 Y145.815 E.01646
G1 X163.241 Y106.187 E1.72599
G1 X163.776 Y106.187 E.01646
G1 X203.403 Y145.815 E1.72599
G1 X203.938 Y145.815 E.01646
G1 X164.31 Y106.187 E1.72599
G1 X164.845 Y106.187 E.01646
G1 X204.472 Y145.815 E1.72599
G1 X205.007 Y145.815 E.01646
G1 X165.379 Y106.187 E1.72599
G1 X165.914 Y106.187 E.01646
G1 X205.541 Y145.815 E1.72598
G1 X206.076 Y145.815 E.01646
G1 X166.448 Y106.187 E1.72598
G1 X166.983 Y106.187 E.01646
G1 X206.61 Y145.815 E1.72598
G1 X207.145 Y145.815 E.01646
G1 X167.517 Y106.187 E1.72598
G1 X168.052 Y106.187 E.01646
G1 X207.679 Y145.815 E1.72598
G1 X208.214 Y145.815 E.01646
G1 X168.586 Y106.187 E1.72598
G1 X169.121 Y106.187 E.01646
G1 X208.748 Y145.815 E1.72598
G1 X209.283 Y145.815 E.01646
G1 X169.655 Y106.187 E1.72598
G1 X170.19 Y106.187 E.01646
G1 X209.817 Y145.815 E1.72598
G1 X210.352 Y145.815 E.01646
G1 X170.724 Y106.187 E1.72598
G1 X171.259 Y106.187 E.01646
G1 X210.886 Y145.815 E1.72598
G1 X211.421 Y145.815 E.01646
G1 X171.794 Y106.187 E1.72598
G1 X172.328 Y106.187 E.01646
G1 X211.955 Y145.815 E1.72598
G1 X212.49 Y145.815 E.01646
G1 X172.863 Y106.187 E1.72598
G1 X173.397 Y106.187 E.01646
G1 X213.025 Y145.815 E1.72598
G1 X213.559 Y145.815 E.01646
G1 X173.932 Y106.187 E1.72598
G1 X174.466 Y106.187 E.01646
G1 X214.094 Y145.815 E1.72598
G2 X214.612 Y145.798 I.092 J-5.283 E.01597
G1 X175.001 Y106.187 E1.72526
G1 X175.535 Y106.187 E.01646
G1 X215.11 Y145.762 E1.72369
G1 X215.575 Y145.693 E.01449
G1 X176.07 Y106.187 E1.72068
G1 X176.604 Y106.187 E.01646
G1 X216.011 Y145.594 E1.71638
G2 X216.432 Y145.48 I-.369 J-2.191 E.01344
G1 X177.139 Y106.187 E1.71141
G1 X177.673 Y106.187 E.01646
G1 X216.825 Y145.339 E1.70528
G2 X217.202 Y145.182 I-.612 J-1.992 E.0126
G1 X178.208 Y106.187 E1.69841
G1 X178.742 Y106.187 E.01646
G1 X217.565 Y145.01 E1.69093
G2 X217.904 Y144.815 I-.822 J-1.821 E.01208
G1 X179.277 Y106.187 E1.68243
G1 X179.811 Y106.187 E.01646
G1 X218.237 Y144.613 E1.67366
G1 X218.544 Y144.386 E.01177
G1 X180.346 Y106.187 E1.66374
G1 X180.88 Y106.187 E.01646
G1 X218.845 Y144.152 E1.65356
G1 X219.125 Y143.898 E.01165
G1 X181.415 Y106.187 E1.6425
G1 X181.949 Y106.187 E.01646
G1 X219.395 Y143.634 E1.63097
G1 X219.65 Y143.353 E.01165
G1 X182.484 Y106.187 E1.61876
M73 P38 R21
G1 X183.018 Y106.187 E.01646
G1 X219.889 Y143.058 E1.6059
G1 X220.116 Y142.751 E.01177
G1 X183.553 Y106.187 E1.59253
G1 X184.087 Y106.187 E.01646
G1 X220.323 Y142.424 E1.57827
G1 X220.524 Y142.089 E.012
G1 X184.622 Y106.187 E1.56372
G1 X185.156 Y106.187 E.01646
G1 X220.696 Y141.727 E1.54795
G2 X220.86 Y141.357 I-1.797 J-1.018 E.0125
G1 X185.691 Y106.187 E1.53181
G1 X186.225 Y106.187 E.01646
G1 X221.001 Y140.963 E1.51467
G2 X221.122 Y140.55 I-2.038 J-.821 E.01329
G1 X186.76 Y106.187 E1.49666
G1 X187.294 Y106.187 E.01646
G1 X221.229 Y140.122 E1.47802
G1 X221.298 Y139.656 E.01449
G1 X187.829 Y106.187 E1.45775
G1 X188.363 Y106.187 E.01646
G1 X221.343 Y139.167 E1.43644
G2 X221.365 Y138.654 I-5.208 J-.477 E.01582
G1 X188.898 Y106.187 E1.4141
G1 X189.432 Y106.187 E.01646
G1 X221.365 Y138.12 E1.39082
G1 X221.365 Y137.585 E.01646
G1 X189.967 Y106.187 E1.36754
G1 X190.501 Y106.187 E.01646
G1 X221.365 Y137.051 E1.34426
G1 X221.365 Y136.516 E.01646
G1 X191.036 Y106.187 E1.32098
G1 X191.57 Y106.187 E.01646
G1 X221.365 Y135.982 E1.2977
G1 X221.365 Y135.447 E.01646
G1 X192.105 Y106.187 E1.27441
G1 X192.639 Y106.187 E.01646
G1 X221.365 Y134.913 E1.25113
G1 X221.365 Y134.378 E.01646
G1 X193.174 Y106.187 E1.22785
G1 X193.708 Y106.188 E.01646
G1 X221.365 Y133.844 E1.20457
G1 X221.365 Y133.309 E.01646
G1 X194.243 Y106.188 E1.18129
G1 X194.777 Y106.188 E.01646
G1 X221.365 Y132.775 E1.15801
G1 X221.365 Y132.24 E.01646
G1 X195.312 Y106.188 E1.13473
G1 X195.846 Y106.188 E.01646
G1 X221.365 Y131.706 E1.11145
G1 X221.365 Y131.171 E.01646
G1 X196.381 Y106.188 E1.08817
G1 X196.915 Y106.188 E.01646
G1 X221.365 Y130.637 E1.06489
G1 X221.365 Y130.102 E.01646
G1 X197.45 Y106.188 E1.04161
G1 X197.984 Y106.188 E.01646
G1 X221.365 Y129.568 E1.01833
G1 X221.365 Y129.033 E.01646
G1 X198.519 Y106.188 E.99505
G1 X199.054 Y106.188 E.01646
G1 X221.365 Y128.499 E.97177
G1 X221.365 Y127.964 E.01646
G1 X199.588 Y106.188 E.94849
G1 X200.123 Y106.188 E.01646
G1 X221.365 Y127.43 E.9252
G1 X221.365 Y126.895 E.01646
G1 X200.657 Y106.188 E.90192
G1 X201.192 Y106.188 E.01646
G1 X221.365 Y126.361 E.87864
G1 X221.365 Y125.826 E.01646
G1 X201.726 Y106.188 E.85536
G1 X202.261 Y106.188 E.01646
G1 X221.365 Y125.292 E.83208
G1 X221.365 Y124.757 E.01646
G1 X202.795 Y106.188 E.8088
G1 X203.33 Y106.188 E.01646
G1 X221.365 Y124.223 E.78552
G1 X221.365 Y123.688 E.01646
G1 X203.864 Y106.188 E.76224
G1 X204.399 Y106.188 E.01646
G1 X221.365 Y123.154 E.73896
G1 X221.365 Y122.619 E.01646
G1 X204.933 Y106.188 E.71568
G1 X205.468 Y106.188 E.01646
G1 X221.365 Y122.085 E.6924
G1 X221.365 Y121.55 E.01646
G1 X206.002 Y106.188 E.66912
G1 X206.537 Y106.188 E.01646
G1 X221.365 Y121.016 E.64584
G1 X221.365 Y120.481 E.01646
G1 X207.071 Y106.188 E.62256
G1 X207.606 Y106.188 E.01646
G1 X221.365 Y119.947 E.59928
G1 X221.365 Y119.412 E.01646
G1 X208.14 Y106.188 E.576
G1 X208.675 Y106.188 E.01646
G1 X221.365 Y118.878 E.55271
G1 X221.365 Y118.343 E.01646
G1 X209.209 Y106.188 E.52943
G1 X209.744 Y106.188 E.01646
G1 X221.365 Y117.809 E.50615
G1 X221.365 Y117.274 E.01646
G1 X210.278 Y106.188 E.48287
G1 X210.813 Y106.188 E.01646
G1 X221.365 Y116.74 E.45959
G1 X221.365 Y116.205 E.01646
G1 X211.347 Y106.188 E.43631
G1 X211.882 Y106.188 E.01646
G1 X221.365 Y115.671 E.41303
G1 X221.365 Y115.136 E.01646
G1 X212.416 Y106.188 E.38975
G1 X212.951 Y106.188 E.01646
G1 X221.365 Y114.602 E.36647
G1 X221.365 Y114.067 E.01646
G1 X213.485 Y106.188 E.34319
G1 X214.02 Y106.188 E.01646
G1 X221.365 Y113.533 E.31991
G2 X221.35 Y112.984 I-5.59 J-.13 E.01691
G1 X214.566 Y106.2 E.2955
G3 X215.144 Y106.243 I.069 J2.955 E.01788
G1 X221.307 Y112.406 E.26843
G2 X221.201 Y111.766 I-3.304 J.217 E.02002
G1 X215.784 Y106.349 E.23594
G3 X216.522 Y106.552 I-.663 J3.846 E.0236
G1 X220.998 Y111.028 E.19495
G2 X220.624 Y110.119 I-4.802 J1.447 E.03033
G1 X217.431 Y106.926 E.13905
G3 X219.291 Y108.252 I-2.993 J6.167 E.07067
G1 X220.38 Y109.341 E.04745
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X219.291 Y108.252 E-.5854
G1 X218.951 Y107.943 E-.1746
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/35
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1 I-.001 J-1.217 P1  F30000
G1 X36.476 Y108.026 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.362 Y105.856 E5.72702
G3 X221.698 Y113.265 I-.066 J7.402 E.38374
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.412 J.001 E.38626
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I-.001 J-7.412 E.38626
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.198 Y107.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.381 Y105.464 E5.30585
G3 X222.09 Y113.255 I-.08 J7.788 E.37356
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.01 J-7.805 E.37612
G1 X33.91 Y113.255 E.78322
G3 X36.156 Y107.791 I7.813 J.018 E.18616
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.31317
G1 X37.372 Y106.773 E-.29045
G1 X37.725 Y106.561 E-.15639
; WIPE_END
G1 E-.04 F1800
G1 X36.333 Y114.066 Z1.2 F30000
G1 X34.65 Y123.133 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X34.65 Y124.762 E.05401
G1 X55.688 Y145.8 E.98693
G1 X54.469 Y145.8 E.04046
G1 X94.067 Y106.201 E1.85763
G1 X92.85 Y106.201 E.04038
G1 X132.448 Y145.8 E1.85764
G1 X131.228 Y145.8 E.04046
G1 X170.825 Y106.203 E1.85756
G1 X169.611 Y106.203 E.04027
G1 X209.207 Y145.8 E1.85756
G1 X207.988 Y145.8 E.04046
G1 X221.35 Y132.438 E.62684
G1 X221.35 Y134.914 E.08215
G1 X192.639 Y106.204 E1.34687
G1 X193.852 Y106.204 E.04024
G1 X154.256 Y145.8 E1.85753
G1 X155.476 Y145.8 E.04046
G1 X115.878 Y106.202 E1.85761
G1 X117.094 Y106.202 E.04035
G1 X77.496 Y145.8 E1.85761
G1 X78.716 Y145.8 E.04046
G1 X39.483 Y106.566 E1.84052
G3 X40.158 Y106.379 I1.29 J3.335 E.02328
G1 X34.829 Y111.708 E.25
G3 X35.382 Y110.142 I7.078 J1.621 E.05522
G1 X71.04 Y145.8 E1.67278
G1 X69.821 Y145.8 E.04046
G1 X109.418 Y106.202 E1.85762
G1 X108.202 Y106.202 E.04036
G1 X147.8 Y145.8 E1.85762
G1 X146.58 Y145.8 E.04046
G1 X186.176 Y106.203 E1.85754
G1 X184.963 Y106.203 E.04025
G1 X220.618 Y141.858 E1.67264
G2 X221.171 Y140.292 I-6.522 J-3.186 E.05522
G1 X215.844 Y145.619 E.24991
G2 X216.517 Y145.434 I-.685 J-3.802 E.02319
G1 X177.287 Y106.203 E1.84038
M73 P39 R21
G1 X178.501 Y106.203 E.04026
G1 X138.904 Y145.8 E1.85755
G1 X140.124 Y145.8 E.04046
G1 X100.526 Y106.202 E1.85763
G1 X101.743 Y106.202 E.04037
G1 X62.145 Y145.8 E1.85763
G1 X63.364 Y145.8 E.04046
G1 X34.65 Y117.086 E1.34703
G1 X34.65 Y119.562 E.08215
G1 X48.012 Y106.2 E.62683
G1 X46.793 Y106.2 E.04045
G1 X86.392 Y145.8 E1.85768
G1 X85.172 Y145.8 E.04046
G1 X124.77 Y106.202 E1.8576
G1 X123.554 Y106.202 E.04034
G1 X163.152 Y145.8 E1.8576
G1 X161.932 Y145.8 E.04046
G1 X201.528 Y106.204 E1.85752
G1 X200.315 Y106.204 E.04023
G1 X221.35 Y127.238 E.98677
G1 X221.35 Y124.762 E.08215
G1 X200.312 Y145.8 E.98693
G1 X201.531 Y145.8 E.04046
G1 X161.935 Y106.203 E1.85756
G1 X163.149 Y106.203 E.04028
G1 X123.552 Y145.8 E1.85756
G1 X124.772 Y145.8 E.04046
G1 X85.173 Y106.201 E1.85764
G1 X86.391 Y106.201 E.04039
G1 X46.793 Y145.8 E1.85764
G1 X48.012 Y145.8 E.04046
G1 X34.65 Y132.438 E.62684
G1 X34.65 Y134.914 E.08215
G1 X63.364 Y106.201 E1.347
G1 X62.145 Y106.201 E.04043
G1 X101.744 Y145.8 E1.85767
G1 X100.524 Y145.8 E.04046
G1 X140.122 Y106.202 E1.85759
G1 X138.906 Y106.202 E.04031
G1 X178.503 Y145.8 E1.85759
G1 X177.284 Y145.8 E.04046
G1 X216.517 Y106.566 E1.84052
G2 X215.842 Y106.379 I-1.29 J3.335 E.02329
G1 X221.171 Y111.708 E.25
G2 X220.618 Y110.142 I-7.075 J1.62 E.05522
G1 X184.96 Y145.8 E1.67278
G1 X186.179 Y145.8 E.04046
G1 X146.582 Y106.203 E1.85758
G1 X147.797 Y106.203 E.0403
G1 X108.2 Y145.8 E1.85758
G1 X109.42 Y145.8 E.04046
G1 X69.821 Y106.201 E1.85766
G1 X71.039 Y106.201 E.04041
G1 X35.382 Y141.858 E1.67275
G3 X34.829 Y140.292 I6.52 J-3.186 E.05522
G1 X40.158 Y145.621 E.25
G3 X39.483 Y145.434 I.614 J-3.522 E.02328
G1 X78.715 Y106.201 E1.84048
G1 X77.497 Y106.201 E.0404
G1 X117.096 Y145.8 E1.85765
G1 X115.876 Y145.8 E.04046
G1 X155.473 Y106.203 E1.85757
G1 X154.259 Y106.203 E.04029
G1 X193.855 Y145.8 E1.85757
G1 X192.636 Y145.8 E.04046
G1 X221.35 Y117.086 E1.34703
G1 X221.35 Y119.562 E.08215
G1 X207.991 Y106.204 E.62667
G1 X209.204 Y106.204 E.04021
G1 X169.608 Y145.8 E1.85752
G1 X170.828 Y145.8 E.04046
G1 X131.23 Y106.202 E1.8576
G1 X132.446 Y106.202 E.04033
G1 X92.848 Y145.8 E1.85759
G1 X94.068 Y145.8 E.04046
G1 X54.469 Y106.201 E1.85767
G1 X55.688 Y106.201 E.04044
G1 X34.65 Y127.238 E.98692
G1 X34.65 Y128.867 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X34.65 Y127.238 E-.61876
G1 X34.913 Y126.975 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/35
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.2 I1.213 J.1 P1  F30000
G1 X36.476 Y108.026 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.388 Y105.857 E5.72789
G3 X221.698 Y113.265 I-.091 J7.401 E.38285
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
M73 P39 R20
G3 X214.285 Y146.148 I-7.416 J-.003 E.38621
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.003 J-7.416 E.38621
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.198 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.538 J5.558 E.18798
G1 X214.407 Y105.466 E5.30665
G3 X222.09 Y113.255 I-.105 J7.787 E.37274
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.802 J-.007 E.37615
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.013 J-7.809 E.37607
G1 X33.91 Y113.255 E.78322
G3 X35.287 Y108.836 I7.939 J.05 E.14433
G3 X36.155 Y107.79 I6.448 J4.47 E.04182
; WIPE_START
M204 S10000
G1 X36.758 Y107.229 E-.3131
G1 X37.372 Y106.773 E-.29055
G1 X37.725 Y106.561 E-.15635
; WIPE_END
G1 E-.04 F1800
G1 X36.683 Y114.122 Z1.4 F30000
G1 X34.65 Y128.867 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X34.65 Y127.238 E.05401
G1 X55.688 Y106.201 E.98691
G1 X54.469 Y106.201 E.04043
G1 X94.068 Y145.8 E1.85767
G1 X92.848 Y145.8 E.04046
G1 X132.445 Y106.203 E1.85756
G1 X131.231 Y106.203 E.04028
G1 X170.828 Y145.8 E1.85756
G1 X169.608 Y145.8 E.04046
G1 X209.202 Y106.205 E1.85746
G1 X207.993 Y106.205 E.04013
G1 X221.35 Y119.562 E.62661
G1 X221.35 Y117.086 E.08215
G1 X192.636 Y145.8 E1.34703
G1 X193.855 Y145.8 E.04046
G1 X154.259 Y106.204 E1.85753
G1 X155.472 Y106.204 E.04024
G1 X115.876 Y145.8 E1.85753
G1 X117.096 Y145.8 E.04046
G1 X77.498 Y106.201 E1.85764
G1 X78.715 Y106.201 E.04039
G1 X39.483 Y145.434 E1.84047
G2 X40.158 Y145.621 I1.29 J-3.334 E.02328
G1 X34.829 Y140.292 E.25
G2 X35.382 Y141.858 I7.074 J-1.62 E.05522
G1 X71.039 Y106.201 E1.67274
G1 X69.821 Y106.201 E.0404
G1 X109.42 Y145.8 E1.85765
G1 X108.2 Y145.8 E.04046
G1 X147.797 Y106.203 E1.85754
G1 X146.583 Y106.203 E.04025
G1 X186.179 Y145.8 E1.85754
G1 X184.96 Y145.8 E.04046
G1 X220.618 Y110.142 E1.67278
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X215.842 Y106.379 E.25
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X177.284 Y145.8 E1.84052
G1 X178.503 Y145.8 E.04046
G1 X138.907 Y106.203 E1.85755
G1 X140.121 Y106.203 E.04027
G1 X100.524 Y145.8 E1.85755
G1 X101.744 Y145.8 E.04046
G1 X62.145 Y106.201 E1.85766
G1 X63.364 Y106.201 E.04041
G1 X34.65 Y134.914 E1.347
G1 X34.65 Y132.438 E.08215
G1 X48.012 Y145.8 E.62684
G1 X46.793 Y145.8 E.04046
G1 X86.391 Y106.202 E1.85763
G1 X85.174 Y106.202 E.04037
G1 X124.772 Y145.8 E1.85763
G1 X123.552 Y145.8 E.04046
G1 X163.148 Y106.204 E1.85752
G1 X161.936 Y106.204 E.04022
G1 X201.531 Y145.8 E1.85752
G1 X200.312 Y145.8 E.04046
G1 X221.35 Y124.762 E.98693
G1 X221.35 Y127.238 E.08215
G1 X200.316 Y106.205 E.98671
G1 X201.527 Y106.205 E.04015
G1 X161.932 Y145.8 E1.85747
G1 X163.152 Y145.8 E.04046
G1 X123.555 Y106.203 E1.85758
G1 X124.769 Y106.203 E.0403
G1 X85.172 Y145.8 E1.85757
G1 X86.392 Y145.8 E.04046
G1 X46.793 Y106.2 E1.85768
G1 X48.012 Y106.201 E.04044
G1 X34.65 Y119.562 E.62683
G1 X34.65 Y117.086 E.08215
G1 X63.364 Y145.8 E1.34703
M73 P40 R20
G1 X62.145 Y145.8 E.04046
G1 X101.742 Y106.202 E1.85761
G1 X100.526 Y106.202 E.04034
G1 X140.124 Y145.8 E1.85761
G1 X138.904 Y145.8 E.04046
G1 X178.499 Y106.204 E1.8575
G1 X177.288 Y106.204 E.04019
G1 X216.517 Y145.434 E1.84033
G3 X215.845 Y145.618 I-1.388 J-3.737 E.02316
G1 X221.171 Y140.292 E.24987
G3 X220.618 Y141.858 I-7.076 J-1.62 E.05522
G1 X184.964 Y106.205 E1.67259
G1 X186.175 Y106.205 E.04018
G1 X146.58 Y145.8 E1.85749
G1 X147.8 Y145.8 E.04046
G1 X108.202 Y106.202 E1.8576
G1 X109.418 Y106.202 E.04033
G1 X69.821 Y145.8 E1.85759
G1 X71.04 Y145.8 E.04046
G1 X35.382 Y110.142 E1.67278
G2 X34.829 Y111.708 I6.521 J3.186 E.05522
G1 X40.158 Y106.379 E.25
G2 X39.483 Y106.566 I.615 J3.525 E.02328
G1 X78.716 Y145.8 E1.84052
G1 X77.496 Y145.8 E.04046
G1 X117.094 Y106.203 E1.85758
G1 X115.878 Y106.202 E.04031
G1 X155.476 Y145.8 E1.85759
G1 X154.256 Y145.8 E.04046
G1 X193.851 Y106.205 E1.85748
G1 X192.64 Y106.205 E.04016
G1 X221.35 Y134.914 E1.34682
G1 X221.35 Y132.438 E.08215
G1 X207.988 Y145.8 E.62684
G1 X209.207 Y145.8 E.04046
G1 X169.612 Y106.204 E1.85751
G1 X170.824 Y106.204 E.04021
G1 X131.228 Y145.8 E1.85751
G1 X132.448 Y145.8 E.04046
G1 X92.85 Y106.202 E1.85762
G1 X94.066 Y106.202 E.04035
G1 X54.469 Y145.8 E1.85762
G1 X55.688 Y145.8 E.04046
G1 X34.65 Y124.762 E.98693
G1 X34.65 Y123.133 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X34.65 Y124.762 E-.61876
G1 X34.913 Y125.025 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/35
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.4 I1.212 J.111 P1  F30000
G1 X36.476 Y108.026 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.414 Y105.858 E5.72876
G3 X221.698 Y113.265 I-.116 J7.399 E.38197
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.198 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.433 Y105.467 E5.30746
G3 X222.09 Y113.255 I-.13 J7.786 E.37192
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X36.156 Y107.791 I7.813 J.018 E.18616
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.3131
G1 X37.372 Y106.773 E-.29051
G1 X37.725 Y106.561 E-.15638
; WIPE_END
G1 E-.04 F1800
G1 X45.258 Y107.791 Z1.6 F30000
G1 X221.35 Y136.542 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X221.35 Y134.914 E.05401
G1 X192.641 Y106.206 E1.34677
G1 X193.85 Y106.206 E.04009
G1 X154.256 Y145.8 E1.85743
G1 X155.476 Y145.8 E.04046
G1 X115.879 Y106.203 E1.85756
G1 X117.093 Y106.203 E.04027
G1 X77.496 Y145.8 E1.85756
G1 X78.716 Y145.8 E.04046
G1 X39.483 Y106.566 E1.84052
G3 X40.158 Y106.379 I1.29 J3.338 E.02328
G1 X34.829 Y111.708 E.25
G3 X35.382 Y110.142 I7.077 J1.621 E.05522
G1 X71.04 Y145.8 E1.67278
G1 X69.821 Y145.8 E.04046
G1 X109.417 Y106.203 E1.85757
G1 X108.203 Y106.203 E.04029
G1 X147.8 Y145.8 E1.85757
G1 X146.58 Y145.8 E.04046
G1 X186.174 Y106.206 E1.85744
G1 X184.965 Y106.206 E.04011
G1 X220.618 Y141.858 E1.67254
G2 X221.171 Y140.292 I-6.523 J-3.187 E.05522
G1 X215.842 Y145.621 E.25
G2 X216.517 Y145.434 I-.614 J-3.521 E.02328
G1 X177.289 Y106.205 E1.84029
G1 X178.498 Y106.205 E.04012
G1 X138.904 Y145.8 E1.85745
G1 X140.124 Y145.8 E.04046
G1 X100.527 Y106.202 E1.85759
G1 X101.742 Y106.203 E.04031
G1 X62.145 Y145.8 E1.85758
G1 X63.364 Y145.8 E.04046
G1 X34.65 Y117.086 E1.34703
G1 X34.65 Y119.562 E.08215
G1 X48.012 Y106.201 E.62682
G1 X46.793 Y106.2 E.04044
G1 X86.392 Y145.8 E1.85768
G1 X85.172 Y145.8 E.04046
G1 X124.769 Y106.203 E1.85754
G1 X123.555 Y106.203 E.04026
G1 X163.152 Y145.8 E1.85755
G1 X161.932 Y145.8 E.04046
G1 X201.526 Y106.206 E1.85741
G1 X200.318 Y106.206 E.04007
G1 X221.35 Y127.238 E.98666
G1 X221.35 Y124.762 E.08215
G1 X200.312 Y145.8 E.98693
G1 X201.531 Y145.8 E.04046
G1 X161.936 Y106.205 E1.85748
G1 X163.147 Y106.205 E.04016
G1 X123.552 Y145.8 E1.85748
G1 X124.772 Y145.8 E.04046
G1 X85.174 Y106.202 E1.85761
G1 X86.39 Y106.202 E.04035
G1 X46.793 Y145.8 E1.85761
G1 X48.012 Y145.8 E.04046
G1 X34.65 Y132.438 E.62684
G1 X34.65 Y134.914 E.08215
G1 X63.363 Y106.201 E1.34699
G1 X62.145 Y106.201 E.0404
G1 X101.744 Y145.8 E1.85765
G1 X100.524 Y145.8 E.04046
G1 X140.12 Y106.204 E1.85752
G1 X138.908 Y106.204 E.04022
G1 X178.503 Y145.8 E1.85752
G1 X177.284 Y145.8 E.04046
G1 X216.517 Y106.566 E1.84052
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X221.171 Y111.708 E.25
G2 X220.618 Y110.142 I-7.076 J1.62 E.05522
G1 X184.96 Y145.8 E1.67278
G1 X186.179 Y145.8 E.04046
G1 X146.584 Y106.204 E1.85751
G1 X147.796 Y106.204 E.0402
G1 X108.2 Y145.8 E1.8575
G1 X109.42 Y145.8 E.04046
G1 X69.822 Y106.201 E1.85764
G1 X71.039 Y106.201 E.04039
G1 X35.382 Y141.858 E1.67273
G3 X34.829 Y140.292 I6.522 J-3.186 E.05522
G1 X40.158 Y145.621 E.25
G3 X39.483 Y145.434 I.615 J-3.522 E.02328
G1 X78.715 Y106.202 E1.84046
G1 X77.498 Y106.202 E.04037
G1 X117.096 Y145.8 E1.85763
G1 X115.876 Y145.8 E.04046
G1 X155.471 Y106.204 E1.85749
G1 X154.26 Y106.204 E.04018
G1 X193.855 Y145.8 E1.85749
G1 X192.636 Y145.8 E.04046
G1 X221.35 Y117.086 E1.34703
G1 X221.35 Y119.562 E.08215
G1 X207.994 Y106.206 E.62655
G1 X209.201 Y106.206 E.04005
G1 X169.608 Y145.8 E1.8574
G1 X170.828 Y145.8 E.04046
G1 X131.231 Y106.204 E1.85753
G1 X132.444 Y106.204 E.04024
M73 P41 R20
G1 X92.848 Y145.8 E1.85753
G1 X94.068 Y145.8 E.04046
G1 X54.469 Y106.201 E1.85767
G1 X55.688 Y106.201 E.04042
G1 X34.65 Y127.238 E.98691
G1 X34.65 Y124.762 E.08215
G1 X55.688 Y145.8 E.98693
G1 X54.469 Y145.8 E.04046
G1 X94.066 Y106.202 E1.8576
G1 X92.85 Y106.202 E.04033
G1 X132.448 Y145.8 E1.8576
G1 X131.228 Y145.8 E.04046
G1 X170.823 Y106.205 E1.85747
G1 X169.613 Y106.205 E.04014
G1 X209.207 Y145.8 E1.85747
G1 X207.988 Y145.8 E.04046
G1 X221.35 Y132.438 E.62684
G1 X221.35 Y130.809 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X221.35 Y132.438 E-.61876
G1 X221.087 Y132.701 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/35
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.6 I.161 J-1.206 P1  F30000
G1 X36.475 Y108.025 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X41.715 Y105.852 I5.246 J5.246 E.19308
G1 X214.44 Y105.86 E5.72962
G3 X221.698 Y113.265 I-.142 J7.398 E.38109
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.419 J.006 E.19109
M204 S250
G1 X36.198 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.524 J5.524 E.18801
G1 X214.46 Y105.468 E5.30826
G3 X222.09 Y113.255 I-.155 J7.784 E.3711
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X36.156 Y107.791 I7.812 J.017 E.18617
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.31314
G1 X37.372 Y106.773 E-.29052
G1 X37.725 Y106.562 E-.15634
; WIPE_END
G1 E-.04 F1800
G1 X36.683 Y114.122 Z1.8 F30000
G1 X34.65 Y128.867 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X34.65 Y127.238 E.05401
G1 X55.688 Y106.201 E.9869
G1 X54.469 Y106.201 E.04042
G1 X94.068 Y145.8 E1.85766
G1 X92.848 Y145.8 E.04046
G1 X132.444 Y106.204 E1.8575
G1 X131.232 Y106.204 E.04019
G1 X170.828 Y145.8 E1.8575
G1 X169.608 Y145.8 E.04046
G1 X209.2 Y106.208 E1.85734
G1 X207.995 Y106.208 E.03997
G1 X221.35 Y119.562 E.62649
G1 X221.35 Y117.086 E.08215
G1 X192.636 Y145.8 E1.34703
G1 X193.855 Y145.8 E.04046
G1 X154.261 Y106.205 E1.85745
G1 X155.471 Y106.205 E.04012
G1 X115.876 Y145.8 E1.85745
G1 X117.096 Y145.8 E.04046
G1 X77.498 Y106.202 E1.85761
G1 X78.714 Y106.202 E.04035
G1 X39.483 Y145.434 E1.84044
G2 X40.158 Y145.621 I1.289 J-3.333 E.02328
G1 X34.829 Y140.292 E.25
G2 X35.382 Y141.858 I7.076 J-1.62 E.05522
G1 X71.039 Y106.202 E1.67272
G1 X69.822 Y106.202 E.04037
G1 X109.42 Y145.8 E1.85763
G1 X108.2 Y145.8 E.04046
G1 X147.795 Y106.205 E1.85747
G1 X146.585 Y106.205 E.04015
G1 X186.179 Y145.8 E1.85747
G1 X184.96 Y145.8 E.04046
G1 X220.618 Y110.142 E1.67278
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X215.842 Y106.379 E.25
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X177.284 Y145.8 E1.84052
G1 X178.503 Y145.8 E.04046
G1 X138.908 Y106.205 E1.85749
G1 X140.119 Y106.205 E.04017
G1 X100.524 Y145.8 E1.85748
G1 X101.744 Y145.8 E.04046
G1 X62.145 Y106.201 E1.85765
G1 X63.363 Y106.201 E.04039
G1 X34.65 Y134.914 E1.34698
G1 X34.65 Y132.438 E.08215
G1 X48.012 Y145.8 E.62684
G1 X46.793 Y145.8 E.04046
G1 X86.39 Y106.202 E1.8576
G1 X85.174 Y106.202 E.04033
G1 X124.772 Y145.8 E1.8576
G1 X123.552 Y145.8 E.04046
G1 X163.146 Y106.206 E1.85744
G1 X161.937 Y106.206 E.0401
G1 X201.531 Y145.8 E1.85744
G1 X200.312 Y145.8 E.04046
G1 X221.35 Y124.762 E.98693
G1 X221.35 Y127.238 E.08215
G1 X200.319 Y106.207 E.9866
G1 X201.524 Y106.207 E.03999
G1 X161.932 Y145.8 E1.85736
G1 X163.152 Y145.8 E.04046
G1 X123.556 Y106.204 E1.85752
G1 X124.768 Y106.204 E.04021
G1 X85.172 Y145.8 E1.85752
G1 X86.392 Y145.8 E.04046
G1 X46.793 Y106.201 E1.85768
G1 X48.012 Y106.201 E.04044
G1 X34.65 Y119.562 E.62682
G1 X34.65 Y117.086 E.08215
G1 X63.364 Y145.8 E1.34703
G1 X62.145 Y145.8 E.04046
G1 X101.741 Y106.203 E1.85756
G1 X100.527 Y106.203 E.04028
G1 X140.124 Y145.8 E1.85757
G1 X138.904 Y145.8 E.04046
G1 X178.497 Y106.206 E1.8574
G1 X177.29 Y106.206 E.04006
G1 X216.517 Y145.434 E1.84024
G3 X215.846 Y145.617 I-1.448 J-3.982 E.0231
G1 X221.167 Y140.296 E.2496
G3 X220.618 Y141.858 I-6.822 J-1.522 E.05504
G1 X184.966 Y106.207 E1.67249
G1 X186.173 Y106.207 E.04003
G1 X146.58 Y145.8 E1.85739
G1 X147.8 Y145.8 E.04046
G1 X108.203 Y106.203 E1.85755
G1 X109.417 Y106.203 E.04026
G1 X69.821 Y145.8 E1.85755
G1 X71.04 Y145.8 E.04046
G1 X35.382 Y110.142 E1.67278
G2 X34.833 Y111.704 I6.272 J3.083 E.05505
G1 X40.158 Y106.379 E.2498
G2 X39.483 Y106.566 I.614 J3.521 E.02328
G1 X78.716 Y145.8 E1.84052
G1 X77.496 Y145.8 E.04046
G1 X117.093 Y106.204 E1.85753
G1 X115.88 Y106.204 E.04024
G1 X155.476 Y145.8 E1.85753
G1 X154.256 Y145.8 E.04046
G1 X193.849 Y106.207 E1.85737
G1 X192.642 Y106.207 E.04001
G1 X221.35 Y134.914 E1.34671
G1 X221.35 Y132.438 E.08215
G1 X207.988 Y145.8 E.62684
G1 X209.207 Y145.8 E.04046
G1 X169.614 Y106.206 E1.85742
G1 X170.822 Y106.206 E.04008
G1 X131.228 Y145.8 E1.85742
G1 X132.448 Y145.8 E.04046
G1 X92.851 Y106.203 E1.85758
G1 X94.066 Y106.203 E.0403
G1 X54.469 Y145.8 E1.85758
G1 X55.688 Y145.8 E.04046
G1 X34.65 Y124.762 E.98693
G1 X34.65 Y123.133 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X34.65 Y124.762 E-.61876
G1 X34.913 Y125.025 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/35
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.8 I1.212 J.111 P1  F30000
G1 X36.476 Y108.026 Z1.8
G1 Z1.6
M73 P42 R20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.466 Y105.861 E5.73049
G3 X221.698 Y113.265 I-.167 J7.397 E.38021
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.198 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.486 Y105.469 E5.30906
G3 X222.09 Y113.255 I-.181 J7.783 E.37029
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.817 J-.022 E.37595
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X36.156 Y107.791 I7.813 J.018 E.18616
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.3131
G1 X37.372 Y106.773 E-.29051
G1 X37.725 Y106.561 E-.15638
; WIPE_END
G1 E-.04 F1800
G1 X39.445 Y106.599 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X40.319 Y106.354 E.02516
G3 X41.728 Y106.215 I1.76 J10.648 E.03923
G1 X42.678 Y106.215 E.02632
G1 X45.165 Y106.201 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X46.793 Y106.201 E.05401
G1 X47.066 Y106.473 E.01279
G1 X47.07 Y106.578 E.00347
G1 X47.17 Y106.578 E.00331
G1 X86.015 Y145.423 E1.82229
G1 X85.55 Y145.423 E.01543
G1 X124.39 Y106.582 E1.8221
G1 X123.934 Y106.582 E.01515
G1 X162.774 Y145.423 E1.8221
G1 X162.964 Y145.423 E.0063
G2 X163.152 Y145.8 I.357 J.058 E.01491
G1 X166.899 Y145.8 E.12432
G1 X166.522 Y145.423 E.01769
G1 X169.985 Y145.423 E.11487
G1 X208.822 Y106.586 E1.8219
G1 X210.45 Y106.586 E.05401
G1 X208.489 Y106.223 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X211.331 Y106.224 E.07874
; Slow Down End
G1 X200.841 Y106.223 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X203.694 Y106.223 E.07906
; Slow Down End
G1 X193.191 Y106.223 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X196.057 Y106.223 E.0794
; Slow Down End
G1 X185.541 Y106.222 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X188.42 Y106.222 E.07975
; Slow Down End
G1 X177.891 Y106.222 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M73 P42 R19
G1 X180.783 Y106.222 E.08012
; Slow Down End
G1 X170.24 Y106.221 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X173.146 Y106.222 E.08051
; Slow Down End
G1 X167.986 Y106.207 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X169.615 Y106.207 E.05401
G1 X169.791 Y106.383 E.00827
G1 X169.59 Y106.584 E.00943
G1 X169.788 Y106.584 E.00658
G1 X162.577 Y106.221 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X165.508 Y106.221 E.08123
; Slow Down End
G1 X160.31 Y106.206 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X161.938 Y106.207 E.05401
G1 X162.115 Y106.383 E.00829
G1 X161.914 Y106.584 E.00941
G1 X162.112 Y106.584 E.00655
G1 X154.935 Y106.221 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X157.871 Y106.221 E.08135
; Slow Down End
G1 X152.634 Y106.206 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X154.262 Y106.206 E.05401
G1 X154.439 Y106.383 E.0083
G1 X154.239 Y106.583 E.00939
G1 X154.436 Y106.583 E.00653
G1 X147.282 Y106.22 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X150.234 Y106.22 E.0818
; Slow Down End
G1 X144.957 Y106.206 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.586 Y106.206 E.05401
G1 X146.763 Y106.383 E.00832
G1 X146.563 Y106.583 E.00937
G1 X146.759 Y106.583 E.0065
G1 X139.627 Y106.22 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X142.597 Y106.22 E.08228
; Slow Down End
G1 X137.281 Y106.205 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X138.909 Y106.205 E.05401
G1 X139.087 Y106.383 E.00834
G1 X138.888 Y106.582 E.00935
G1 X139.083 Y106.583 E.00648
G1 X131.972 Y106.219 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X134.96 Y106.22 E.08278
; Slow Down End
G1 X129.604 Y106.205 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.233 Y106.205 E.05401
G1 X131.411 Y106.383 E.00836
G1 X131.212 Y106.582 E.00933
G1 X131.406 Y106.582 E.00645
G1 X124.316 Y106.219 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X127.323 Y106.219 E.08331
; Slow Down End
G1 X121.928 Y106.204 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X123.556 Y106.205 E.05401
G1 X123.735 Y106.383 E.00838
G1 X123.536 Y106.582 E.00932
G1 X123.73 Y106.582 E.00642
G1 X116.658 Y106.219 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X119.686 Y106.219 E.08388
; Slow Down End
G1 X114.252 Y106.204 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.88 Y106.204 E.05401
G1 X116.059 Y106.383 E.0084
G1 X115.861 Y106.581 E.0093
G1 X116.054 Y106.581 E.0064
G1 X109.061 Y106.218 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X111.412 Y106.218 E.06514
; Slow Down End
G1 X106.575 Y106.204 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.204 Y106.204 E.05401
G1 X108.383 Y106.383 E.00842
G1 X108.185 Y106.581 E.00928
G1 X108.377 Y106.581 E.00637
G1 X101.385 Y106.218 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X103.775 Y106.218 E.0662
; Slow Down End
G1 X98.899 Y106.203 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X100.527 Y106.203 E.05401
G1 X100.707 Y106.383 E.00843
G1 X100.51 Y106.581 E.00926
G1 X100.701 Y106.581 E.00634
G1 X93.71 Y106.218 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X96.138 Y106.218 E.06727
; Slow Down End
G1 X93.025 Y106.58 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X92.834 Y106.58 E.00632
G1 X93.031 Y106.383 E.00924
G1 X92.851 Y106.203 E.00845
G1 X89.059 Y106.203 E.12579
G1 X89.436 Y106.58 E.01769
G1 X86.013 Y106.58 E.11356
G1 X47.17 Y145.423 E1.82219
G1 X45.542 Y145.423 E.05401
G1 X47.484 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X44.633 Y145.785 E.07897
; Slow Down End
G1 X55.133 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X52.27 Y145.785 E.07931
; Slow Down End
G1 X62.782 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X59.907 Y145.785 E.07966
; Slow Down End
G1 X70.432 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X67.544 Y145.785 E.08003
; Slow Down End
G1 X78.083 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X75.18 Y145.785 E.08042
; Slow Down End
G1 X85.744 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X82.817 Y145.785 E.0811
; Slow Down End
G1 X86.218 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X86.404 Y145.423 E.00614
G1 X86.209 Y145.617 E.00912
G1 X86.392 Y145.8 E.00858
G1 X88.02 Y145.8 E.05401
G1 X93.387 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X90.454 Y145.785 E.08127
; Slow Down End
G1 X93.894 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X94.08 Y145.423 E.00614
G1 X93.885 Y145.617 E.00912
G1 X94.068 Y145.8 E.00858
G1 X95.696 Y145.8 E.05401
G1 X101.04 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X98.091 Y145.785 E.08173
; Slow Down End
G1 X101.57 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X101.755 Y145.423 E.00614
G1 X101.561 Y145.617 E.00912
G1 X101.744 Y145.8 E.00858
G1 X103.372 Y145.8 E.05401
G1 X108.695 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X105.727 Y145.785 E.08221
; Slow Down End
G1 X109.246 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.431 Y145.423 E.00614
G1 X109.237 Y145.617 E.00912
G1 X109.42 Y145.8 E.00858
G1 X111.048 Y145.8 E.05401
G1 X116.35 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X113.364 Y145.785 E.08272
; Slow Down End
G1 X116.922 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.107 Y145.423 E.00614
G1 X116.913 Y145.617 E.00912
G1 X117.096 Y145.8 E.00858
G1 X118.724 Y145.8 E.05401
G1 X120.941 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X123.946 Y145.785 E.08326
; Slow Down End
G1 X124.598 Y145.422 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.783 Y145.423 E.00614
G1 X124.589 Y145.617 E.00912
G1 X124.772 Y145.8 E.00858
G1 X126.4 Y145.8 E.05401
G1 X131.663 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X128.638 Y145.785 E.08383
; Slow Down End
G1 X132.274 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X132.459 Y145.423 E.00614
G1 X132.265 Y145.617 E.00912
G1 X132.448 Y145.8 E.00858
G1 X134.076 Y145.8 E.05401
G1 X139.322 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X136.911 Y145.785 E.06681
; Slow Down End
G1 X139.95 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.135 Y145.423 E.00614
G1 X139.941 Y145.617 E.00912
G1 X140.124 Y145.8 E.00858
G1 X141.752 Y145.8 E.05401
G1 X146.936 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X144.548 Y145.785 E.06616
; Slow Down End
G1 X147.626 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.811 Y145.423 E.00614
G1 X147.617 Y145.617 E.00912
G1 X147.8 Y145.8 E.00858
G1 X149.428 Y145.8 E.05401
G1 X154.612 Y145.785 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X152.184 Y145.785 E.06725
; Slow Down End
G1 X162.657 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X159.821 Y145.785 E.07857
; Slow Down End
G1 X170.305 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X167.458 Y145.785 E.07889
; Slow Down End
G1 X177.954 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X175.095 Y145.785 E.07922
; Slow Down End
G1 X185.604 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X182.731 Y145.785 E.07958
; Slow Down End
G1 X193.254 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X190.368 Y145.785 E.07994
; Slow Down End
G1 X200.904 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X198.005 Y145.785 E.08033
; Slow Down End
G1 X203.16 Y145.8 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X201.531 Y145.8 E.05401
G1 X201.256 Y145.524 E.01292
G1 X201.252 Y145.423 E.00338
G1 X201.154 Y145.423 E.00323
G1 X162.315 Y106.584 E1.82201
G1 X162.768 Y106.584 E.01502
G1 X123.929 Y145.422 E1.82201
G1 X124.395 Y145.422 E.01543
G1 X85.552 Y106.58 E1.82219
G1 X85.357 Y106.58 E.00646
G2 X85.175 Y106.203 I-.355 J-.061 E.01483
G1 X81.422 Y106.202 E.12449
G1 X81.799 Y106.58 E.01769
G1 X78.337 Y106.579 E.11484
G1 X39.483 Y145.434 E1.82274
G2 X40.158 Y145.621 I1.29 J-3.334 E.02328
G1 X34.829 Y140.292 E.25
G2 X35.382 Y141.858 I7.076 J-1.62 E.05522
G1 X70.661 Y106.579 E1.65502
G1 X74.162 Y106.579 E.11611
G1 X73.785 Y106.202 E.0177
G1 X77.498 Y106.202 E.12319
G3 X77.702 Y106.579 I-.15 J.325 E.01525
G1 X77.876 Y106.579 E.00575
G1 X116.719 Y145.423 E1.82221
G1 X116.253 Y145.423 E.01543
G1 X155.093 Y106.583 E1.82203
G1 X154.639 Y106.583 E.01505
G1 X193.478 Y145.423 E1.82203
G1 X193.592 Y145.423 E.00376
G1 X193.6 Y145.544 E.00405
G1 X193.855 Y145.8 E.01198
G1 X197.446 Y145.8 E.11912
G1 X197.069 Y145.423 E.01769
G1 X200.689 Y145.422 E.12007
G1 X220.973 Y125.139 E.95154
G1 X220.973 Y125.763 E.0207
G1 X221.35 Y125.813 E.01262
G1 X221.35 Y127.238 E.04728
G1 X200.697 Y106.586 E.96885
G1 X200.522 Y106.586 E.0058
G2 X200.32 Y106.209 I-.346 J-.057 E.01527
G1 X196.615 Y106.208 E.12289
G1 X196.993 Y106.585 E.01769
G1 X193.47 Y106.585 E.11684
G1 X154.633 Y145.423 E1.82193
G1 X155.098 Y145.423 E.01543
G1 X116.257 Y106.581 E1.82212
G1 X116.715 Y106.581 E.01518
G1 X77.874 Y145.423 E1.82212
G1 X74.245 Y145.423 E.12037
G1 X74.622 Y145.8 E.01769
G1 X71.04 Y145.8 E.11882
G1 X70.78 Y145.539 E.01221
G1 X70.772 Y145.423 E.00389
G1 X70.663 Y145.423 E.00363
G1 X35.382 Y110.142 E1.65509
G3 X36.257 Y108.773 I17.9 J10.467 E.0539
G1 X35.053 Y112.761 F30000
G1 F15476.087
G3 X35.368 Y111.168 I13.951 J1.934 E.05388
G1 X39.618 Y106.918 E.19938
G3 X39.779 Y106.862 I.365 J.79 E.00565
G1 X78.339 Y145.423 E1.80893
G1 X78.433 Y145.423 E.00312
G1 X78.436 Y145.52 E.00324
G1 X78.716 Y145.8 E.01312
G1 X80.344 Y145.8 E.05401
G1 X78.016 Y106.217 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X80.863 Y106.217 E.07888
; Slow Down End
G1 X85.665 Y106.217 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X88.501 Y106.217 E.07857
; Slow Down End
G1 X70.367 Y106.216 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X73.226 Y106.216 E.07921
; Slow Down End
G1 X62.718 Y106.216 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X65.589 Y106.216 E.07955
; Slow Down End
G1 X55.068 Y106.216 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X57.952 Y106.216 E.07991
; Slow Down End
G1 X47.417 Y106.215 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X50.315 Y106.215 E.08029
; Slow Down End
G1 X34.665 Y114.239 F30000
G1 F12000
G3 X34.699 Y112.568 I17.034 J-.482 E.04632
G3 X35.031 Y111.026 I8.218 J.96 E.04378
G1 X34.665 Y121.876 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X34.665 Y118.995 E.07981
; Slow Down End
G1 X34.665 Y129.513 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X34.665 Y126.645 E.07945
; Slow Down End
G1 X34.665 Y137.149 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X34.665 Y134.294 E.0791
; Slow Down End
G1 X208.556 Y145.785 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X205.642 Y145.785 E.08074
; Slow Down End
G1 X209.034 Y145.423 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X209.219 Y145.423 E.00614
G1 X209.025 Y145.617 E.00912
G1 X209.207 Y145.8 E.00858
G1 X210.836 Y145.8 E.05401
G1 X213.218 Y145.785 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G2 X214.982 Y145.751 I.529 J-17.981 E.04888
G2 X216.474 Y145.427 I-.57 J-6.244 E.04242
G1 X219.743 Y143.227 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X220.618 Y141.858 I-17.015 J-11.83 E.0539
G1 X185.344 Y106.585 E1.65474
G1 X185.207 Y106.585 E.00455
G2 X184.967 Y106.208 I-.343 J-.047 E.01613
G1 X181.341 Y106.208 E.12029
M73 P43 R19
G1 X181.718 Y106.585 E.0177
G1 X178.119 Y106.585 E.11938
G1 X139.281 Y145.423 E1.82197
G1 X139.747 Y145.423 E.01543
G1 X100.905 Y106.581 E1.82216
G1 X101.364 Y106.581 E.01523
G1 X62.522 Y145.423 E1.82216
G1 X58.971 Y145.423 E.11777
G1 X59.349 Y145.8 E.01769
G1 X55.688 Y145.8 E.12142
G3 X55.456 Y145.423 I.122 J-.335 E.01586
G1 X55.311 Y145.422 E.0048
G1 X34.65 Y124.762 E.96924
G1 X34.65 Y126.219 E.04833
G1 X35.027 Y126.259 E.01258
G1 X35.027 Y126.861 E.01998
G1 X55.31 Y106.578 E.95151
G1 X58.888 Y106.578 E.11866
G1 X58.51 Y106.201 E.01769
G1 X62.146 Y106.201 E.12059
G3 X62.389 Y106.579 I-.108 J.337 E.01613
G1 X62.523 Y106.579 E.00445
G1 X101.367 Y145.423 E1.82225
G1 X100.902 Y145.423 E.01543
G1 X139.741 Y106.583 E1.82206
G1 X139.286 Y106.583 E.0151
G1 X178.126 Y145.423 E1.82206
G1 X178.276 Y145.423 E.00495
G2 X178.503 Y145.8 I.354 J.043 E.01576
G1 X182.173 Y145.8 E.12172
G1 X181.796 Y145.423 E.01769
G1 X185.337 Y145.423 E.11747
G1 X220.618 Y110.142 E1.65509
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X215.842 Y106.379 E.25
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X177.661 Y145.423 E1.82283
G1 X174.159 Y145.423 E.11617
G1 X174.536 Y145.8 E.01769
G1 X170.828 Y145.8 E.12302
G3 X170.619 Y145.423 I.148 J-.328 E.01532
G1 X170.45 Y145.423 E.00561
G1 X131.61 Y106.582 E1.82208
G1 X132.066 Y106.582 E.01513
G1 X93.226 Y145.423 E1.82208
G1 X93.691 Y145.423 E.01543
G1 X54.846 Y106.578 E1.82227
G1 X54.73 Y106.578 E.00385
G1 X54.721 Y106.453 E.00417
G1 X54.469 Y106.201 E.01182
G1 X50.873 Y106.201 E.11929
G1 X51.25 Y106.578 E.01769
G1 X47.635 Y106.578 E.11994
G1 X35.027 Y119.185 E.59143
G1 X35.027 Y118.6 E.01939
G1 X34.65 Y118.57 E.01255
G1 X34.65 Y117.086 E.04924
G1 X62.987 Y145.423 E1.32933
G1 X63.113 Y145.423 E.00419
G1 X63.126 Y145.562 E.00463
G1 X63.364 Y145.8 E.01117
G1 X66.985 Y145.8 E.12012
G1 X66.608 Y145.423 E.01769
G1 X70.198 Y145.423 E.11907
G1 X109.039 Y106.581 E1.82214
G1 X108.581 Y106.581 E.0152
G1 X147.423 Y145.423 E1.82214
G1 X146.957 Y145.423 E.01543
G1 X185.795 Y106.585 E1.82195
G1 X189.355 Y106.585 E.11811
G1 X188.978 Y106.208 E.01769
G1 X192.644 Y106.208 E.12159
G3 X192.865 Y106.585 I-.123 J.326 E.01569
G1 X193.021 Y106.585 E.00516
G1 X221.35 Y134.914 E1.32897
G1 X221.35 Y133.461 E.04822
G1 X220.973 Y133.42 E.01258
G1 X220.973 Y132.815 E.02006
G1 X208.365 Y145.422 E.59145
G1 X208.83 Y145.423 E.01543
G1 X169.992 Y106.584 E1.82199
G1 X170.444 Y106.584 E.01499
G1 X131.605 Y145.423 E1.82199
G1 X132.071 Y145.423 E.01543
G1 X93.228 Y106.58 E1.82218
G1 X93.688 Y106.58 E.01526
G1 X54.846 Y145.423 E1.82217
G1 X51.335 Y145.423 E.11647
G1 X51.712 Y145.8 E.01769
G1 X48.012 Y145.8 E.12272
G3 X47.799 Y145.423 I.143 J-.329 E.01542
G1 X47.635 Y145.423 E.00545
G1 X34.65 Y132.438 E.60914
G1 X34.65 Y133.867 E.0474
G1 X35.027 Y133.915 E.01262
G1 X35.027 Y134.537 E.02062
G1 X62.986 Y106.579 E1.31159
G1 X66.525 Y106.579 E.11739
G1 X66.147 Y106.202 E.01769
G1 X69.822 Y106.202 E.12189
G3 X70.046 Y106.579 I-.129 J.332 E.01568
G1 X70.199 Y106.579 E.00508
G1 X109.043 Y145.423 E1.82223
G1 X108.577 Y145.423 E.01543
G1 X147.417 Y106.583 E1.82204
G1 X146.963 Y106.583 E.01507
G1 X185.802 Y145.423 E1.82205
G1 X185.933 Y145.423 E.00433
G1 X185.947 Y145.567 E.00482
G1 X186.179 Y145.8 E.01091
G1 X189.81 Y145.8 E.12042
G1 X189.433 Y145.423 E.01769
G1 X193.013 Y145.423 E.11877
G1 X220.973 Y117.463 E1.31164
G1 X220.973 Y118.107 E.02137
G1 X221.35 Y118.166 E.01266
G1 X221.35 Y119.562 E.04633
G1 X208.373 Y106.586 E.60874
G1 X208.178 Y106.586 E.00649
G2 X207.996 Y106.209 I-.347 J-.065 E.01486
G1 X204.253 Y106.209 E.12419
G1 X204.63 Y106.586 E.0177
G1 X201.146 Y106.586 E.11556
G1 X162.309 Y145.423 E1.82191
G1 X158.886 Y145.423 E.11357
G1 X159.263 Y145.8 E.01769
G1 X155.476 Y145.8 E.12562
G1 X155.293 Y145.617 E.00858
G1 X155.487 Y145.423 E.00912
G1 X155.302 Y145.423 E.00614
G1 X220.938 Y141.051 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X221.197 Y140.13 E.02652
G2 X221.335 Y138.73 I-7.037 J-1.401 E.03903
G1 X221.335 Y137.865 E.02397
G1 X220.947 Y139.239 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X220.632 Y140.832 I-13.953 J-1.934 E.05388
G1 X216.382 Y145.082 E.19938
G1 X216.221 Y145.137 E.00564
G1 X177.668 Y106.585 E1.8086
G1 X177.548 Y106.584 E.00398
G1 X177.541 Y106.457 E.00422
G1 X177.291 Y106.207 E.01173
G1 X175.663 Y106.207 E.05401
G1 X221.335 Y117.796 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X221.335 Y114.955 E.07873
; Slow Down End
G1 X221.335 Y125.445 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X221.335 Y122.591 E.07906
; Slow Down End
G1 X221.335 Y133.094 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X221.335 Y130.228 E.0794
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X221.335 Y132.228 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/35
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2 I.158 J-1.207 P1  F30000
G1 X36.476 Y108.026 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.493 Y105.862 E5.73136
G3 X221.698 Y113.265 I-.192 J7.395 E.37933
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.199 Y107.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.527 J5.527 E.18798
G1 X214.512 Y105.471 E5.30987
G3 X222.09 Y113.255 I-.206 J7.782 E.36947
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X36.157 Y107.792 I7.817 J.021 E.18614
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.31309
G1 X37.372 Y106.773 E-.29051
G1 X37.725 Y106.561 E-.15639
; WIPE_END
G1 E-.04 F1800
G1 X35.462 Y110.221 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X35.382 Y110.142 E.00372
G1 X35.462 Y117.897 F30000
G1 F15476.087
G1 X34.65 Y117.086 E.03806
G1 X35.462 Y125.573 F30000
G1 F15476.087
G1 X34.65 Y124.762 E.03806
G1 X35.462 Y133.249 F30000
G1 F15476.087
G1 X34.65 Y132.438 E.03806
G1 X36.447 Y139.445 F30000
G1 F15476.087
G1 X36.695 Y139.692 E.0116
G1 X36.217 Y140.169 E.02239
G1 X36.644 Y140.596 E.02003
G1 X35.382 Y141.858 E.0592
G3 X34.829 Y140.292 I6.521 J-3.186 E.05522
G1 X40.158 Y145.621 E.25
G3 X39.483 Y145.434 I.614 J-3.522 E.02328
G1 X40.482 Y144.434 E.04689
G1 X40.909 Y144.861 E.02003
G1 X41.634 Y144.137 E.03399
G1 X36.68 Y140.026 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40067
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X40.909 Y144.255 E.30723
G1 X41.228 Y143.936 E.02315
G1 X37.142 Y139.85 E.29683
G1 X37.301 Y139.692 E.0115
G1 X34.672 Y137.063 E.191
G1 X34.672 Y136.742 E.01647
G1 X41.547 Y143.617 E.49948
G1 X41.865 Y143.299 E.02315
G1 X34.672 Y136.105 E.52263
G1 X34.672 Y135.468 E.03274
G1 X44.982 Y145.778 E.74907
G1 X45.62 Y145.778 E.03274
G1 X34.672 Y134.83 E.79538
G1 X34.672 Y134.302 E.02716
G1 X34.797 Y134.318 E.00647
G1 X46.257 Y145.778 E.83261
G1 X46.894 Y145.778 E.03274
G1 X35.216 Y134.1 E.84841
G1 X35.535 Y133.782 E.02315
G1 X47.397 Y145.644 E.86181
G1 X47.373 Y145.467 E.00917
G1 X47.615 Y145.225 E.01762
G1 X35.854 Y133.463 E.85449
G1 X36.172 Y133.144 E.02315
G1 X47.934 Y144.906 E.85449
G1 X48.253 Y144.587 E.02315
G1 X36.491 Y132.826 E.85449
G1 X36.81 Y132.507 E.02315
G1 X48.571 Y144.269 E.85449
G1 X48.89 Y143.95 E.02315
G1 X37.128 Y132.188 E.85449
G1 X37.281 Y132.036 E.01109
G1 X34.672 Y129.426 E.18957
G1 X34.672 Y129.094 E.01706
G1 X49.209 Y143.631 E1.05613
G1 X49.527 Y143.313 E.02315
G1 X34.672 Y128.457 E1.07928
G1 X34.672 Y127.82 E.03274
G1 X52.63 Y145.778 E1.30472
G1 X53.268 Y145.778 E.03274
G1 X34.672 Y127.182 E1.35102
G1 X34.672 Y126.652 E.02723
G1 X34.792 Y126.665 E.0062
G1 X53.905 Y145.778 E1.38861
G1 X54.543 Y145.778 E.03274
G1 X35.202 Y126.438 E1.40506
G1 X35.521 Y126.12 E.02315
G1 X55.05 Y145.649 E1.41882
G1 X55.032 Y145.485 E.0085
G1 X55.277 Y145.239 E.01787
G1 X35.84 Y125.801 E1.41216
G1 X36.158 Y125.482 E.02315
G1 X55.596 Y144.92 E1.41216
G1 X55.915 Y144.601 E.02315
G1 X36.477 Y125.164 E1.41216
G1 X36.796 Y124.845 E.02315
G1 X56.233 Y144.283 E1.41216
G1 X56.552 Y143.964 E.02315
G1 X37.115 Y124.526 E1.41216
G1 X37.261 Y124.379 E.01068
G1 X34.672 Y121.789 E.18815
G1 X34.672 Y121.446 E.01764
G1 X56.871 Y143.645 E1.61278
G1 X57.19 Y143.327 E.02315
G1 X34.672 Y120.809 E1.63593
G1 X34.672 Y120.171 E.03274
G1 X60.279 Y145.778 E1.86036
G1 X60.916 Y145.778 E.03274
G1 X34.672 Y119.534 E1.90666
G1 X34.672 Y119.002 E.02733
G1 X34.786 Y119.011 E.0059
G1 X61.553 Y145.778 E1.94465
G1 X62.191 Y145.778 E.03274
G1 X35.189 Y118.776 E1.96171
G1 X35.507 Y118.458 E.02315
G1 X62.704 Y145.654 E1.97586
G1 X62.69 Y145.502 E.00787
G1 X62.94 Y145.253 E.01811
G1 X35.826 Y118.139 E1.96982
G1 X36.145 Y117.82 E.02315
G1 X63.258 Y144.934 E1.96982
M73 P44 R19
G1 X63.577 Y144.615 E.02315
G1 X36.463 Y117.502 E1.96982
G1 X36.782 Y117.183 E.02315
G1 X63.896 Y144.296 E1.96982
G1 X64.214 Y143.978 E.02315
G1 X37.101 Y116.864 E1.96982
G1 X37.242 Y116.723 E.01027
G1 X34.672 Y114.153 E.18673
G1 X34.672 Y113.798 E.01822
G1 X64.533 Y143.659 E2.16943
G1 X64.852 Y143.34 E.02315
G1 X34.677 Y113.166 E2.1922
G1 X34.707 Y112.559 E.03123
G1 X67.927 Y145.778 E2.41342
G1 X68.564 Y145.778 E.03274
G1 X34.789 Y112.004 E2.45375
G3 X34.907 Y111.484 I2.697 J.336 E.02742
G1 X69.201 Y145.778 E2.49151
G1 X69.839 Y145.778 E.03274
G1 X35.101 Y111.04 E2.52375
G1 X35.245 Y111.044 E.00741
G1 X35.493 Y110.796 E.01806
G1 X70.358 Y145.66 E2.53295
G1 X70.349 Y145.519 E.00729
G1 X70.602 Y145.266 E.01834
G1 X35.812 Y110.477 E2.52748
G1 X36.131 Y110.158 E.02315
G1 X70.92 Y144.948 E2.52748
G1 X71.239 Y144.629 E.02315
G1 X36.449 Y109.839 E2.52748
G1 X36.768 Y109.521 E.02315
G1 X71.558 Y144.31 E2.52748
G1 X71.876 Y143.992 E.02315
G1 X37.087 Y109.202 E2.52748
G1 X37.405 Y108.883 E.02315
G1 X72.195 Y143.673 E2.52748
G1 X72.514 Y143.354 E.02315
G1 X37.724 Y108.565 E2.52748
G1 X38.043 Y108.246 E.02315
G1 X75.575 Y145.778 E2.72673
G1 X76.212 Y145.778 E.03274
G1 X38.361 Y107.927 E2.74988
G1 X38.68 Y107.609 E.02315
G1 X76.85 Y145.778 E2.77303
G1 X77.487 Y145.778 E.03274
G1 X38.999 Y107.29 E2.79619
G1 X39.317 Y106.971 E.02315
G1 X78.013 Y145.667 E2.81125
G1 X78.008 Y145.536 E.00674
G1 X78.264 Y145.28 E.01856
G1 X39.549 Y106.565 E2.81266
G3 X40.049 Y106.428 I.946 J2.468 E.02668
G1 X78.582 Y144.962 E2.79948
G1 X78.901 Y144.643 E.02315
G1 X40.579 Y106.321 E2.78412
G3 X41.145 Y106.25 I.642 J2.84 E.02938
G1 X79.22 Y144.324 E2.76611
G1 X79.538 Y144.006 E.02315
G1 X41.754 Y106.222 E2.74502
G1 X42.392 Y106.222 E.03274
G1 X79.857 Y143.687 E2.72187
G1 X80.176 Y143.368 E.02315
G1 X45.386 Y108.579 E2.52748
G1 X45.705 Y108.26 E.02315
G1 X83.223 Y145.778 E2.72572
G1 X83.86 Y145.778 E.03274
G1 X46.023 Y107.941 E2.74887
G1 X46.342 Y107.623 E.02315
G1 X84.498 Y145.778 E2.77202
G1 X85.135 Y145.778 E.03274
M73 P45 R19
G1 X46.661 Y107.304 E2.79517
G1 X46.979 Y106.985 E.02315
G1 X85.668 Y145.674 E2.81075
G1 X85.667 Y145.553 E.00623
G1 X85.926 Y145.294 E.01877
G1 X47.298 Y106.667 E2.80631
G1 X47.495 Y106.47 E.01427
G1 X47.483 Y106.222 E.01276
G1 X86.244 Y144.976 E2.81574
G1 X86.563 Y144.657 E.02315
G1 X48.128 Y106.222 E2.79231
G1 X48.766 Y106.222 E.03274
M73 P45 R18
G1 X86.882 Y144.338 E2.76916
G1 X87.2 Y144.02 E.02315
G1 X49.403 Y106.222 E2.746
G1 X50.04 Y106.222 E.03274
G1 X87.519 Y143.701 E2.72285
G1 X87.838 Y143.382 E.02315
G1 X53.048 Y108.593 E2.52748
G1 X53.367 Y108.274 E.02315
G1 X90.871 Y145.778 E2.72471
G1 X91.508 Y145.778 E.03274
G1 X53.685 Y107.955 E2.74786
G1 X54.004 Y107.637 E.02315
G1 X92.146 Y145.778 E2.77101
G1 X92.783 Y145.778 E.03274
G1 X54.323 Y107.318 E2.79416
G1 X54.641 Y106.999 E.02315
G1 X93.324 Y145.682 E2.81029
G1 X93.326 Y145.569 E.00577
G1 X93.588 Y145.308 E.01898
G1 X54.96 Y106.681 E2.80631
G1 X55.153 Y106.487 E.01404
G1 X55.134 Y106.222 E.01364
G1 X93.906 Y144.99 E2.81663
G1 X94.225 Y144.671 E.02315
G1 X55.777 Y106.223 E2.79329
G1 X56.414 Y106.223 E.03274
G1 X94.544 Y144.352 E2.77014
G1 X94.862 Y144.033 E.02315
G1 X57.051 Y106.223 E2.74698
G1 X57.689 Y106.223 E.03274
G1 X95.181 Y143.715 E2.72383
M73 P46 R18
G1 X95.5 Y143.396 E.02315
G1 X60.71 Y108.607 E2.52748
G1 X61.029 Y108.288 E.02315
G1 X98.519 Y145.778 E2.7237
G1 X99.157 Y145.778 E.03274
G1 X61.347 Y107.969 E2.74685
G1 X61.666 Y107.651 E.02315
G1 X99.794 Y145.778 E2.77
G1 X100.431 Y145.778 E.03274
G1 X61.985 Y107.332 E2.79315
G1 X62.303 Y107.013 E.02315
G1 X100.98 Y145.69 E2.80986
G1 X100.986 Y145.586 E.00534
G1 X101.25 Y145.322 E.01917
G1 X62.622 Y106.695 E2.80631
G1 X62.812 Y106.504 E.01381
G1 X62.785 Y106.223 E.01453
G1 X101.568 Y145.003 E2.81754
G1 X101.887 Y144.685 E.02315
G1 X63.425 Y106.223 E2.79427
G1 X64.063 Y106.223 E.03274
G1 X102.206 Y144.366 E2.77111
G1 X102.524 Y144.047 E.02315
G1 X64.7 Y106.223 E2.74796
G1 X65.337 Y106.223 E.03274
G1 X102.843 Y143.729 E2.7248
G1 X103.162 Y143.41 E.02315
G1 X68.372 Y108.62 E2.52748
G1 X68.691 Y108.302 E.02315
G1 X106.167 Y145.778 E2.72268
G1 X106.805 Y145.778 E.03274
G1 X69.01 Y107.983 E2.74584
G1 X69.328 Y107.664 E.02315
G1 X107.442 Y145.778 E2.76899
G1 X108.079 Y145.778 E.03274
G1 X69.647 Y107.346 E2.79214
G1 X69.966 Y107.027 E.02315
G1 X108.637 Y145.698 E2.80947
G1 X108.645 Y145.602 E.00494
G1 X108.912 Y145.336 E.01935
G1 X70.284 Y106.708 E2.80631
G1 X70.471 Y106.522 E.01356
M73 P47 R18
G1 X70.435 Y106.223 E.01544
G1 X109.23 Y145.017 E2.81847
G1 X109.549 Y144.699 E.02315
G1 X71.074 Y106.223 E2.79525
G1 X71.711 Y106.223 E.03274
G1 X109.868 Y144.38 E2.77209
G1 X110.186 Y144.061 E.02315
G1 X72.349 Y106.223 E2.74894
G1 X72.986 Y106.224 E.03274
G1 X110.505 Y143.743 E2.72578
G1 X110.824 Y143.424 E.02315
G1 X76.034 Y108.634 E2.52748
G1 X76.353 Y108.316 E.02315
G1 X113.815 Y145.778 E2.72167
G1 X114.453 Y145.778 E.03274
G1 X76.672 Y107.997 E2.74483
G1 X76.99 Y107.678 E.02315
G1 X115.09 Y145.778 E2.76798
G1 X115.727 Y145.778 E.03274
G1 X77.309 Y107.36 E2.79113
G1 X77.628 Y107.041 E.02315
G1 X116.294 Y145.707 E2.8091
G1 X116.305 Y145.619 E.00458
G1 X116.574 Y145.35 E.01952
G1 X77.946 Y106.722 E2.80631
G1 X78.129 Y106.539 E.01331
G1 X78.084 Y106.224 E.01637
G1 X116.892 Y145.031 E2.81942
G1 X117.211 Y144.713 E.02315
G1 X78.722 Y106.224 E2.79622
G1 X79.36 Y106.224 E.03274
G1 X117.53 Y144.394 E2.77307
G1 X117.848 Y144.075 E.02315
G1 X79.997 Y106.224 E2.74992
G1 X80.635 Y106.224 E.03274
G1 X118.167 Y143.757 E2.72676
G1 X118.486 Y143.438 E.02315
G1 X83.696 Y108.648 E2.52748
G1 X84.015 Y108.33 E.02315
G1 X121.464 Y145.778 E2.72066
M73 P48 R18
G1 X122.101 Y145.778 E.03274
G1 X84.334 Y108.011 E2.74381
G1 X84.652 Y107.692 E.02315
G1 X122.738 Y145.778 E2.76697
M73 P48 R17
G1 X123.376 Y145.778 E.03274
G1 X84.971 Y107.374 E2.79012
G1 X85.29 Y107.055 E.02315
G1 X123.951 Y145.716 E2.80877
G1 X123.965 Y145.635 E.00426
G1 X124.236 Y145.364 E.01967
G1 X85.608 Y106.736 E2.80631
G1 X85.788 Y106.557 E.01305
G1 X85.733 Y106.224 E.01731
G1 X124.554 Y145.045 E2.82039
G1 X124.873 Y144.726 E.02315
G1 X86.371 Y106.224 E2.7972
G1 X87.008 Y106.224 E.03274
G1 X125.192 Y144.408 E2.77405
G1 X125.51 Y144.089 E.02315
G1 X87.646 Y106.224 E2.75089
G1 X88.283 Y106.224 E.03274
G1 X125.829 Y143.77 E2.72774
G1 X126.148 Y143.452 E.02315
G1 X91.358 Y108.662 E2.52748
G1 X91.677 Y108.344 E.02315
G1 X129.112 Y145.778 E2.71965
G1 X129.749 Y145.778 E.03274
G1 X91.996 Y108.025 E2.7428
G1 X92.314 Y107.706 E.02315
G1 X130.386 Y145.778 E2.76596
G1 X131.024 Y145.778 E.03274
G1 X92.633 Y107.388 E2.78911
G1 X92.952 Y107.069 E.02315
G1 X131.609 Y145.726 E2.80846
G1 X131.625 Y145.651 E.00396
G1 X131.898 Y145.378 E.01982
G1 X93.27 Y106.75 E2.80631
G1 X93.589 Y106.432 E.02315
G1 X132.217 Y145.059 E2.80631
G1 X132.535 Y144.74 E.02315
G1 X94.02 Y106.225 E2.79818
G1 X94.657 Y106.225 E.03274
M73 P49 R17
G1 X132.854 Y144.422 E2.77503
G1 X133.173 Y144.103 E.02315
G1 X95.294 Y106.225 E2.75187
G1 X95.932 Y106.225 E.03274
G1 X133.491 Y143.784 E2.72872
G1 X133.81 Y143.466 E.02315
G1 X99.02 Y108.676 E2.52748
G1 X99.339 Y108.357 E.02315
G1 X134.129 Y143.147 E2.52748
G1 X134.217 Y143.058 E.00645
G1 X136.937 Y145.778 E.19761
G1 X137.397 Y145.778 E.02363
G1 X99.658 Y108.039 E2.74179
G1 X99.976 Y107.72 E.02315
G1 X138.034 Y145.778 E2.76494
G1 X138.672 Y145.778 E.03274
G1 X100.295 Y107.401 E2.78809
G1 X100.614 Y107.083 E.02315
G1 X139.267 Y145.736 E2.80818
G1 X139.285 Y145.666 E.0037
G1 X139.56 Y145.392 E.01995
G1 X100.932 Y106.764 E2.80631
G1 X101.251 Y106.445 E.02315
G1 X139.879 Y145.073 E2.80631
G1 X140.197 Y144.754 E.02315
G1 X101.668 Y106.225 E2.79916
G1 X102.306 Y106.225 E.03274
G1 X140.516 Y144.436 E2.77601
G1 X140.835 Y144.117 E.02315
G1 X102.943 Y106.225 E2.75285
G1 X103.58 Y106.225 E.03274
G1 X141.153 Y143.798 E2.7297
G1 X141.472 Y143.48 E.02315
G1 X106.682 Y108.69 E2.52748
G1 X107.001 Y108.371 E.02315
G1 X141.791 Y143.161 E2.52748
G1 X141.874 Y143.078 E.00603
G1 X144.574 Y145.778 E.19618
G1 X145.045 Y145.778 E.02421
G1 X107.32 Y108.053 E2.74078
M73 P50 R17
G1 X107.638 Y107.734 E.02315
G1 X145.683 Y145.778 E2.76393
G1 X146.32 Y145.778 E.03274
G1 X107.957 Y107.415 E2.78708
G1 X108.276 Y107.097 E.02315
G1 X146.903 Y145.724 E2.80631
G1 X147.222 Y145.406 E.02315
G1 X108.594 Y106.778 E2.80631
G1 X108.913 Y106.459 E.02315
G1 X147.541 Y145.087 E2.80631
G1 X147.859 Y144.768 E.02315
G1 X109.319 Y106.228 E2.79999
G1 X109.955 Y106.227 E.03271
G1 X148.178 Y144.45 E2.77688
G1 X148.497 Y144.131 E.02315
G1 X110.592 Y106.226 E2.75378
G1 X111.229 Y106.226 E.03271
G1 X148.815 Y143.812 E2.73067
G1 X149.134 Y143.494 E.02315
G1 X114.344 Y108.704 E2.52748
G1 X114.663 Y108.385 E.02315
G1 X149.453 Y143.175 E2.52748
G1 X149.53 Y143.098 E.00562
G1 X152.211 Y145.778 E.19476
G1 X152.693 Y145.778 E.02479
G1 X114.982 Y108.067 E2.73977
G1 X115.3 Y107.748 E.02315
G1 X153.331 Y145.778 E2.76292
G1 X153.968 Y145.778 E.03274
G1 X115.619 Y107.429 E2.78607
G1 X115.938 Y107.111 E.02315
G1 X154.565 Y145.738 E2.80631
G1 X154.884 Y145.42 E.02315
G1 X116.256 Y106.792 E2.80631
G1 X116.575 Y106.473 E.02315
G1 X155.203 Y145.101 E2.80631
G1 X155.521 Y144.782 E.02315
G1 X116.965 Y106.226 E2.80112
G1 X117.603 Y106.226 E.03274
G1 X155.84 Y144.464 E2.77796
G1 X156.159 Y144.145 E.02315
G1 X118.24 Y106.226 E2.75481
M73 P51 R16
G1 X118.877 Y106.226 E.03274
G1 X156.477 Y143.826 E2.73165
G1 X156.796 Y143.507 E.02315
G1 X119.515 Y106.226 E2.7085
G1 X119.66 Y106.226 E.00744
G1 X122.079 Y108.645 E.17576
G1 X122.325 Y108.399 E.01789
G1 X157.115 Y143.189 E2.52748
G1 X157.186 Y143.117 E.00521
G1 X159.848 Y145.778 E.19333
G1 X160.342 Y145.778 E.02538
G1 X122.644 Y108.081 E2.73876
G1 X122.962 Y107.762 E.02315
G1 X160.979 Y145.778 E2.76191
G1 X161.616 Y145.778 E.03274
G1 X123.281 Y107.443 E2.78506
G1 X123.6 Y107.125 E.02315
G1 X162.254 Y145.778 E2.80822
G1 X162.589 Y145.778 E.01723
G1 X162.534 Y145.446 E.01732
G1 X162.546 Y145.433 E.00089
G1 X123.918 Y106.806 E2.80631
G1 X124.237 Y106.487 E.02315
G1 X162.865 Y145.115 E2.80631
G1 X163.183 Y144.796 E.02315
G1 X124.614 Y106.227 E2.80209
G1 X125.251 Y106.227 E.03274
G1 X163.502 Y144.477 E2.77894
G1 X163.821 Y144.159 E.02315
G1 X125.889 Y106.227 E2.75578
G1 X126.526 Y106.227 E.03274
G1 X164.139 Y143.84 E2.73263
G1 X164.458 Y143.521 E.02315
G1 X127.163 Y106.227 E2.70948
G1 X127.297 Y106.227 E.00686
G1 X129.735 Y108.665 E.17715
G1 X129.987 Y108.413 E.0183
G1 X164.777 Y143.203 E2.52748
G1 X164.843 Y143.137 E.00479
G1 X167.484 Y145.778 E.19191
G1 X167.99 Y145.778 E.02596
G1 X130.306 Y108.094 E2.73775
M73 P52 R16
G1 X130.624 Y107.776 E.02315
G1 X168.627 Y145.778 E2.7609
G1 X169.264 Y145.778 E.03274
G1 X130.943 Y107.457 E2.78405
G1 X131.262 Y107.138 E.02315
G1 X169.902 Y145.778 E2.8072
G1 X170.238 Y145.778 E.01726
G1 X170.192 Y145.463 E.01636
G1 X170.208 Y145.447 E.00115
G1 X131.581 Y106.82 E2.80631
G1 X131.899 Y106.501 E.02315
G1 X170.527 Y145.129 E2.80631
G1 X170.845 Y144.81 E.02315
G1 X132.262 Y106.227 E2.80307
G1 X132.9 Y106.227 E.03274
G1 X171.164 Y144.491 E2.77992
G1 X171.483 Y144.173 E.02315
G1 X133.537 Y106.227 E2.75676
G1 X134.175 Y106.227 E.03274
G1 X171.801 Y143.854 E2.73361
G1 X172.12 Y143.535 E.02315
G1 X134.812 Y106.227 E2.71045
G1 X134.934 Y106.227 E.00627
G1 X137.392 Y108.685 E.17854
G1 X137.649 Y108.427 E.01872
G1 X172.439 Y143.217 E2.52748
G1 X172.499 Y143.156 E.00438
G1 X175.121 Y145.778 E.19049
G1 X175.638 Y145.778 E.02655
G1 X137.968 Y108.108 E2.73674
G1 X138.287 Y107.79 E.02315
G1 X176.275 Y145.778 E2.75989
G1 X176.912 Y145.778 E.03274
G1 X138.605 Y107.471 E2.78304
G1 X138.924 Y107.152 E.02315
G1 X177.55 Y145.778 E2.80619
G1 X177.887 Y145.778 E.01731
G1 X177.851 Y145.481 E.01541
G1 X177.87 Y145.461 E.0014
G1 X139.243 Y106.834 E2.80631
G1 X139.561 Y106.515 E.02315
G1 X178.189 Y145.143 E2.80631
G1 X178.507 Y144.824 E.02315
G1 X139.911 Y106.227 E2.80405
G1 X140.548 Y106.228 E.03274
G1 X178.826 Y144.505 E2.7809
M73 P53 R16
G1 X179.145 Y144.187 E.02315
G1 X141.186 Y106.228 E2.75774
G1 X141.823 Y106.228 E.03274
G1 X179.463 Y143.868 E2.73459
G1 X179.782 Y143.549 E.02315
G1 X142.461 Y106.228 E2.71143
G1 X142.571 Y106.228 E.00569
G1 X145.048 Y108.704 E.17993
G1 X145.311 Y108.441 E.01913
G1 X180.101 Y143.231 E2.52748
G1 X180.155 Y143.176 E.00397
G1 X182.758 Y145.778 E.18906
G1 X183.286 Y145.778 E.02713
G1 X145.63 Y108.122 E2.73573
G1 X145.949 Y107.804 E.02315
G1 X183.923 Y145.778 E2.75888
G1 X184.561 Y145.778 E.03274
G1 X146.267 Y107.485 E2.78203
G1 X146.586 Y107.166 E.02315
G1 X185.198 Y145.778 E2.80518
G1 X185.537 Y145.778 E.0174
G1 X185.51 Y145.498 E.01448
G1 X185.532 Y145.475 E.00164
G1 X146.905 Y106.848 E2.80631
G1 X147.223 Y106.529 E.02315
G1 X185.851 Y145.157 E2.80631
G1 X186.169 Y144.838 E.02315
G1 X147.56 Y106.228 E2.80503
G1 X148.197 Y106.228 E.03274
G1 X186.488 Y144.519 E2.78187
G1 X186.807 Y144.2 E.02315
G1 X148.834 Y106.228 E2.75872
G1 X149.472 Y106.228 E.03274
G1 X187.125 Y143.882 E2.73557
G1 X187.444 Y143.563 E.02315
G1 X150.109 Y106.228 E2.71241
G1 X150.208 Y106.228 E.0051
G1 X152.704 Y108.724 E.18132
G1 X152.973 Y108.455 E.01954
G1 X187.763 Y143.244 E2.52748
G1 X187.812 Y143.196 E.00355
G1 X190.395 Y145.778 E.18764
G1 X190.934 Y145.778 E.02771
G1 X153.292 Y108.136 E2.73472
M73 P53 R15
G1 X153.611 Y107.818 E.02315
G1 X191.571 Y145.778 E2.75787
G1 X192.209 Y145.778 E.03274
G1 X153.929 Y107.499 E2.78102
M73 P54 R15
G1 X154.248 Y107.18 E.02315
G1 X192.846 Y145.778 E2.80417
G1 X193.187 Y145.778 E.01751
G1 X193.168 Y145.515 E.01356
G1 X193.194 Y145.489 E.00187
G1 X154.567 Y106.862 E2.80631
G1 X154.885 Y106.543 E.02315
G1 X193.513 Y145.17 E2.80631
G1 X193.832 Y144.852 E.02315
G1 X155.208 Y106.228 E2.80601
G1 X155.846 Y106.228 E.03274
G1 X194.15 Y144.533 E2.78285
G1 X194.469 Y144.214 E.02315
G1 X156.483 Y106.228 E2.7597
G1 X157.12 Y106.228 E.03274
G1 X194.788 Y143.896 E2.73654
G1 X195.106 Y143.577 E.02315
G1 X157.758 Y106.229 E2.71339
G1 X157.846 Y106.229 E.00452
G1 X160.361 Y108.743 E.18271
G1 X160.635 Y108.469 E.01996
G1 X195.425 Y143.258 E2.52748
G1 X195.468 Y143.215 E.00314
G1 X198.031 Y145.778 E.18621
G1 X198.582 Y145.778 E.0283
G1 X160.954 Y108.15 E2.7337
G1 X161.273 Y107.831 E.02315
G1 X199.219 Y145.778 E2.75686
G1 X199.857 Y145.778 E.03274
G1 X161.591 Y107.513 E2.78001
G1 X161.91 Y107.194 E.02315
G1 X200.494 Y145.778 E2.80316
G1 X200.838 Y145.778 E.01766
G1 X200.827 Y145.532 E.01267
G1 X200.856 Y145.503 E.0021
G1 X162.229 Y106.875 E2.80631
G1 X162.547 Y106.557 E.02315
G1 X201.175 Y145.184 E2.80631
G1 X201.494 Y144.866 E.02315
G1 X162.857 Y106.229 E2.80698
G1 X163.494 Y106.229 E.03274
G1 X201.812 Y144.547 E2.78383
G1 X202.131 Y144.228 E.02315
G1 X164.131 Y106.229 E2.76068
G1 X164.769 Y106.229 E.03274
G1 X202.45 Y143.91 E2.73752
G1 X202.768 Y143.591 E.02315
G1 X165.406 Y106.229 E2.71437
M73 P55 R15
G1 X165.483 Y106.229 E.00394
G1 X168.017 Y108.763 E.1841
G1 X168.297 Y108.483 E.02037
G1 X203.087 Y143.272 E2.52748
G1 X203.124 Y143.235 E.00273
G1 X205.668 Y145.778 E.18479
G1 X206.23 Y145.778 E.02888
G1 X168.616 Y108.164 E2.73269
G1 X168.935 Y107.845 E.02315
G1 X206.868 Y145.778 E2.75584
G1 X207.505 Y145.778 E.03274
G1 X169.253 Y107.527 E2.779
G1 X169.572 Y107.208 E.02315
G1 X208.142 Y145.778 E2.80215
G1 X208.49 Y145.778 E.01785
G1 X208.486 Y145.549 E.01179
G1 X208.518 Y145.517 E.00231
G1 X169.891 Y106.889 E2.80631
G1 X170.209 Y106.571 E.02315
G1 X208.837 Y145.198 E2.80631
G1 X209.156 Y144.88 E.02315
G1 X170.505 Y106.229 E2.80796
G1 X171.143 Y106.229 E.03274
G1 X209.474 Y144.561 E2.78481
G1 X209.793 Y144.242 E.02315
G1 X171.78 Y106.229 E2.76165
G1 X172.417 Y106.229 E.03274
G1 X210.112 Y143.924 E2.7385
G1 X210.43 Y143.605 E.02315
G1 X173.055 Y106.229 E2.71535
G1 X173.12 Y106.229 E.00335
G1 X175.673 Y108.783 E.1855
G1 X175.959 Y108.497 E.02078
G1 X210.749 Y143.286 E2.52748
G1 X210.781 Y143.254 E.00232
G1 X213.305 Y145.778 E.18337
G1 X213.878 Y145.778 E.02947
G1 X176.278 Y108.178 E2.73168
G1 X176.597 Y107.859 E.02315
G1 X214.504 Y145.767 E2.75402
G2 X215.101 Y145.727 I.093 J-3.051 E.03078
G1 X176.915 Y107.541 E2.77423
G1 X177.234 Y107.222 E.02315
G1 X215.656 Y145.644 E2.7914
G2 X216.167 Y145.518 I-10.926 J-45.226 E.02704
G1 X177.553 Y106.903 E2.80536
M73 P56 R15
G1 X177.871 Y106.585 E.02315
G1 X216.499 Y145.212 E2.80631
G1 X216.818 Y144.894 E.02315
G1 X178.154 Y106.23 E2.80894
G1 X178.791 Y106.23 E.03274
G1 X217.136 Y144.575 E2.78579
G1 X217.455 Y144.256 E.02315
G1 X179.429 Y106.23 E2.76263
G1 X180.066 Y106.23 E.03274
G1 X217.774 Y143.938 E2.73948
G1 X218.092 Y143.619 E.02315
G1 X180.703 Y106.23 E2.71633
G1 X180.757 Y106.23 E.00277
G1 X183.33 Y108.802 E.18689
G1 X183.621 Y108.511 E.02119
G1 X218.411 Y143.3 E2.52748
G1 X218.73 Y142.981 E.02315
G1 X183.94 Y108.192 E2.52748
G1 X184.259 Y107.873 E.02315
G1 X219.048 Y142.663 E2.52748
G1 X219.367 Y142.344 E.02315
G1 X184.577 Y107.555 E2.52748
G1 X184.896 Y107.236 E.02315
G1 X219.686 Y142.025 E2.52748
G1 X220.004 Y141.707 E.02315
G1 X185.215 Y106.917 E2.52748
G1 X185.533 Y106.599 E.02315
G1 X220.323 Y141.388 E2.52748
G1 X220.642 Y141.069 E.02315
G1 X185.802 Y106.23 E2.53109
G1 X186.44 Y106.23 E.03274
G1 X221.018 Y140.808 E2.51212
G2 X221.147 Y140.3 I-2.527 J-.914 E.02697
G1 X187.077 Y106.23 E2.4752
M73 P56 R14
G1 X187.715 Y106.23 E.03274
G1 X221.245 Y139.761 E2.43604
G2 X221.306 Y139.184 I-2.901 J-.595 E.02985
G1 X188.352 Y106.23 E2.39411
G1 X188.394 Y106.23 E.00218
G1 X190.986 Y108.822 E.18828
G1 X191.283 Y108.524 E.02161
G1 X221.328 Y138.569 E2.18277
G1 X221.328 Y137.932 E.03274
G1 X191.602 Y108.206 E2.15962
G1 X191.921 Y107.887 E.02315
G1 X219.034 Y135.001 E1.96982
G1 X219.353 Y134.682 E.02315
G1 X192.239 Y107.568 E1.96982
M73 P57 R14
G1 X192.558 Y107.25 E.02315
G1 X219.672 Y134.363 E1.96982
G1 X219.99 Y134.045 E.02315
G1 X192.877 Y106.931 E1.96982
G1 X193.195 Y106.612 E.02315
G1 X220.309 Y133.726 E1.96982
G1 X220.628 Y133.407 E.02315
G1 X193.451 Y106.231 E1.97441
G1 X194.088 Y106.231 E.03274
G1 X220.946 Y133.089 E1.95125
G1 X221.039 Y132.996 E.00676
G1 X221.328 Y133.027 E.01493
G1 X221.328 Y132.833 E.00996
G1 X194.726 Y106.231 E1.93269
G1 X195.363 Y106.231 E.03274
G1 X221.328 Y132.196 E1.88638
G1 X221.328 Y131.559 E.03274
G1 X196.001 Y106.231 E1.84008
G1 X196.032 Y106.231 E.0016
G1 X198.642 Y108.841 E.18967
G1 X198.946 Y108.538 E.02202
G1 X221.328 Y130.921 E1.62612
G1 X221.328 Y130.284 E.03274
G1 X199.264 Y108.22 E1.60297
G1 X199.583 Y107.901 E.02315
G1 X219.021 Y127.339 E1.41216
G1 X219.339 Y127.02 E.02315
G1 X199.902 Y107.582 E1.41216
G1 X200.22 Y107.264 E.02315
G1 X219.658 Y126.701 E1.41216
G1 X219.977 Y126.383 E.02315
G1 X200.539 Y106.945 E1.41216
G1 X200.858 Y106.626 E.02315
G1 X220.295 Y126.064 E1.41216
G1 X220.614 Y125.745 E.02315
G1 X201.1 Y106.231 E1.41772
G1 X201.737 Y106.231 E.03274
G1 X220.933 Y125.427 E1.39457
G1 X221.022 Y125.337 E.00651
G1 X221.328 Y125.378 E.01587
G1 X221.328 Y125.185 E.00989
G1 X202.374 Y106.231 E1.37702
G1 X203.012 Y106.231 E.03274
G1 X221.328 Y124.548 E1.33071
M73 P58 R14
G1 X221.328 Y123.91 E.03274
G1 X203.649 Y106.231 E1.2844
G1 X203.669 Y106.231 E.00102
G1 X206.299 Y108.861 E.19106
G1 X206.608 Y108.552 E.02243
G1 X221.328 Y123.273 E1.06947
G1 X221.328 Y122.636 E.03274
G1 X206.926 Y108.234 E1.04632
G1 X207.245 Y107.915 E.02315
G1 X219.007 Y119.677 E.85449
G1 X219.325 Y119.358 E.02315
G1 X207.564 Y107.596 E.85449
G1 X207.882 Y107.278 E.02315
G1 X219.644 Y119.039 E.85449
G1 X219.963 Y118.721 E.02315
G1 X208.201 Y106.959 E.85449
G1 X208.52 Y106.64 E.02315
G1 X220.281 Y118.402 E.85449
G1 X220.6 Y118.083 E.02315
G1 X208.748 Y106.232 E.86104
G1 X209.386 Y106.232 E.03274
G1 X220.919 Y117.765 E.83788
G1 X221.005 Y117.679 E.00626
G1 X221.328 Y117.729 E.01682
G1 X221.328 Y117.537 E.00984
G1 X210.023 Y106.232 E.82134
G1 X210.66 Y106.232 E.03274
G1 X221.328 Y116.9 E.77504
G1 X221.328 Y116.262 E.03274
G1 X211.298 Y106.232 E.72873
G1 X213.955 Y108.881 E.19276
G1 X214.27 Y108.566 E.02284
G1 X221.328 Y115.625 E.51282
G1 X221.328 Y114.988 E.03274
G1 X214.588 Y108.248 E.48967
G1 X214.907 Y107.929 E.02315
G1 X218.993 Y112.015 E.29683
G1 X219.311 Y111.696 E.02315
G1 X215.082 Y107.467 E.30723
G1 X219.371 Y112.418 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X219.283 Y112.33 E.00413
G1 X219.92 Y111.694 E.02985
G1 X219.493 Y111.267 E.02003
G1 X220.618 Y110.142 E.05277
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X215.842 Y106.379 E.25
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X215.655 Y107.429 E.04046
G1 X215.228 Y107.002 E.02003
G1 X214.503 Y107.726 E.03399
G1 X221.35 Y119.562 F30000
G1 F15476.087
G1 X220.538 Y118.751 E.03806
G1 X221.35 Y127.238 F30000
G1 F15476.087
G1 X220.538 Y126.427 E.03806
G1 X221.35 Y134.914 F30000
G1 F15476.087
G1 X220.538 Y134.103 E.03806
G1 X220.618 Y141.858 F30000
G1 F15476.087
G1 X220.538 Y141.779 E.00372
G1 X209.207 Y145.8 F30000
G1 F15476.087
G1 X209.024 Y145.617 E.00858
G1 X201.531 Y145.8 F30000
G1 F15476.087
G1 X201.348 Y145.617 E.00858
G1 X193.855 Y145.8 F30000
G1 F15476.087
G1 X193.673 Y145.617 E.00858
G1 X186.179 Y145.8 F30000
G1 F15476.087
G1 X185.997 Y145.617 E.00858
G1 X155.476 Y145.8 F30000
G1 F15476.087
G1 X155.293 Y145.617 E.00858
G1 X147.8 Y145.8 F30000
G1 F15476.087
G1 X147.617 Y145.617 E.00858
G1 X140.124 Y145.8 F30000
G1 F15476.087
M73 P59 R14
G1 X139.941 Y145.617 E.00858
G1 X132.448 Y145.8 F30000
G1 F15476.087
G1 X132.265 Y145.617 E.00858
G1 X124.772 Y145.8 F30000
G1 F15476.087
G1 X124.589 Y145.617 E.00858
G1 X117.096 Y145.8 F30000
G1 F15476.087
G1 X116.913 Y145.617 E.00858
G1 X109.42 Y145.8 F30000
G1 F15476.087
G1 X109.237 Y145.617 E.00858
G1 X101.744 Y145.8 F30000
G1 F15476.087
G1 X101.561 Y145.617 E.00858
G1 X94.068 Y145.8 F30000
G1 F15476.087
G1 X93.885 Y145.617 E.00858
G1 X86.392 Y145.8 F30000
G1 F15476.087
G1 X86.209 Y145.617 E.00858
G1 X78.716 Y145.8 F30000
G1 F15476.087
G1 X78.533 Y145.617 E.00858
G1 X71.04 Y145.8 F30000
G1 F15476.087
G1 X70.857 Y145.617 E.00858
G1 X63.364 Y145.8 F30000
G1 F15476.087
G1 X63.181 Y145.617 E.00858
G1 X62.327 Y106.383 F30000
G1 F15476.087
G1 X62.146 Y106.202 E.00852
G1 X54.652 Y106.383 F30000
G1 F15476.087
G1 X54.469 Y106.201 E.00854
G1 X46.976 Y106.383 F30000
G1 F15476.087
G1 X46.793 Y106.201 E.00856
G1 X93.031 Y106.383 F30000
G1 F15476.087
G1 X92.851 Y106.203 E.00844
G1 X100.707 Y106.383 F30000
G1 F15476.087
G1 X100.528 Y106.204 E.00842
G1 X108.383 Y106.383 F30000
G1 F15476.087
G1 X108.204 Y106.204 E.0084
G1 X116.059 Y106.383 F30000
G1 F15476.087
G1 X115.881 Y106.205 E.00837
G1 X123.735 Y106.383 F30000
G1 F15476.087
G1 X123.557 Y106.205 E.00835
G1 X131.411 Y106.383 F30000
G1 F15476.087
G1 X131.233 Y106.206 E.00833
G1 X139.087 Y106.383 F30000
G1 F15476.087
G1 X138.91 Y106.206 E.00831
G1 X146.763 Y106.383 F30000
G1 F15476.087
G1 X146.586 Y106.206 E.00829
G1 X154.439 Y106.383 F30000
G1 F15476.087
G1 X154.263 Y106.207 E.00827
G1 X162.115 Y106.383 F30000
G1 F15476.087
G1 X161.939 Y106.207 E.00825
G1 X169.791 Y106.383 F30000
G1 F15476.087
G1 X169.615 Y106.208 E.00823
G1 X177.467 Y106.383 F30000
G1 F15476.087
G1 X177.292 Y106.208 E.0082
G1 X185.143 Y106.383 F30000
G1 F15476.087
G1 X184.968 Y106.209 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X185.143 Y106.383 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/35
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.2 I-.013 J-1.217 P1  F30000
G1 X36.476 Y108.026 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.519 Y105.864 E5.73222
G3 X221.698 Y113.265 I-.218 J7.394 E.37845
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.198 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.538 Y105.472 E5.31067
G3 X222.09 Y113.255 I-.232 J7.78 E.36866
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X36.156 Y107.791 I7.813 J.018 E.18616
; WIPE_START
M204 S10000
G1 X36.758 Y107.228 E-.3131
G1 X37.372 Y106.773 E-.29051
G1 X37.725 Y106.561 E-.15638
; WIPE_END
G1 E-.04 F1800
G1 X37.715 Y110.624 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X37.456 Y112.215 I3.418 J1.373 E.05392
G1 X35.382 Y110.142 E.09728
G2 X34.829 Y111.708 I6.522 J3.186 E.05522
G1 X40.158 Y106.379 E.25
G2 X39.483 Y106.566 I.614 J3.522 E.02328
G1 X41.922 Y109.006 E.11445
G1 X45.207 Y109.006 E.10895
G1 X48.012 Y106.201 E.1316
G1 X46.793 Y106.201 E.04043
G1 X49.598 Y109.006 E.1316
G1 X52.883 Y109.006 E.10895
G1 X55.687 Y106.201 E.13157
G1 X54.469 Y106.201 E.0404
G1 X57.274 Y109.006 E.13158
G1 X60.559 Y109.006 E.10895
G1 X63.363 Y106.202 E.13155
G1 X62.146 Y106.202 E.04036
G1 X64.95 Y109.006 E.13155
G1 X68.234 Y109.006 E.10894
G1 X71.038 Y106.202 E.13153
G1 X69.822 Y106.202 E.04033
G1 X72.626 Y109.006 E.13153
G1 X75.91 Y109.006 E.10894
G1 X78.714 Y106.203 E.13151
G1 X77.499 Y106.203 E.0403
G1 X80.302 Y109.006 E.13151
G1 X83.586 Y109.006 E.10894
G1 X86.389 Y106.203 E.13148
G1 X85.175 Y106.203 E.04026
G1 X87.978 Y109.006 E.13149
G1 X91.262 Y109.006 E.10894
G1 X94.065 Y106.204 E.13146
G1 X92.852 Y106.204 E.04023
G1 X95.654 Y109.006 E.13146
G1 X98.938 Y109.006 E.10894
G1 X101.74 Y106.204 E.13144
G1 X100.528 Y106.204 E.04019
G1 X103.33 Y109.006 E.13144
G1 X106.614 Y109.006 E.10893
G1 X109.415 Y106.205 E.13141
G1 X108.205 Y106.205 E.04016
G1 X111.006 Y109.006 E.13142
G1 X114.29 Y109.006 E.10893
G1 X117.091 Y106.205 E.13139
G1 X115.881 Y106.205 E.04013
G1 X118.682 Y109.006 E.1314
G1 X121.966 Y109.006 E.10893
G1 X124.766 Y106.206 E.13137
G1 X123.558 Y106.206 E.04009
G1 X126.358 Y109.006 E.13137
G1 X129.642 Y109.006 E.10893
G1 X132.442 Y106.206 E.13135
G1 X131.234 Y106.206 E.04006
G1 X134.034 Y109.006 E.13135
G1 X137.318 Y109.006 E.10893
G1 X140.117 Y106.207 E.13132
G1 X138.911 Y106.207 E.04002
G1 X141.71 Y109.006 E.13133
G1 X144.994 Y109.006 E.10893
G1 X147.793 Y106.207 E.1313
G1 X146.587 Y106.207 E.03999
G1 X149.386 Y109.006 E.13131
G1 X152.67 Y109.006 E.10892
G1 X155.468 Y106.208 E.13128
G1 X154.264 Y106.208 E.03996
G1 X157.062 Y109.006 E.13128
G1 X160.346 Y109.006 E.10892
G1 X163.144 Y106.208 E.13126
G1 X161.94 Y106.208 E.03992
G1 X164.738 Y109.006 E.13126
G1 X168.022 Y109.006 E.10892
G1 X170.819 Y106.209 E.13123
G1 X169.616 Y106.209 E.03989
G1 X172.414 Y109.006 E.13124
G1 X175.697 Y109.006 E.10892
G1 X178.494 Y106.209 E.13121
G1 X177.293 Y106.209 E.03986
G1 X180.09 Y109.006 E.13122
G1 X183.373 Y109.006 E.10892
G1 X186.17 Y106.21 E.13119
G1 X184.969 Y106.21 E.03982
G1 X187.766 Y109.006 E.13119
G1 X191.049 Y109.006 E.10891
G1 X193.845 Y106.21 E.13117
G1 X192.646 Y106.21 E.03979
G1 X195.442 Y109.006 E.13117
G1 X198.725 Y109.006 E.10891
G1 X201.521 Y106.211 E.13114
G1 X200.322 Y106.211 E.03975
G1 X203.118 Y109.006 E.13115
G1 X206.401 Y109.006 E.10891
G1 X209.196 Y106.211 E.13112
G1 X207.999 Y106.211 E.03972
G1 X210.794 Y109.007 E.13113
G1 X214.077 Y109.007 E.10891
G1 X216.517 Y106.566 E.11448
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X221.171 Y111.708 E.25
G2 X220.618 Y110.142 I-7.076 J1.62 E.05522
G1 X218.543 Y112.216 E.09731
G1 X218.543 Y116.756 E.1506
G1 X221.35 Y119.562 E.13165
G1 X221.35 Y117.086 E.08215
G1 X218.543 Y119.892 E.13165
G1 X218.543 Y124.432 E.1506
G1 X221.35 Y127.238 E.13165
G1 X221.35 Y124.762 E.08215
G1 X218.543 Y127.568 E.13165
G1 X218.543 Y132.108 E.1506
G1 X221.35 Y134.914 E.13165
G1 X221.35 Y132.438 E.08215
G1 X218.543 Y135.244 E.13165
G1 X218.543 Y139.784 E.1506
G1 X220.618 Y141.858 E.09731
G2 X221.171 Y140.292 I-6.522 J-3.186 E.05522
G1 X215.842 Y145.621 E.25
G2 X216.517 Y145.434 I-.615 J-3.523 E.02328
G1 X214.078 Y142.994 E.11445
G1 X210.793 Y142.994 E.10895
G1 X207.988 Y145.8 E.13161
G1 X209.207 Y145.8 E.04046
G1 X206.402 Y142.994 E.13162
G1 X203.117 Y142.994 E.10895
G1 X200.312 Y145.8 E.13162
G1 X201.531 Y145.8 E.04046
G1 X198.726 Y142.994 E.13162
G1 X195.441 Y142.994 E.10895
G1 X192.636 Y145.8 E.13162
G1 X193.855 Y145.8 E.04046
G1 X191.05 Y142.994 E.13162
G1 X187.766 Y142.994 E.10894
G1 X184.96 Y145.8 E.13162
G1 X186.179 Y145.8 E.04046
G1 X183.374 Y142.994 E.13162
G1 X180.09 Y142.994 E.10894
G1 X177.284 Y145.8 E.13162
G1 X178.503 Y145.8 E.04046
G1 X175.698 Y142.994 E.13162
G1 X172.414 Y142.994 E.10894
G1 X169.608 Y145.8 E.13162
G1 X170.828 Y145.8 E.04046
G1 X168.022 Y142.994 E.13162
G1 X164.738 Y142.994 E.10894
G1 X161.932 Y145.8 E.13162
G1 X163.152 Y145.8 E.04046
G1 X160.346 Y142.994 E.13162
G1 X157.062 Y142.994 E.10894
G1 X154.256 Y145.8 E.13162
G1 X155.476 Y145.8 E.04046
G1 X152.67 Y142.994 E.13163
G1 X149.386 Y142.994 E.10893
G1 X146.58 Y145.8 E.13163
G1 X147.8 Y145.8 E.04046
G1 X144.994 Y142.994 E.13163
G1 X141.71 Y142.994 E.10893
G1 X138.904 Y145.8 E.13163
G1 X140.124 Y145.8 E.04046
G1 X137.318 Y142.994 E.13163
G1 X134.034 Y142.994 E.10893
G1 X131.228 Y145.8 E.13163
G1 X132.448 Y145.8 E.04046
G1 X129.642 Y142.994 E.13163
G1 X126.358 Y142.994 E.10893
G1 X123.552 Y145.8 E.13163
G1 X124.772 Y145.8 E.04046
G1 X121.966 Y142.994 E.13163
G1 X118.682 Y142.994 E.10893
G1 X115.876 Y145.8 E.13163
G1 X117.096 Y145.8 E.04046
G1 X114.29 Y142.994 E.13163
G1 X111.006 Y142.994 E.10893
G1 X108.2 Y145.8 E.13163
G1 X109.42 Y145.8 E.04046
G1 X106.614 Y142.994 E.13163
G1 X103.33 Y142.994 E.10892
G1 X100.524 Y145.8 E.13163
G1 X101.744 Y145.8 E.04046
G1 X98.938 Y142.994 E.13163
G1 X95.654 Y142.994 E.10892
G1 X92.848 Y145.8 E.13164
G1 X94.068 Y145.8 E.04046
G1 X91.262 Y142.994 E.13164
G1 X87.978 Y142.994 E.10892
G1 X85.172 Y145.8 E.13164
G1 X86.392 Y145.8 E.04046
G1 X83.586 Y142.994 E.13164
G1 X80.303 Y142.994 E.10892
G1 X77.496 Y145.8 E.13164
G1 X78.716 Y145.8 E.04046
G1 X75.91 Y142.994 E.13164
G1 X72.627 Y142.994 E.10892
G1 X69.821 Y145.8 E.13164
G1 X71.04 Y145.8 E.04046
G1 X68.234 Y142.994 E.13164
G1 X64.951 Y142.994 E.10891
G1 X62.145 Y145.8 E.13164
G1 X63.364 Y145.8 E.04046
G1 X60.558 Y142.994 E.13164
G1 X57.275 Y142.994 E.10891
G1 X54.469 Y145.8 E.13164
G1 X55.688 Y145.8 E.04046
G1 X52.882 Y142.994 E.13164
G1 X49.599 Y142.993 E.10891
G1 X46.793 Y145.8 E.13164
G1 X48.012 Y145.8 E.04046
G1 X45.206 Y142.993 E.13164
G1 X41.923 Y142.993 E.10891
G1 X39.483 Y145.434 E.11448
G2 X40.158 Y145.621 I1.29 J-3.334 E.02328
G1 X34.829 Y140.292 E.25
G2 X35.382 Y141.858 I7.076 J-1.62 E.05522
G1 X37.457 Y139.784 E.09731
G1 X37.456 Y135.244 E.1506
G1 X34.65 Y132.438 E.13164
G1 X34.65 Y134.914 E.08215
G1 X37.456 Y132.108 E.13164
G1 X37.456 Y127.568 E.15061
G1 X34.65 Y124.762 E.13163
G1 X34.65 Y127.238 E.08215
G1 X37.456 Y124.432 E.13163
M73 P59 R13
G1 X37.456 Y119.892 E.15063
G1 X34.65 Y117.086 E.13162
G1 X34.65 Y119.562 E.08215
G1 X37.456 Y116.757 E.13162
G1 X37.456 Y115.128 E.05401
G1 X39.173 Y109.475 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42011
G1 F15000
G1 X38.493 Y110.155 E.02957
G1 X38.216 Y110.517 E.01401
G1 X38.071 Y110.788 E.00945
G1 X37.964 Y111.074 E.00936
G1 X37.924 Y111.258 E.00579
G1 X39.708 Y109.474 E.07752
G1 X40.062 Y109.398 E.01114
G1 X40.317 Y109.398 E.00785
G1 X37.848 Y111.867 E.10734
G1 X37.848 Y112.401 E.01639
G1 X40.851 Y109.398 E.13053
G1 X41.384 Y109.398 E.0164
G1 X37.848 Y112.934 E.15371
G1 X37.848 Y113.468 E.0164
G1 X41.918 Y109.398 E.1769
G1 X42.451 Y109.398 E.0164
G1 X37.848 Y114.001 E.20008
G1 X37.848 Y114.534 E.01639
G1 X42.985 Y109.398 E.22327
G1 X43.518 Y109.398 E.0164
G1 X37.848 Y115.068 E.24646
G1 X37.848 Y115.601 E.0164
G1 X44.051 Y109.398 E.26964
G1 X44.585 Y109.398 E.0164
G1 X37.848 Y116.135 E.29283
G1 X37.848 Y116.668 E.01639
G1 X45.118 Y109.398 E.31601
G1 X45.652 Y109.398 E.0164
G1 X37.848 Y117.202 E.3392
G1 X37.848 Y117.735 E.01639
G1 X46.185 Y109.398 E.36239
G1 X46.719 Y109.398 E.0164
G1 X37.848 Y118.268 E.38557
G1 X37.848 Y118.802 E.01639
G1 X47.252 Y109.398 E.40876
G1 X47.785 Y109.398 E.0164
G1 X37.848 Y119.335 E.43195
G1 X37.848 Y119.869 E.0164
G1 X48.319 Y109.398 E.45513
G1 X48.852 Y109.398 E.0164
G1 X37.848 Y120.402 E.47832
G1 X37.848 Y120.935 E.0164
G1 X49.386 Y109.398 E.5015
G1 X49.919 Y109.398 E.0164
G1 X37.848 Y121.469 E.52469
G1 X37.848 Y122.002 E.0164
G1 X50.453 Y109.398 E.54788
G1 X50.986 Y109.398 E.0164
G1 X37.848 Y122.536 E.57106
G1 X37.848 Y123.069 E.01639
G1 X51.519 Y109.398 E.59425
G1 X52.053 Y109.398 E.0164
G1 X37.848 Y123.603 E.61743
G1 X37.848 Y124.136 E.0164
G1 X52.586 Y109.398 E.64062
G1 X53.12 Y109.398 E.0164
G1 X37.848 Y124.669 E.66381
G1 X37.848 Y125.203 E.01639
G1 X53.653 Y109.398 E.68699
G1 X54.186 Y109.398 E.0164
G1 X37.848 Y125.736 E.71018
G1 X37.848 Y126.27 E.0164
G1 X54.72 Y109.398 E.73337
G1 X55.253 Y109.398 E.0164
G1 X37.848 Y126.803 E.75655
G1 X37.848 Y127.336 E.01639
G1 X55.787 Y109.398 E.77974
G1 X56.32 Y109.398 E.0164
G1 X37.848 Y127.87 E.80292
G1 X37.848 Y128.403 E.01639
G1 X56.854 Y109.398 E.82611
G1 X57.387 Y109.398 E.0164
G1 X37.848 Y128.937 E.8493
G1 X37.848 Y129.47 E.01639
G1 X57.92 Y109.398 E.87248
G1 X58.454 Y109.398 E.0164
G1 X37.848 Y130.004 E.89567
G1 X37.848 Y130.537 E.0164
G1 X58.987 Y109.398 E.91885
G1 X59.521 Y109.398 E.0164
G1 X37.848 Y131.07 E.94204
G1 X37.848 Y131.604 E.0164
G1 X60.054 Y109.398 E.96523
G1 X60.588 Y109.398 E.0164
G1 X37.848 Y132.137 E.98841
G1 X37.849 Y132.671 E.0164
G1 X61.121 Y109.398 E1.0116
G1 X61.654 Y109.398 E.0164
G1 X37.849 Y133.204 E1.03479
G1 X37.849 Y133.737 E.01639
G1 X62.188 Y109.398 E1.05797
G1 X62.721 Y109.398 E.0164
G1 X37.849 Y134.271 E1.08116
G1 X37.849 Y134.804 E.0164
G1 X63.255 Y109.398 E1.10434
G1 X63.788 Y109.398 E.0164
G1 X37.849 Y135.338 E1.12753
G1 X37.849 Y135.871 E.01639
G1 X64.322 Y109.398 E1.15072
G1 X64.855 Y109.398 E.0164
G1 X37.849 Y136.404 E1.1739
G1 X37.849 Y136.938 E.0164
G1 X65.388 Y109.398 E1.19709
G1 X65.922 Y109.398 E.0164
G1 X37.849 Y137.471 E1.22027
G1 X37.849 Y138.005 E.01639
G1 X66.455 Y109.398 E1.24346
G1 X66.989 Y109.398 E.0164
G1 X37.849 Y138.538 E1.26665
G1 X37.849 Y139.072 E.0164
G1 X67.522 Y109.398 E1.28983
G1 X68.056 Y109.398 E.0164
G1 X37.849 Y139.605 E1.31302
G1 X37.849 Y140.138 E.01639
G1 X68.589 Y109.398 E1.3362
G1 X69.122 Y109.398 E.0164
G1 X37.898 Y140.622 E1.35723
G1 X37.964 Y140.925 E.00953
G1 X38.009 Y141.045 E.00395
G1 X69.656 Y109.398 E1.37563
G1 X70.189 Y109.398 E.0164
G1 X38.182 Y141.405 E1.39126
G1 X38.302 Y141.612 E.00734
G1 X38.398 Y141.722 E.00452
G1 X70.723 Y109.398 E1.40505
G1 X71.256 Y109.398 E.0164
G1 X38.657 Y141.997 E1.41698
G1 X38.959 Y142.228 E.01169
G1 X71.79 Y109.398 E1.42705
G1 X72.323 Y109.398 E.0164
G1 X39.314 Y142.407 E1.43483
G1 X39.524 Y142.486 E.00689
G1 X39.725 Y142.529 E.00633
G1 X72.856 Y109.398 E1.44014
G1 X73.39 Y109.398 E.0164
G1 X40.187 Y142.601 E1.44326
G1 X40.72 Y142.601 E.0164
G1 X73.923 Y109.398 E1.44326
G1 X74.457 Y109.398 E.0164
G1 X41.253 Y142.601 E1.44326
G1 X41.787 Y142.601 E.0164
G1 X74.99 Y109.398 E1.44326
G1 X75.523 Y109.398 E.0164
G1 X42.32 Y142.601 E1.44326
G1 X42.854 Y142.601 E.0164
G1 X76.057 Y109.398 E1.44326
G1 X76.59 Y109.398 E.0164
G1 X43.387 Y142.601 E1.44326
G1 X43.921 Y142.601 E.0164
M73 P60 R13
G1 X77.124 Y109.398 E1.44326
G1 X77.657 Y109.398 E.0164
G1 X44.454 Y142.601 E1.44326
G1 X44.987 Y142.601 E.0164
G1 X78.191 Y109.398 E1.44326
G1 X78.724 Y109.398 E.0164
G1 X45.521 Y142.601 E1.44326
G1 X46.054 Y142.601 E.0164
G1 X79.257 Y109.398 E1.44326
G1 X79.791 Y109.398 E.0164
G1 X46.588 Y142.601 E1.44326
G1 X47.121 Y142.601 E.0164
G1 X80.324 Y109.398 E1.44326
G1 X80.858 Y109.398 E.0164
G1 X47.655 Y142.601 E1.44326
G1 X48.188 Y142.601 E.0164
G1 X81.391 Y109.398 E1.44326
G1 X81.925 Y109.398 E.0164
G1 X48.721 Y142.601 E1.44326
G1 X49.255 Y142.601 E.0164
G1 X82.458 Y109.398 E1.44326
G1 X82.991 Y109.398 E.0164
G1 X49.788 Y142.601 E1.44326
G1 X50.322 Y142.601 E.0164
G1 X83.525 Y109.398 E1.44326
G1 X84.058 Y109.398 E.0164
G1 X50.855 Y142.601 E1.44326
G1 X51.389 Y142.601 E.0164
G1 X84.592 Y109.398 E1.44326
G1 X85.125 Y109.398 E.0164
G1 X51.922 Y142.601 E1.44326
G1 X52.455 Y142.601 E.0164
G1 X85.659 Y109.398 E1.44326
G1 X86.192 Y109.398 E.0164
G1 X52.989 Y142.601 E1.44326
G1 X53.522 Y142.601 E.0164
G1 X86.725 Y109.398 E1.44326
G1 X87.259 Y109.398 E.0164
G1 X54.056 Y142.601 E1.44326
G1 X54.589 Y142.601 E.0164
G1 X87.792 Y109.398 E1.44326
G1 X88.326 Y109.398 E.0164
G1 X55.123 Y142.601 E1.44326
G1 X55.656 Y142.601 E.0164
G1 X88.859 Y109.398 E1.44326
G1 X89.393 Y109.398 E.0164
G1 X56.189 Y142.601 E1.44326
G1 X56.723 Y142.601 E.0164
G1 X89.926 Y109.398 E1.44326
G1 X90.459 Y109.398 E.0164
G1 X57.256 Y142.601 E1.44326
G1 X57.79 Y142.601 E.0164
G1 X90.993 Y109.398 E1.44326
G1 X91.526 Y109.398 E.0164
G1 X58.323 Y142.601 E1.44326
G1 X58.857 Y142.601 E.0164
G1 X92.06 Y109.398 E1.44326
G1 X92.593 Y109.398 E.0164
G1 X59.39 Y142.601 E1.44326
G1 X59.923 Y142.601 E.0164
G1 X93.127 Y109.398 E1.44326
G1 X93.66 Y109.398 E.0164
G1 X60.457 Y142.601 E1.44326
G1 X60.99 Y142.601 E.0164
G1 X94.193 Y109.398 E1.44326
G1 X94.727 Y109.398 E.0164
G1 X61.524 Y142.601 E1.44326
G1 X62.057 Y142.601 E.0164
G1 X95.26 Y109.398 E1.44326
G1 X95.794 Y109.398 E.0164
G1 X62.59 Y142.601 E1.44326
G1 X63.124 Y142.601 E.0164
G1 X96.327 Y109.398 E1.44326
G1 X96.861 Y109.398 E.0164
G1 X63.657 Y142.601 E1.44326
G1 X64.191 Y142.601 E.0164
G1 X97.394 Y109.398 E1.44326
G1 X97.927 Y109.398 E.0164
G1 X64.724 Y142.601 E1.44326
G1 X65.258 Y142.601 E.0164
G1 X98.461 Y109.398 E1.44326
G1 X98.994 Y109.398 E.0164
G1 X65.791 Y142.601 E1.44326
G1 X66.324 Y142.601 E.0164
G1 X99.528 Y109.398 E1.44326
G1 X100.061 Y109.398 E.0164
G1 X66.858 Y142.601 E1.44326
G1 X67.391 Y142.601 E.0164
G1 X100.594 Y109.398 E1.44326
G1 X101.128 Y109.398 E.0164
G1 X67.925 Y142.601 E1.44326
G1 X68.458 Y142.601 E.0164
G1 X101.661 Y109.398 E1.44326
G1 X102.195 Y109.398 E.0164
G1 X68.992 Y142.601 E1.44326
G1 X69.525 Y142.601 E.0164
G1 X102.728 Y109.398 E1.44326
G1 X103.262 Y109.398 E.0164
G1 X70.058 Y142.601 E1.44326
G1 X70.592 Y142.601 E.0164
G1 X103.795 Y109.398 E1.44326
G1 X104.328 Y109.398 E.0164
G1 X71.125 Y142.601 E1.44326
G1 X71.659 Y142.601 E.0164
G1 X104.862 Y109.398 E1.44326
G1 X105.395 Y109.398 E.0164
G1 X72.192 Y142.601 E1.44326
G1 X72.726 Y142.601 E.0164
G1 X105.929 Y109.398 E1.44326
G1 X106.462 Y109.398 E.0164
G1 X73.259 Y142.601 E1.44326
G1 X73.792 Y142.601 E.0164
G1 X106.996 Y109.398 E1.44326
G1 X107.529 Y109.398 E.0164
G1 X74.326 Y142.601 E1.44326
G1 X74.859 Y142.601 E.0164
G1 X108.062 Y109.398 E1.44326
G1 X108.596 Y109.398 E.0164
G1 X75.393 Y142.601 E1.44326
G1 X75.926 Y142.601 E.0164
G1 X109.129 Y109.398 E1.44326
G1 X109.663 Y109.398 E.0164
G1 X76.46 Y142.601 E1.44326
G1 X76.993 Y142.601 E.0164
G1 X110.196 Y109.398 E1.44326
G1 X110.73 Y109.398 E.0164
G1 X77.526 Y142.601 E1.44326
G1 X78.06 Y142.601 E.0164
G1 X111.263 Y109.398 E1.44326
G1 X111.796 Y109.398 E.0164
G1 X78.593 Y142.601 E1.44326
G1 X79.127 Y142.601 E.0164
G1 X112.33 Y109.398 E1.44326
G1 X112.863 Y109.398 E.0164
G1 X79.66 Y142.601 E1.44326
G1 X80.194 Y142.601 E.0164
G1 X113.397 Y109.398 E1.44326
G1 X113.93 Y109.398 E.0164
G1 X80.727 Y142.601 E1.44326
G1 X81.26 Y142.601 E.0164
G1 X114.464 Y109.398 E1.44326
G1 X114.997 Y109.398 E.0164
G1 X81.794 Y142.601 E1.44326
G1 X82.327 Y142.601 E.0164
G1 X115.53 Y109.398 E1.44326
G1 X116.064 Y109.398 E.0164
G1 X82.861 Y142.601 E1.44326
G1 X83.394 Y142.601 E.0164
G1 X116.597 Y109.398 E1.44326
G1 X117.131 Y109.398 E.0164
G1 X83.927 Y142.601 E1.44326
G1 X84.461 Y142.601 E.0164
G1 X117.664 Y109.398 E1.44326
G1 X118.198 Y109.398 E.0164
G1 X84.994 Y142.601 E1.44326
G1 X85.528 Y142.601 E.0164
G1 X118.731 Y109.398 E1.44326
G1 X119.264 Y109.398 E.0164
G1 X86.061 Y142.601 E1.44326
G1 X86.595 Y142.601 E.0164
G1 X119.798 Y109.398 E1.44326
G1 X120.331 Y109.398 E.0164
G1 X87.128 Y142.601 E1.44326
G1 X87.661 Y142.601 E.0164
G1 X120.865 Y109.398 E1.44326
G1 X121.398 Y109.398 E.0164
G1 X88.195 Y142.601 E1.44326
G1 X88.728 Y142.601 E.0164
G1 X121.931 Y109.398 E1.44326
G1 X122.465 Y109.398 E.0164
G1 X89.262 Y142.601 E1.44326
G1 X89.795 Y142.601 E.0164
G1 X122.998 Y109.398 E1.44326
G1 X123.532 Y109.398 E.0164
G1 X90.329 Y142.601 E1.44326
G1 X90.862 Y142.601 E.0164
G1 X124.065 Y109.398 E1.44326
G1 X124.599 Y109.398 E.0164
G1 X91.395 Y142.601 E1.44326
G1 X91.929 Y142.601 E.0164
G1 X125.132 Y109.398 E1.44326
G1 X125.665 Y109.398 E.0164
G1 X92.462 Y142.601 E1.44326
G1 X92.996 Y142.602 E.0164
G1 X126.199 Y109.398 E1.44326
G1 X126.732 Y109.398 E.0164
G1 X93.529 Y142.602 E1.44326
G1 X94.063 Y142.602 E.0164
G1 X127.266 Y109.398 E1.44326
G1 X127.799 Y109.398 E.0164
G1 X94.596 Y142.602 E1.44326
G1 X95.129 Y142.602 E.0164
M73 P61 R13
G1 X128.333 Y109.398 E1.44326
G1 X128.866 Y109.398 E.0164
G1 X95.663 Y142.602 E1.44326
G1 X96.196 Y142.602 E.0164
G1 X129.399 Y109.398 E1.44326
G1 X129.933 Y109.398 E.0164
G1 X96.73 Y142.602 E1.44326
G1 X97.263 Y142.602 E.0164
G1 X130.466 Y109.398 E1.44326
G1 X131 Y109.398 E.0164
G1 X97.797 Y142.602 E1.44326
G1 X98.33 Y142.602 E.0164
G1 X131.533 Y109.398 E1.44326
G1 X132.067 Y109.398 E.0164
G1 X98.863 Y142.602 E1.44326
G1 X99.397 Y142.602 E.0164
G1 X132.6 Y109.398 E1.44326
G1 X133.133 Y109.398 E.0164
G1 X99.93 Y142.602 E1.44326
G1 X100.464 Y142.602 E.0164
G1 X133.667 Y109.398 E1.44326
G1 X134.2 Y109.398 E.0164
G1 X100.997 Y142.602 E1.44326
G1 X101.531 Y142.602 E.0164
G1 X134.734 Y109.398 E1.44326
G1 X135.267 Y109.398 E.0164
G1 X102.064 Y142.602 E1.44326
G1 X102.597 Y142.602 E.0164
G1 X135.801 Y109.398 E1.44326
G1 X136.334 Y109.398 E.0164
G1 X103.131 Y142.602 E1.44326
G1 X103.664 Y142.602 E.0164
G1 X136.867 Y109.398 E1.44326
G1 X137.401 Y109.398 E.0164
G1 X104.198 Y142.602 E1.44326
G1 X104.731 Y142.602 E.0164
G1 X137.934 Y109.398 E1.44326
G1 X138.468 Y109.398 E.0164
G1 X105.265 Y142.602 E1.44326
G1 X105.798 Y142.602 E.0164
G1 X139.001 Y109.398 E1.44326
G1 X139.535 Y109.398 E.0164
G1 X106.331 Y142.602 E1.44326
G1 X106.865 Y142.602 E.0164
G1 X140.068 Y109.398 E1.44326
G1 X140.601 Y109.398 E.0164
G1 X107.398 Y142.602 E1.44326
G1 X107.932 Y142.602 E.0164
G1 X141.135 Y109.398 E1.44326
G1 X141.668 Y109.398 E.0164
G1 X108.465 Y142.602 E1.44326
G1 X108.998 Y142.602 E.0164
G1 X142.202 Y109.398 E1.44326
G1 X142.735 Y109.398 E.0164
G1 X109.532 Y142.602 E1.44326
G1 X110.065 Y142.602 E.0164
G1 X143.269 Y109.398 E1.44326
G1 X143.802 Y109.398 E.0164
G1 X110.599 Y142.602 E1.44326
G1 X111.132 Y142.602 E.0164
G1 X144.335 Y109.398 E1.44326
G1 X144.869 Y109.398 E.0164
G1 X111.666 Y142.602 E1.44326
G1 X112.199 Y142.602 E.0164
G1 X145.402 Y109.398 E1.44326
G1 X145.936 Y109.398 E.0164
G1 X112.732 Y142.602 E1.44326
G1 X113.266 Y142.602 E.0164
G1 X146.469 Y109.398 E1.44326
G1 X147.002 Y109.398 E.0164
G1 X113.799 Y142.602 E1.44326
G1 X114.333 Y142.602 E.0164
G1 X147.536 Y109.398 E1.44326
G1 X148.069 Y109.398 E.0164
G1 X114.866 Y142.602 E1.44326
G1 X115.4 Y142.602 E.0164
G1 X148.603 Y109.398 E1.44326
G1 X149.136 Y109.398 E.0164
G1 X115.933 Y142.602 E1.44326
G1 X116.466 Y142.602 E.0164
G1 X149.67 Y109.398 E1.44326
G1 X150.203 Y109.398 E.0164
G1 X117 Y142.602 E1.44326
G1 X117.533 Y142.602 E.0164
G1 X150.736 Y109.398 E1.44326
G1 X151.27 Y109.398 E.0164
G1 X118.067 Y142.602 E1.44326
G1 X118.6 Y142.602 E.0164
G1 X151.803 Y109.398 E1.44326
G1 X152.337 Y109.398 E.0164
G1 X119.134 Y142.602 E1.44326
G1 X119.667 Y142.602 E.0164
G1 X152.87 Y109.398 E1.44326
G1 X153.404 Y109.398 E.0164
G1 X120.2 Y142.602 E1.44326
G1 X120.734 Y142.602 E.0164
G1 X153.937 Y109.398 E1.44326
G1 X154.47 Y109.398 E.0164
G1 X121.267 Y142.602 E1.44326
G1 X121.801 Y142.602 E.0164
G1 X155.004 Y109.398 E1.44326
G1 X155.537 Y109.398 E.0164
G1 X122.334 Y142.602 E1.44326
G1 X122.868 Y142.602 E.0164
G1 X156.071 Y109.398 E1.44326
G1 X156.604 Y109.398 E.0164
G1 X123.401 Y142.602 E1.44326
G1 X123.934 Y142.602 E.0164
G1 X157.138 Y109.398 E1.44326
G1 X157.671 Y109.398 E.0164
G1 X124.468 Y142.602 E1.44326
G1 X125.001 Y142.602 E.0164
G1 X158.204 Y109.398 E1.44326
G1 X158.738 Y109.398 E.0164
G1 X125.535 Y142.602 E1.44326
G1 X126.068 Y142.602 E.0164
G1 X159.271 Y109.398 E1.44326
G1 X159.805 Y109.398 E.0164
G1 X126.602 Y142.602 E1.44326
G1 X127.135 Y142.602 E.0164
G1 X160.338 Y109.398 E1.44326
G1 X160.872 Y109.398 E.0164
G1 X127.668 Y142.602 E1.44326
G1 X128.202 Y142.602 E.0164
G1 X161.405 Y109.398 E1.44326
G1 X161.938 Y109.398 E.0164
G1 X128.735 Y142.602 E1.44326
G1 X129.269 Y142.602 E.0164
G1 X162.472 Y109.398 E1.44326
G1 X163.005 Y109.398 E.0164
G1 X129.802 Y142.602 E1.44326
G1 X130.335 Y142.602 E.0164
G1 X163.539 Y109.398 E1.44326
G1 X164.072 Y109.398 E.0164
G1 X130.869 Y142.602 E1.44326
G1 X131.402 Y142.602 E.0164
G1 X164.606 Y109.398 E1.44326
G1 X165.139 Y109.398 E.0164
G1 X131.936 Y142.602 E1.44326
G1 X132.469 Y142.602 E.0164
G1 X165.672 Y109.398 E1.44326
G1 X166.206 Y109.398 E.0164
G1 X133.003 Y142.602 E1.44326
G1 X133.536 Y142.602 E.0164
G1 X166.739 Y109.398 E1.44326
G1 X167.273 Y109.399 E.0164
G1 X134.069 Y142.602 E1.44326
G1 X134.603 Y142.602 E.0164
G1 X167.806 Y109.399 E1.44326
G1 X168.339 Y109.399 E.0164
G1 X135.136 Y142.602 E1.44326
G1 X135.67 Y142.602 E.0164
G1 X168.873 Y109.399 E1.44326
G1 X169.406 Y109.399 E.0164
G1 X136.203 Y142.602 E1.44326
G1 X136.737 Y142.602 E.0164
G1 X169.94 Y109.399 E1.44326
G1 X170.473 Y109.399 E.0164
G1 X137.27 Y142.602 E1.44326
G1 X137.803 Y142.602 E.0164
G1 X171.007 Y109.399 E1.44326
G1 X171.54 Y109.399 E.0164
G1 X138.337 Y142.602 E1.44326
G1 X138.87 Y142.602 E.0164
G1 X172.073 Y109.399 E1.44326
G1 X172.607 Y109.399 E.0164
G1 X139.404 Y142.602 E1.44326
G1 X139.937 Y142.602 E.0164
G1 X173.14 Y109.399 E1.44326
G1 X173.674 Y109.399 E.0164
G1 X140.471 Y142.602 E1.44326
G1 X141.004 Y142.602 E.0164
G1 X174.207 Y109.399 E1.44326
G1 X174.741 Y109.399 E.0164
G1 X141.537 Y142.602 E1.44326
G1 X142.071 Y142.602 E.0164
G1 X175.274 Y109.399 E1.44326
G1 X175.807 Y109.399 E.0164
G1 X142.604 Y142.602 E1.44326
G1 X143.138 Y142.602 E.0164
G1 X176.341 Y109.399 E1.44326
G1 X176.874 Y109.399 E.0164
G1 X143.671 Y142.602 E1.44326
G1 X144.205 Y142.602 E.0164
G1 X177.408 Y109.399 E1.44326
G1 X177.941 Y109.399 E.0164
G1 X144.738 Y142.602 E1.44326
M73 P62 R13
G1 X145.271 Y142.602 E.0164
G1 X178.475 Y109.399 E1.44326
G1 X179.008 Y109.399 E.0164
G1 X145.805 Y142.602 E1.44326
G1 X146.338 Y142.602 E.0164
G1 X179.541 Y109.399 E1.44326
G1 X180.075 Y109.399 E.0164
G1 X146.872 Y142.602 E1.44326
G1 X147.405 Y142.602 E.0164
G1 X180.608 Y109.399 E1.44326
G1 X181.142 Y109.399 E.0164
G1 X147.939 Y142.602 E1.44326
G1 X148.472 Y142.602 E.0164
G1 X181.675 Y109.399 E1.44326
G1 X182.209 Y109.399 E.0164
G1 X149.005 Y142.602 E1.44326
G1 X149.539 Y142.602 E.0164
G1 X182.742 Y109.399 E1.44326
G1 X183.275 Y109.399 E.0164
G1 X150.072 Y142.602 E1.44326
G1 X150.606 Y142.602 E.0164
G1 X183.809 Y109.399 E1.44326
G1 X184.342 Y109.399 E.0164
G1 X151.139 Y142.602 E1.44326
G1 X151.673 Y142.602 E.0164
G1 X184.876 Y109.399 E1.44326
G1 X185.409 Y109.399 E.0164
G1 X152.206 Y142.602 E1.44326
G1 X152.739 Y142.602 E.0164
G1 X185.943 Y109.399 E1.44326
G1 X186.476 Y109.399 E.0164
G1 X153.273 Y142.602 E1.44326
G1 X153.806 Y142.602 E.0164
G1 X187.009 Y109.399 E1.44326
G1 X187.543 Y109.399 E.0164
G1 X154.34 Y142.602 E1.44326
G1 X154.873 Y142.602 E.0164
G1 X188.076 Y109.399 E1.44326
G1 X188.61 Y109.399 E.0164
G1 X155.406 Y142.602 E1.44326
G1 X155.94 Y142.602 E.0164
G1 X189.143 Y109.399 E1.44326
G1 X189.677 Y109.399 E.0164
G1 X156.473 Y142.602 E1.44326
G1 X157.007 Y142.602 E.0164
G1 X190.21 Y109.399 E1.44326
G1 X190.743 Y109.399 E.0164
G1 X157.54 Y142.602 E1.44326
G1 X158.074 Y142.602 E.0164
G1 X191.277 Y109.399 E1.44326
G1 X191.81 Y109.399 E.0164
G1 X158.607 Y142.602 E1.44326
G1 X159.14 Y142.602 E.0164
G1 X192.344 Y109.399 E1.44326
G1 X192.877 Y109.399 E.0164
G1 X159.674 Y142.602 E1.44326
G1 X160.207 Y142.602 E.0164
G1 X193.41 Y109.399 E1.44326
G1 X193.944 Y109.399 E.0164
G1 X160.741 Y142.602 E1.44326
G1 X161.274 Y142.602 E.0164
G1 X194.477 Y109.399 E1.44326
G1 X195.011 Y109.399 E.0164
G1 X161.808 Y142.602 E1.44326
G1 X162.341 Y142.602 E.0164
G1 X195.544 Y109.399 E1.44326
G1 X196.078 Y109.399 E.0164
G1 X162.874 Y142.602 E1.44326
G1 X163.408 Y142.602 E.0164
G1 X196.611 Y109.399 E1.44326
G1 X197.144 Y109.399 E.0164
G1 X163.941 Y142.602 E1.44326
G1 X164.475 Y142.602 E.0164
G1 X197.678 Y109.399 E1.44326
G1 X198.211 Y109.399 E.0164
G1 X165.008 Y142.602 E1.44326
G1 X165.542 Y142.602 E.0164
G1 X198.745 Y109.399 E1.44326
G1 X199.278 Y109.399 E.0164
G1 X166.075 Y142.602 E1.44326
G1 X166.608 Y142.602 E.0164
G1 X199.812 Y109.399 E1.44326
G1 X200.345 Y109.399 E.0164
G1 X167.142 Y142.602 E1.44326
G1 X167.675 Y142.602 E.0164
G1 X200.878 Y109.399 E1.44326
G1 X201.412 Y109.399 E.0164
G1 X168.209 Y142.602 E1.44326
G1 X168.742 Y142.602 E.0164
G1 X201.945 Y109.399 E1.44326
G1 X202.479 Y109.399 E.0164
G1 X169.276 Y142.602 E1.44326
G1 X169.809 Y142.602 E.0164
G1 X203.012 Y109.399 E1.44326
G1 X203.546 Y109.399 E.0164
G1 X170.342 Y142.602 E1.44326
G1 X170.876 Y142.602 E.0164
G1 X204.079 Y109.399 E1.44326
M73 P62 R12
G1 X204.612 Y109.399 E.0164
G1 X171.409 Y142.602 E1.44326
G1 X171.943 Y142.602 E.0164
G1 X205.146 Y109.399 E1.44326
G1 X205.679 Y109.399 E.0164
G1 X172.476 Y142.602 E1.44326
G1 X173.01 Y142.602 E.0164
G1 X206.213 Y109.399 E1.44326
G1 X206.746 Y109.399 E.0164
G1 X173.543 Y142.602 E1.44326
G1 X174.076 Y142.602 E.0164
G1 X207.28 Y109.399 E1.44326
G1 X207.813 Y109.399 E.0164
G1 X174.61 Y142.602 E1.44326
G1 X175.143 Y142.602 E.0164
G1 X208.346 Y109.399 E1.44326
G1 X208.88 Y109.399 E.0164
G1 X175.677 Y142.602 E1.44326
G1 X176.21 Y142.602 E.0164
G1 X209.413 Y109.399 E1.44326
G1 X209.947 Y109.399 E.0164
G1 X176.743 Y142.602 E1.44326
G1 X177.277 Y142.602 E.0164
G1 X210.48 Y109.399 E1.44326
G1 X211.014 Y109.399 E.0164
G1 X177.81 Y142.602 E1.44326
G1 X178.344 Y142.602 E.0164
G1 X211.547 Y109.399 E1.44326
G1 X212.08 Y109.399 E.0164
G1 X178.877 Y142.602 E1.44326
G1 X179.411 Y142.602 E.0164
G1 X212.614 Y109.399 E1.44326
G1 X213.147 Y109.399 E.0164
G1 X179.944 Y142.602 E1.44326
G1 X180.477 Y142.602 E.0164
G1 X213.681 Y109.399 E1.44326
G1 X214.214 Y109.399 E.0164
G1 X181.011 Y142.602 E1.44326
G1 X181.544 Y142.602 E.0164
G1 X214.747 Y109.399 E1.44326
G1 X215.281 Y109.399 E.0164
G1 X182.078 Y142.602 E1.44326
G1 X182.611 Y142.602 E.0164
G1 X215.814 Y109.399 E1.44326
G1 X215.941 Y109.399 E.0039
G1 X216.276 Y109.471 E.01052
G1 X183.145 Y142.602 E1.44013
G1 X183.678 Y142.602 E.0164
G1 X216.687 Y109.593 E1.43482
G1 X217.041 Y109.772 E.0122
G1 X184.211 Y142.602 E1.42703
G1 X184.745 Y142.602 E.0164
G1 X217.343 Y110.004 E1.41697
G1 X217.602 Y110.278 E.0116
G1 X185.278 Y142.602 E1.40503
G1 X185.812 Y142.602 E.0164
G1 X217.818 Y110.596 E1.39123
G1 X217.928 Y110.787 E.00678
G1 X217.992 Y110.955 E.00554
G1 X186.345 Y142.602 E1.3756
G1 X186.879 Y142.602 E.0164
G1 X218.102 Y111.379 E1.35719
G1 X218.151 Y111.609 E.00722
G1 X218.151 Y111.863 E.00781
G1 X187.412 Y142.602 E1.33616
G1 X187.945 Y142.602 E.0164
G1 X218.151 Y112.396 E1.31298
G1 X218.151 Y112.929 E.0164
G1 X188.479 Y142.602 E1.28979
G1 X189.012 Y142.602 E.0164
G1 X218.151 Y113.463 E1.2666
G1 X218.151 Y113.996 E.0164
G1 X189.546 Y142.602 E1.24342
G1 X190.079 Y142.602 E.0164
G1 X218.151 Y114.53 E1.22023
G1 X218.151 Y115.063 E.0164
G1 X190.613 Y142.602 E1.19704
G1 X191.146 Y142.602 E.0164
G1 X218.151 Y115.597 E1.17386
G1 X218.151 Y116.13 E.0164
G1 X191.679 Y142.602 E1.15067
G1 X192.213 Y142.602 E.0164
G1 X218.151 Y116.663 E1.12748
G1 X218.151 Y117.197 E.0164
G1 X192.746 Y142.602 E1.1043
G1 X193.28 Y142.602 E.0164
G1 X218.151 Y117.73 E1.08111
G1 X218.151 Y118.264 E.0164
M73 P63 R12
G1 X193.813 Y142.602 E1.05792
G1 X194.347 Y142.602 E.0164
G1 X218.151 Y118.797 E1.03474
G1 X218.151 Y119.331 E.0164
G1 X194.88 Y142.602 E1.01155
G1 X195.413 Y142.602 E.0164
G1 X218.151 Y119.864 E.98836
G1 X218.151 Y120.397 E.0164
G1 X195.947 Y142.602 E.96518
G1 X196.48 Y142.602 E.0164
G1 X218.151 Y120.931 E.94199
G1 X218.151 Y121.464 E.0164
G1 X197.014 Y142.602 E.9188
G1 X197.547 Y142.602 E.0164
G1 X218.151 Y121.998 E.89561
G1 X218.151 Y122.531 E.0164
G1 X198.08 Y142.602 E.87243
G1 X198.614 Y142.602 E.0164
G1 X218.151 Y123.065 E.84924
G1 X218.151 Y123.598 E.0164
G1 X199.147 Y142.602 E.82605
G1 X199.681 Y142.602 E.0164
G1 X218.151 Y124.131 E.80287
G1 X218.151 Y124.665 E.0164
G1 X200.214 Y142.602 E.77968
G1 X200.748 Y142.602 E.0164
G1 X218.151 Y125.198 E.75649
G1 X218.151 Y125.732 E.0164
G1 X201.281 Y142.602 E.73331
G1 X201.814 Y142.602 E.0164
G1 X218.151 Y126.265 E.71012
G1 X218.151 Y126.799 E.0164
G1 X202.348 Y142.602 E.68693
G1 X202.881 Y142.602 E.0164
G1 X218.151 Y127.332 E.66375
G1 X218.151 Y127.865 E.0164
G1 X203.415 Y142.602 E.64056
G1 X203.948 Y142.602 E.0164
G1 X218.151 Y128.399 E.61737
G1 X218.151 Y128.932 E.0164
G1 X204.482 Y142.602 E.59419
G1 X205.015 Y142.602 E.0164
G1 X218.151 Y129.466 E.571
G1 X218.151 Y129.999 E.0164
G1 X205.548 Y142.602 E.54781
G1 X206.082 Y142.602 E.0164
G1 X218.151 Y130.533 E.52463
G1 X218.151 Y131.066 E.0164
G1 X206.615 Y142.602 E.50144
G1 X207.149 Y142.602 E.0164
G1 X218.151 Y131.599 E.47825
G1 X218.151 Y132.133 E.0164
G1 X207.682 Y142.602 E.45507
G1 X208.216 Y142.602 E.0164
G1 X218.151 Y132.666 E.43188
G1 X218.151 Y133.2 E.0164
G1 X208.749 Y142.602 E.40869
G1 X209.282 Y142.602 E.0164
G1 X218.151 Y133.733 E.38551
G1 X218.151 Y134.267 E.0164
G1 X209.816 Y142.602 E.36232
G1 X210.349 Y142.602 E.0164
G1 X218.151 Y134.8 E.33913
G1 X218.151 Y135.333 E.0164
G1 X210.883 Y142.602 E.31595
G1 X211.416 Y142.602 E.0164
G1 X218.151 Y135.867 E.29276
G1 X218.151 Y136.4 E.0164
G1 X211.95 Y142.602 E.26957
G1 X212.483 Y142.602 E.0164
G1 X218.151 Y136.934 E.24639
G1 X218.151 Y137.467 E.0164
G1 X213.016 Y142.602 E.2232
G1 X213.55 Y142.602 E.0164
G1 X218.151 Y138.001 E.20001
G1 X218.151 Y138.534 E.0164
G1 X214.083 Y142.602 E.17683
G1 X214.617 Y142.602 E.0164
G1 X218.151 Y139.067 E.15364
G1 X218.151 Y139.601 E.0164
G1 X215.15 Y142.602 E.13045
G1 X215.684 Y142.602 E.0164
G1 X218.151 Y140.134 E.10727
G1 X218.151 Y140.391 E.00791
G1 X218.075 Y140.743 E.01107
G1 X216.072 Y142.746 E.08707
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X217.487 Y141.332 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/35
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.4 I.22 J-1.197 P1  F30000
G1 X36.475 Y108.025 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.247 J5.247 E.19308
G1 X214.285 Y105.852 E5.72448
G1 X214.545 Y105.865 E.00863
G3 X221.698 Y113.265 I-.244 J7.393 E.37757
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I-.001 J-7.412 E.38626
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.42 J.007 E.19108
M204 S250
G1 X36.192 Y107.742 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00027
G3 X41.705 Y105.46 I5.524 J5.524 E.18801
G1 X214.295 Y105.46 E5.3032
G1 X214.564 Y105.473 E.00829
G3 X222.09 Y113.255 I-.258 J7.779 E.36785
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.008 J-7.804 E.37613
G1 X33.91 Y113.255 E.78322
G3 X35.685 Y108.314 I7.812 J.017 E.16454
G1 X36.152 Y107.787 E.02163
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02292
G1 X36.758 Y107.228 E-.29034
G1 X37.372 Y106.773 E-.29051
G1 X37.725 Y106.562 E-.15622
; WIPE_END
G1 E-.04 F1800
G1 X37.47 Y114.19 Z2.6 F30000
G1 X37.438 Y115.146 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X37.438 Y116.775 E.05401
G1 X34.65 Y119.562 E.13077
G1 X34.65 Y117.086 E.08215
G1 X37.438 Y119.874 E.13078
G1 X37.438 Y124.45 E.15181
G1 X34.65 Y127.238 E.13079
G1 X34.65 Y124.762 E.08215
G1 X37.438 Y127.55 E.1308
G1 X37.439 Y132.126 E.15179
G1 X34.65 Y134.914 E.13081
G1 X34.65 Y132.438 E.08215
G1 X37.439 Y135.226 E.13082
G1 X37.439 Y139.801 E.15176
G1 X35.382 Y141.858 E.09649
G3 X34.829 Y140.292 I6.523 J-3.186 E.05522
G1 X40.158 Y145.621 E.25
G3 X39.483 Y145.434 I.615 J-3.522 E.02328
G1 X41.904 Y143.012 E.11359
G1 X45.225 Y143.012 E.11016
G1 X48.012 Y145.8 E.13076
G1 X46.793 Y145.8 E.04046
G1 X49.58 Y143.012 E.13076
G1 X52.901 Y143.012 E.11016
G1 X55.688 Y145.8 E.13076
G1 X54.469 Y145.8 E.04046
G1 X57.256 Y143.012 E.13076
G1 X60.577 Y143.012 E.11016
G1 X63.364 Y145.8 E.13076
G1 X62.145 Y145.8 E.04046
G1 X64.932 Y143.012 E.13076
G1 X68.253 Y143.012 E.11016
G1 X71.04 Y145.8 E.13076
G1 X69.821 Y145.8 E.04046
G1 X72.608 Y143.012 E.13076
G1 X75.929 Y143.012 E.11016
G1 X78.716 Y145.8 E.13076
G1 X77.496 Y145.8 E.04046
G1 X80.284 Y143.012 E.13076
G1 X83.605 Y143.012 E.11016
G1 X86.392 Y145.8 E.13076
G1 X85.172 Y145.8 E.04046
G1 X87.96 Y143.012 E.13076
G1 X91.281 Y143.012 E.11016
G1 X94.068 Y145.8 E.13076
G1 X92.848 Y145.8 E.04046
G1 X95.636 Y143.012 E.13076
G1 X98.957 Y143.012 E.11016
G1 X101.744 Y145.8 E.13076
G1 X100.524 Y145.8 E.04046
G1 X103.312 Y143.012 E.13076
G1 X106.633 Y143.012 E.11016
G1 X109.42 Y145.8 E.13076
G1 X108.2 Y145.8 E.04046
G1 X110.988 Y143.012 E.13076
G1 X114.308 Y143.012 E.11016
G1 X117.096 Y145.8 E.13076
G1 X115.876 Y145.8 E.04046
G1 X118.664 Y143.012 E.13076
G1 X121.984 Y143.012 E.11016
G1 X124.772 Y145.8 E.13076
G1 X123.552 Y145.8 E.04046
G1 X126.34 Y143.012 E.13076
G1 X129.66 Y143.012 E.11016
G1 X132.448 Y145.8 E.13076
G1 X131.228 Y145.8 E.04046
G1 X134.016 Y143.012 E.13076
G1 X137.336 Y143.012 E.11016
G1 X140.124 Y145.8 E.13076
G1 X138.904 Y145.8 E.04046
G1 X141.692 Y143.012 E.13076
G1 X145.012 Y143.012 E.11016
G1 X147.8 Y145.8 E.13076
G1 X146.58 Y145.8 E.04046
G1 X149.367 Y143.012 E.13076
G1 X152.688 Y143.012 E.11016
G1 X155.476 Y145.8 E.13076
G1 X154.256 Y145.8 E.04046
G1 X157.043 Y143.012 E.13076
G1 X160.364 Y143.012 E.11016
G1 X163.152 Y145.8 E.13076
G1 X161.932 Y145.8 E.04046
G1 X164.719 Y143.012 E.13076
G1 X168.04 Y143.012 E.11016
G1 X170.828 Y145.8 E.13076
G1 X169.608 Y145.8 E.04046
G1 X172.395 Y143.012 E.13076
G1 X175.716 Y143.012 E.11016
G1 X178.503 Y145.8 E.13076
G1 X177.284 Y145.8 E.04046
G1 X180.071 Y143.012 E.13076
G1 X183.392 Y143.012 E.11016
G1 X186.179 Y145.8 E.13076
G1 X184.96 Y145.8 E.04046
G1 X187.747 Y143.012 E.13076
G1 X191.068 Y143.012 E.11016
G1 X193.855 Y145.8 E.13076
G1 X192.636 Y145.8 E.04046
G1 X195.423 Y143.012 E.13076
G1 X198.744 Y143.012 E.11016
G1 X201.531 Y145.8 E.13076
G1 X200.312 Y145.8 E.04046
G1 X203.099 Y143.012 E.13076
G1 X206.42 Y143.012 E.11016
G1 X209.207 Y145.8 E.13076
G1 X207.988 Y145.8 E.04046
G1 X210.775 Y143.012 E.13076
G1 X214.096 Y143.012 E.11016
G1 X216.517 Y145.434 E.11359
G3 X215.842 Y145.621 I-1.29 J-3.334 E.02328
G1 X221.171 Y140.292 E.25
G3 X220.618 Y141.858 I-7.077 J-1.621 E.05522
G1 X218.562 Y139.803 E.09642
G1 X218.562 Y135.225 E.15184
G1 X221.35 Y132.438 E.13077
G1 X221.35 Y134.914 E.08215
G1 X218.562 Y132.126 E.13078
G1 X218.562 Y127.55 E.15181
G1 X221.35 Y124.762 E.13079
G1 X221.35 Y127.238 E.08215
G1 X218.562 Y124.45 E.1308
G1 X218.561 Y119.874 E.15179
G1 X221.35 Y117.086 E.13081
G1 X221.35 Y119.562 E.08215
G1 X218.561 Y116.774 E.13082
G1 X218.561 Y112.199 E.15176
G1 X220.618 Y110.142 E.09649
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X215.842 Y106.379 E.25
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X214.096 Y108.988 E.11359
G1 X210.775 Y108.988 E.11016
G1 X207.988 Y106.2 E.13076
G1 X209.207 Y106.2 E.04046
G1 X206.42 Y108.988 E.13076
G1 X203.099 Y108.988 E.11016
G1 X200.312 Y106.2 E.13076
G1 X201.531 Y106.2 E.04046
G1 X198.744 Y108.988 E.13076
G1 X195.423 Y108.988 E.11016
G1 X192.636 Y106.2 E.13076
G1 X193.855 Y106.2 E.04046
G1 X191.068 Y108.988 E.13076
G1 X187.747 Y108.988 E.11016
G1 X184.96 Y106.2 E.13076
G1 X186.179 Y106.2 E.04046
G1 X183.392 Y108.988 E.13076
G1 X180.071 Y108.988 E.11016
G1 X177.284 Y106.2 E.13076
G1 X178.504 Y106.2 E.04046
G1 X175.716 Y108.988 E.13076
G1 X172.395 Y108.988 E.11016
G1 X169.608 Y106.2 E.13076
G1 X170.828 Y106.2 E.04046
G1 X168.04 Y108.988 E.13076
G1 X164.719 Y108.988 E.11016
G1 X161.932 Y106.2 E.13076
G1 X163.152 Y106.2 E.04046
G1 X160.364 Y108.988 E.13076
G1 X157.043 Y108.988 E.11016
G1 X154.256 Y106.2 E.13076
G1 X155.476 Y106.2 E.04046
G1 X152.688 Y108.988 E.13076
G1 X149.367 Y108.988 E.11016
G1 X146.58 Y106.2 E.13076
G1 X147.8 Y106.2 E.04046
G1 X145.012 Y108.988 E.13076
G1 X141.692 Y108.988 E.11016
G1 X138.904 Y106.2 E.13076
G1 X140.124 Y106.2 E.04046
G1 X137.336 Y108.988 E.13076
G1 X134.016 Y108.988 E.11016
G1 X131.228 Y106.2 E.13076
G1 X132.448 Y106.2 E.04046
G1 X129.66 Y108.988 E.13076
G1 X126.34 Y108.988 E.11016
G1 X123.552 Y106.2 E.13076
G1 X124.772 Y106.2 E.04046
G1 X121.984 Y108.988 E.13076
G1 X118.664 Y108.988 E.11016
G1 X115.876 Y106.2 E.13076
G1 X117.096 Y106.2 E.04046
G1 X114.308 Y108.988 E.13076
G1 X110.988 Y108.988 E.11016
G1 X108.2 Y106.2 E.13076
G1 X109.42 Y106.2 E.04046
G1 X106.633 Y108.988 E.13076
G1 X103.312 Y108.988 E.11016
G1 X100.524 Y106.2 E.13076
G1 X101.744 Y106.2 E.04046
G1 X98.957 Y108.988 E.13076
G1 X95.636 Y108.988 E.11016
G1 X92.848 Y106.2 E.13076
G1 X94.068 Y106.2 E.04046
G1 X91.281 Y108.988 E.13076
G1 X87.96 Y108.988 E.11016
G1 X85.172 Y106.2 E.13076
G1 X86.392 Y106.2 E.04046
G1 X83.605 Y108.988 E.13076
G1 X80.284 Y108.988 E.11016
G1 X77.496 Y106.2 E.13076
G1 X78.716 Y106.2 E.04046
G1 X75.929 Y108.988 E.13076
G1 X72.608 Y108.988 E.11016
G1 X69.821 Y106.2 E.13076
G1 X71.04 Y106.2 E.04046
G1 X68.253 Y108.988 E.13076
G1 X64.932 Y108.988 E.11016
G1 X62.145 Y106.2 E.13076
G1 X63.364 Y106.2 E.04046
G1 X60.577 Y108.988 E.13076
G1 X57.256 Y108.988 E.11016
G1 X54.469 Y106.2 E.13076
G1 X55.688 Y106.2 E.04046
G1 X52.901 Y108.988 E.13076
G1 X49.58 Y108.988 E.11016
G1 X46.793 Y106.2 E.13076
G1 X48.012 Y106.2 E.04046
G1 X45.225 Y108.988 E.13076
G1 X41.904 Y108.988 E.11016
G1 X39.483 Y106.566 E.1136
G3 X40.158 Y106.379 I1.29 J3.336 E.02328
G1 X34.829 Y111.708 E.25
G3 X35.382 Y110.142 I7.077 J1.621 E.05522
G1 X37.438 Y112.197 E.09642
G3 X37.705 Y110.609 I3.116 J-.292 E.05404
G1 X39.166 Y142.549 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42023
G1 F15000
G1 X38.46 Y141.844 E.03069
G1 X38.197 Y141.5 E.01331
G1 X38.05 Y141.225 E.00959
G1 X37.894 Y140.743 E.01558
G1 X39.704 Y142.554 E.07873
G1 X39.814 Y142.58 E.00346
G1 X40.304 Y142.62 E.01512
G1 X37.831 Y140.147 E.10752
G1 X37.831 Y139.614 E.01641
G1 X40.838 Y142.62 E.13072
G1 X41.371 Y142.62 E.01641
G1 X37.831 Y139.08 E.15393
G1 X37.831 Y138.546 E.01641
G1 X41.905 Y142.62 E.17713
G1 X42.438 Y142.62 E.01641
G1 X37.831 Y138.013 E.20033
G1 X37.831 Y137.479 E.01641
G1 X42.972 Y142.62 E.22353
G1 X43.506 Y142.62 E.01641
G1 X37.831 Y136.946 E.24674
G1 X37.831 Y136.412 E.01641
G1 X44.039 Y142.62 E.26994
M73 P64 R12
G1 X44.573 Y142.62 E.01641
G1 X37.831 Y135.878 E.29314
G1 X37.831 Y135.345 E.01641
G1 X45.106 Y142.62 E.31634
G1 X45.64 Y142.62 E.01641
G1 X37.831 Y134.811 E.33955
G1 X37.831 Y134.278 E.01641
G1 X46.174 Y142.62 E.36275
G1 X46.707 Y142.62 E.01641
G1 X37.831 Y133.744 E.38595
G1 X37.831 Y133.21 E.01641
G1 X47.241 Y142.62 E.40915
G1 X47.774 Y142.62 E.01641
G1 X37.831 Y132.677 E.43236
G1 X37.831 Y132.143 E.01641
G1 X48.308 Y142.62 E.45556
G1 X48.842 Y142.62 E.01641
G1 X37.831 Y131.609 E.47876
G1 X37.831 Y131.076 E.01641
G1 X49.375 Y142.62 E.50197
G1 X49.909 Y142.62 E.01641
G1 X37.831 Y130.542 E.52517
G1 X37.831 Y130.009 E.01641
G1 X50.442 Y142.62 E.54837
G1 X50.976 Y142.62 E.01641
G1 X37.831 Y129.475 E.57157
G1 X37.831 Y128.941 E.01641
G1 X51.51 Y142.62 E.59478
G1 X52.043 Y142.62 E.01641
G1 X37.831 Y128.408 E.61798
G1 X37.831 Y127.874 E.01641
G1 X52.577 Y142.62 E.64118
G1 X53.11 Y142.62 E.01641
G1 X37.831 Y127.34 E.66438
G1 X37.831 Y126.807 E.01641
G1 X53.644 Y142.62 E.68759
G1 X54.178 Y142.62 E.01641
G1 X37.831 Y126.273 E.71079
G1 X37.831 Y125.74 E.01641
G1 X54.711 Y142.62 E.73399
G1 X55.245 Y142.62 E.01641
G1 X37.831 Y125.206 E.75719
G1 X37.831 Y124.672 E.01641
G1 X55.778 Y142.62 E.7804
G1 X56.312 Y142.62 E.01641
G1 X37.83 Y124.139 E.8036
G1 X37.83 Y123.605 E.01641
G1 X56.846 Y142.62 E.8268
G1 X57.379 Y142.62 E.01641
G1 X37.83 Y123.071 E.85001
G1 X37.83 Y122.538 E.01641
G1 X57.913 Y142.62 E.87321
G1 X58.446 Y142.62 E.01641
G1 X37.83 Y122.004 E.89641
G1 X37.83 Y121.471 E.01641
G1 X58.98 Y142.62 E.91961
G1 X59.514 Y142.62 E.01641
G1 X37.83 Y120.937 E.94282
G1 X37.83 Y120.403 E.01641
G1 X60.047 Y142.62 E.96602
G1 X60.581 Y142.62 E.01641
G1 X37.83 Y119.87 E.98922
G1 X37.83 Y119.336 E.01641
G1 X61.114 Y142.62 E1.01242
G1 X61.648 Y142.62 E.01641
G1 X37.83 Y118.802 E1.03563
G1 X37.83 Y118.269 E.01641
G1 X62.182 Y142.62 E1.05883
G1 X62.715 Y142.62 E.01641
G1 X37.83 Y117.735 E1.08203
G1 X37.83 Y117.202 E.01641
G1 X63.249 Y142.62 E1.10523
G1 X63.782 Y142.62 E.01641
G1 X37.83 Y116.668 E1.12844
G1 X37.83 Y116.134 E.01641
G1 X64.316 Y142.62 E1.15164
G1 X64.849 Y142.62 E.01641
G1 X37.83 Y115.601 E1.17484
G1 X37.83 Y115.067 E.01641
G1 X65.383 Y142.62 E1.19805
G1 X65.917 Y142.62 E.01641
G1 X37.83 Y114.533 E1.22125
G1 X37.83 Y114 E.01641
G1 X66.45 Y142.62 E1.24445
G1 X66.984 Y142.62 E.01641
G1 X37.83 Y113.466 E1.26765
G1 X37.83 Y112.933 E.01641
G1 X67.517 Y142.62 E1.29086
G1 X68.051 Y142.62 E.01641
G1 X37.83 Y112.399 E1.31406
G1 X37.83 Y111.865 E.01641
G1 X68.585 Y142.62 E1.33726
G1 X69.118 Y142.62 E.01641
G1 X37.87 Y111.371 E1.35874
G1 X37.981 Y110.95 E.01342
G1 X69.652 Y142.62 E1.37708
G1 X70.185 Y142.62 E.01641
G1 X38.153 Y110.588 E1.39281
G1 X38.197 Y110.5 E.00301
G1 X38.371 Y110.272 E.00882
G1 X70.719 Y142.62 E1.40653
G1 X71.253 Y142.62 E.01641
G1 X38.632 Y110 E1.41839
G1 X38.826 Y109.83 E.00792
G1 X38.933 Y109.767 E.00383
G1 X71.786 Y142.62 E1.42849
G1 X72.32 Y142.62 E.01641
G1 X39.28 Y109.581 E1.4366
G1 X39.667 Y109.45 E.01256
G1 X72.853 Y142.62 E1.44264
G1 X73.387 Y142.62 E.01641
G1 X40.152 Y109.385 E1.44512
G1 X40.68 Y109.38 E.01626
G1 X73.921 Y142.62 E1.44533
G1 X74.454 Y142.62 E.01641
G1 X41.214 Y109.38 E1.44533
G1 X41.748 Y109.38 E.01641
G1 X74.988 Y142.62 E1.44533
G1 X75.521 Y142.62 E.01641
G1 X42.281 Y109.38 E1.44533
G1 X42.815 Y109.38 E.01641
G1 X76.055 Y142.62 E1.44533
G1 X76.589 Y142.62 E.01641
G1 X43.348 Y109.38 E1.44533
G1 X43.882 Y109.38 E.01641
G1 X77.122 Y142.62 E1.44533
G1 X77.656 Y142.62 E.01641
G1 X44.416 Y109.38 E1.44533
G1 X44.949 Y109.38 E.01641
G1 X78.189 Y142.62 E1.44533
G1 X78.723 Y142.62 E.01641
G1 X45.483 Y109.38 E1.44533
G1 X46.016 Y109.38 E.01641
G1 X79.257 Y142.62 E1.44533
G1 X79.79 Y142.62 E.01641
G1 X46.55 Y109.38 E1.44533
G1 X47.084 Y109.38 E.01641
G1 X80.324 Y142.62 E1.44533
G1 X80.857 Y142.62 E.01641
G1 X47.617 Y109.38 E1.44533
G1 X48.151 Y109.38 E.01641
G1 X81.391 Y142.62 E1.44533
G1 X81.925 Y142.62 E.01641
G1 X48.684 Y109.38 E1.44533
G1 X49.218 Y109.38 E.01641
G1 X82.458 Y142.62 E1.44533
G1 X82.992 Y142.62 E.01641
G1 X49.752 Y109.38 E1.44533
G1 X50.285 Y109.38 E.01641
G1 X83.525 Y142.62 E1.44533
G1 X84.059 Y142.62 E.01641
G1 X50.819 Y109.38 E1.44533
G1 X51.352 Y109.38 E.01641
G1 X84.593 Y142.62 E1.44533
G1 X85.126 Y142.62 E.01641
G1 X51.886 Y109.38 E1.44533
G1 X52.419 Y109.38 E.01641
G1 X85.66 Y142.62 E1.44533
G1 X86.193 Y142.62 E.01641
G1 X52.953 Y109.38 E1.44533
G1 X53.487 Y109.38 E.01641
G1 X86.727 Y142.62 E1.44533
G1 X87.261 Y142.62 E.01641
G1 X54.02 Y109.38 E1.44533
G1 X54.554 Y109.38 E.01641
G1 X87.794 Y142.62 E1.44533
G1 X88.328 Y142.62 E.01641
G1 X55.087 Y109.38 E1.44533
G1 X55.621 Y109.38 E.01641
G1 X88.861 Y142.62 E1.44533
G1 X89.395 Y142.62 E.01641
G1 X56.155 Y109.38 E1.44533
G1 X56.688 Y109.38 E.01641
G1 X89.929 Y142.62 E1.44533
G1 X90.462 Y142.62 E.01641
G1 X57.222 Y109.38 E1.44533
G1 X57.755 Y109.38 E.01641
G1 X90.996 Y142.62 E1.44533
G1 X91.529 Y142.62 E.01641
G1 X58.289 Y109.38 E1.44533
G1 X58.823 Y109.38 E.01641
G1 X92.063 Y142.62 E1.44533
G1 X92.597 Y142.62 E.01641
G1 X59.356 Y109.38 E1.44533
G1 X59.89 Y109.38 E.01641
G1 X93.13 Y142.62 E1.44533
G1 X93.664 Y142.62 E.01641
G1 X60.423 Y109.38 E1.44533
G1 X60.957 Y109.38 E.01641
G1 X94.197 Y142.62 E1.44533
G1 X94.731 Y142.62 E.01641
G1 X61.491 Y109.38 E1.44533
G1 X62.024 Y109.38 E.01641
G1 X95.265 Y142.62 E1.44533
G1 X95.798 Y142.62 E.01641
G1 X62.558 Y109.38 E1.44533
G1 X63.091 Y109.38 E.01641
G1 X96.332 Y142.62 E1.44533
G1 X96.865 Y142.62 E.01641
G1 X63.625 Y109.38 E1.44533
G1 X64.159 Y109.38 E.01641
G1 X97.399 Y142.62 E1.44533
G1 X97.933 Y142.62 E.01641
G1 X64.692 Y109.38 E1.44533
G1 X65.226 Y109.38 E.01641
G1 X98.466 Y142.62 E1.44533
G1 X99 Y142.62 E.01641
G1 X65.759 Y109.38 E1.44533
G1 X66.293 Y109.38 E.01641
G1 X99.533 Y142.62 E1.44533
G1 X100.067 Y142.62 E.01641
G1 X66.827 Y109.38 E1.44533
G1 X67.36 Y109.38 E.01641
G1 X100.6 Y142.62 E1.44533
G1 X101.134 Y142.62 E.01641
G1 X67.894 Y109.38 E1.44533
G1 X68.427 Y109.38 E.01641
G1 X101.668 Y142.62 E1.44533
G1 X102.201 Y142.62 E.01641
G1 X68.961 Y109.38 E1.44533
G1 X69.495 Y109.38 E.01641
G1 X102.735 Y142.62 E1.44533
G1 X103.268 Y142.62 E.01641
G1 X70.028 Y109.38 E1.44533
G1 X70.562 Y109.38 E.01641
G1 X103.802 Y142.62 E1.44533
G1 X104.336 Y142.62 E.01641
G1 X71.095 Y109.38 E1.44533
G1 X71.629 Y109.38 E.01641
G1 X104.869 Y142.62 E1.44533
G1 X105.403 Y142.62 E.01641
G1 X72.163 Y109.38 E1.44533
G1 X72.696 Y109.38 E.01641
G1 X105.936 Y142.62 E1.44533
G1 X106.47 Y142.62 E.01641
G1 X73.23 Y109.38 E1.44533
G1 X73.763 Y109.38 E.01641
G1 X107.004 Y142.62 E1.44533
G1 X107.537 Y142.62 E.01641
G1 X74.297 Y109.38 E1.44533
G1 X74.831 Y109.38 E.01641
G1 X108.071 Y142.62 E1.44533
G1 X108.604 Y142.62 E.01641
G1 X75.364 Y109.38 E1.44533
G1 X75.898 Y109.38 E.01641
G1 X109.138 Y142.62 E1.44533
G1 X109.672 Y142.62 E.01641
G1 X76.431 Y109.38 E1.44533
G1 X76.965 Y109.38 E.01641
G1 X110.205 Y142.62 E1.44533
G1 X110.739 Y142.62 E.01641
G1 X77.499 Y109.38 E1.44533
G1 X78.032 Y109.38 E.01641
G1 X111.272 Y142.62 E1.44533
G1 X111.806 Y142.62 E.01641
G1 X78.566 Y109.38 E1.44533
G1 X79.099 Y109.38 E.01641
G1 X112.34 Y142.62 E1.44533
G1 X112.873 Y142.62 E.01641
G1 X79.633 Y109.38 E1.44533
M73 P65 R12
G1 X80.167 Y109.38 E.01641
G1 X113.407 Y142.62 E1.44533
G1 X113.94 Y142.62 E.01641
G1 X80.7 Y109.38 E1.44533
G1 X81.234 Y109.38 E.01641
G1 X114.474 Y142.62 E1.44533
G1 X115.008 Y142.62 E.01641
G1 X81.767 Y109.38 E1.44533
G1 X82.301 Y109.38 E.01641
G1 X115.541 Y142.62 E1.44533
G1 X116.075 Y142.62 E.01641
G1 X82.835 Y109.38 E1.44533
G1 X83.368 Y109.38 E.01641
G1 X116.608 Y142.62 E1.44533
G1 X117.142 Y142.62 E.01641
G1 X83.902 Y109.38 E1.44533
G1 X84.435 Y109.38 E.01641
G1 X117.676 Y142.62 E1.44533
G1 X118.209 Y142.62 E.01641
G1 X84.969 Y109.38 E1.44533
G1 X85.503 Y109.38 E.01641
G1 X118.743 Y142.62 E1.44533
G1 X119.276 Y142.62 E.01641
G1 X86.036 Y109.38 E1.44533
G1 X86.57 Y109.38 E.01641
G1 X119.81 Y142.62 E1.44533
G1 X120.344 Y142.62 E.01641
G1 X87.103 Y109.38 E1.44533
G1 X87.637 Y109.38 E.01641
G1 X120.877 Y142.62 E1.44533
G1 X121.411 Y142.62 E.01641
G1 X88.17 Y109.38 E1.44533
G1 X88.704 Y109.38 E.01641
G1 X121.944 Y142.62 E1.44533
G1 X122.478 Y142.62 E.01641
G1 X89.238 Y109.38 E1.44533
G1 X89.771 Y109.38 E.01641
G1 X123.012 Y142.62 E1.44533
G1 X123.545 Y142.62 E.01641
G1 X90.305 Y109.38 E1.44533
G1 X90.838 Y109.38 E.01641
G1 X124.079 Y142.62 E1.44533
G1 X124.612 Y142.62 E.01641
G1 X91.372 Y109.38 E1.44533
G1 X91.906 Y109.38 E.01641
G1 X125.146 Y142.62 E1.44533
G1 X125.68 Y142.62 E.01641
G1 X92.439 Y109.38 E1.44533
G1 X92.973 Y109.38 E.01641
G1 X126.213 Y142.62 E1.44533
G1 X126.747 Y142.62 E.01641
G1 X93.506 Y109.38 E1.44533
G1 X94.04 Y109.38 E.01641
G1 X127.28 Y142.62 E1.44533
G1 X127.814 Y142.62 E.01641
G1 X94.574 Y109.38 E1.44533
G1 X95.107 Y109.38 E.01641
G1 X128.348 Y142.62 E1.44533
G1 X128.881 Y142.62 E.01641
G1 X95.641 Y109.38 E1.44533
G1 X96.174 Y109.38 E.01641
G1 X129.415 Y142.62 E1.44533
G1 X129.948 Y142.62 E.01641
G1 X96.708 Y109.38 E1.44533
G1 X97.242 Y109.38 E.01641
G1 X130.482 Y142.62 E1.44533
G1 X131.016 Y142.62 E.01641
G1 X97.775 Y109.38 E1.44533
G1 X98.309 Y109.38 E.01641
G1 X131.549 Y142.62 E1.44533
G1 X132.083 Y142.62 E.01641
G1 X98.842 Y109.38 E1.44533
G1 X99.376 Y109.38 E.01641
G1 X132.616 Y142.62 E1.44533
G1 X133.15 Y142.62 E.01641
G1 X99.91 Y109.38 E1.44533
G1 X100.443 Y109.38 E.01641
G1 X133.684 Y142.62 E1.44533
M73 P65 R11
G1 X134.217 Y142.62 E.01641
G1 X100.977 Y109.38 E1.44533
G1 X101.51 Y109.38 E.01641
G1 X134.751 Y142.62 E1.44533
G1 X135.284 Y142.62 E.01641
G1 X102.044 Y109.38 E1.44533
G1 X102.578 Y109.38 E.01641
G1 X135.818 Y142.62 E1.44533
G1 X136.351 Y142.62 E.01641
G1 X103.111 Y109.38 E1.44533
G1 X103.645 Y109.38 E.01641
G1 X136.885 Y142.62 E1.44533
G1 X137.419 Y142.62 E.01641
G1 X104.178 Y109.38 E1.44533
G1 X104.712 Y109.38 E.01641
G1 X137.952 Y142.62 E1.44533
G1 X138.486 Y142.62 E.01641
G1 X105.246 Y109.38 E1.44533
G1 X105.779 Y109.38 E.01641
G1 X139.019 Y142.62 E1.44533
G1 X139.553 Y142.62 E.01641
G1 X106.313 Y109.38 E1.44533
G1 X106.846 Y109.38 E.01641
G1 X140.087 Y142.62 E1.44533
G1 X140.62 Y142.62 E.01641
G1 X107.38 Y109.38 E1.44533
G1 X107.914 Y109.38 E.01641
G1 X141.154 Y142.62 E1.44533
G1 X141.687 Y142.62 E.01641
G1 X108.447 Y109.38 E1.44533
G1 X108.981 Y109.38 E.01641
G1 X142.221 Y142.62 E1.44533
G1 X142.755 Y142.62 E.01641
G1 X109.514 Y109.38 E1.44533
G1 X110.048 Y109.38 E.01641
G1 X143.288 Y142.62 E1.44533
G1 X143.822 Y142.62 E.01641
G1 X110.582 Y109.38 E1.44533
G1 X111.115 Y109.38 E.01641
G1 X144.355 Y142.62 E1.44533
G1 X144.889 Y142.62 E.01641
G1 X111.649 Y109.38 E1.44533
G1 X112.182 Y109.38 E.01641
G1 X145.423 Y142.62 E1.44533
G1 X145.956 Y142.62 E.01641
G1 X112.716 Y109.38 E1.44533
G1 X113.25 Y109.38 E.01641
G1 X146.49 Y142.62 E1.44533
G1 X147.023 Y142.62 E.01641
G1 X113.783 Y109.38 E1.44533
G1 X114.317 Y109.38 E.01641
G1 X147.557 Y142.62 E1.44533
G1 X148.091 Y142.62 E.01641
G1 X114.85 Y109.38 E1.44533
G1 X115.384 Y109.38 E.01641
G1 X148.624 Y142.62 E1.44533
G1 X149.158 Y142.62 E.01641
G1 X115.918 Y109.38 E1.44533
G1 X116.451 Y109.38 E.01641
G1 X149.691 Y142.62 E1.44533
G1 X150.225 Y142.62 E.01641
G1 X116.985 Y109.38 E1.44533
G1 X117.518 Y109.38 E.01641
G1 X150.759 Y142.62 E1.44533
G1 X151.292 Y142.62 E.01641
G1 X118.052 Y109.38 E1.44533
G1 X118.586 Y109.38 E.01641
G1 X151.826 Y142.62 E1.44533
G1 X152.359 Y142.62 E.01641
G1 X119.119 Y109.38 E1.44533
G1 X119.653 Y109.38 E.01641
G1 X152.893 Y142.62 E1.44533
G1 X153.427 Y142.62 E.01641
G1 X120.186 Y109.38 E1.44533
G1 X120.72 Y109.38 E.01641
G1 X153.96 Y142.62 E1.44533
G1 X154.494 Y142.62 E.01641
G1 X121.253 Y109.38 E1.44533
G1 X121.787 Y109.38 E.01641
G1 X155.027 Y142.62 E1.44533
G1 X155.561 Y142.62 E.01641
G1 X122.321 Y109.38 E1.44533
G1 X122.854 Y109.38 E.01641
G1 X156.095 Y142.62 E1.44533
G1 X156.628 Y142.62 E.01641
G1 X123.388 Y109.38 E1.44533
G1 X123.921 Y109.38 E.01641
G1 X157.162 Y142.62 E1.44533
G1 X157.695 Y142.62 E.01641
G1 X124.455 Y109.38 E1.44533
G1 X124.989 Y109.38 E.01641
G1 X158.229 Y142.62 E1.44533
G1 X158.763 Y142.62 E.01641
G1 X125.522 Y109.38 E1.44533
G1 X126.056 Y109.38 E.01641
G1 X159.296 Y142.62 E1.44533
G1 X159.83 Y142.62 E.01641
G1 X126.589 Y109.38 E1.44533
G1 X127.123 Y109.38 E.01641
G1 X160.363 Y142.62 E1.44533
G1 X160.897 Y142.62 E.01641
G1 X127.657 Y109.38 E1.44533
G1 X128.19 Y109.38 E.01641
G1 X161.431 Y142.62 E1.44533
G1 X161.964 Y142.62 E.01641
G1 X128.724 Y109.38 E1.44533
G1 X129.257 Y109.38 E.01641
G1 X162.498 Y142.62 E1.44533
M73 P66 R11
G1 X163.031 Y142.62 E.01641
G1 X129.791 Y109.38 E1.44533
G1 X130.325 Y109.38 E.01641
G1 X163.565 Y142.62 E1.44533
G1 X164.099 Y142.62 E.01641
G1 X130.858 Y109.38 E1.44533
G1 X131.392 Y109.38 E.01641
G1 X164.632 Y142.62 E1.44533
G1 X165.166 Y142.62 E.01641
G1 X131.925 Y109.38 E1.44533
G1 X132.459 Y109.38 E.01641
G1 X165.699 Y142.62 E1.44533
G1 X166.233 Y142.62 E.01641
G1 X132.993 Y109.38 E1.44533
G1 X133.526 Y109.38 E.01641
G1 X166.767 Y142.62 E1.44533
G1 X167.3 Y142.62 E.01641
G1 X134.06 Y109.38 E1.44533
G1 X134.593 Y109.38 E.01641
G1 X167.834 Y142.62 E1.44533
G1 X168.367 Y142.62 E.01641
G1 X135.127 Y109.38 E1.44533
G1 X135.661 Y109.38 E.01641
G1 X168.901 Y142.62 E1.44533
G1 X169.434 Y142.62 E.01641
G1 X136.194 Y109.38 E1.44533
G1 X136.728 Y109.38 E.01641
G1 X169.968 Y142.62 E1.44533
G1 X170.502 Y142.62 E.01641
G1 X137.261 Y109.38 E1.44533
G1 X137.795 Y109.38 E.01641
G1 X171.035 Y142.62 E1.44533
G1 X171.569 Y142.62 E.01641
G1 X138.329 Y109.38 E1.44533
G1 X138.862 Y109.38 E.01641
G1 X172.102 Y142.62 E1.44533
G1 X172.636 Y142.62 E.01641
G1 X139.396 Y109.38 E1.44533
G1 X139.929 Y109.38 E.01641
G1 X173.17 Y142.62 E1.44533
G1 X173.703 Y142.62 E.01641
G1 X140.463 Y109.38 E1.44533
G1 X140.997 Y109.38 E.01641
G1 X174.237 Y142.62 E1.44533
G1 X174.77 Y142.62 E.01641
G1 X141.53 Y109.38 E1.44533
G1 X142.064 Y109.38 E.01641
G1 X175.304 Y142.62 E1.44533
G1 X175.838 Y142.62 E.01641
G1 X142.597 Y109.38 E1.44533
G1 X143.131 Y109.38 E.01641
G1 X176.371 Y142.62 E1.44533
G1 X176.905 Y142.62 E.01641
G1 X143.665 Y109.38 E1.44533
G1 X144.198 Y109.38 E.01641
G1 X177.438 Y142.62 E1.44533
G1 X177.972 Y142.62 E.01641
G1 X144.732 Y109.38 E1.44533
G1 X145.265 Y109.38 E.01641
G1 X178.506 Y142.62 E1.44533
G1 X179.039 Y142.62 E.01641
G1 X145.799 Y109.38 E1.44533
G1 X146.333 Y109.38 E.01641
G1 X179.573 Y142.62 E1.44533
G1 X180.106 Y142.62 E.01641
G1 X146.866 Y109.38 E1.44533
G1 X147.4 Y109.38 E.01641
G1 X180.64 Y142.62 E1.44533
G1 X181.174 Y142.62 E.01641
G1 X147.933 Y109.38 E1.44533
G1 X148.467 Y109.38 E.01641
G1 X181.707 Y142.62 E1.44533
G1 X182.241 Y142.62 E.01641
G1 X149.001 Y109.38 E1.44533
G1 X149.534 Y109.38 E.01641
G1 X182.774 Y142.62 E1.44533
G1 X183.308 Y142.62 E.01641
G1 X150.068 Y109.38 E1.44533
G1 X150.601 Y109.38 E.01641
G1 X183.842 Y142.62 E1.44533
G1 X184.375 Y142.62 E.01641
G1 X151.135 Y109.38 E1.44533
G1 X151.669 Y109.38 E.01641
G1 X184.909 Y142.62 E1.44533
G1 X185.442 Y142.62 E.01641
G1 X152.202 Y109.38 E1.44533
G1 X152.736 Y109.38 E.01641
G1 X185.976 Y142.62 E1.44533
G1 X186.51 Y142.62 E.01641
G1 X153.269 Y109.38 E1.44533
G1 X153.803 Y109.38 E.01641
G1 X187.043 Y142.62 E1.44533
G1 X187.577 Y142.62 E.01641
G1 X154.337 Y109.38 E1.44533
G1 X154.87 Y109.38 E.01641
G1 X188.11 Y142.62 E1.44533
G1 X188.644 Y142.62 E.01641
G1 X155.404 Y109.38 E1.44533
G1 X155.937 Y109.38 E.01641
G1 X189.178 Y142.62 E1.44533
G1 X189.711 Y142.62 E.01641
G1 X156.471 Y109.38 E1.44533
G1 X157.004 Y109.38 E.01641
G1 X190.245 Y142.62 E1.44533
G1 X190.778 Y142.62 E.01641
G1 X157.538 Y109.38 E1.44533
G1 X158.072 Y109.38 E.01641
G1 X191.312 Y142.62 E1.44533
G1 X191.846 Y142.62 E.01641
G1 X158.605 Y109.38 E1.44533
G1 X159.139 Y109.38 E.01641
G1 X192.379 Y142.62 E1.44533
G1 X192.913 Y142.62 E.01641
G1 X159.672 Y109.38 E1.44533
G1 X160.206 Y109.38 E.01641
G1 X193.446 Y142.62 E1.44533
G1 X193.98 Y142.62 E.01641
G1 X160.74 Y109.38 E1.44533
G1 X161.273 Y109.38 E.01641
G1 X194.514 Y142.62 E1.44533
G1 X195.047 Y142.62 E.01641
G1 X161.807 Y109.38 E1.44533
G1 X162.34 Y109.38 E.01641
G1 X195.581 Y142.62 E1.44533
G1 X196.114 Y142.62 E.01641
G1 X162.874 Y109.38 E1.44533
G1 X163.408 Y109.38 E.01641
G1 X196.648 Y142.62 E1.44533
G1 X197.182 Y142.62 E.01641
G1 X163.941 Y109.38 E1.44533
G1 X164.475 Y109.38 E.01641
G1 X197.715 Y142.62 E1.44533
G1 X198.249 Y142.62 E.01641
G1 X165.008 Y109.38 E1.44533
G1 X165.542 Y109.38 E.01641
G1 X198.782 Y142.62 E1.44533
G1 X199.316 Y142.62 E.01641
G1 X166.076 Y109.38 E1.44533
G1 X166.609 Y109.38 E.01641
G1 X199.85 Y142.62 E1.44533
G1 X200.383 Y142.62 E.01641
G1 X167.143 Y109.38 E1.44533
G1 X167.676 Y109.38 E.01641
G1 X200.917 Y142.62 E1.44533
G1 X201.45 Y142.62 E.01641
G1 X168.21 Y109.38 E1.44533
G1 X168.744 Y109.38 E.01641
G1 X201.984 Y142.62 E1.44533
G1 X202.518 Y142.62 E.01641
G1 X169.277 Y109.38 E1.44533
G1 X169.811 Y109.38 E.01641
G1 X203.051 Y142.62 E1.44533
G1 X203.585 Y142.62 E.01641
G1 X170.344 Y109.38 E1.44533
G1 X170.878 Y109.38 E.01641
G1 X204.118 Y142.62 E1.44533
G1 X204.652 Y142.62 E.01641
G1 X171.412 Y109.38 E1.44533
G1 X171.945 Y109.38 E.01641
G1 X205.185 Y142.62 E1.44533
G1 X205.719 Y142.62 E.01641
G1 X172.479 Y109.38 E1.44533
G1 X173.012 Y109.38 E.01641
G1 X206.253 Y142.62 E1.44533
G1 X206.786 Y142.62 E.01641
G1 X173.546 Y109.38 E1.44533
G1 X174.08 Y109.38 E.01641
G1 X207.32 Y142.62 E1.44533
G1 X207.853 Y142.62 E.01641
G1 X174.613 Y109.38 E1.44533
G1 X175.147 Y109.38 E.01641
G1 X208.387 Y142.62 E1.44533
G1 X208.921 Y142.62 E.01641
G1 X175.68 Y109.38 E1.44533
G1 X176.214 Y109.38 E.01641
G1 X209.454 Y142.62 E1.44533
G1 X209.988 Y142.62 E.01641
G1 X176.748 Y109.38 E1.44533
G1 X177.281 Y109.38 E.01641
G1 X210.521 Y142.62 E1.44533
G1 X211.055 Y142.62 E.01641
G1 X177.815 Y109.38 E1.44533
G1 X178.348 Y109.38 E.01641
G1 X211.589 Y142.62 E1.44533
G1 X212.122 Y142.62 E.01641
G1 X178.882 Y109.38 E1.44533
M73 P67 R11
G1 X179.416 Y109.38 E.01641
G1 X212.656 Y142.62 E1.44533
G1 X213.189 Y142.62 E.01641
G1 X179.949 Y109.38 E1.44533
G1 X180.483 Y109.38 E.01641
G1 X213.723 Y142.62 E1.44533
G1 X214.257 Y142.62 E.01641
G1 X181.016 Y109.38 E1.44533
G1 X181.55 Y109.38 E.01641
G1 X214.79 Y142.62 E1.44533
G1 X215.324 Y142.62 E.01641
G1 X182.084 Y109.38 E1.44533
G1 X182.617 Y109.38 E.01641
G1 X215.853 Y142.616 E1.44514
G1 X216.186 Y142.58 E.01031
G1 X216.316 Y142.545 E.00412
G1 X183.151 Y109.38 E1.44207
G1 X183.684 Y109.38 E.01641
G1 X216.723 Y142.419 E1.43657
G1 X216.911 Y142.334 E.00634
G1 X217.067 Y142.229 E.00579
G1 X184.218 Y109.38 E1.42834
G1 X184.752 Y109.38 E.01641
G1 X217.373 Y142.001 E1.41842
G1 X217.636 Y141.731 E.0116
G1 X185.285 Y109.38 E1.40668
G1 X185.819 Y109.38 E.01641
G1 X217.85 Y141.411 E1.39277
G1 X218.015 Y141.043 E.01241
G1 X186.352 Y109.38 E1.37676
G1 X186.886 Y109.38 E.01641
G1 X218.131 Y140.625 E1.35857
G1 X218.17 Y140.13 E.01524
G1 X187.42 Y109.38 E1.33708
G1 X187.953 Y109.38 E.01641
G1 X218.17 Y139.597 E1.31388
G1 X218.17 Y139.063 E.01641
G1 X188.487 Y109.38 E1.29067
G1 X189.02 Y109.38 E.01641
G1 X218.17 Y138.53 E1.26747
G1 X218.17 Y137.996 E.01641
G1 X189.554 Y109.38 E1.24427
G1 X190.087 Y109.38 E.01641
G1 X218.17 Y137.462 E1.22107
G1 X218.17 Y136.929 E.01641
G1 X190.621 Y109.38 E1.19786
G1 X191.155 Y109.38 E.01641
G1 X218.17 Y136.395 E1.17466
G1 X218.17 Y135.861 E.01641
G1 X191.688 Y109.38 E1.15146
G1 X192.222 Y109.38 E.01641
G1 X218.17 Y135.328 E1.12826
G1 X218.17 Y134.794 E.01641
G1 X192.755 Y109.38 E1.10505
G1 X193.289 Y109.38 E.01641
G1 X218.17 Y134.261 E1.08185
G1 X218.17 Y133.727 E.01641
G1 X193.823 Y109.38 E1.05865
G1 X194.356 Y109.38 E.01641
G1 X218.17 Y133.193 E1.03544
G1 X218.17 Y132.66 E.01641
G1 X194.89 Y109.38 E1.01224
G1 X195.423 Y109.38 E.01641
G1 X218.17 Y132.126 E.98904
G1 X218.17 Y131.592 E.01641
G1 X195.957 Y109.38 E.96584
G1 X196.491 Y109.38 E.01641
G1 X218.17 Y131.059 E.94263
G1 X218.17 Y130.525 E.01641
G1 X197.024 Y109.38 E.91943
G1 X197.558 Y109.38 E.01641
G1 X218.17 Y129.992 E.89623
G1 X218.17 Y129.458 E.01641
G1 X198.091 Y109.38 E.87303
G1 X198.625 Y109.38 E.01641
G1 X218.17 Y128.924 E.84982
G1 X218.17 Y128.391 E.01641
G1 X199.159 Y109.38 E.82662
G1 X199.692 Y109.38 E.01641
G1 X218.17 Y127.857 E.80342
G1 X218.169 Y127.324 E.01641
G1 X200.226 Y109.38 E.78021
G1 X200.759 Y109.38 E.01641
G1 X218.169 Y126.79 E.75701
G1 X218.169 Y126.256 E.01641
G1 X201.293 Y109.38 E.73381
G1 X201.827 Y109.38 E.01641
G1 X218.169 Y125.723 E.71061
G1 X218.169 Y125.189 E.01641
G1 X202.36 Y109.38 E.6874
G1 X202.894 Y109.38 E.01641
G1 X218.169 Y124.655 E.6642
G1 X218.169 Y124.122 E.01641
G1 X203.427 Y109.38 E.641
G1 X203.961 Y109.38 E.01641
G1 X218.169 Y123.588 E.6178
G1 X218.169 Y123.055 E.01641
G1 X204.495 Y109.38 E.59459
G1 X205.028 Y109.38 E.01641
G1 X218.169 Y122.521 E.57139
G1 X218.169 Y121.987 E.01641
G1 X205.562 Y109.38 E.54819
G1 X206.095 Y109.38 E.01641
G1 X218.169 Y121.454 E.52499
G1 X218.169 Y120.92 E.01641
G1 X206.629 Y109.38 E.50178
G1 X207.163 Y109.38 E.01641
G1 X218.169 Y120.386 E.47858
G1 X218.169 Y119.853 E.01641
G1 X207.696 Y109.38 E.45538
G1 X208.23 Y109.38 E.01641
G1 X218.169 Y119.319 E.43217
G1 X218.169 Y118.786 E.01641
G1 X208.763 Y109.38 E.40897
G1 X209.297 Y109.38 E.01641
G1 X218.169 Y118.252 E.38577
G1 X218.169 Y117.718 E.01641
G1 X209.831 Y109.38 E.36257
G1 X210.364 Y109.38 E.01641
G1 X218.169 Y117.185 E.33936
G1 X218.169 Y116.651 E.01641
G1 X210.898 Y109.38 E.31616
G1 X211.431 Y109.38 E.01641
G1 X218.169 Y116.117 E.29296
G1 X218.169 Y115.584 E.01641
G1 X211.965 Y109.38 E.26976
G1 X212.499 Y109.38 E.01641
G1 X218.169 Y115.05 E.24655
G1 X218.169 Y114.517 E.01641
G1 X213.032 Y109.38 E.22335
G1 X213.566 Y109.38 E.01641
G1 X218.169 Y113.983 E.20015
G1 X218.169 Y113.449 E.01641
G1 X214.099 Y109.38 E.17694
G1 X214.633 Y109.38 E.01641
G1 X218.169 Y112.916 E.15374
G1 X218.169 Y112.382 E.01641
G1 X215.167 Y109.38 E.13054
G1 X215.7 Y109.38 E.01641
G1 X218.169 Y111.848 E.10734
G1 X218.169 Y111.665 E.00565
G1 X218.106 Y111.252 E.01284
G1 X216.301 Y109.447 E.07846
G1 X216.489 Y109.491 E.00594
G1 X216.91 Y109.666 E.01401
G1 X217.299 Y109.925 E.01436
G3 X218.113 Y110.725 I-14.044 J15.106 E.03511
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X217.299 Y109.925 E-.43384
G1 X216.91 Y109.666 E-.17744
G1 X216.549 Y109.516 E-.14872
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/35
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.6 I.01 J-1.217 P1  F30000
G1 X36.476 Y108.026 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.247 J5.247 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.571 Y105.866 E.00949
G3 X221.698 Y113.265 I-.269 J7.391 E.3767
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.008 E.19108
M204 S250
G1 X36.191 Y107.742 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00028
G3 X41.705 Y105.46 I5.525 J5.525 E.18801
G1 X214.295 Y105.46 E5.3032
G1 X214.59 Y105.475 E.00909
G3 X222.09 Y113.255 I-.283 J7.778 E.36704
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.685 Y108.314 I7.813 J.018 E.16453
G1 X36.152 Y107.787 E.02161
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02312
G1 X36.758 Y107.228 E-.29034
G1 X37.372 Y106.773 E-.29051
G1 X37.724 Y106.562 E-.15603
; WIPE_END
G1 E-.04 F1800
G1 X37.457 Y110.268 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X37.072 Y111.831 I2.794 J1.519 E.05399
G1 X35.382 Y110.142 E.07926
G2 X34.829 Y111.708 I6.522 J3.186 E.05522
G1 X40.158 Y106.379 E.25
G2 X39.483 Y106.566 I.614 J3.521 E.02328
G1 X41.538 Y108.622 E.09643
G1 X45.591 Y108.622 E.13443
G1 X48.012 Y106.2 E.1136
G1 X46.793 Y106.2 E.04046
G1 X49.214 Y108.622 E.1136
G1 X53.267 Y108.622 E.13443
G1 X55.688 Y106.2 E.1136
G1 X54.469 Y106.2 E.04046
G1 X56.89 Y108.622 E.1136
G1 X60.943 Y108.622 E.13443
G1 X63.364 Y106.2 E.1136
G1 X62.145 Y106.2 E.04046
G1 X64.566 Y108.622 E.1136
G1 X68.619 Y108.622 E.13443
G1 X71.04 Y106.2 E.1136
G1 X69.821 Y106.2 E.04046
G1 X72.242 Y108.622 E.1136
G1 X76.295 Y108.622 E.13443
G1 X78.716 Y106.2 E.1136
G1 X77.496 Y106.2 E.04046
G1 X79.918 Y108.622 E.1136
G1 X83.971 Y108.622 E.13443
G1 X86.392 Y106.2 E.1136
G1 X85.172 Y106.2 E.04046
G1 X87.594 Y108.622 E.1136
G1 X91.647 Y108.622 E.13443
G1 X94.068 Y106.2 E.1136
G1 X92.848 Y106.2 E.04046
G1 X95.27 Y108.622 E.1136
G1 X99.322 Y108.622 E.13443
G1 X101.744 Y106.2 E.1136
G1 X100.524 Y106.2 E.04046
G1 X102.946 Y108.622 E.1136
G1 X106.998 Y108.622 E.13443
G1 X109.42 Y106.2 E.11359
G1 X108.2 Y106.2 E.04046
G1 X110.622 Y108.622 E.1136
G1 X114.674 Y108.622 E.13443
G1 X117.096 Y106.2 E.1136
G1 X115.876 Y106.2 E.04046
G1 X118.298 Y108.622 E.1136
G1 X122.35 Y108.622 E.13443
G1 X124.772 Y106.2 E.11359
G1 X123.552 Y106.2 E.04046
G1 X125.974 Y108.622 E.1136
G1 X130.026 Y108.622 E.13443
G1 X132.448 Y106.2 E.1136
M73 P68 R11
G1 X131.228 Y106.2 E.04046
G1 X133.65 Y108.622 E.11359
G1 X137.702 Y108.622 E.13443
G1 X140.124 Y106.2 E.1136
G1 X138.904 Y106.2 E.04046
G1 X141.326 Y108.622 E.11359
G1 X145.378 Y108.622 E.13443
G1 X147.8 Y106.2 E.1136
G1 X146.58 Y106.2 E.04046
G1 X149.002 Y108.622 E.1136
G1 X153.054 Y108.622 E.13443
G1 X155.476 Y106.2 E.11359
G1 X154.256 Y106.2 E.04046
G1 X156.677 Y108.622 E.11359
G1 X160.73 Y108.622 E.13443
G1 X163.152 Y106.2 E.1136
G1 X161.932 Y106.2 E.04046
G1 X164.353 Y108.622 E.1136
G1 X168.406 Y108.622 E.13443
G1 X170.828 Y106.2 E.11359
G1 X169.608 Y106.2 E.04046
G1 X172.029 Y108.622 E.11359
G1 X176.082 Y108.622 E.13443
G1 X178.504 Y106.2 E.11359
G1 X177.284 Y106.2 E.04046
G1 X179.705 Y108.622 E.1136
G1 X183.758 Y108.622 E.13443
G1 X186.179 Y106.2 E.1136
G1 X184.96 Y106.2 E.04046
G1 X187.381 Y108.622 E.11359
G1 X191.434 Y108.622 E.13443
G1 X193.855 Y106.2 E.1136
G1 X192.636 Y106.2 E.04046
G1 X195.057 Y108.622 E.1136
G1 X199.11 Y108.622 E.13443
G1 X201.531 Y106.2 E.1136
G1 X200.312 Y106.2 E.04046
G1 X202.733 Y108.622 E.11359
G1 X206.786 Y108.622 E.13443
G1 X209.207 Y106.2 E.1136
G1 X207.988 Y106.2 E.04046
G1 X210.409 Y108.622 E.1136
G1 X214.462 Y108.622 E.13443
G1 X216.517 Y106.566 E.09643
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X221.171 Y111.708 E.25
G2 X220.618 Y110.142 I-7.076 J1.62 E.05522
G1 X218.922 Y111.837 E.07954
G2 X218.547 Y110.273 I-3.02 J-.104 E.05402
G1 X221.35 Y136.542 F30000
G1 F15476.087
G1 X221.35 Y134.914 E.05401
G1 X218.927 Y132.491 E.11367
G1 X218.927 Y134.86 E.07859
G1 X221.35 Y132.438 E.11365
G1 X221.35 Y127.238 E.17248
G1 X218.925 Y124.814 E.11375
G1 X218.925 Y127.186 E.0787
G1 X221.35 Y124.762 E.11372
G1 X221.35 Y119.562 E.17248
G1 X218.923 Y117.136 E.11382
G1 X218.924 Y119.512 E.07881
G1 X221.35 Y117.086 E.1138
G1 X221.35 Y115.458 E.05401
G1 X218.549 Y141.735 F30000
G1 F15476.087
G2 X218.928 Y140.169 I-2.991 J-1.553 E.05398
G1 X220.618 Y141.858 E.07926
G2 X221.171 Y140.292 I-6.522 J-3.186 E.05522
G1 X215.842 Y145.621 E.25
G2 X216.517 Y145.434 I-.615 J-3.523 E.02328
G1 X214.462 Y143.378 E.09643
G1 X210.409 Y143.378 E.13443
G1 X207.988 Y145.8 E.1136
G1 X209.207 Y145.8 E.04046
G1 X206.786 Y143.378 E.1136
G1 X202.733 Y143.378 E.13443
G1 X200.312 Y145.8 E.1136
G1 X201.531 Y145.8 E.04046
G1 X199.11 Y143.378 E.1136
G1 X195.057 Y143.378 E.13443
G1 X192.636 Y145.8 E.1136
G1 X193.855 Y145.8 E.04046
G1 X191.434 Y143.378 E.1136
G1 X187.381 Y143.378 E.13443
G1 X184.96 Y145.8 E.1136
G1 X186.179 Y145.8 E.04046
G1 X183.758 Y143.378 E.1136
G1 X179.705 Y143.378 E.13443
G1 X177.284 Y145.8 E.1136
G1 X178.503 Y145.8 E.04046
G1 X176.082 Y143.378 E.1136
G1 X172.029 Y143.378 E.13443
G1 X169.608 Y145.8 E.1136
G1 X170.828 Y145.8 E.04046
G1 X168.406 Y143.378 E.1136
G1 X164.353 Y143.378 E.13443
G1 X161.932 Y145.8 E.1136
G1 X163.152 Y145.8 E.04046
G1 X160.73 Y143.378 E.1136
G1 X156.677 Y143.378 E.13443
G1 X154.256 Y145.8 E.1136
G1 X155.476 Y145.8 E.04046
G1 X153.054 Y143.378 E.1136
G1 X149.002 Y143.378 E.13443
G1 X146.58 Y145.8 E.11359
G1 X147.8 Y145.8 E.04046
G1 X145.378 Y143.378 E.1136
G1 X141.326 Y143.378 E.13443
G1 X138.904 Y145.8 E.1136
G1 X140.124 Y145.8 E.04046
G1 X137.702 Y143.378 E.1136
G1 X133.65 Y143.378 E.13443
G1 X131.228 Y145.8 E.11359
G1 X132.448 Y145.8 E.04046
G1 X130.026 Y143.378 E.1136
G1 X125.974 Y143.378 E.13443
G1 X123.552 Y145.8 E.1136
G1 X124.772 Y145.8 E.04046
G1 X122.35 Y143.378 E.1136
G1 X118.298 Y143.378 E.13443
G1 X115.876 Y145.8 E.1136
G1 X117.096 Y145.8 E.04046
G1 X114.674 Y143.378 E.1136
G1 X110.622 Y143.378 E.13443
G1 X108.2 Y145.8 E.1136
G1 X109.42 Y145.8 E.04046
G1 X106.998 Y143.378 E.1136
G1 X102.946 Y143.378 E.13443
G1 X100.524 Y145.8 E.11359
G1 X101.744 Y145.8 E.04046
G1 X99.322 Y143.378 E.1136
G1 X95.27 Y143.378 E.13443
G1 X92.848 Y145.8 E.1136
G1 X94.068 Y145.8 E.04046
G1 X91.647 Y143.378 E.1136
G1 X87.594 Y143.378 E.13443
G1 X85.172 Y145.8 E.11359
G1 X86.392 Y145.8 E.04046
G1 X83.971 Y143.378 E.1136
G1 X79.918 Y143.378 E.13443
G1 X77.496 Y145.8 E.11359
G1 X78.716 Y145.8 E.04046
G1 X76.295 Y143.378 E.1136
G1 X72.242 Y143.378 E.13443
G1 X69.821 Y145.8 E.1136
G1 X71.04 Y145.8 E.04046
G1 X68.619 Y143.378 E.1136
G1 X64.566 Y143.378 E.13443
G1 X62.145 Y145.8 E.1136
G1 X63.364 Y145.8 E.04046
G1 X60.943 Y143.378 E.1136
G1 X56.89 Y143.378 E.13443
G1 X54.469 Y145.8 E.1136
G1 X55.688 Y145.8 E.04046
G1 X53.267 Y143.378 E.1136
G1 X49.214 Y143.378 E.13443
G1 X46.793 Y145.8 E.1136
G1 X48.012 Y145.8 E.04046
G1 X45.591 Y143.378 E.1136
G1 X41.538 Y143.378 E.13443
G1 X39.483 Y145.434 E.09643
G2 X40.158 Y145.621 I1.29 J-3.336 E.02328
G1 X34.829 Y140.292 E.25
G2 X35.382 Y141.858 I7.076 J-1.62 E.05522
G1 X37.078 Y140.163 E.07954
G2 X37.453 Y141.727 I3.02 J.104 E.05402
G1 X34.65 Y115.458 F30000
G1 F15476.087
G1 X34.65 Y117.086 E.05401
G1 X37.073 Y119.509 E.11367
G1 X37.073 Y117.14 E.07859
G1 X34.65 Y119.562 E.11365
G1 X34.65 Y124.762 E.17248
G1 X37.075 Y127.186 E.11375
G1 X37.074 Y124.814 E.0787
G1 X34.65 Y127.238 E.11372
G1 X34.65 Y132.438 E.17248
G1 X37.077 Y134.864 E.11382
G1 X37.076 Y132.488 E.07881
G1 X34.65 Y134.914 E.1138
G1 X34.65 Y136.542 E.05401
G1 X37.595 Y110.492 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42021
G1 F15000
G3 X38.58 Y109.549 I7.675 J7.032 E.04194
G1 X38.881 Y109.356 E.01099
G1 X39.103 Y109.247 E.00761
G1 X39.513 Y109.108 E.0133
G1 X37.557 Y111.064 E.08505
G1 X37.498 Y111.339 E.00865
G1 X37.468 Y111.686 E.0107
G1 X40.139 Y109.016 E.11609
G1 X40.674 Y109.014 E.01646
G1 X37.464 Y112.224 E.13956
M73 P68 R10
G1 X37.464 Y112.757 E.0164
G1 X41.207 Y109.014 E.16275
G1 X41.741 Y109.014 E.0164
G1 X37.464 Y113.291 E.18595
G1 X37.464 Y113.824 E.0164
G1 X42.275 Y109.014 E.20914
G1 X42.808 Y109.014 E.0164
G1 X37.464 Y114.358 E.23234
G1 X37.465 Y114.891 E.0164
G1 X43.342 Y109.014 E.25553
G1 X43.875 Y109.014 E.0164
G1 X37.465 Y115.424 E.27873
G1 X37.465 Y115.958 E.0164
G1 X44.409 Y109.014 E.30192
G1 X44.942 Y109.014 E.0164
G1 X37.465 Y116.491 E.32511
G1 X37.465 Y117.025 E.0164
G1 X45.476 Y109.014 E.34831
G1 X46.01 Y109.014 E.0164
G1 X37.465 Y117.558 E.3715
G1 X37.465 Y118.092 E.0164
G1 X46.543 Y109.014 E.3947
G1 X47.077 Y109.014 E.0164
G1 X37.465 Y118.625 E.41789
G1 X37.465 Y119.159 E.0164
G1 X47.61 Y109.014 E.44108
G1 X48.144 Y109.014 E.0164
G1 X37.466 Y119.692 E.46428
G1 X37.466 Y120.226 E.0164
G1 X48.677 Y109.014 E.48747
G1 X49.211 Y109.014 E.0164
G1 X37.466 Y120.759 E.51067
G1 X37.466 Y121.293 E.0164
G1 X49.745 Y109.014 E.53386
G1 X50.278 Y109.014 E.0164
G1 X37.466 Y121.826 E.55706
G1 X37.466 Y122.359 E.0164
G1 X50.812 Y109.014 E.58025
G1 X51.345 Y109.014 E.0164
G1 X37.466 Y122.893 E.60344
G1 X37.466 Y123.426 E.0164
G1 X51.879 Y109.014 E.62664
G1 X52.412 Y109.014 E.0164
G1 X37.466 Y123.96 E.64983
G1 X37.467 Y124.493 E.0164
G1 X52.946 Y109.014 E.67303
G1 X53.479 Y109.014 E.0164
G1 X37.467 Y125.027 E.69622
G1 X37.467 Y125.56 E.0164
G1 X54.013 Y109.014 E.71942
G1 X54.547 Y109.014 E.0164
G1 X37.467 Y126.094 E.74261
G1 X37.467 Y126.627 E.0164
G1 X55.08 Y109.014 E.7658
G1 X55.614 Y109.014 E.0164
G1 X37.467 Y127.161 E.789
G1 X37.467 Y127.694 E.0164
G1 X56.147 Y109.014 E.81219
G1 X56.681 Y109.014 E.0164
G1 X37.467 Y128.227 E.83539
G1 X37.467 Y128.761 E.0164
G1 X57.214 Y109.014 E.85858
G1 X57.748 Y109.014 E.0164
G1 X37.468 Y129.294 E.88177
G1 X37.468 Y129.828 E.0164
G1 X58.282 Y109.014 E.90497
G1 X58.815 Y109.014 E.0164
G1 X37.468 Y130.361 E.92816
G1 X37.468 Y130.895 E.0164
G1 X59.349 Y109.014 E.95136
G1 X59.882 Y109.014 E.0164
G1 X37.468 Y131.428 E.97455
G1 X37.468 Y131.962 E.0164
G1 X60.416 Y109.014 E.99775
G1 X60.949 Y109.014 E.0164
G1 X37.468 Y132.495 E1.02094
G1 X37.468 Y133.029 E.0164
G1 X61.483 Y109.014 E1.04413
G1 X62.017 Y109.014 E.0164
G1 X37.468 Y133.562 E1.06733
G1 X37.469 Y134.095 E.0164
G1 X62.55 Y109.014 E1.09052
G1 X63.084 Y109.014 E.0164
G1 X37.469 Y134.629 E1.11372
G1 X37.469 Y135.162 E.0164
G1 X63.617 Y109.014 E1.13691
G1 X64.151 Y109.014 E.0164
G1 X37.469 Y135.696 E1.16011
G1 X37.469 Y136.229 E.0164
G1 X64.684 Y109.014 E1.1833
G1 X65.218 Y109.014 E.0164
G1 X37.469 Y136.763 E1.20649
G1 X37.469 Y137.296 E.0164
G1 X65.752 Y109.014 E1.22969
G1 X66.285 Y109.014 E.0164
G1 X37.469 Y137.83 E1.25288
G1 X37.47 Y138.363 E.0164
G1 X66.819 Y109.014 E1.27608
G1 X67.352 Y109.014 E.0164
G1 X37.47 Y138.897 E1.29927
G1 X37.47 Y139.43 E.0164
G1 X67.886 Y109.014 E1.32247
G1 X68.419 Y109.014 E.0164
G1 X37.47 Y139.963 E1.34566
G1 X37.478 Y140.489 E.01616
G1 X68.953 Y109.014 E1.36851
G1 X69.487 Y109.014 E.0164
G1 X37.559 Y140.941 E1.38817
G1 X37.694 Y141.34 E.01293
G1 X70.02 Y109.014 E1.40549
G1 X70.554 Y109.014 E.0164
G1 X37.879 Y141.689 E1.42068
G1 X38.102 Y141.999 E.01175
G1 X71.087 Y109.014 E1.43415
G1 X71.621 Y109.014 E.0164
G1 X38.366 Y142.268 E1.44588
G1 X38.493 Y142.384 E.00529
G1 X38.668 Y142.501 E.00644
G1 X72.154 Y109.014 E1.45598
G1 X72.688 Y109.014 E.0164
G1 X39 Y142.702 E1.46473
G1 X39.382 Y142.854 E.01263
G1 X73.222 Y109.014 E1.47133
G1 X73.755 Y109.014 E.0164
G1 X39.815 Y142.954 E1.47569
G1 X40.317 Y142.986 E.01545
G1 X74.289 Y109.014 E1.47708
G1 X74.822 Y109.014 E.0164
G1 X40.85 Y142.986 E1.47708
G1 X41.384 Y142.986 E.0164
G1 X75.356 Y109.014 E1.47708
G1 X75.889 Y109.014 E.0164
G1 X41.917 Y142.986 E1.47708
G1 X42.451 Y142.986 E.0164
G1 X76.423 Y109.014 E1.47708
G1 X76.957 Y109.014 E.0164
G1 X42.984 Y142.986 E1.47708
G1 X43.518 Y142.986 E.0164
G1 X77.49 Y109.014 E1.47708
G1 X78.024 Y109.014 E.0164
G1 X44.052 Y142.986 E1.47708
G1 X44.585 Y142.986 E.0164
G1 X78.557 Y109.014 E1.47708
G1 X79.091 Y109.014 E.0164
G1 X45.119 Y142.986 E1.47708
G1 X45.652 Y142.986 E.0164
G1 X79.624 Y109.014 E1.47708
G1 X80.158 Y109.014 E.0164
G1 X46.186 Y142.986 E1.47708
G1 X46.719 Y142.986 E.0164
G1 X80.691 Y109.014 E1.47708
G1 X81.225 Y109.014 E.0164
G1 X47.253 Y142.986 E1.47708
G1 X47.786 Y142.986 E.0164
G1 X81.759 Y109.014 E1.47708
G1 X82.292 Y109.014 E.0164
G1 X48.32 Y142.986 E1.47708
G1 X48.854 Y142.986 E.0164
G1 X82.826 Y109.014 E1.47708
G1 X83.359 Y109.014 E.0164
G1 X49.387 Y142.986 E1.47708
G1 X49.921 Y142.986 E.0164
G1 X83.893 Y109.014 E1.47708
G1 X84.426 Y109.014 E.0164
G1 X50.454 Y142.986 E1.47708
G1 X50.988 Y142.986 E.0164
G1 X84.96 Y109.014 E1.47708
G1 X85.494 Y109.014 E.0164
G1 X51.521 Y142.986 E1.47708
G1 X52.055 Y142.986 E.0164
G1 X86.027 Y109.014 E1.47708
G1 X86.561 Y109.014 E.0164
G1 X52.589 Y142.986 E1.47708
G1 X53.122 Y142.986 E.0164
G1 X87.094 Y109.014 E1.47708
G1 X87.628 Y109.014 E.0164
G1 X53.656 Y142.986 E1.47708
G1 X54.189 Y142.986 E.0164
G1 X88.161 Y109.014 E1.47708
G1 X88.695 Y109.014 E.0164
G1 X54.723 Y142.986 E1.47708
G1 X55.256 Y142.986 E.0164
G1 X89.229 Y109.014 E1.47708
G1 X89.762 Y109.014 E.0164
G1 X55.79 Y142.986 E1.47708
G1 X56.324 Y142.986 E.0164
G1 X90.296 Y109.014 E1.47708
G1 X90.829 Y109.014 E.0164
G1 X56.857 Y142.986 E1.47708
G1 X57.391 Y142.986 E.0164
G1 X91.363 Y109.014 E1.47708
G1 X91.896 Y109.014 E.0164
G1 X57.924 Y142.986 E1.47708
G1 X58.458 Y142.986 E.0164
G1 X92.43 Y109.014 E1.47708
G1 X92.964 Y109.014 E.0164
G1 X58.991 Y142.986 E1.47708
G1 X59.525 Y142.986 E.0164
G1 X93.497 Y109.014 E1.47708
G1 X94.031 Y109.014 E.0164
G1 X60.059 Y142.986 E1.47708
G1 X60.592 Y142.986 E.0164
G1 X94.564 Y109.014 E1.47708
G1 X95.098 Y109.014 E.0164
G1 X61.126 Y142.986 E1.47708
G1 X61.659 Y142.986 E.0164
G1 X95.631 Y109.014 E1.47708
G1 X96.165 Y109.014 E.0164
G1 X62.193 Y142.986 E1.47708
M73 P69 R10
G1 X62.726 Y142.986 E.0164
G1 X96.699 Y109.014 E1.47708
G1 X97.232 Y109.014 E.0164
G1 X63.26 Y142.986 E1.47708
G1 X63.794 Y142.986 E.0164
G1 X97.766 Y109.014 E1.47708
G1 X98.299 Y109.014 E.0164
G1 X64.327 Y142.986 E1.47708
G1 X64.861 Y142.986 E.0164
G1 X98.833 Y109.014 E1.47708
G1 X99.366 Y109.014 E.0164
G1 X65.394 Y142.986 E1.47708
G1 X65.928 Y142.986 E.0164
G1 X99.9 Y109.014 E1.47708
G1 X100.434 Y109.014 E.0164
G1 X66.461 Y142.986 E1.47708
G1 X66.995 Y142.986 E.0164
G1 X100.967 Y109.014 E1.47708
G1 X101.501 Y109.014 E.0164
G1 X67.529 Y142.986 E1.47708
G1 X68.062 Y142.986 E.0164
G1 X102.034 Y109.014 E1.47708
G1 X102.568 Y109.014 E.0164
G1 X68.596 Y142.986 E1.47708
G1 X69.129 Y142.986 E.0164
G1 X103.101 Y109.014 E1.47708
G1 X103.635 Y109.014 E.0164
G1 X69.663 Y142.986 E1.47708
G1 X70.196 Y142.986 E.0164
G1 X104.169 Y109.014 E1.47708
G1 X104.702 Y109.014 E.0164
G1 X70.73 Y142.986 E1.47708
G1 X71.264 Y142.986 E.0164
G1 X105.236 Y109.014 E1.47708
G1 X105.769 Y109.014 E.0164
G1 X71.797 Y142.986 E1.47708
G1 X72.331 Y142.986 E.0164
G1 X106.303 Y109.014 E1.47708
G1 X106.836 Y109.014 E.0164
G1 X72.864 Y142.986 E1.47708
G1 X73.398 Y142.986 E.0164
G1 X107.37 Y109.014 E1.47708
G1 X107.904 Y109.014 E.0164
G1 X73.931 Y142.986 E1.47708
G1 X74.465 Y142.986 E.0164
G1 X108.437 Y109.014 E1.47708
G1 X108.971 Y109.014 E.0164
G1 X74.998 Y142.986 E1.47708
G1 X75.532 Y142.986 E.0164
G1 X109.504 Y109.014 E1.47708
G1 X110.038 Y109.014 E.0164
G1 X76.066 Y142.986 E1.47708
G1 X76.599 Y142.986 E.0164
G1 X110.571 Y109.014 E1.47708
G1 X111.105 Y109.014 E.0164
G1 X77.133 Y142.986 E1.47708
G1 X77.666 Y142.986 E.0164
G1 X111.638 Y109.014 E1.47708
G1 X112.172 Y109.014 E.0164
G1 X78.2 Y142.986 E1.47708
G1 X78.733 Y142.986 E.0164
G1 X112.706 Y109.014 E1.47708
G1 X113.239 Y109.014 E.0164
G1 X79.267 Y142.986 E1.47708
G1 X79.801 Y142.986 E.0164
G1 X113.773 Y109.014 E1.47708
G1 X114.306 Y109.014 E.0164
G1 X80.334 Y142.986 E1.47708
G1 X80.868 Y142.986 E.0164
G1 X114.84 Y109.014 E1.47708
G1 X115.373 Y109.014 E.0164
G1 X81.401 Y142.986 E1.47708
G1 X81.935 Y142.986 E.0164
G1 X115.907 Y109.014 E1.47708
G1 X116.441 Y109.014 E.0164
G1 X82.468 Y142.986 E1.47708
G1 X83.002 Y142.986 E.0164
G1 X116.974 Y109.014 E1.47708
G1 X117.508 Y109.014 E.0164
G1 X83.536 Y142.986 E1.47708
G1 X84.069 Y142.986 E.0164
G1 X118.041 Y109.014 E1.47708
G1 X118.575 Y109.014 E.0164
G1 X84.603 Y142.986 E1.47708
G1 X85.136 Y142.986 E.0164
G1 X119.108 Y109.014 E1.47708
G1 X119.642 Y109.014 E.0164
G1 X85.67 Y142.986 E1.47708
G1 X86.203 Y142.986 E.0164
G1 X120.176 Y109.014 E1.47708
G1 X120.709 Y109.014 E.0164
G1 X86.737 Y142.986 E1.47708
G1 X87.271 Y142.986 E.0164
G1 X121.243 Y109.014 E1.47708
G1 X121.776 Y109.014 E.0164
G1 X87.804 Y142.986 E1.47708
G1 X88.338 Y142.986 E.0164
G1 X122.31 Y109.014 E1.47708
G1 X122.843 Y109.014 E.0164
G1 X88.871 Y142.986 E1.47708
G1 X89.405 Y142.986 E.0164
G1 X123.377 Y109.014 E1.47708
G1 X123.911 Y109.014 E.0164
G1 X89.938 Y142.986 E1.47708
G1 X90.472 Y142.986 E.0164
G1 X124.444 Y109.014 E1.47708
G1 X124.978 Y109.014 E.0164
G1 X91.006 Y142.986 E1.47708
G1 X91.539 Y142.986 E.0164
G1 X125.511 Y109.014 E1.47708
G1 X126.045 Y109.014 E.0164
G1 X92.073 Y142.986 E1.47708
G1 X92.606 Y142.986 E.0164
G1 X126.578 Y109.014 E1.47708
G1 X127.112 Y109.014 E.0164
G1 X93.14 Y142.986 E1.47708
G1 X93.673 Y142.986 E.0164
G1 X127.646 Y109.014 E1.47708
G1 X128.179 Y109.014 E.0164
G1 X94.207 Y142.986 E1.47708
G1 X94.741 Y142.986 E.0164
G1 X128.713 Y109.014 E1.47708
G1 X129.246 Y109.014 E.0164
G1 X95.274 Y142.986 E1.47708
G1 X95.808 Y142.986 E.0164
G1 X129.78 Y109.014 E1.47708
G1 X130.313 Y109.014 E.0164
G1 X96.341 Y142.986 E1.47708
G1 X96.875 Y142.986 E.0164
G1 X130.847 Y109.014 E1.47708
G1 X131.381 Y109.014 E.0164
G1 X97.408 Y142.986 E1.47708
G1 X97.942 Y142.986 E.0164
G1 X131.914 Y109.014 E1.47708
G1 X132.448 Y109.014 E.0164
G1 X98.476 Y142.986 E1.47708
G1 X99.009 Y142.986 E.0164
G1 X132.981 Y109.014 E1.47708
G1 X133.515 Y109.014 E.0164
G1 X99.543 Y142.986 E1.47708
G1 X100.076 Y142.986 E.0164
G1 X134.048 Y109.014 E1.47708
G1 X134.582 Y109.014 E.0164
G1 X100.61 Y142.986 E1.47708
G1 X101.143 Y142.986 E.0164
G1 X135.116 Y109.014 E1.47708
G1 X135.649 Y109.014 E.0164
G1 X101.677 Y142.986 E1.47708
G1 X102.21 Y142.986 E.0164
G1 X136.183 Y109.014 E1.47708
G1 X136.716 Y109.014 E.0164
G1 X102.744 Y142.986 E1.47708
G1 X103.278 Y142.986 E.0164
G1 X137.25 Y109.014 E1.47708
G1 X137.783 Y109.014 E.0164
G1 X103.811 Y142.986 E1.47708
G1 X104.345 Y142.986 E.0164
G1 X138.317 Y109.014 E1.47708
G1 X138.85 Y109.014 E.0164
G1 X104.878 Y142.986 E1.47708
G1 X105.412 Y142.986 E.0164
G1 X139.384 Y109.014 E1.47708
G1 X139.918 Y109.014 E.0164
G1 X105.945 Y142.986 E1.47708
G1 X106.479 Y142.986 E.0164
G1 X140.451 Y109.014 E1.47708
G1 X140.985 Y109.014 E.0164
G1 X107.013 Y142.986 E1.47708
G1 X107.546 Y142.986 E.0164
G1 X141.518 Y109.014 E1.47708
G1 X142.052 Y109.014 E.0164
G1 X108.08 Y142.986 E1.47708
G1 X108.613 Y142.986 E.0164
G1 X142.585 Y109.014 E1.47708
G1 X143.119 Y109.014 E.0164
G1 X109.147 Y142.986 E1.47708
G1 X109.68 Y142.986 E.0164
G1 X143.653 Y109.014 E1.47708
G1 X144.186 Y109.014 E.0164
G1 X110.214 Y142.986 E1.47708
G1 X110.748 Y142.986 E.0164
G1 X144.72 Y109.014 E1.47708
G1 X145.253 Y109.014 E.0164
G1 X111.281 Y142.986 E1.47708
M73 P70 R10
G1 X111.815 Y142.986 E.0164
G1 X145.787 Y109.014 E1.47708
G1 X146.32 Y109.014 E.0164
G1 X112.348 Y142.986 E1.47708
G1 X112.882 Y142.986 E.0164
G1 X146.854 Y109.014 E1.47708
G1 X147.388 Y109.014 E.0164
G1 X113.415 Y142.986 E1.47708
G1 X113.949 Y142.986 E.0164
G1 X147.921 Y109.014 E1.47708
G1 X148.455 Y109.014 E.0164
G1 X114.483 Y142.986 E1.47708
G1 X115.016 Y142.986 E.0164
G1 X148.988 Y109.014 E1.47708
G1 X149.522 Y109.014 E.0164
G1 X115.55 Y142.986 E1.47708
G1 X116.083 Y142.986 E.0164
G1 X150.055 Y109.014 E1.47708
G1 X150.589 Y109.014 E.0164
G1 X116.617 Y142.986 E1.47708
G1 X117.15 Y142.986 E.0164
G1 X151.123 Y109.014 E1.47708
G1 X151.656 Y109.014 E.0164
G1 X117.684 Y142.986 E1.47708
G1 X118.218 Y142.986 E.0164
G1 X152.19 Y109.014 E1.47708
G1 X152.723 Y109.014 E.0164
G1 X118.751 Y142.986 E1.47708
G1 X119.285 Y142.986 E.0164
G1 X153.257 Y109.014 E1.47708
G1 X153.79 Y109.014 E.0164
G1 X119.818 Y142.986 E1.47708
G1 X120.352 Y142.986 E.0164
G1 X154.324 Y109.014 E1.47708
G1 X154.858 Y109.014 E.0164
G1 X120.885 Y142.986 E1.47708
G1 X121.419 Y142.986 E.0164
G1 X155.391 Y109.014 E1.47708
G1 X155.925 Y109.014 E.0164
G1 X121.953 Y142.986 E1.47708
G1 X122.486 Y142.986 E.0164
G1 X156.458 Y109.014 E1.47708
G1 X156.992 Y109.014 E.0164
G1 X123.02 Y142.986 E1.47708
G1 X123.553 Y142.986 E.0164
G1 X157.525 Y109.014 E1.47708
G1 X158.059 Y109.014 E.0164
G1 X124.087 Y142.986 E1.47708
G1 X124.62 Y142.986 E.0164
G1 X158.593 Y109.014 E1.47708
G1 X159.126 Y109.014 E.0164
G1 X125.154 Y142.986 E1.47708
G1 X125.688 Y142.986 E.0164
G1 X159.66 Y109.014 E1.47708
G1 X160.193 Y109.014 E.0164
G1 X126.221 Y142.986 E1.47708
G1 X126.755 Y142.986 E.0164
G1 X160.727 Y109.014 E1.47708
G1 X161.26 Y109.014 E.0164
G1 X127.288 Y142.986 E1.47708
G1 X127.822 Y142.986 E.0164
G1 X161.794 Y109.014 E1.47708
G1 X162.328 Y109.014 E.0164
G1 X128.355 Y142.986 E1.47708
G1 X128.889 Y142.986 E.0164
G1 X162.861 Y109.014 E1.47708
G1 X163.395 Y109.014 E.0164
G1 X129.423 Y142.986 E1.47708
G1 X129.956 Y142.986 E.0164
G1 X163.928 Y109.014 E1.47708
G1 X164.462 Y109.014 E.0164
G1 X130.49 Y142.986 E1.47708
G1 X131.023 Y142.986 E.0164
G1 X164.995 Y109.014 E1.47708
G1 X165.529 Y109.014 E.0164
G1 X131.557 Y142.986 E1.47708
G1 X132.09 Y142.986 E.0164
G1 X166.062 Y109.014 E1.47708
G1 X166.596 Y109.014 E.0164
G1 X132.624 Y142.986 E1.47708
G1 X133.157 Y142.986 E.0164
G1 X167.13 Y109.014 E1.47708
G1 X167.663 Y109.014 E.0164
G1 X133.691 Y142.986 E1.47708
G1 X134.225 Y142.986 E.0164
G1 X168.197 Y109.014 E1.47708
G1 X168.73 Y109.014 E.0164
G1 X134.758 Y142.986 E1.47708
G1 X135.292 Y142.986 E.0164
G1 X169.264 Y109.014 E1.47708
G1 X169.797 Y109.014 E.0164
G1 X135.825 Y142.986 E1.47708
G1 X136.359 Y142.986 E.0164
G1 X170.331 Y109.014 E1.47708
G1 X170.865 Y109.014 E.0164
G1 X136.892 Y142.986 E1.47708
G1 X137.426 Y142.986 E.0164
G1 X171.398 Y109.014 E1.47708
G1 X171.932 Y109.014 E.0164
G1 X137.96 Y142.986 E1.47708
G1 X138.493 Y142.986 E.0164
G1 X172.465 Y109.014 E1.47708
G1 X172.999 Y109.014 E.0164
G1 X139.027 Y142.986 E1.47708
G1 X139.56 Y142.986 E.0164
G1 X173.532 Y109.014 E1.47708
G1 X174.066 Y109.014 E.0164
G1 X140.094 Y142.986 E1.47708
G1 X140.627 Y142.986 E.0164
G1 X174.6 Y109.014 E1.47708
G1 X175.133 Y109.014 E.0164
G1 X141.161 Y142.986 E1.47708
G1 X141.695 Y142.986 E.0164
G1 X175.667 Y109.014 E1.47708
G1 X176.2 Y109.014 E.0164
G1 X142.228 Y142.986 E1.47708
G1 X142.762 Y142.986 E.0164
G1 X176.734 Y109.014 E1.47708
G1 X177.267 Y109.014 E.0164
G1 X143.295 Y142.986 E1.47708
G1 X143.829 Y142.986 E.0164
G1 X177.801 Y109.014 E1.47708
G1 X178.335 Y109.014 E.0164
G1 X144.362 Y142.986 E1.47708
G1 X144.896 Y142.986 E.0164
G1 X178.868 Y109.014 E1.47708
G1 X179.402 Y109.014 E.0164
G1 X145.43 Y142.986 E1.47708
G1 X145.963 Y142.986 E.0164
G1 X179.935 Y109.014 E1.47708
G1 X180.469 Y109.014 E.0164
G1 X146.497 Y142.986 E1.47708
G1 X147.03 Y142.986 E.0164
G1 X181.002 Y109.014 E1.47708
G1 X181.536 Y109.014 E.0164
G1 X147.564 Y142.986 E1.47708
G1 X148.097 Y142.986 E.0164
G1 X182.07 Y109.014 E1.47708
G1 X182.603 Y109.014 E.0164
G1 X148.631 Y142.986 E1.47708
G1 X149.165 Y142.986 E.0164
G1 X183.137 Y109.014 E1.47708
G1 X183.67 Y109.014 E.0164
G1 X149.698 Y142.986 E1.47708
G1 X150.232 Y142.986 E.0164
G1 X184.204 Y109.014 E1.47708
G1 X184.737 Y109.014 E.0164
G1 X150.765 Y142.986 E1.47708
G1 X151.299 Y142.986 E.0164
G1 X185.271 Y109.014 E1.47708
G1 X185.805 Y109.014 E.0164
G1 X151.832 Y142.986 E1.47708
G1 X152.366 Y142.986 E.0164
G1 X186.338 Y109.014 E1.47708
G1 X186.872 Y109.014 E.0164
G1 X152.9 Y142.986 E1.47708
G1 X153.433 Y142.986 E.0164
G1 X187.405 Y109.014 E1.47708
G1 X187.939 Y109.014 E.0164
G1 X153.967 Y142.986 E1.47708
G1 X154.5 Y142.986 E.0164
G1 X188.472 Y109.014 E1.47708
G1 X189.006 Y109.014 E.0164
G1 X155.034 Y142.986 E1.47708
G1 X155.567 Y142.986 E.0164
G1 X189.54 Y109.014 E1.47708
G1 X190.073 Y109.014 E.0164
G1 X156.101 Y142.986 E1.47708
G1 X156.635 Y142.986 E.0164
G1 X190.607 Y109.014 E1.47708
G1 X191.14 Y109.014 E.0164
G1 X157.168 Y142.986 E1.47708
G1 X157.702 Y142.986 E.0164
G1 X191.674 Y109.014 E1.47708
G1 X192.207 Y109.014 E.0164
G1 X158.235 Y142.986 E1.47708
G1 X158.769 Y142.986 E.0164
G1 X192.741 Y109.014 E1.47708
G1 X193.274 Y109.014 E.0164
G1 X159.302 Y142.986 E1.47708
G1 X159.836 Y142.986 E.0164
G1 X193.808 Y109.014 E1.47708
M73 P71 R10
G1 X194.342 Y109.014 E.0164
G1 X160.369 Y142.986 E1.47708
G1 X160.903 Y142.986 E.0164
G1 X194.875 Y109.014 E1.47708
G1 X195.409 Y109.014 E.0164
G1 X161.437 Y142.986 E1.47708
G1 X161.97 Y142.986 E.0164
G1 X195.942 Y109.014 E1.47708
G1 X196.476 Y109.014 E.0164
G1 X162.504 Y142.986 E1.47708
G1 X163.037 Y142.986 E.0164
G1 X197.009 Y109.014 E1.47708
G1 X197.543 Y109.014 E.0164
G1 X163.571 Y142.986 E1.47708
G1 X164.104 Y142.986 E.0164
G1 X198.077 Y109.014 E1.47708
G1 X198.61 Y109.014 E.0164
G1 X164.638 Y142.986 E1.47708
G1 X165.172 Y142.986 E.0164
G1 X199.144 Y109.014 E1.47708
G1 X199.677 Y109.014 E.0164
G1 X165.705 Y142.986 E1.47708
G1 X166.239 Y142.986 E.0164
G1 X200.211 Y109.014 E1.47708
G1 X200.744 Y109.014 E.0164
G1 X166.772 Y142.986 E1.47708
G1 X167.306 Y142.986 E.0164
G1 X201.278 Y109.014 E1.47708
G1 X201.812 Y109.014 E.0164
G1 X167.839 Y142.986 E1.47708
G1 X168.373 Y142.986 E.0164
G1 X202.345 Y109.014 E1.47708
G1 X202.879 Y109.014 E.0164
G1 X168.907 Y142.986 E1.47708
M73 P71 R9
G1 X169.44 Y142.986 E.0164
G1 X203.412 Y109.014 E1.47708
G1 X203.946 Y109.014 E.0164
G1 X169.974 Y142.986 E1.47708
G1 X170.507 Y142.986 E.0164
G1 X204.479 Y109.014 E1.47708
G1 X205.013 Y109.014 E.0164
G1 X171.041 Y142.986 E1.47708
G1 X171.574 Y142.986 E.0164
G1 X205.547 Y109.014 E1.47708
G1 X206.08 Y109.014 E.0164
G1 X172.108 Y142.986 E1.47708
G1 X172.642 Y142.986 E.0164
G1 X206.614 Y109.014 E1.47708
G1 X207.147 Y109.014 E.0164
G1 X173.175 Y142.986 E1.47708
G1 X173.709 Y142.986 E.0164
G1 X207.681 Y109.014 E1.47708
G1 X208.214 Y109.014 E.0164
G1 X174.242 Y142.986 E1.47708
G1 X174.776 Y142.986 E.0164
G1 X208.748 Y109.014 E1.47708
G1 X209.282 Y109.014 E.0164
G1 X175.309 Y142.986 E1.47708
G1 X175.843 Y142.986 E.0164
G1 X209.815 Y109.014 E1.47708
G1 X210.349 Y109.014 E.0164
G1 X176.377 Y142.986 E1.47708
G1 X176.91 Y142.986 E.0164
G1 X210.882 Y109.014 E1.47708
G1 X211.416 Y109.014 E.0164
G1 X177.444 Y142.986 E1.47708
G1 X177.977 Y142.986 E.0164
G1 X211.949 Y109.014 E1.47708
G1 X212.483 Y109.014 E.0164
G1 X178.511 Y142.986 E1.47708
G1 X179.044 Y142.986 E.0164
G1 X213.017 Y109.014 E1.47708
G1 X213.55 Y109.014 E.0164
G1 X179.578 Y142.986 E1.47708
G1 X180.112 Y142.986 E.0164
G1 X214.084 Y109.014 E1.47708
G1 X214.617 Y109.014 E.0164
G1 X180.645 Y142.986 E1.47708
G1 X181.179 Y142.986 E.0164
G1 X215.151 Y109.014 E1.47708
G1 X215.684 Y109.014 E.0164
G1 X181.712 Y142.986 E1.47708
G1 X182.246 Y142.986 E.0164
G1 X216.186 Y109.046 E1.47568
G1 X216.211 Y109.048 E.00079
G1 X216.619 Y109.146 E.01289
G1 X182.779 Y142.986 E1.47132
G1 X183.313 Y142.986 E.0164
G1 X217.001 Y109.298 E1.46472
G1 X217.333 Y109.5 E.01194
G1 X183.847 Y142.986 E1.45596
G1 X184.38 Y142.986 E.0164
G1 X217.634 Y109.732 E1.44586
G1 X217.898 Y110.002 E.0116
G1 X184.914 Y142.986 E1.43413
G1 X185.447 Y142.986 E.0164
G1 X218.122 Y110.312 E1.42065
G1 X218.306 Y110.661 E.01214
G1 X185.981 Y142.986 E1.40546
G1 X186.514 Y142.986 E.0164
G1 X218.441 Y111.059 E1.38814
G1 X218.522 Y111.512 E.01413
G1 X187.048 Y142.986 E1.36848
G1 X187.581 Y142.986 E.0164
G1 X218.53 Y112.037 E1.34562
G1 X218.53 Y112.571 E.0164
G1 X188.115 Y142.986 E1.32243
G1 X188.649 Y142.986 E.0164
G1 X218.53 Y113.104 E1.29923
G1 X218.53 Y113.638 E.0164
G1 X189.182 Y142.986 E1.27604
G1 X189.716 Y142.986 E.0164
G1 X218.531 Y114.171 E1.25284
G1 X218.531 Y114.705 E.0164
G1 X190.249 Y142.986 E1.22965
G1 X190.783 Y142.986 E.0164
G1 X218.531 Y115.238 E1.20645
G1 X218.531 Y115.772 E.0164
G1 X191.316 Y142.986 E1.18326
G1 X191.85 Y142.986 E.0164
G1 X218.531 Y116.305 E1.16007
G1 X218.531 Y116.839 E.0164
G1 X192.384 Y142.986 E1.13687
G1 X192.917 Y142.986 E.0164
G1 X218.531 Y117.372 E1.11368
G1 X218.531 Y117.905 E.0164
G1 X193.451 Y142.986 E1.09048
G1 X193.984 Y142.986 E.0164
G1 X218.531 Y118.439 E1.06729
G1 X218.532 Y118.972 E.0164
G1 X194.518 Y142.986 E1.04409
G1 X195.051 Y142.986 E.0164
G1 X218.532 Y119.506 E1.0209
G1 X218.532 Y120.039 E.0164
G1 X195.585 Y142.986 E.99771
G1 X196.119 Y142.986 E.0164
G1 X218.532 Y120.573 E.97451
G1 X218.532 Y121.106 E.0164
G1 X196.652 Y142.986 E.95132
G1 X197.186 Y142.986 E.0164
G1 X218.532 Y121.64 E.92812
G1 X218.532 Y122.173 E.0164
G1 X197.719 Y142.986 E.90493
G1 X198.253 Y142.986 E.0164
G1 X218.532 Y122.707 E.88173
G1 X218.532 Y123.24 E.0164
G1 X198.786 Y142.986 E.85854
G1 X199.32 Y142.986 E.0164
G1 X218.533 Y123.773 E.83535
G1 X218.533 Y124.307 E.0164
G1 X199.854 Y142.986 E.81215
G1 X200.387 Y142.986 E.0164
G1 X218.533 Y124.84 E.78896
G1 X218.533 Y125.374 E.0164
G1 X200.921 Y142.986 E.76576
G1 X201.454 Y142.986 E.0164
G1 X218.533 Y125.907 E.74257
G1 X218.533 Y126.441 E.0164
G1 X201.988 Y142.986 E.71938
G1 X202.521 Y142.986 E.0164
G1 X218.533 Y126.974 E.69618
G1 X218.533 Y127.508 E.0164
G1 X203.055 Y142.986 E.67299
G1 X203.589 Y142.986 E.0164
G1 X218.533 Y128.041 E.64979
G1 X218.534 Y128.575 E.0164
G1 X204.122 Y142.986 E.6266
G1 X204.656 Y142.986 E.0164
G1 X218.534 Y129.108 E.6034
G1 X218.534 Y129.641 E.0164
G1 X205.189 Y142.986 E.58021
G1 X205.723 Y142.986 E.0164
G1 X218.534 Y130.175 E.55702
G1 X218.534 Y130.708 E.0164
G1 X206.256 Y142.986 E.53382
G1 X206.79 Y142.986 E.0164
G1 X218.534 Y131.242 E.51063
G1 X218.534 Y131.775 E.0164
G1 X207.324 Y142.986 E.48743
G1 X207.857 Y142.986 E.0164
G1 X218.534 Y132.309 E.46424
G1 X218.535 Y132.842 E.0164
G1 X208.391 Y142.986 E.44104
G1 X208.924 Y142.986 E.0164
G1 X218.535 Y133.376 E.41785
G1 X218.535 Y133.909 E.0164
G1 X209.458 Y142.986 E.39466
G1 X209.991 Y142.986 E.0164
G1 X218.535 Y134.443 E.37146
G1 X218.535 Y134.976 E.0164
G1 X210.525 Y142.986 E.34827
M73 P72 R9
G1 X211.059 Y142.986 E.0164
G1 X218.535 Y135.51 E.32507
G1 X218.535 Y136.043 E.0164
G1 X211.592 Y142.986 E.30188
G1 X212.126 Y142.986 E.0164
G1 X218.535 Y136.576 E.27868
G1 X218.535 Y137.11 E.0164
G1 X212.659 Y142.986 E.25549
G1 X213.193 Y142.986 E.0164
G1 X218.536 Y137.643 E.2323
G1 X218.536 Y138.177 E.0164
G1 X213.726 Y142.986 E.2091
G1 X214.26 Y142.986 E.0164
G1 X218.536 Y138.71 E.18591
G1 X218.536 Y139.244 E.0164
G1 X214.793 Y142.986 E.16271
G1 X215.327 Y142.986 E.0164
G1 X218.536 Y139.777 E.13952
G1 X218.531 Y140.315 E.01654
G1 X215.865 Y142.981 E.11593
G1 X216.211 Y142.952 E.01067
G1 X216.487 Y142.893 E.00869
G1 X218.44 Y140.94 E.08491
G1 X218.303 Y141.346 E.01317
G1 X218.194 Y141.568 E.00762
G1 X217.935 Y141.956 E.01436
G1 X217.772 Y142.141 E.00757
G1 X217.051 Y142.863 E.03136
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X217.772 Y142.141 E-.38761
G1 X217.935 Y141.956 E-.09351
G1 X218.194 Y141.568 E-.17748
G1 X218.303 Y141.346 E-.09414
G1 X218.31 Y141.328 E-.00727
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/35
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.8 I.208 J-1.199 P1  F30000
G1 X38.523 Y110.177 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X39.893 Y109.471 I1.677 J1.573 E.05214
G1 X40.067 Y109.433 E.00588
G1 X215.936 Y109.434 E5.83392
G1 X216.107 Y109.471 E.00578
G3 X217.478 Y110.176 I-.311 J2.291 E.05214
G3 X218.116 Y111.613 I-2.013 J1.754 E.05296
G1 X218.116 Y140.386 E.95445
G1 X218.079 Y140.557 E.00577
G3 X217.374 Y141.928 I-2.291 J-.311 E.05214
G3 X215.933 Y142.566 I-1.757 J-2.019 E.05307
G1 X40.064 Y142.566 E5.83392
G1 X39.893 Y142.529 E.00578
G3 X38.522 Y141.824 I.311 J-2.291 E.05214
G3 X37.884 Y140.387 I2.013 J-1.754 E.05296
G1 X37.883 Y111.617 E.95435
G1 X37.921 Y111.444 E.00588
G3 X38.483 Y110.221 I2.279 J.307 E.0453
; WIPE_START
G1 X38.742 Y109.97 E-.13704
G1 X39.113 Y109.722 E-.16967
G1 X39.534 Y109.548 E-.173
G1 X39.893 Y109.471 E-.1397
G1 X40.067 Y109.433 E-.06739
G1 X40.259 Y109.434 E-.07321
; WIPE_END
G1 E-.04 F1800
G1 X36.471 Y108.021 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G3 X41.715 Y105.852 I5.237 J5.237 E.19318
G1 X214.285 Y105.852 E5.72448
G1 X214.597 Y105.867 E.01036
G3 X221.698 Y113.265 I-.295 J7.39 E.37583
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.429 Y108.064 I7.406 J-.007 E.19118
M204 S250
G1 X36.191 Y107.743 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.192 Y107.742 E.00004
G3 X41.705 Y105.46 I5.51 J5.51 E.18814
G1 X214.295 Y105.46 E5.3032
G1 X214.616 Y105.476 E.00989
G3 X222.09 Y113.255 I-.309 J7.776 E.36623
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.679 Y108.309 I7.793 J-.002 E.16464
G1 X36.151 Y107.787 E.02161
; WIPE_START
M204 S10000
G1 X36.192 Y107.742 E-.02324
G1 X36.758 Y107.228 E-.29047
G1 X37.372 Y106.773 E-.29051
G1 X37.724 Y106.562 E-.15578
; WIPE_END
G1 E-.04 F1800
G1 X36.945 Y114.155 Z3 F30000
G1 X34.65 Y136.542 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X34.65 Y134.914 E.05401
G1 X36.777 Y132.788 E.09975
G1 X36.777 Y134.564 E.05893
G1 X34.65 Y132.438 E.09975
G1 X34.65 Y127.238 E.17248
G1 X36.777 Y125.112 E.09975
G1 X36.777 Y126.888 E.05893
G1 X34.65 Y124.762 E.09975
G1 X34.65 Y119.562 E.17248
G1 X36.777 Y117.436 E.09975
G1 X36.777 Y119.212 E.05893
G1 X34.65 Y117.086 E.09975
G1 X34.65 Y115.458 E.05401
G1 X37.262 Y142.001 F30000
G1 F15476.087
G3 X36.778 Y140.462 I3.2 J-1.85 E.05395
G1 X35.382 Y141.858 E.0655
G3 X34.829 Y140.292 I6.523 J-3.186 E.05522
G1 X40.158 Y145.621 E.25
G3 X39.483 Y145.434 I.614 J-3.522 E.02328
G1 X41.243 Y143.673 E.08259
G1 X45.886 Y143.673 E.15401
G1 X48.012 Y145.8 E.09976
G1 X46.793 Y145.8 E.04046
G1 X48.919 Y143.673 E.09976
G1 X53.562 Y143.673 E.15401
G1 X55.688 Y145.8 E.09976
G1 X54.469 Y145.8 E.04046
G1 X56.595 Y143.673 E.09976
G1 X61.238 Y143.673 E.15401
G1 X63.364 Y145.8 E.09976
G1 X62.145 Y145.8 E.04046
G1 X64.271 Y143.673 E.09976
G1 X68.914 Y143.673 E.15401
G1 X71.04 Y145.8 E.09976
G1 X69.821 Y145.8 E.04046
G1 X71.947 Y143.673 E.09976
G1 X76.59 Y143.673 E.15401
G1 X78.716 Y145.8 E.09976
G1 X77.496 Y145.8 E.04046
G1 X79.623 Y143.673 E.09975
G1 X84.266 Y143.673 E.15401
G1 X86.392 Y145.8 E.09976
G1 X85.172 Y145.8 E.04046
G1 X87.299 Y143.673 E.09975
G1 X91.942 Y143.673 E.15401
G1 X94.068 Y145.8 E.09976
G1 X92.848 Y145.8 E.04046
G1 X94.975 Y143.673 E.09976
G1 X99.618 Y143.673 E.15401
G1 X101.744 Y145.8 E.09976
G1 X100.524 Y145.8 E.04046
G1 X102.651 Y143.673 E.09975
G1 X107.293 Y143.673 E.15401
G1 X109.42 Y145.8 E.09976
G1 X108.2 Y145.8 E.04046
G1 X110.327 Y143.673 E.09976
G1 X114.969 Y143.673 E.15401
G1 X117.096 Y145.8 E.09976
G1 X115.876 Y145.8 E.04046
G1 X118.003 Y143.673 E.09976
G1 X122.645 Y143.673 E.15401
G1 X124.772 Y145.8 E.09976
G1 X123.552 Y145.8 E.04046
G1 X125.679 Y143.673 E.09976
G1 X130.321 Y143.673 E.15401
G1 X132.448 Y145.8 E.09976
G1 X131.228 Y145.8 E.04046
G1 X133.355 Y143.673 E.09975
G1 X137.997 Y143.673 E.15401
G1 X140.124 Y145.8 E.09976
G1 X138.904 Y145.8 E.04046
G1 X141.031 Y143.673 E.09976
G1 X145.673 Y143.673 E.15401
G1 X147.8 Y145.8 E.09976
G1 X146.58 Y145.8 E.04046
G1 X148.707 Y143.673 E.09975
G1 X153.349 Y143.673 E.15401
G1 X155.476 Y145.8 E.09976
G1 X154.256 Y145.8 E.04046
G1 X156.382 Y143.673 E.09976
G1 X161.025 Y143.673 E.15401
G1 X163.152 Y145.8 E.09976
G1 X161.932 Y145.8 E.04046
G1 X164.058 Y143.673 E.09976
G1 X168.701 Y143.673 E.15401
G1 X170.828 Y145.8 E.09976
G1 X169.608 Y145.8 E.04046
G1 X171.734 Y143.673 E.09976
G1 X176.377 Y143.673 E.15401
G1 X178.503 Y145.8 E.09976
G1 X177.284 Y145.8 E.04046
G1 X179.41 Y143.673 E.09976
G1 X184.053 Y143.673 E.15401
G1 X186.179 Y145.8 E.09976
G1 X184.96 Y145.8 E.04046
G1 X187.086 Y143.673 E.09976
G1 X191.729 Y143.673 E.15401
G1 X193.855 Y145.8 E.09976
G1 X192.636 Y145.8 E.04046
G1 X194.762 Y143.673 E.09976
G1 X199.405 Y143.673 E.15401
G1 X201.531 Y145.8 E.09976
G1 X200.312 Y145.8 E.04046
G1 X202.438 Y143.673 E.09976
G1 X207.081 Y143.673 E.15401
G1 X209.207 Y145.8 E.09976
G1 X207.988 Y145.8 E.04046
G1 X210.114 Y143.673 E.09976
G1 X214.757 Y143.673 E.15401
G1 X216.517 Y145.434 E.08259
G3 X215.842 Y145.621 I-1.29 J-3.334 E.02328
G1 X221.171 Y140.292 E.25
G3 X220.618 Y141.858 I-7.076 J-1.62 E.05522
G1 X219.221 Y140.465 E.06543
G3 X218.738 Y142.001 I-3.347 J-.209 E.05395
G1 X218.513 Y141.623 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.393208
G1 F12000
G1 X218.704 Y141.146 E.01466
G1 X218.844 Y140.408 E.02143
G1 X218.845 Y111.593 E.8225
G1 X218.719 Y110.906 E.01993
G2 X217.909 Y109.563 I-3.152 J.985 E.04521
G1 X217.494 Y109.225 E.01526
G1 X216.808 Y108.882 E.02192
G2 X215.95 Y108.705 I-1.135 J3.326 E.02505
G1 X40.045 Y108.705 E5.02105
G1 X39.353 Y108.832 E.02007
G1 X38.861 Y109.02 E.01506
G1 X38.31 Y109.372 E.01865
G1 X37.918 Y109.741 E.01537
G1 X37.611 Y110.158 E.01478
G1 X37.333 Y110.742 E.01845
G2 X37.156 Y111.595 I3.259 J1.12 E.02495
G1 X37.155 Y140.418 E.82271
G1 X37.282 Y141.094 E.01963
G1 X37.471 Y141.591 E.0152
G2 X38.507 Y142.776 I3.102 J-1.667 E.0453
G1 X39.192 Y143.117 E.02183
G2 X40.042 Y143.294 I1.121 J-3.264 E.02485
G1 X215.968 Y143.295 E5.02163
G1 X216.643 Y143.169 E.01961
G2 X218.481 Y141.673 I-.919 J-3.007 E.06935
; WIPE_START
G1 X218.244 Y142.054 E-.17018
G1 X217.89 Y142.455 E-.20336
G1 X217.483 Y142.783 E-.1988
G1 X217.137 Y142.977 E-.15037
G1 X217.046 Y143.012 E-.03729
; WIPE_END
G1 E-.04 F1800
G1 X209.532 Y141.671 Z3 F30000
G1 X37.63 Y110.98 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.393108
G1 F12000
G1 X37.911 Y110.353 E.0196
G1 X38.229 Y109.93 E.01511
G1 X38.516 Y109.662 E.0112
G1 X38.948 Y109.377 E.01478
G1 X39.428 Y109.18 E.01479
G1 X40.045 Y109.055 E.01796
G1 X215.95 Y109.055 E5.01961
G1 X216.56 Y109.178 E.01776
G1 X217.197 Y109.461 E.01988
G1 X217.623 Y109.781 E.0152
G1 X217.969 Y110.172 E.01489
G1 X218.236 Y110.626 E.01503
G1 X218.426 Y111.223 E.01789
G1 X218.494 Y111.593 E.01073
G1 X218.494 Y140.408 E.82227
G1 X218.372 Y141.01 E.01754
G3 X217.213 Y142.531 I-2.629 J-.803 E.05573
G1 X216.626 Y142.8 E.0184
G1 X215.955 Y142.945 E.01961
G1 X40.042 Y142.944 E5.01982
G1 X39.44 Y142.822 E.01754
G1 X38.803 Y142.539 E.01988
G1 X38.377 Y142.219 E.0152
G1 X38.031 Y141.828 E.01489
G1 X37.764 Y141.374 E.01504
G1 X37.569 Y140.752 E.0186
G1 X37.506 Y140.406 E.01003
G1 X37.505 Y111.595 E.82215
G1 X37.618 Y111.038 E.01621
; WIPE_START
G1 X37.505 Y111.595 E-.21586
G1 X37.505 Y113.027 E-.54414
; WIPE_END
G1 E-.04 F1800
G1 X45.136 Y112.883 Z3 F30000
G1 X215.908 Y109.657 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X217.893 Y111.642 E.08625
G1 X217.893 Y112.175
G1 X215.375 Y109.657 E.10943
G1 X214.842 Y109.657
G1 X217.893 Y112.708 E.1326
G1 X217.893 Y113.241
G1 X214.309 Y109.657 E.15577
G1 X213.775 Y109.657
G1 X217.893 Y113.775 E.17894
G1 X217.893 Y114.308
G1 X213.242 Y109.657 E.20212
G1 X212.709 Y109.657
G1 X217.893 Y114.841 E.22529
G1 X217.893 Y115.374
G1 X212.176 Y109.657 E.24846
G1 X211.642 Y109.657
G1 X217.893 Y115.908 E.27163
G1 X217.893 Y116.441
G1 X211.109 Y109.657 E.29481
G1 X210.576 Y109.657
G1 X217.893 Y116.974 E.31798
G1 X217.893 Y117.507
G1 X210.043 Y109.657 E.34115
G1 X209.509 Y109.657
G1 X217.893 Y118.041 E.36432
G1 X217.893 Y118.574
G1 X208.976 Y109.657 E.3875
G1 X208.443 Y109.657
G1 X217.893 Y119.107 E.41067
G1 X217.893 Y119.64
G1 X207.91 Y109.657 E.43384
G1 X207.376 Y109.657
G1 X217.893 Y120.174 E.45702
G1 X217.893 Y120.707
G1 X206.843 Y109.657 E.48019
G1 X206.31 Y109.657
G1 X217.893 Y121.24 E.50336
G1 X217.893 Y121.773
G1 X205.777 Y109.657 E.52653
G1 X205.243 Y109.657
G1 X217.893 Y122.307 E.54971
G1 X217.893 Y122.84
G1 X204.71 Y109.657 E.57288
G1 X204.177 Y109.657
G1 X217.893 Y123.373 E.59605
G1 X217.893 Y123.906
G1 X203.643 Y109.657 E.61922
G1 X203.11 Y109.657
G1 X217.893 Y124.44 E.6424
G1 X217.893 Y124.973
G1 X202.577 Y109.657 E.66557
G1 X202.044 Y109.657
G1 X217.893 Y125.506 E.68874
G1 X217.893 Y126.04
G1 X201.51 Y109.657 E.71192
G1 X200.977 Y109.657
G1 X217.893 Y126.573 E.73509
G1 X217.893 Y127.106
G1 X200.444 Y109.657 E.75826
G1 X199.911 Y109.657
G1 X217.893 Y127.639 E.78143
G1 X217.893 Y128.173
G1 X199.377 Y109.657 E.80461
G1 X198.844 Y109.657
G1 X217.893 Y128.706 E.82778
G1 X217.893 Y129.239
G1 X198.311 Y109.657 E.85095
G1 X197.778 Y109.657
G1 X217.893 Y129.772 E.87412
M73 P73 R9
G1 X217.893 Y130.306
G1 X197.244 Y109.657 E.8973
G1 X196.711 Y109.657
G1 X217.893 Y130.839 E.92047
G1 X217.893 Y131.372
G1 X196.178 Y109.657 E.94364
G1 X195.645 Y109.657
G1 X217.893 Y131.905 E.96682
G1 X217.893 Y132.439
G1 X195.111 Y109.657 E.98999
G1 X194.578 Y109.657
G1 X217.893 Y132.972 E1.01316
G1 X217.893 Y133.505
G1 X194.045 Y109.657 E1.03633
G1 X193.512 Y109.657
G1 X217.893 Y134.038 E1.05951
G1 X217.893 Y134.572
G1 X192.978 Y109.657 E1.08268
G1 X192.445 Y109.657
G1 X217.893 Y135.105 E1.10585
G1 X217.893 Y135.638
G1 X191.912 Y109.657 E1.12902
G1 X191.379 Y109.657
G1 X217.893 Y136.171 E1.1522
G1 X217.893 Y136.705
G1 X190.845 Y109.657 E1.17537
G1 X190.312 Y109.657
G1 X217.893 Y137.238 E1.19854
G1 X217.893 Y137.771
G1 X189.779 Y109.657 E1.22172
G1 X189.245 Y109.657
G1 X217.893 Y138.304 E1.24489
G1 X217.893 Y138.838
G1 X188.712 Y109.657 E1.26806
G1 X188.179 Y109.657
G1 X217.893 Y139.371 E1.29123
G1 X217.893 Y139.904
G1 X187.646 Y109.657 E1.31441
G1 X187.112 Y109.657
G1 X217.88 Y140.424 E1.337
G1 X217.785 Y140.863
G1 X186.579 Y109.657 E1.35606
G1 X186.046 Y109.657
G1 X217.628 Y141.238 E1.37238
G1 X217.414 Y141.558
G1 X185.513 Y109.657 E1.38628
G1 X184.979 Y109.657
G1 X217.151 Y141.828 E1.398
G1 X216.838 Y142.049
G1 X184.446 Y109.657 E1.4076
G1 X183.913 Y109.657
G1 X216.472 Y142.215 E1.41483
G1 X216.039 Y142.316
G1 X183.38 Y109.657 E1.41921
G1 X182.846 Y109.657
G1 X215.534 Y142.344 E1.42043
G1 X215.001 Y142.344
G1 X182.313 Y109.657 E1.42043
G1 X181.78 Y109.657
G1 X214.467 Y142.344 E1.42043
G1 X213.934 Y142.344
G1 X181.247 Y109.657 E1.42043
G1 X180.713 Y109.657
G1 X213.401 Y142.344 E1.42043
G1 X212.868 Y142.344
G1 X180.18 Y109.657 E1.42043
G1 X179.647 Y109.657
G1 X212.334 Y142.344 E1.42043
G1 X211.801 Y142.344
G1 X179.114 Y109.657 E1.42043
G1 X178.58 Y109.657
G1 X211.268 Y142.344 E1.42043
G1 X210.734 Y142.344
G1 X178.047 Y109.657 E1.42043
G1 X177.514 Y109.657
G1 X210.201 Y142.344 E1.42043
G1 X209.668 Y142.344
G1 X176.98 Y109.657 E1.42043
G1 X176.447 Y109.657
G1 X209.135 Y142.344 E1.42043
G1 X208.601 Y142.344
G1 X175.914 Y109.657 E1.42043
G1 X175.381 Y109.657
G1 X208.068 Y142.344 E1.42043
G1 X207.535 Y142.344
G1 X174.847 Y109.657 E1.42043
G1 X174.314 Y109.657
G1 X207.002 Y142.344 E1.42043
G1 X206.468 Y142.344
G1 X173.781 Y109.657 E1.42043
G1 X173.248 Y109.657
G1 X205.935 Y142.344 E1.42043
G1 X205.402 Y142.344
G1 X172.714 Y109.656 E1.42043
G1 X172.181 Y109.656
G1 X204.869 Y142.344 E1.42043
G1 X204.335 Y142.344
G1 X171.648 Y109.656 E1.42043
G1 X171.115 Y109.656
G1 X203.802 Y142.344 E1.42043
G1 X203.269 Y142.344
G1 X170.581 Y109.656 E1.42043
G1 X170.048 Y109.656
G1 X202.736 Y142.344 E1.42043
G1 X202.202 Y142.344
G1 X169.515 Y109.656 E1.42043
G1 X168.982 Y109.656
G1 X201.669 Y142.344 E1.42043
G1 X201.136 Y142.344
G1 X168.448 Y109.656 E1.42043
G1 X167.915 Y109.656
G1 X200.603 Y142.344 E1.42043
G1 X200.069 Y142.344
G1 X167.382 Y109.656 E1.42043
G1 X166.849 Y109.656
G1 X199.536 Y142.344 E1.42043
G1 X199.003 Y142.344
G1 X166.315 Y109.656 E1.42043
G1 X165.782 Y109.656
G1 X198.47 Y142.344 E1.42043
G1 X197.936 Y142.344
G1 X165.249 Y109.656 E1.42043
G1 X164.716 Y109.656
G1 X197.403 Y142.344 E1.42043
G1 X196.87 Y142.344
G1 X164.182 Y109.656 E1.42043
G1 X163.649 Y109.656
G1 X196.336 Y142.344 E1.42043
G1 X195.803 Y142.344
G1 X163.116 Y109.656 E1.42043
G1 X162.582 Y109.656
G1 X195.27 Y142.344 E1.42043
G1 X194.737 Y142.344
G1 X162.049 Y109.656 E1.42043
G1 X161.516 Y109.656
G1 X194.203 Y142.344 E1.42043
G1 X193.67 Y142.344
G1 X160.983 Y109.656 E1.42043
G1 X160.449 Y109.656
G1 X193.137 Y142.344 E1.42043
G1 X192.604 Y142.344
G1 X159.916 Y109.656 E1.42043
G1 X159.383 Y109.656
G1 X192.07 Y142.344 E1.42043
G1 X191.537 Y142.344
G1 X158.85 Y109.656 E1.42043
G1 X158.316 Y109.656
M73 P74 R9
G1 X191.004 Y142.344 E1.42043
G1 X190.471 Y142.344
G1 X157.783 Y109.656 E1.42043
G1 X157.25 Y109.656
G1 X189.937 Y142.344 E1.42043
G1 X189.404 Y142.344
G1 X156.717 Y109.656 E1.42043
G1 X156.183 Y109.656
G1 X188.871 Y142.344 E1.42043
M73 P74 R8
G1 X188.338 Y142.344
G1 X155.65 Y109.656 E1.42043
G1 X155.117 Y109.656
G1 X187.804 Y142.344 E1.42043
G1 X187.271 Y142.344
G1 X154.584 Y109.656 E1.42043
G1 X154.05 Y109.656
G1 X186.738 Y142.344 E1.42043
G1 X186.205 Y142.344
G1 X153.517 Y109.656 E1.42043
G1 X152.984 Y109.656
G1 X185.671 Y142.344 E1.42043
G1 X185.138 Y142.344
G1 X152.451 Y109.656 E1.42043
G1 X151.917 Y109.656
G1 X184.605 Y142.344 E1.42043
G1 X184.072 Y142.344
G1 X151.384 Y109.656 E1.42043
G1 X150.851 Y109.656
G1 X183.538 Y142.344 E1.42043
G1 X183.005 Y142.344
G1 X150.318 Y109.656 E1.42043
G1 X149.784 Y109.656
G1 X182.472 Y142.344 E1.42043
G1 X181.938 Y142.344
G1 X149.251 Y109.656 E1.42043
G1 X148.718 Y109.656
G1 X181.405 Y142.344 E1.42043
G1 X180.872 Y142.344
G1 X148.184 Y109.656 E1.42043
G1 X147.651 Y109.656
G1 X180.339 Y142.344 E1.42043
G1 X179.805 Y142.344
G1 X147.118 Y109.656 E1.42043
G1 X146.585 Y109.656
G1 X179.272 Y142.344 E1.42043
G1 X178.739 Y142.344
G1 X146.051 Y109.656 E1.42043
G1 X145.518 Y109.656
G1 X178.206 Y142.344 E1.42043
G1 X177.672 Y142.344
G1 X144.985 Y109.656 E1.42043
G1 X144.452 Y109.656
G1 X177.139 Y142.344 E1.42043
G1 X176.606 Y142.344
G1 X143.918 Y109.656 E1.42043
G1 X143.385 Y109.656
G1 X176.073 Y142.344 E1.42043
G1 X175.539 Y142.344
G1 X142.852 Y109.656 E1.42043
G1 X142.319 Y109.656
G1 X175.006 Y142.344 E1.42043
G1 X174.473 Y142.344
G1 X141.785 Y109.656 E1.42043
G1 X141.252 Y109.656
G1 X173.94 Y142.344 E1.42043
G1 X173.406 Y142.344
G1 X140.719 Y109.656 E1.42043
G1 X140.186 Y109.656
G1 X172.873 Y142.344 E1.42043
G1 X172.34 Y142.344
G1 X139.652 Y109.656 E1.42043
G1 X139.119 Y109.656
G1 X171.807 Y142.344 E1.42043
G1 X171.273 Y142.344
G1 X138.586 Y109.656 E1.42043
G1 X138.053 Y109.656
G1 X170.74 Y142.344 E1.42043
G1 X170.207 Y142.344
G1 X137.519 Y109.656 E1.42043
G1 X136.986 Y109.656
G1 X169.673 Y142.344 E1.42043
G1 X169.14 Y142.344
G1 X136.453 Y109.656 E1.42043
G1 X135.92 Y109.656
G1 X168.607 Y142.344 E1.42043
G1 X168.074 Y142.344
G1 X135.386 Y109.656 E1.42043
G1 X134.853 Y109.656
G1 X167.54 Y142.344 E1.42043
G1 X167.007 Y142.344
G1 X134.32 Y109.656 E1.42043
G1 X133.786 Y109.656
G1 X166.474 Y142.344 E1.42043
G1 X165.941 Y142.344
G1 X133.253 Y109.656 E1.42043
G1 X132.72 Y109.656
G1 X165.407 Y142.344 E1.42043
G1 X164.874 Y142.344
G1 X132.187 Y109.656 E1.42043
G1 X131.653 Y109.656
G1 X164.341 Y142.344 E1.42043
G1 X163.808 Y142.344
G1 X131.12 Y109.656 E1.42043
G1 X130.587 Y109.656
G1 X163.274 Y142.344 E1.42043
G1 X162.741 Y142.344
G1 X130.054 Y109.656 E1.42043
G1 X129.52 Y109.656
G1 X162.208 Y142.344 E1.42043
G1 X161.675 Y142.344
G1 X128.987 Y109.656 E1.42043
G1 X128.454 Y109.656
G1 X161.141 Y142.344 E1.42043
G1 X160.608 Y142.344
G1 X127.921 Y109.656 E1.42043
G1 X127.387 Y109.656
G1 X160.075 Y142.344 E1.42043
G1 X159.542 Y142.344
G1 X126.854 Y109.656 E1.42043
G1 X126.321 Y109.656
G1 X159.008 Y142.344 E1.42043
M73 P75 R8
G1 X158.475 Y142.344
G1 X125.788 Y109.656 E1.42043
G1 X125.254 Y109.656
G1 X157.942 Y142.344 E1.42043
G1 X157.409 Y142.344
G1 X124.721 Y109.656 E1.42043
G1 X124.188 Y109.656
G1 X156.875 Y142.344 E1.42043
G1 X156.342 Y142.344
G1 X123.655 Y109.656 E1.42043
G1 X123.121 Y109.656
G1 X155.809 Y142.344 E1.42043
G1 X155.275 Y142.344
G1 X122.588 Y109.656 E1.42043
G1 X122.055 Y109.656
G1 X154.742 Y142.344 E1.42043
G1 X154.209 Y142.344
G1 X121.521 Y109.656 E1.42043
G1 X120.988 Y109.656
G1 X153.676 Y142.344 E1.42043
G1 X153.142 Y142.344
G1 X120.455 Y109.656 E1.42043
G1 X119.922 Y109.656
G1 X152.609 Y142.344 E1.42043
G1 X152.076 Y142.344
G1 X119.388 Y109.656 E1.42043
G1 X118.855 Y109.656
G1 X151.543 Y142.344 E1.42043
G1 X151.009 Y142.344
G1 X118.322 Y109.656 E1.42043
G1 X117.789 Y109.656
G1 X150.476 Y142.344 E1.42043
G1 X149.943 Y142.344
G1 X117.255 Y109.656 E1.42043
G1 X116.722 Y109.656
G1 X149.41 Y142.344 E1.42043
G1 X148.876 Y142.344
G1 X116.189 Y109.656 E1.42043
G1 X115.656 Y109.656
G1 X148.343 Y142.344 E1.42043
G1 X147.81 Y142.344
G1 X115.122 Y109.656 E1.42043
G1 X114.589 Y109.656
G1 X147.277 Y142.344 E1.42043
G1 X146.743 Y142.344
G1 X114.056 Y109.656 E1.42043
G1 X113.523 Y109.656
G1 X146.21 Y142.344 E1.42043
G1 X145.677 Y142.344
G1 X112.989 Y109.656 E1.42043
G1 X112.456 Y109.656
G1 X145.144 Y142.344 E1.42043
G1 X144.61 Y142.344
G1 X111.923 Y109.656 E1.42043
G1 X111.39 Y109.656
G1 X144.077 Y142.344 E1.42043
G1 X143.544 Y142.344
G1 X110.856 Y109.656 E1.42043
G1 X110.323 Y109.656
G1 X143.011 Y142.344 E1.42043
G1 X142.477 Y142.344
G1 X109.79 Y109.656 E1.42043
G1 X109.257 Y109.656
G1 X141.944 Y142.344 E1.42043
G1 X141.411 Y142.344
G1 X108.723 Y109.656 E1.42043
G1 X108.19 Y109.656
G1 X140.877 Y142.344 E1.42043
G1 X140.344 Y142.344
G1 X107.657 Y109.656 E1.42043
G1 X107.123 Y109.656
G1 X139.811 Y142.344 E1.42043
G1 X139.278 Y142.344
G1 X106.59 Y109.656 E1.42043
G1 X106.057 Y109.656
G1 X138.744 Y142.344 E1.42043
G1 X138.211 Y142.344
G1 X105.524 Y109.656 E1.42043
G1 X104.99 Y109.656
G1 X137.678 Y142.344 E1.42043
G1 X137.145 Y142.344
G1 X104.457 Y109.656 E1.42043
G1 X103.924 Y109.656
G1 X136.611 Y142.344 E1.42043
G1 X136.078 Y142.344
G1 X103.391 Y109.656 E1.42043
G1 X102.857 Y109.656
G1 X135.545 Y142.344 E1.42043
G1 X135.012 Y142.344
G1 X102.324 Y109.656 E1.42043
G1 X101.791 Y109.656
G1 X134.478 Y142.344 E1.42043
G1 X133.945 Y142.344
G1 X101.258 Y109.656 E1.42043
G1 X100.724 Y109.656
G1 X133.412 Y142.344 E1.42043
G1 X132.879 Y142.344
G1 X100.191 Y109.656 E1.42043
G1 X99.658 Y109.656
G1 X132.345 Y142.344 E1.42043
G1 X131.812 Y142.344
G1 X99.125 Y109.656 E1.42043
G1 X98.591 Y109.656
G1 X131.279 Y142.344 E1.42043
G1 X130.746 Y142.344
G1 X98.058 Y109.656 E1.42043
G1 X97.525 Y109.656
G1 X130.212 Y142.344 E1.42043
G1 X129.679 Y142.344
G1 X96.992 Y109.656 E1.42043
G1 X96.458 Y109.656
G1 X129.146 Y142.344 E1.42043
G1 X128.613 Y142.344
G1 X95.925 Y109.656 E1.42043
G1 X95.392 Y109.656
G1 X128.079 Y142.344 E1.42043
G1 X127.546 Y142.344
G1 X94.859 Y109.656 E1.42043
G1 X94.325 Y109.656
G1 X127.013 Y142.344 E1.42043
M73 P76 R8
G1 X126.479 Y142.344
G1 X93.792 Y109.656 E1.42043
G1 X93.259 Y109.656
G1 X125.946 Y142.344 E1.42043
G1 X125.413 Y142.344
G1 X92.725 Y109.656 E1.42043
G1 X92.192 Y109.656
G1 X124.88 Y142.344 E1.42043
G1 X124.346 Y142.344
G1 X91.659 Y109.656 E1.42043
G1 X91.126 Y109.656
G1 X123.813 Y142.344 E1.42043
G1 X123.28 Y142.344
G1 X90.592 Y109.656 E1.42043
G1 X90.059 Y109.656
G1 X122.747 Y142.344 E1.42043
G1 X122.213 Y142.344
G1 X89.526 Y109.656 E1.42043
G1 X88.993 Y109.656
G1 X121.68 Y142.344 E1.42043
G1 X121.147 Y142.344
G1 X88.459 Y109.656 E1.42043
G1 X87.926 Y109.656
G1 X120.614 Y142.344 E1.42043
G1 X120.08 Y142.344
G1 X87.393 Y109.656 E1.42043
G1 X86.86 Y109.656
G1 X119.547 Y142.344 E1.42043
G1 X119.014 Y142.344
G1 X86.326 Y109.656 E1.42043
G1 X85.793 Y109.656
G1 X118.481 Y142.344 E1.42043
G1 X117.947 Y142.344
G1 X85.26 Y109.656 E1.42043
G1 X84.727 Y109.656
G1 X117.414 Y142.344 E1.42043
G1 X116.881 Y142.344
G1 X84.193 Y109.656 E1.42043
G1 X83.66 Y109.656
G1 X116.348 Y142.344 E1.42043
G1 X115.814 Y142.344
G1 X83.127 Y109.656 E1.42043
G1 X82.594 Y109.656
G1 X115.281 Y142.344 E1.42043
G1 X114.748 Y142.344
G1 X82.06 Y109.656 E1.42043
G1 X81.527 Y109.656
G1 X114.214 Y142.344 E1.42043
G1 X113.681 Y142.344
G1 X80.994 Y109.656 E1.42043
G1 X80.461 Y109.656
G1 X113.148 Y142.344 E1.42043
G1 X112.615 Y142.344
G1 X79.927 Y109.656 E1.42043
G1 X79.394 Y109.656
G1 X112.081 Y142.344 E1.42043
G1 X111.548 Y142.344
G1 X78.861 Y109.656 E1.42043
G1 X78.327 Y109.656
G1 X111.015 Y142.344 E1.42043
G1 X110.482 Y142.344
G1 X77.794 Y109.656 E1.42043
G1 X77.261 Y109.656
G1 X109.948 Y142.344 E1.42043
G1 X109.415 Y142.344
G1 X76.728 Y109.656 E1.42043
G1 X76.194 Y109.656
G1 X108.882 Y142.344 E1.42043
G1 X108.349 Y142.344
G1 X75.661 Y109.656 E1.42043
G1 X75.128 Y109.656
G1 X107.815 Y142.344 E1.42043
G1 X107.282 Y142.344
G1 X74.595 Y109.656 E1.42043
G1 X74.061 Y109.656
G1 X106.749 Y142.344 E1.42043
G1 X106.216 Y142.344
G1 X73.528 Y109.656 E1.42043
G1 X72.995 Y109.656
G1 X105.682 Y142.344 E1.42043
G1 X105.149 Y142.344
G1 X72.462 Y109.656 E1.42043
G1 X71.928 Y109.656
G1 X104.616 Y142.344 E1.42043
G1 X104.083 Y142.344
G1 X71.395 Y109.656 E1.42043
G1 X70.862 Y109.656
G1 X103.549 Y142.344 E1.42043
G1 X103.016 Y142.344
G1 X70.329 Y109.656 E1.42043
G1 X69.795 Y109.656
G1 X102.483 Y142.344 E1.42043
G1 X101.95 Y142.344
G1 X69.262 Y109.656 E1.42043
G1 X68.729 Y109.656
G1 X101.416 Y142.344 E1.42043
G1 X100.883 Y142.344
G1 X68.196 Y109.656 E1.42043
G1 X67.662 Y109.656
G1 X100.35 Y142.344 E1.42043
G1 X99.816 Y142.344
G1 X67.129 Y109.656 E1.42043
G1 X66.596 Y109.656
G1 X99.283 Y142.344 E1.42043
G1 X98.75 Y142.344
G1 X66.063 Y109.656 E1.42043
G1 X65.529 Y109.656
G1 X98.217 Y142.344 E1.42043
G1 X97.683 Y142.344
G1 X64.996 Y109.656 E1.42043
G1 X64.463 Y109.656
G1 X97.15 Y142.344 E1.42043
G1 X96.617 Y142.344
G1 X63.929 Y109.656 E1.42043
G1 X63.396 Y109.656
G1 X96.084 Y142.344 E1.42043
M73 P76 R7
G1 X95.55 Y142.344
G1 X62.863 Y109.656 E1.42043
G1 X62.33 Y109.656
G1 X95.017 Y142.344 E1.42043
G1 X94.484 Y142.344
G1 X61.796 Y109.656 E1.42043
M73 P77 R7
G1 X61.263 Y109.656
G1 X93.951 Y142.344 E1.42043
G1 X93.417 Y142.344
G1 X60.73 Y109.656 E1.42043
G1 X60.197 Y109.656
G1 X92.884 Y142.344 E1.42043
G1 X92.351 Y142.344
G1 X59.663 Y109.656 E1.42043
G1 X59.13 Y109.656
G1 X91.818 Y142.344 E1.42043
G1 X91.284 Y142.344
G1 X58.597 Y109.656 E1.42043
G1 X58.064 Y109.656
G1 X90.751 Y142.344 E1.42043
G1 X90.218 Y142.344
G1 X57.53 Y109.656 E1.42043
G1 X56.997 Y109.656
G1 X89.685 Y142.344 E1.42043
G1 X89.151 Y142.344
G1 X56.464 Y109.656 E1.42043
G1 X55.931 Y109.656
G1 X88.618 Y142.344 E1.42043
G1 X88.085 Y142.344
G1 X55.397 Y109.656 E1.42043
G1 X54.864 Y109.656
G1 X87.552 Y142.344 E1.42043
G1 X87.018 Y142.344
G1 X54.331 Y109.656 E1.42043
G1 X53.798 Y109.656
G1 X86.485 Y142.344 E1.42043
G1 X85.952 Y142.344
G1 X53.264 Y109.656 E1.42043
G1 X52.731 Y109.656
G1 X85.418 Y142.344 E1.42043
G1 X84.885 Y142.343
G1 X52.198 Y109.656 E1.42043
G1 X51.664 Y109.656
G1 X84.352 Y142.343 E1.42043
G1 X83.819 Y142.343
G1 X51.131 Y109.656 E1.42043
G1 X50.598 Y109.656
G1 X83.285 Y142.343 E1.42043
G1 X82.752 Y142.343
G1 X50.065 Y109.656 E1.42043
G1 X49.531 Y109.656
G1 X82.219 Y142.343 E1.42043
G1 X81.686 Y142.343
G1 X48.998 Y109.656 E1.42043
G1 X48.465 Y109.656
G1 X81.152 Y142.343 E1.42043
G1 X80.619 Y142.343
G1 X47.932 Y109.656 E1.42043
G1 X47.398 Y109.656
G1 X80.086 Y142.343 E1.42043
G1 X79.553 Y142.343
G1 X46.865 Y109.656 E1.42043
G1 X46.332 Y109.656
G1 X79.019 Y142.343 E1.42043
G1 X78.486 Y142.343
G1 X45.799 Y109.656 E1.42043
G1 X45.265 Y109.656
G1 X77.953 Y142.343 E1.42043
G1 X77.42 Y142.343
G1 X44.732 Y109.656 E1.42043
G1 X44.199 Y109.656
G1 X76.886 Y142.343 E1.42043
G1 X76.353 Y142.343
G1 X43.666 Y109.656 E1.42043
G1 X43.132 Y109.656
G1 X75.82 Y142.343 E1.42043
G1 X75.287 Y142.343
G1 X42.599 Y109.656 E1.42043
G1 X42.066 Y109.656
G1 X74.753 Y142.343 E1.42043
G1 X74.22 Y142.343
G1 X41.533 Y109.656 E1.42043
G1 X40.999 Y109.656
G1 X73.687 Y142.343 E1.42043
G1 X73.154 Y142.343
G1 X40.466 Y109.656 E1.42043
G1 X39.961 Y109.684
G1 X72.62 Y142.343 E1.41921
G1 X72.087 Y142.343
G1 X39.528 Y109.785 E1.41483
G1 X39.162 Y109.951
G1 X71.554 Y142.343 E1.4076
G1 X71.02 Y142.343
G1 X38.849 Y110.172 E1.398
G1 X38.586 Y110.442
G1 X70.487 Y142.343 E1.38627
G1 X69.954 Y142.343
G1 X38.372 Y110.762 E1.37238
G1 X38.215 Y111.137
G1 X69.421 Y142.343 E1.35605
G1 X68.887 Y142.343
G1 X38.12 Y111.576 E1.337
G1 X38.106 Y112.095
G1 X68.354 Y142.343 E1.31443
G1 X67.821 Y142.343
G1 X38.106 Y112.629 E1.29126
G1 X38.106 Y113.162
G1 X67.288 Y142.343 E1.26808
G1 X66.754 Y142.343
G1 X38.106 Y113.695 E1.24491
G1 X38.106 Y114.228
G1 X66.221 Y142.343 E1.22174
G1 X65.688 Y142.343
G1 X38.106 Y114.762 E1.19856
G1 X38.106 Y115.295
G1 X65.155 Y142.343 E1.17539
G1 X64.621 Y142.343
G1 X38.106 Y115.828 E1.15222
G1 X38.106 Y116.361
G1 X64.088 Y142.343 E1.12904
G1 X63.555 Y142.343
G1 X38.106 Y116.895 E1.10587
G1 X38.106 Y117.428
G1 X63.022 Y142.343 E1.0827
G1 X62.488 Y142.343
G1 X38.106 Y117.961 E1.05952
M73 P78 R7
G1 X38.106 Y118.494
G1 X61.955 Y142.343 E1.03635
G1 X61.422 Y142.343
G1 X38.106 Y119.028 E1.01318
G1 X38.106 Y119.561
G1 X60.889 Y142.343 E.99
G1 X60.355 Y142.343
G1 X38.106 Y120.094 E.96683
G1 X38.106 Y120.628
G1 X59.822 Y142.343 E.94366
G1 X59.289 Y142.343
G1 X38.106 Y121.161 E.92048
G1 X38.106 Y121.694
G1 X58.756 Y142.343 E.89731
G1 X58.222 Y142.343
G1 X38.106 Y122.227 E.87414
G1 X38.106 Y122.761
G1 X57.689 Y142.343 E.85096
G1 X57.156 Y142.343
G1 X38.106 Y123.294 E.82779
G1 X38.106 Y123.827
G1 X56.622 Y142.343 E.80462
G1 X56.089 Y142.343
G1 X38.106 Y124.36 E.78144
G1 X38.106 Y124.894
G1 X55.556 Y142.343 E.75827
G1 X55.023 Y142.343
G1 X38.106 Y125.427 E.7351
G1 X38.106 Y125.96
G1 X54.489 Y142.343 E.71193
G1 X53.956 Y142.343
G1 X38.106 Y126.494 E.68875
G1 X38.106 Y127.027
G1 X53.423 Y142.343 E.66558
G1 X52.89 Y142.343
G1 X38.106 Y127.56 E.64241
G1 X38.106 Y128.093
G1 X52.356 Y142.343 E.61923
G1 X51.823 Y142.343
G1 X38.106 Y128.627 E.59606
G1 X38.106 Y129.16
G1 X51.29 Y142.343 E.57289
G1 X50.757 Y142.343
G1 X38.106 Y129.693 E.54971
G1 X38.106 Y130.226
G1 X50.223 Y142.343 E.52654
G1 X49.69 Y142.343
G1 X38.106 Y130.76 E.50337
G1 X38.106 Y131.293
G1 X49.157 Y142.343 E.48019
G1 X48.624 Y142.343
G1 X38.106 Y131.826 E.45702
G1 X38.106 Y132.36
G1 X48.09 Y142.343 E.43385
G1 X47.557 Y142.343
G1 X38.106 Y132.893 E.41067
G1 X38.107 Y133.426
G1 X47.024 Y142.343 E.3875
G1 X46.491 Y142.343
G1 X38.107 Y133.959 E.36433
G1 X38.107 Y134.493
G1 X45.957 Y142.343 E.34115
G1 X45.424 Y142.343
G1 X38.107 Y135.026 E.31798
G1 X38.107 Y135.559
G1 X44.891 Y142.343 E.29481
G1 X44.357 Y142.343
G1 X38.107 Y136.092 E.27163
G1 X38.107 Y136.626
G1 X43.824 Y142.343 E.24846
G1 X43.291 Y142.343
G1 X38.107 Y137.159 E.22529
G1 X38.107 Y137.692
G1 X42.758 Y142.343 E.20211
G1 X42.224 Y142.343
G1 X38.107 Y138.225 E.17894
G1 X38.107 Y138.759
G1 X41.691 Y142.343 E.15577
G1 X41.158 Y142.343
G1 X38.107 Y139.292 E.13259
G1 X38.107 Y139.825
G1 X40.625 Y142.343 E.10942
G1 X40.091 Y142.343
G1 X38.107 Y140.359 E.08625
; WIPE_START
M204 S10000
G1 X39.521 Y141.773 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.153 Y141.788 Z3 F30000
G1 X216.643 Y142.12 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0898106
G1 F15000
G1 X216.507 Y142.205 E.00061
G1 X39.698 Y142.285 F30000
; LINE_WIDTH: 0.288171
G1 F15000
G1 X39.272 Y141.98 E.01047
; LINE_WIDTH: 0.326513
G1 X39.174 Y141.904 E.00288
; LINE_WIDTH: 0.365744
G3 X38.98 Y141.74 I2.42 J-3.052 E.00669
; LINE_WIDTH: 0.3869
G3 X38.629 Y141.378 I3.508 J-3.749 E.01413
; LINE_WIDTH: 0.35567
G1 X38.546 Y141.276 E.00336
; LINE_WIDTH: 0.326473
G1 X38.47 Y141.177 E.00288
; LINE_WIDTH: 0.28812
G1 X38.165 Y140.752 E.01046
G1 X38.145 Y111.341 F30000
; LINE_WIDTH: 0.129039
G1 F15000
G1 X38.179 Y111.443 E.00076
G1 X38.124 Y111.551 E.00085
; WIPE_START
G1 X38.179 Y111.443 E-.40248
G1 X38.145 Y111.341 E-.35752
; WIPE_END
G1 E-.04 F1800
G1 X45.777 Y111.337 Z3 F30000
G1 X217.835 Y111.249 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.288235
G1 F15000
G1 X217.53 Y110.823 E.01047
; LINE_WIDTH: 0.326571
G1 X217.454 Y110.724 E.00288
; LINE_WIDTH: 0.365826
G2 X217.29 Y110.53 I-3.057 J2.424 E.00669
; LINE_WIDTH: 0.386987
G2 X216.928 Y110.179 I-3.748 J3.506 E.01414
; LINE_WIDTH: 0.355762
G1 X216.826 Y110.096 E.00336
; LINE_WIDTH: 0.326605
G1 X216.727 Y110.02 E.00288
; LINE_WIDTH: 0.288258
G1 X216.302 Y109.715 E.01047
; WIPE_START
G1 X216.727 Y110.02 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.737 Y110 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X219.222 Y111.538 I-3.107 J1.825 E.05396
G1 X220.618 Y110.142 E.0655
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X215.842 Y106.379 E.25
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X214.755 Y108.328 E.08266
G1 X210.116 Y108.328 E.1539
G1 X207.988 Y106.2 E.09983
G1 X209.207 Y106.2 E.04046
G1 X207.079 Y108.328 E.09983
G1 X202.44 Y108.328 E.1539
G1 X200.312 Y106.2 E.09983
G1 X201.531 Y106.2 E.04046
G1 X199.403 Y108.328 E.09982
G1 X194.764 Y108.328 E.15391
G1 X192.636 Y106.2 E.09982
G1 X193.855 Y106.2 E.04046
G1 X191.728 Y108.328 E.09982
G1 X187.088 Y108.328 E.15391
G1 X184.96 Y106.2 E.09982
G1 X186.179 Y106.2 E.04046
G1 X184.052 Y108.328 E.09982
G1 X179.412 Y108.328 E.15392
G1 X177.284 Y106.2 E.09982
G1 X178.504 Y106.2 E.04046
G1 X176.376 Y108.328 E.09981
G1 X171.736 Y108.328 E.15392
G1 X169.608 Y106.2 E.09981
G1 X170.828 Y106.2 E.04046
G1 X168.7 Y108.328 E.09981
G1 X164.06 Y108.328 E.15393
G1 X161.932 Y106.2 E.09981
G1 X163.152 Y106.2 E.04046
G1 X161.024 Y108.328 E.09981
G1 X156.384 Y108.328 E.15393
G1 X154.256 Y106.2 E.09981
G1 X155.476 Y106.2 E.04046
G1 X153.348 Y108.328 E.0998
G1 X148.708 Y108.328 E.15394
G1 X146.58 Y106.2 E.0998
G1 X147.8 Y106.2 E.04046
G1 X145.672 Y108.328 E.0998
G1 X141.032 Y108.328 E.15394
G1 X138.904 Y106.2 E.0998
G1 X140.124 Y106.2 E.04046
G1 X137.996 Y108.328 E.0998
G1 X133.355 Y108.328 E.15395
G1 X131.228 Y106.2 E.0998
G1 X132.448 Y106.2 E.04046
G1 X130.32 Y108.328 E.09979
G1 X125.679 Y108.328 E.15395
G1 X123.552 Y106.2 E.09979
G1 X124.772 Y106.2 E.04046
G1 X122.645 Y108.328 E.09979
G1 X118.003 Y108.327 E.15396
G1 X115.876 Y106.2 E.09979
G1 X117.096 Y106.2 E.04046
G1 X114.969 Y108.327 E.09979
G1 X110.327 Y108.327 E.15396
G1 X108.2 Y106.2 E.09979
G1 X109.42 Y106.2 E.04046
G1 X107.293 Y108.327 E.09978
G1 X102.651 Y108.327 E.15397
G1 X100.524 Y106.2 E.09978
G1 X101.744 Y106.2 E.04046
G1 X99.617 Y108.327 E.09978
G1 X94.975 Y108.327 E.15397
G1 X92.848 Y106.2 E.09978
G1 X94.068 Y106.2 E.04046
G1 X91.941 Y108.327 E.09978
G1 X87.299 Y108.327 E.15398
G1 X85.172 Y106.2 E.09978
G1 X86.392 Y106.2 E.04046
G1 X84.265 Y108.327 E.09977
G1 X79.623 Y108.327 E.15398
G1 X77.496 Y106.2 E.09977
G1 X78.716 Y106.2 E.04046
G1 X76.589 Y108.327 E.09977
G1 X71.947 Y108.327 E.15398
G1 X69.821 Y106.2 E.09977
G1 X71.04 Y106.2 E.04046
G1 X68.913 Y108.327 E.09977
G1 X64.271 Y108.327 E.15399
G1 X62.145 Y106.2 E.09977
G1 X63.364 Y106.2 E.04046
G1 X61.238 Y108.327 E.09976
G1 X56.595 Y108.327 E.15399
G1 X54.469 Y106.2 E.09976
G1 X55.688 Y106.2 E.04046
G1 X53.562 Y108.327 E.09976
G1 X48.919 Y108.327 E.154
G1 X46.793 Y106.2 E.09976
G1 X48.012 Y106.2 E.04046
G1 X45.886 Y108.327 E.09976
G1 X41.243 Y108.327 E.154
G1 X39.483 Y106.566 E.08259
G3 X40.158 Y106.379 I1.29 J3.336 E.02328
G1 X34.829 Y111.708 E.25
G3 X35.382 Y110.142 I7.076 J1.62 E.05522
G1 X36.779 Y111.535 E.06543
G3 X37.262 Y109.999 I3.347 J.209 E.05395
; WIPE_START
G1 X36.957 Y110.645 E-.27155
G1 X36.779 Y111.535 E-.34488
G1 X36.511 Y111.268 E-.14357
; WIPE_END
G1 E-.04 F1800
G1 X44.142 Y111.441 Z3 F30000
G1 X221.35 Y115.458 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X221.35 Y117.086 E.05401
G1 X219.223 Y119.212 E.09975
G1 X219.223 Y117.436 E.05893
G1 X221.35 Y119.562 E.09975
G1 X221.35 Y124.762 E.17248
G1 X219.223 Y126.888 E.09975
G1 X219.223 Y125.112 E.05893
G1 X221.35 Y127.238 E.09975
G1 X221.35 Y132.438 E.17248
G1 X219.223 Y134.564 E.09975
G1 X219.223 Y132.788 E.05893
G1 X221.35 Y134.914 E.09975
G1 X221.35 Y136.542 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X221.35 Y134.914 E-.61876
G1 X221.087 Y134.651 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/35
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I.161 J-1.206 P1  F30000
G1 X39.051 Y110.347 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
M73 P79 R7
G3 X40.115 Y109.91 I1.246 J1.522 E.0387
G1 X215.885 Y109.91 E5.83064
G3 X216.662 Y110.142 I-.27 J2.319 E.02703
G3 X217.64 Y111.665 I-.981 J1.706 E.06238
G1 X217.64 Y140.335 E.95107
G1 X217.61 Y140.475 E.00474
G3 X215.81 Y142.091 I-1.858 J-.259 E.08719
G1 X40.115 Y142.09 E5.82814
G3 X39.338 Y141.858 I.269 J-2.319 E.02703
G3 X38.36 Y140.335 I.981 J-1.706 E.06238
G1 X38.359 Y111.74 E.94857
G3 X38.592 Y110.888 I2.378 J.191 E.02947
G3 X39.005 Y110.385 I1.706 J.981 E.02169
M204 S250
G1 X39.317 Y110.625 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.368 Y110.592 E.00186
G3 X40.157 Y110.302 I.898 J1.224 E.02616
G1 X215.843 Y110.302 E5.39837
G3 X216.307 Y110.41 I-.362 J2.593 E.01463
G3 X217.248 Y111.707 I-.573 J1.406 E.05186
G1 X217.248 Y140.293 E.8784
G3 X215.804 Y141.699 I-1.519 J-.117 E.06766
G1 X40.157 Y141.698 E5.39714
G3 X39.693 Y141.59 I.361 J-2.591 E.01463
G3 X38.752 Y140.293 I.573 J-1.406 E.05186
G1 X38.751 Y111.746 E.87717
G3 X38.86 Y111.243 I2.82 J.347 E.01584
G3 X39.225 Y110.712 I1.406 J.573 E.01996
G1 X39.273 Y110.666 E.00204
; WIPE_START
M204 S10000
G1 X39.368 Y110.592 E-.04567
G1 X39.523 Y110.488 E-.07101
G1 X39.693 Y110.41 E-.07122
G1 X39.873 Y110.355 E-.07121
G1 X40.157 Y110.302 E-.10977
G1 X41.186 Y110.302 E-.39114
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.623 Y105.869 E.01123
G3 X221.698 Y113.265 I-.321 J7.389 E.37495
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.191 Y107.743 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00029
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.643 Y105.477 E.0107
G1 X215.064 Y105.498 E.01295
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.151 Y107.788 E.02158
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.0235
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.724 Y106.562 E-.15565
; WIPE_END
G1 E-.04 F1800
G1 X36.532 Y112.955 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X36.569 Y111.328 I8.285 J-.625 E.05405
G1 X35.382 Y110.142 E.05566
G2 X34.829 Y111.708 I6.523 J3.187 E.05522
G1 X40.158 Y106.379 E.25
G2 X39.483 Y106.566 I.615 J3.523 E.02328
G1 X40.998 Y108.081 E.07107
G1 X46.131 Y108.081 E.17029
G1 X48.012 Y106.2 E.08824
G1 X46.793 Y106.2 E.04046
G1 X48.674 Y108.081 E.08824
G1 X53.807 Y108.081 E.17029
G1 X55.688 Y106.2 E.08824
G1 X54.469 Y106.2 E.04046
G1 X56.35 Y108.081 E.08824
G1 X61.483 Y108.081 E.17029
G1 X63.364 Y106.2 E.08824
G1 X62.145 Y106.2 E.04046
G1 X64.026 Y108.081 E.08824
G1 X69.159 Y108.081 E.17029
G1 X71.04 Y106.2 E.08824
G1 X69.821 Y106.2 E.04046
G1 X71.701 Y108.081 E.08824
G1 X76.835 Y108.081 E.17029
G1 X78.716 Y106.2 E.08824
G1 X77.496 Y106.2 E.04046
G1 X79.377 Y108.081 E.08824
G1 X84.511 Y108.081 E.17029
G1 X86.392 Y106.2 E.08824
G1 X85.172 Y106.2 E.04046
G1 X87.053 Y108.081 E.08824
G1 X92.187 Y108.081 E.17029
G1 X94.068 Y106.2 E.08824
G1 X92.848 Y106.2 E.04046
G1 X94.729 Y108.081 E.08824
G1 X99.863 Y108.081 E.17029
G1 X101.744 Y106.2 E.08824
G1 X100.524 Y106.2 E.04046
G1 X102.405 Y108.081 E.08824
G1 X107.539 Y108.081 E.17029
G1 X109.42 Y106.2 E.08824
G1 X108.2 Y106.2 E.04046
G1 X110.081 Y108.081 E.08824
G1 X115.215 Y108.081 E.17029
G1 X117.096 Y106.2 E.08824
G1 X115.876 Y106.2 E.04046
G1 X117.757 Y108.081 E.08824
G1 X122.891 Y108.081 E.17029
G1 X124.772 Y106.2 E.08824
G1 X123.552 Y106.2 E.04046
G1 X125.433 Y108.081 E.08824
G1 X130.567 Y108.081 E.17029
G1 X132.448 Y106.2 E.08824
G1 X131.228 Y106.2 E.04046
G1 X133.109 Y108.081 E.08824
G1 X138.243 Y108.081 E.17029
G1 X140.124 Y106.2 E.08824
G1 X138.904 Y106.2 E.04046
G1 X140.785 Y108.081 E.08824
G1 X145.919 Y108.081 E.17029
G1 X147.8 Y106.2 E.08824
G1 X146.58 Y106.2 E.04046
G1 X148.461 Y108.081 E.08824
G1 X153.595 Y108.081 E.17029
G1 X155.476 Y106.2 E.08824
G1 X154.256 Y106.2 E.04046
G1 X156.137 Y108.081 E.08824
G1 X161.271 Y108.081 E.17029
G1 X163.152 Y106.2 E.08824
G1 X161.932 Y106.2 E.04046
G1 X163.813 Y108.081 E.08824
G1 X168.947 Y108.081 E.17029
G1 X170.828 Y106.2 E.08824
G1 X169.608 Y106.2 E.04046
G1 X171.489 Y108.081 E.08824
G1 X176.623 Y108.081 E.17029
G1 X178.504 Y106.2 E.08824
G1 X177.284 Y106.2 E.04046
G1 X179.165 Y108.081 E.08824
G1 X184.299 Y108.081 E.17029
G1 X186.179 Y106.2 E.08824
G1 X184.96 Y106.2 E.04046
G1 X186.841 Y108.081 E.08824
G1 X191.974 Y108.081 E.17029
G1 X193.855 Y106.2 E.08824
G1 X192.636 Y106.2 E.04046
G1 X194.517 Y108.081 E.08824
G1 X199.65 Y108.081 E.17029
G1 X201.531 Y106.2 E.08824
G1 X200.312 Y106.2 E.04046
G1 X202.193 Y108.081 E.08824
G1 X207.326 Y108.081 E.17029
G1 X209.207 Y106.2 E.08824
G1 X207.988 Y106.2 E.04046
G1 X209.869 Y108.081 E.08824
G1 X215.002 Y108.081 E.17029
G1 X216.517 Y106.566 E.07107
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X221.171 Y111.708 E.25
G2 X220.618 Y110.142 I-7.076 J1.62 E.05522
G1 X219.428 Y111.332 E.05584
G3 X219.458 Y111.557 I-1.521 J.324 E.00753
G1 X219.459 Y112.958 E.04649
G1 X221.35 Y136.542 F30000
G1 F15476.087
G1 X221.35 Y134.914 E.05401
G1 X219.466 Y133.031 E.08836
G1 X219.467 Y134.321 E.0428
G1 X221.35 Y132.438 E.08834
G1 X221.35 Y127.238 E.17248
G1 X219.463 Y125.352 E.08849
G1 X219.464 Y126.648 E.04298
G1 X221.35 Y124.762 E.08847
G1 X221.35 Y119.562 E.17248
G1 X219.461 Y117.673 E.08862
G1 X219.461 Y118.974 E.04317
G1 X221.35 Y117.086 E.0886
G1 X221.35 Y115.458 E.05401
G1 X219.468 Y139.045 F30000
G1 F15476.087
G3 X219.431 Y140.672 I-8.288 J.625 E.05405
G1 X220.618 Y141.858 E.05566
G2 X221.171 Y140.292 I-6.523 J-3.187 E.05522
G1 X215.842 Y145.621 E.25
G2 X216.517 Y145.434 I-.614 J-3.521 E.02328
G1 X215.002 Y143.919 E.07107
G1 X209.869 Y143.919 E.17029
G1 X207.988 Y145.8 E.08824
G1 X209.207 Y145.8 E.04046
G1 X207.326 Y143.919 E.08824
G1 X202.193 Y143.919 E.17029
G1 X200.312 Y145.8 E.08824
G1 X201.531 Y145.8 E.04046
G1 X199.65 Y143.919 E.08824
G1 X194.517 Y143.919 E.17029
G1 X192.636 Y145.8 E.08824
G1 X193.855 Y145.8 E.04046
G1 X191.974 Y143.919 E.08824
G1 X186.841 Y143.919 E.17029
G1 X184.96 Y145.8 E.08824
G1 X186.179 Y145.8 E.04046
G1 X184.299 Y143.919 E.08824
G1 X179.165 Y143.919 E.17029
G1 X177.284 Y145.8 E.08824
G1 X178.503 Y145.8 E.04046
G1 X176.623 Y143.919 E.08824
G1 X171.489 Y143.919 E.17029
G1 X169.608 Y145.8 E.08824
G1 X170.828 Y145.8 E.04046
G1 X168.947 Y143.919 E.08824
G1 X163.813 Y143.919 E.17029
G1 X161.932 Y145.8 E.08824
G1 X163.152 Y145.8 E.04046
G1 X161.271 Y143.919 E.08824
G1 X156.137 Y143.919 E.17029
G1 X154.256 Y145.8 E.08824
G1 X155.476 Y145.8 E.04046
G1 X153.595 Y143.919 E.08824
G1 X148.461 Y143.919 E.17029
G1 X146.58 Y145.8 E.08824
G1 X147.8 Y145.8 E.04046
G1 X145.919 Y143.919 E.08824
G1 X140.785 Y143.919 E.17029
G1 X138.904 Y145.8 E.08824
G1 X140.124 Y145.8 E.04046
G1 X138.243 Y143.919 E.08824
G1 X133.109 Y143.919 E.17029
G1 X131.228 Y145.8 E.08824
G1 X132.448 Y145.8 E.04046
G1 X130.567 Y143.919 E.08824
G1 X125.433 Y143.919 E.17029
G1 X123.552 Y145.8 E.08824
G1 X124.772 Y145.8 E.04046
G1 X122.891 Y143.919 E.08824
G1 X117.757 Y143.919 E.17029
G1 X115.876 Y145.8 E.08824
G1 X117.096 Y145.8 E.04046
G1 X115.215 Y143.919 E.08824
G1 X110.081 Y143.919 E.17029
G1 X108.2 Y145.8 E.08824
G1 X109.42 Y145.8 E.04046
G1 X107.539 Y143.919 E.08824
G1 X102.405 Y143.919 E.17029
G1 X100.524 Y145.8 E.08824
G1 X101.744 Y145.8 E.04046
G1 X99.863 Y143.919 E.08824
G1 X94.729 Y143.919 E.17029
G1 X92.848 Y145.8 E.08824
G1 X94.068 Y145.8 E.04046
G1 X92.187 Y143.919 E.08824
G1 X87.053 Y143.919 E.17029
G1 X85.172 Y145.8 E.08824
G1 X86.392 Y145.8 E.04046
G1 X84.511 Y143.919 E.08824
G1 X79.377 Y143.919 E.17029
G1 X77.496 Y145.8 E.08824
G1 X78.716 Y145.8 E.04046
G1 X76.835 Y143.919 E.08824
G1 X71.701 Y143.919 E.17029
G1 X69.821 Y145.8 E.08824
G1 X71.04 Y145.8 E.04046
G1 X69.159 Y143.919 E.08824
G1 X64.026 Y143.919 E.17029
G1 X62.145 Y145.8 E.08824
G1 X63.364 Y145.8 E.04046
G1 X61.483 Y143.919 E.08824
G1 X56.35 Y143.919 E.17029
G1 X54.469 Y145.8 E.08824
G1 X55.688 Y145.8 E.04046
G1 X53.807 Y143.919 E.08824
G1 X48.674 Y143.919 E.17029
G1 X46.793 Y145.8 E.08824
G1 X48.012 Y145.8 E.04046
G1 X46.131 Y143.919 E.08824
G1 X40.998 Y143.919 E.17029
G1 X39.483 Y145.434 E.07107
G2 X40.158 Y145.621 I1.29 J-3.335 E.02328
G1 X34.829 Y140.292 E.25
G2 X35.382 Y141.858 I7.076 J-1.62 E.05522
G1 X36.572 Y140.668 E.05584
G3 X36.542 Y140.443 I1.521 J-.324 E.00753
G1 X36.541 Y139.042 E.04649
G1 X34.65 Y115.458 F30000
G1 F15476.087
G1 X34.65 Y117.086 E.05401
G1 X36.534 Y118.969 E.08836
G1 X36.533 Y117.679 E.0428
G1 X34.65 Y119.562 E.08834
G1 X34.65 Y124.762 E.17248
G1 X36.537 Y126.648 E.08849
G1 X36.536 Y125.352 E.04298
G1 X34.65 Y127.238 E.08847
G1 X34.65 Y132.438 E.17248
G1 X36.539 Y134.327 E.08862
G1 X36.539 Y133.026 E.04317
G1 X34.65 Y134.914 E.0886
G1 X34.65 Y136.542 E.05401
; WIPE_START
G1 X34.65 Y134.914 E-.61876
G1 X34.913 Y134.651 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X42.54 Y134.948 Z3.2 F30000
G1 X218.681 Y141.794 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
G1 X218.929 Y141.195 E.01992
G2 X219.076 Y140.254 I-5.101 J-1.28 E.02931
G1 X219.066 Y111.615 E.87996
G2 X218.21 Y109.561 I-3.302 J.171 E.06974
G1 X217.824 Y109.189 E.01648
G1 X217.35 Y108.872 E.01751
G1 X216.917 Y108.682 E.01454
G1 X216.329 Y108.524 E.01872
G1 X215.821 Y108.473 E.01569
G1 X40.175 Y108.474 E5.39695
G1 X39.444 Y108.57 E.02267
G1 X38.854 Y108.771 E.01914
G1 X38.289 Y109.098 E.02005
G1 X37.818 Y109.512 E.01925
G1 X37.42 Y110.031 E.02012
G1 X37.141 Y110.598 E.01941
G1 X36.973 Y111.226 E.01997
G1 X36.924 Y111.746 E.01604
G1 X36.934 Y140.422 E.88112
G1 X37.017 Y140.992 E.01769
G2 X37.443 Y142.002 I3.967 J-1.081 E.03378
G2 X38.65 Y143.128 I3.06 J-2.069 E.05114
G1 X39.083 Y143.318 E.01454
G1 X39.671 Y143.476 E.01872
G1 X40.17 Y143.526 E.01539
G1 X215.821 Y143.527 E5.39713
G1 X216.324 Y143.477 E.01553
G1 X216.955 Y143.308 E.02007
G2 X218.336 Y142.311 I-1.387 J-3.379 E.05283
G1 X218.647 Y141.844 E.01725
G1 X218.713 Y111.615 F30000
; LINE_WIDTH: 0.376081
G1 F12000
G2 X217.895 Y109.745 I-2.952 J.178 E.05658
G1 X217.469 Y109.377 E.0153
G1 X217 Y109.103 E.01475
G2 X215.795 Y108.829 I-1.572 J4.126 E.03367
M73 P79 R6
G1 X40.21 Y108.829 E4.76684
G1 X39.575 Y108.912 E.01737
G1 X39.082 Y109.069 E.01406
G1 X38.578 Y109.342 E.01556
G1 X38.141 Y109.701 E.01534
G1 X37.78 Y110.146 E.01557
G1 X37.516 Y110.642 E.01525
G1 X37.334 Y111.278 E.01795
G1 X37.279 Y111.746 E.01278
G1 X37.286 Y140.355 E.7767
G1 X37.36 Y140.877 E.01432
G2 X37.761 Y141.833 I3.169 J-.766 E.02825
G1 X38.105 Y142.255 E.01478
G1 X38.531 Y142.623 E.0153
G1 X39 Y142.897 E.01475
G2 X40.196 Y143.171 I1.577 J-4.139 E.03341
G1 X215.795 Y143.171 E4.76722
G2 X216.82 Y142.975 I-.204 J-3.835 E.02844
G1 X217.277 Y142.749 E.01381
G1 X217.738 Y142.409 E.01556
G1 X218.121 Y141.994 E.01533
G1 X218.417 Y141.504 E.01555
G1 X218.612 Y140.986 E.01503
G2 X218.721 Y140.254 I-3.855 J-.948 E.02011
G1 X218.714 Y111.675 E.77586
; WIPE_START
G1 X218.714 Y113.675 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.17 Y114.836 Z3.2 F30000
G1 X38.317 Y141.421 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F12000
G1 X38.137 Y141.042 E.01292
G1 X37.968 Y140.355 E.02173
G1 X37.967 Y111.724 E.87973
G1 X38.119 Y110.991 E.023
G1 X38.326 Y110.565 E.01454
G3 X39.696 Y109.591 I1.875 J1.185 E.05297
G1 X40.21 Y109.518 E.01595
G1 X215.905 Y109.518 E5.39848
G1 X216.329 Y109.598 E.01327
G1 X216.827 Y109.794 E.01644
G1 X217.182 Y110.025 E.01302
G1 X217.507 Y110.348 E.01408
G1 X217.817 Y110.829 E.01757
G3 X218.032 Y111.645 I-2.643 J1.134 E.02603
G1 X218.032 Y140.355 E.88215
G1 X217.924 Y140.863 E.01597
G3 X216.559 Y142.331 I-2.188 J-.666 E.06376
G1 X215.795 Y142.483 E.02394
G1 X40.095 Y142.482 E5.39862
M73 P80 R6
G1 X39.671 Y142.402 E.01327
G1 X39.173 Y142.206 E.01644
G1 X38.818 Y141.975 E.01302
G3 X38.354 Y141.469 I1.599 J-1.934 E.02116
G1 X38.014 Y141.609 F30000
; LINE_WIDTH: 0.376124
G1 F12000
G1 X37.797 Y141.157 E.0136
G1 X37.625 Y140.457 E.01957
G1 X37.615 Y140.355 E.00278
G1 X37.612 Y111.746 E.7768
G1 X37.771 Y110.917 E.02291
G1 X37.988 Y110.44 E.01423
G1 X38.289 Y110.03 E.0138
G1 X38.695 Y109.662 E.0149
G1 X39.141 Y109.404 E.01398
G1 X39.629 Y109.242 E.01395
G1 X40.21 Y109.162 E.01592
G1 X215.795 Y109.162 E4.76745
G1 X216.371 Y109.244 E.01581
G1 X216.861 Y109.406 E.01402
G1 X217.342 Y109.693 E.0152
G1 X217.792 Y110.13 E.01702
G1 X218.003 Y110.422 E.00978
G1 X218.203 Y110.843 E.01267
G1 X218.375 Y111.543 E.01957
G1 X218.387 Y140.254 E.77956
G1 X218.308 Y140.821 E.01555
G1 X218.12 Y141.357 E.01543
G1 X217.857 Y141.792 E.01379
G1 X217.433 Y142.231 E.01658
G1 X217.016 Y142.512 E.01364
G1 X216.633 Y142.679 E.01136
G1 X215.939 Y142.826 E.01925
G1 X215.795 Y142.838 E.00393
G1 X40.196 Y142.837 E4.76783
G1 X39.629 Y142.756 E.01555
G1 X39.139 Y142.594 E.01403
G1 X38.658 Y142.307 E.0152
G1 X38.208 Y141.87 E.01702
G1 X38.05 Y141.657 E.00722
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X38.208 Y141.87 E-.10107
G1 X38.658 Y142.307 E-.23818
G1 X39.139 Y142.594 E-.21273
G1 X39.629 Y142.756 E-.1963
G1 X39.66 Y142.761 E-.01172
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/35
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.2 I1.216 J-.035 P1  F30000
G1 X38.727 Y109.963 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X38.848 Y109.859 E.00529
G3 X40.19 Y109.415 I1.378 J1.916 E.04763
G1 X215.81 Y109.415 E5.82564
G3 X218.133 Y111.668 I-.045 J2.371 E.11814
G1 X218.135 Y140.26 E.94845
G3 X215.81 Y142.585 I-2.36 J-.035 E.12064
G1 X40.19 Y142.585 E5.82564
G3 X37.867 Y140.332 I.045 J-2.371 E.11814
G1 X37.865 Y111.74 E.94845
G3 X38.502 Y110.163 I2.36 J.035 E.05772
G1 X38.682 Y110.003 E.00799
M204 S250
G1 X38.984 Y110.257 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X39.076 Y110.177 E.00373
G3 X40.196 Y109.807 I1.149 J1.598 E.03682
G1 X215.804 Y109.807 E5.39592
G3 X217.741 Y111.693 I-.037 J1.976 E.0915
G1 X217.743 Y140.254 E.87758
G3 X215.804 Y142.193 I-1.968 J-.029 E.09323
G1 X40.196 Y142.193 E5.39592
G3 X38.259 Y140.307 I.037 J-1.976 E.0915
G1 X38.257 Y111.746 E.87758
G3 X38.788 Y110.431 I1.968 J.029 E.0446
G1 X38.94 Y110.297 E.00622
; WIPE_START
M204 S10000
G1 X39.076 Y110.177 E-.06888
G1 X39.4 Y109.99 E-.14222
G1 X39.763 Y109.866 E-.14583
G1 X40.196 Y109.807 E-.16614
G1 X40.82 Y109.807 E-.23693
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.649 Y105.87 E.0121
G3 X221.698 Y113.265 I-.347 J7.387 E.37408
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.19 Y107.743 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00029
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.669 Y105.478 E.0115
G1 X215.064 Y105.498 E.01215
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.151 Y107.788 E.02157
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.0237
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.723 Y106.563 E-.15546
; WIPE_END
G1 E-.04 F1800
G1 X36.945 Y114.155 Z3.4 F30000
G1 X34.65 Y136.542 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X34.65 Y134.914 E.05401
G1 X36.316 Y133.248 E.07815
G1 X36.316 Y134.104 E.02837
G1 X34.65 Y132.438 E.07815
G1 X34.65 Y127.238 E.17248
G1 X36.316 Y125.572 E.07815
G1 X36.316 Y126.428 E.02837
G1 X34.65 Y124.762 E.07815
G1 X34.65 Y119.562 E.17248
G1 X36.316 Y117.896 E.07815
G1 X36.316 Y118.752 E.02837
G1 X34.65 Y117.086 E.07815
G1 X34.65 Y115.458 E.05401
G1 X36.316 Y139.241 F30000
G1 F15476.087
G2 X36.375 Y140.865 I7.487 J.542 E.05403
G1 X35.382 Y141.858 E.04657
G3 X34.829 Y140.292 I6.523 J-3.186 E.05522
G1 X37.047 Y142.511 E.10407
G2 X37.939 Y143.402 I2.929 J-2.038 E.04204
G1 X40.158 Y145.621 E.10411
G3 X39.483 Y145.434 I.614 J-3.522 E.02328
G1 X40.783 Y144.134 E.06098
G1 X46.346 Y144.134 E.18456
G1 X48.012 Y145.8 E.07815
G1 X46.793 Y145.8 E.04046
G1 X48.459 Y144.134 E.07815
G1 X54.022 Y144.134 E.18456
G1 X55.688 Y145.8 E.07815
G1 X54.469 Y145.8 E.04046
G1 X56.134 Y144.134 E.07815
G1 X61.698 Y144.134 E.18456
G1 X63.364 Y145.8 E.07815
G1 X62.145 Y145.8 E.04046
G1 X63.81 Y144.134 E.07815
G1 X69.374 Y144.134 E.18456
G1 X71.04 Y145.8 E.07815
G1 X69.821 Y145.8 E.04046
G1 X71.486 Y144.134 E.07815
G1 X77.05 Y144.134 E.18456
G1 X78.716 Y145.8 E.07815
G1 X77.496 Y145.8 E.04046
G1 X79.162 Y144.134 E.07815
G1 X84.726 Y144.134 E.18456
G1 X86.392 Y145.8 E.07815
G1 X85.172 Y145.8 E.04046
G1 X86.838 Y144.134 E.07815
G1 X92.402 Y144.134 E.18456
G1 X94.068 Y145.8 E.07815
G1 X92.848 Y145.8 E.04046
G1 X94.514 Y144.134 E.07815
G1 X100.078 Y144.134 E.18456
G1 X101.744 Y145.8 E.07815
G1 X100.524 Y145.8 E.04046
G1 X102.19 Y144.134 E.07815
G1 X107.754 Y144.134 E.18456
G1 X109.42 Y145.8 E.07815
G1 X108.2 Y145.8 E.04046
G1 X109.866 Y144.134 E.07815
G1 X115.43 Y144.134 E.18456
G1 X117.096 Y145.8 E.07815
G1 X115.876 Y145.8 E.04046
G1 X117.542 Y144.134 E.07815
G1 X123.106 Y144.134 E.18456
G1 X124.772 Y145.8 E.07815
G1 X123.552 Y145.8 E.04046
G1 X125.218 Y144.134 E.07815
G1 X130.782 Y144.134 E.18456
G1 X132.448 Y145.8 E.07815
G1 X131.228 Y145.8 E.04046
G1 X132.894 Y144.134 E.07815
G1 X138.458 Y144.134 E.18456
G1 X140.124 Y145.8 E.07815
G1 X138.904 Y145.8 E.04046
G1 X140.57 Y144.134 E.07815
G1 X146.134 Y144.134 E.18456
G1 X147.8 Y145.8 E.07815
G1 X146.58 Y145.8 E.04046
G1 X148.246 Y144.134 E.07815
G1 X153.81 Y144.134 E.18456
G1 X155.476 Y145.8 E.07815
G1 X154.256 Y145.8 E.04046
G1 X155.922 Y144.134 E.07815
G1 X161.486 Y144.134 E.18456
G1 X163.152 Y145.8 E.07815
G1 X161.932 Y145.8 E.04046
G1 X163.598 Y144.134 E.07815
G1 X169.162 Y144.134 E.18456
G1 X170.828 Y145.8 E.07815
G1 X169.608 Y145.8 E.04046
G1 X171.274 Y144.134 E.07815
G1 X176.838 Y144.134 E.18456
G1 X178.503 Y145.8 E.07815
G1 X177.284 Y145.8 E.04046
G1 X178.95 Y144.134 E.07815
G1 X184.514 Y144.134 E.18456
G1 X186.179 Y145.8 E.07815
G1 X184.96 Y145.8 E.04046
G1 X186.626 Y144.134 E.07815
G1 X192.19 Y144.134 E.18456
G1 X193.855 Y145.8 E.07815
G1 X192.636 Y145.8 E.04046
G1 X194.302 Y144.134 E.07815
G1 X199.865 Y144.134 E.18456
G1 X201.531 Y145.8 E.07815
G1 X200.312 Y145.8 E.04046
G1 X201.978 Y144.134 E.07815
G1 X207.541 Y144.134 E.18456
G1 X209.207 Y145.8 E.07815
G1 X207.988 Y145.8 E.04046
G1 X209.654 Y144.134 E.07815
G1 X215.217 Y144.134 E.18456
G1 X216.517 Y145.434 E.06098
G3 X215.842 Y145.621 I-1.29 J-3.335 E.02328
G1 X218.067 Y143.397 E.10435
G2 X221.171 Y140.292 I-45.573 J-48.678 E.14568
G3 X220.618 Y141.858 I-7.075 J-1.62 E.05522
G1 X219.63 Y140.87 E.04634
G2 X219.684 Y139.245 I-8.675 J-1.101 E.05402
G1 X219.253 Y140.753 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
G1 X219.292 Y140.262 E.01514
G1 X219.292 Y111.745 E.87623
G1 X219.206 Y111.022 E.02237
G1 X219.03 Y110.43 E.01897
G1 X218.805 Y109.975 E.0156
G1 X218.395 Y109.425 E.02107
G2 X216.669 Y108.37 I-2.633 J2.37 E.06303
G2 X215.805 Y108.258 I-1.174 J5.676 E.0268
G1 X40.181 Y108.258 E5.3963
G1 X39.477 Y108.341 E.02177
G1 X38.91 Y108.507 E.01815
G2 X37.279 Y109.849 I1.343 J3.296 E.06589
G1 X36.995 Y110.368 E.01819
G1 X36.825 Y110.856 E.01587
G1 X36.708 Y111.739 E.02736
G1 X36.708 Y140.268 E.8766
G1 X36.794 Y140.978 E.02199
G1 X36.97 Y141.57 E.01897
G1 X37.195 Y142.025 E.0156
G1 X37.605 Y142.575 E.02107
G2 X39.331 Y143.63 I2.633 J-2.37 E.06303
G2 X40.188 Y143.741 I1.166 J-5.614 E.02658
G1 X215.819 Y143.742 E5.39652
G1 X216.354 Y143.693 E.01652
G1 X216.955 Y143.537 E.01905
G2 X218.854 Y141.93 I-1.188 J-3.33 E.07813
G1 X219.112 Y141.331 E.02003
G1 X219.239 Y140.811 E.01645
; WIPE_START
G1 X219.112 Y141.331 E-.20346
G1 X218.854 Y141.93 E-.2477
G1 X218.569 Y142.374 E-.20051
G1 X218.381 Y142.588 E-.10833
; WIPE_END
G1 E-.04 F1800
G1 X210.749 Y142.515 Z3.4 F30000
G1 X37.549 Y140.853 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
G1 X37.475 Y140.348 E.01569
G1 X37.473 Y111.729 E.87935
G3 X39.059 Y109.283 I2.813 J.087 E.09416
G1 X39.542 Y109.115 E.01571
G1 X40.194 Y109.023 E.02024
G1 X215.821 Y109.023 E5.39638
G1 X216.529 Y109.138 E.02202
G1 X217.063 Y109.343 E.01759
G1 X217.509 Y109.637 E.01641
G1 X217.8 Y109.91 E.01226
G1 X218.112 Y110.32 E.01582
G3 X218.525 Y111.652 I-2.91 J1.634 E.0432
G1 X218.527 Y140.271 E.87935
G1 X218.412 Y140.979 E.02203
G1 X218.207 Y141.513 E.01758
G1 X217.925 Y141.941 E.01574
G1 X217.54 Y142.338 E.017
G1 X217.098 Y142.638 E.01641
G1 X216.735 Y142.802 E.01226
G3 X215.806 Y142.977 I-1.022 J-2.873 E.02917
G1 X40.179 Y142.977 E5.39638
G1 X39.471 Y142.862 E.02202
G1 X38.937 Y142.657 E.01759
G1 X38.491 Y142.363 E.01641
G1 X38.2 Y142.09 E.01226
G1 X37.888 Y141.68 E.01582
G3 X37.568 Y140.91 I2.387 J-1.443 E.02574
; WIPE_START
G1 X37.705 Y141.321 E-.16495
G1 X37.888 Y141.68 E-.15306
G1 X38.2 Y142.09 E-.19565
G1 X38.491 Y142.363 E-.15159
G1 X38.699 Y142.5 E-.09475
; WIPE_END
G1 E-.04 F1800
G1 X46.223 Y141.216 Z3.4 F30000
G1 X218.909 Y111.745 Z3.4
M73 P81 R6
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431065
G1 F12000
G1 X218.829 Y111.09 E.02087
G1 X218.662 Y110.554 E.01775
G2 X217.723 Y109.316 I-3.194 J1.449 E.04954
G1 X217.242 Y109.004 E.01815
G1 X216.759 Y108.802 E.01656
G2 X215.805 Y108.641 I-1.216 J4.295 E.03066
G1 X40.194 Y108.641 E5.55437
G1 X39.552 Y108.718 E.02048
G1 X39.033 Y108.877 E.01715
G1 X38.442 Y109.196 E.02126
G1 X38.022 Y109.542 E.01722
G1 X37.598 Y110.063 E.02122
G1 X37.343 Y110.543 E.01719
G1 X37.152 Y111.184 E.02115
G2 X37.091 Y111.739 I4.051 J.727 E.01767
G1 X37.091 Y140.255 E.90195
G1 X37.171 Y140.91 E.02087
G1 X37.338 Y141.446 E.01775
G2 X38.277 Y142.684 I3.194 J-1.449 E.04954
G1 X38.758 Y142.996 E.01815
G1 X39.241 Y143.198 E.01656
G2 X40.188 Y143.359 I1.222 J-4.322 E.03044
G1 X215.806 Y143.359 E5.55459
G2 X218.475 Y141.819 I-.056 J-3.18 E.10175
G1 X218.748 Y141.209 E.02115
G2 X218.909 Y140.262 I-4.32 J-1.222 E.03046
G1 X218.909 Y111.805 E.90006
G1 X219.684 Y112.759 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X219.625 Y111.135 I-7.49 J-.542 E.05403
G1 X220.618 Y110.142 E.04657
G3 X221.171 Y111.708 I-6.523 J3.186 E.05522
G1 X218.953 Y109.489 E.10407
G2 X218.061 Y108.598 I-2.929 J2.038 E.04204
G1 X215.842 Y106.379 E.10411
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X215.217 Y107.866 E.06098
G1 X209.654 Y107.866 E.18456
G1 X207.988 Y106.2 E.07815
G1 X209.207 Y106.2 E.04046
G1 X207.541 Y107.866 E.07815
G1 X201.978 Y107.866 E.18456
G1 X200.312 Y106.2 E.07815
G1 X201.531 Y106.2 E.04046
G1 X199.866 Y107.866 E.07815
G1 X194.302 Y107.866 E.18456
G1 X192.636 Y106.2 E.07815
G1 X193.855 Y106.2 E.04046
G1 X192.19 Y107.866 E.07815
G1 X186.626 Y107.866 E.18456
G1 X184.96 Y106.2 E.07815
G1 X186.179 Y106.2 E.04046
G1 X184.514 Y107.866 E.07815
G1 X178.95 Y107.866 E.18456
G1 X177.284 Y106.2 E.07815
G1 X178.504 Y106.2 E.04046
G1 X176.838 Y107.866 E.07815
G1 X171.274 Y107.866 E.18456
G1 X169.608 Y106.2 E.07815
G1 X170.828 Y106.2 E.04046
G1 X169.162 Y107.866 E.07815
G1 X163.598 Y107.866 E.18456
G1 X161.932 Y106.2 E.07815
G1 X163.152 Y106.2 E.04046
G1 X161.486 Y107.866 E.07815
G1 X155.922 Y107.866 E.18456
G1 X154.256 Y106.2 E.07815
G1 X155.476 Y106.2 E.04046
G1 X153.81 Y107.866 E.07815
G1 X148.246 Y107.866 E.18456
G1 X146.58 Y106.2 E.07815
G1 X147.8 Y106.2 E.04046
G1 X146.134 Y107.866 E.07815
G1 X140.57 Y107.866 E.18456
G1 X138.904 Y106.2 E.07815
G1 X140.124 Y106.2 E.04046
G1 X138.458 Y107.866 E.07815
G1 X132.894 Y107.866 E.18456
G1 X131.228 Y106.2 E.07815
G1 X132.448 Y106.2 E.04046
G1 X130.782 Y107.866 E.07815
G1 X125.218 Y107.866 E.18456
G1 X123.552 Y106.2 E.07815
G1 X124.772 Y106.2 E.04046
G1 X123.106 Y107.866 E.07815
G1 X117.542 Y107.866 E.18456
G1 X115.876 Y106.2 E.07815
G1 X117.096 Y106.2 E.04046
G1 X115.43 Y107.866 E.07815
G1 X109.866 Y107.866 E.18456
G1 X108.2 Y106.2 E.07815
G1 X109.42 Y106.2 E.04046
G1 X107.754 Y107.866 E.07815
G1 X102.19 Y107.866 E.18456
G1 X100.524 Y106.2 E.07815
G1 X101.744 Y106.2 E.04046
G1 X100.078 Y107.866 E.07815
G1 X94.514 Y107.866 E.18456
G1 X92.848 Y106.2 E.07815
G1 X94.068 Y106.2 E.04046
G1 X92.402 Y107.866 E.07815
G1 X86.838 Y107.866 E.18456
G1 X85.172 Y106.2 E.07815
G1 X86.392 Y106.2 E.04046
G1 X84.726 Y107.866 E.07815
G1 X79.162 Y107.866 E.18456
G1 X77.496 Y106.2 E.07815
G1 X78.716 Y106.2 E.04046
G1 X77.05 Y107.866 E.07815
G1 X71.486 Y107.866 E.18456
G1 X69.821 Y106.2 E.07815
G1 X71.04 Y106.2 E.04046
G1 X69.374 Y107.866 E.07815
G1 X63.81 Y107.866 E.18456
G1 X62.145 Y106.2 E.07815
G1 X63.364 Y106.2 E.04046
G1 X61.698 Y107.866 E.07815
G1 X56.135 Y107.866 E.18456
G1 X54.469 Y106.2 E.07815
G1 X55.688 Y106.2 E.04046
G1 X54.022 Y107.866 E.07815
G1 X48.459 Y107.866 E.18456
G1 X46.793 Y106.2 E.07815
G1 X48.012 Y106.2 E.04046
G1 X46.346 Y107.866 E.07815
G1 X40.783 Y107.866 E.18456
G1 X39.483 Y106.566 E.06098
G3 X40.158 Y106.379 I1.29 J3.334 E.02328
G1 X37.933 Y108.603 E.10435
G2 X37.047 Y109.489 I2.016 J2.902 E.0418
G1 X34.829 Y111.708 E.10408
G3 X35.382 Y110.142 I7.075 J1.62 E.05522
G1 X36.371 Y111.131 E.0464
G2 X36.316 Y112.756 I8.09 J1.089 E.05402
; WIPE_START
G1 X36.371 Y111.131 E-.61785
G1 X36.107 Y110.867 E-.14215
; WIPE_END
G1 E-.04 F1800
G1 X43.737 Y111.056 Z3.4 F30000
G1 X221.35 Y115.458 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X221.35 Y117.086 E.05401
G1 X219.684 Y118.752 E.07815
G1 X219.684 Y117.896 E.02837
G1 X221.35 Y119.562 E.07815
G1 X221.35 Y124.762 E.17248
G1 X219.684 Y126.428 E.07815
G1 X219.684 Y125.572 E.02837
G1 X221.35 Y127.238 E.07815
G1 X221.35 Y132.438 E.17248
G1 X219.684 Y134.104 E.07815
G1 X219.684 Y133.248 E.02837
G1 X221.35 Y134.914 E.07815
G1 X221.35 Y136.542 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X221.35 Y134.914 E-.61876
G1 X221.087 Y134.651 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/35
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.4 I.165 J-1.206 P1  F30000
G1 X38.472 Y109.691 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X38.605 Y109.581 E.00573
G3 X40.19 Y109.049 I1.617 J2.191 E.05636
G1 X215.81 Y109.049 E5.82565
G3 X218.501 Y111.74 I-.02 J2.71 E.13991
G1 X218.501 Y140.26 E.94607
G3 X215.81 Y142.951 I-2.71 J-.02 E.13991
G1 X40.19 Y142.951 E5.82565
G3 X37.499 Y140.26 I.02 J-2.71 E.13991
G1 X37.499 Y111.74 E.94607
G3 X38.259 Y109.886 I2.723 J.033 E.06806
G1 X38.427 Y109.732 E.00759
M204 S250
G1 X38.725 Y109.981 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X38.767 Y109.951 E.00156
G3 X40.196 Y109.441 I1.454 J1.82 E.04751
G1 X215.804 Y109.441 E5.39592
G3 X218.109 Y111.746 I-.013 J2.318 E.11109
G1 X218.109 Y140.254 E.87595
G3 X215.804 Y142.559 I-2.318 J-.013 E.11109
G1 X40.196 Y142.559 E5.39592
G3 X37.891 Y140.254 I.013 J-2.318 E.11109
G1 X37.891 Y111.746 E.87595
G3 X38.603 Y110.094 I2.329 J.024 E.05676
G1 X38.682 Y110.021 E.00328
; WIPE_START
M204 S10000
G1 X38.767 Y109.951 E-.04199
G1 X39.011 Y109.775 E-.11444
G1 X39.357 Y109.605 E-.14645
G1 X39.644 Y109.513 E-.11457
G1 X39.858 Y109.47 E-.08286
G1 X40.196 Y109.441 E-.12912
G1 X40.54 Y109.441 E-.13057
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.676 Y105.871 E.01297
G1 X215.025 Y105.888 E.01161
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.004 J-7.416 E.3862
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.19 Y107.744 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.0003
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.695 Y105.48 E.01231
G1 X215.064 Y105.498 E.01134
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.013 J-7.808 E.37608
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.15 Y107.789 E.02155
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02389
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.723 Y106.563 E-.15527
; WIPE_END
G1 E-.04 F1800
G1 X36.135 Y112.604 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X36.222 Y110.981 I6.78 J-.45 E.05403
G1 X35.382 Y110.142 E.03939
G2 X34.829 Y111.708 I6.523 J3.187 E.05522
G1 X36.545 Y109.992 E.08051
G3 X38.432 Y108.105 I3.603 J1.716 E.09026
G1 X40.158 Y106.379 E.08097
G2 X39.483 Y106.566 I.615 J3.523 E.02328
G1 X40.601 Y107.685 E.05248
G1 X46.528 Y107.685 E.19659
G1 X48.012 Y106.2 E.06965
G1 X46.793 Y106.2 E.04046
G1 X48.277 Y107.685 E.06965
G1 X54.204 Y107.685 E.19659
G1 X55.688 Y106.2 E.06965
G1 X54.469 Y106.2 E.04046
G1 X55.953 Y107.685 E.06965
G1 X61.88 Y107.685 E.19659
G1 X63.364 Y106.2 E.06965
G1 X62.145 Y106.2 E.04046
G1 X63.629 Y107.685 E.06965
G1 X69.556 Y107.685 E.19659
G1 X71.04 Y106.2 E.06965
G1 X69.821 Y106.2 E.04046
G1 X71.305 Y107.685 E.06965
G1 X77.231 Y107.685 E.19659
G1 X78.716 Y106.2 E.06965
G1 X77.496 Y106.2 E.04046
G1 X78.981 Y107.685 E.06965
G1 X84.907 Y107.685 E.19659
G1 X86.392 Y106.2 E.06965
G1 X85.172 Y106.2 E.04046
G1 X86.657 Y107.685 E.06965
G1 X92.583 Y107.685 E.19659
G1 X94.068 Y106.2 E.06965
G1 X92.848 Y106.2 E.04046
G1 X94.333 Y107.685 E.06965
G1 X100.259 Y107.685 E.19659
G1 X101.744 Y106.2 E.06965
G1 X100.524 Y106.2 E.04046
G1 X102.009 Y107.685 E.06965
G1 X107.935 Y107.685 E.19659
G1 X109.42 Y106.2 E.06965
G1 X108.2 Y106.2 E.04046
G1 X109.685 Y107.685 E.06965
G1 X115.611 Y107.685 E.19659
G1 X117.096 Y106.2 E.06965
G1 X115.876 Y106.2 E.04046
G1 X117.361 Y107.685 E.06965
G1 X123.287 Y107.685 E.19659
G1 X124.772 Y106.2 E.06965
G1 X123.552 Y106.2 E.04046
G1 X125.037 Y107.685 E.06965
G1 X130.963 Y107.685 E.19659
G1 X132.448 Y106.2 E.06965
G1 X131.228 Y106.2 E.04046
G1 X132.713 Y107.685 E.06965
G1 X138.639 Y107.685 E.19659
G1 X140.124 Y106.2 E.06965
G1 X138.904 Y106.2 E.04046
G1 X140.389 Y107.685 E.06965
G1 X146.315 Y107.685 E.19659
G1 X147.8 Y106.2 E.06965
G1 X146.58 Y106.2 E.04046
G1 X148.065 Y107.685 E.06965
G1 X153.991 Y107.685 E.19659
G1 X155.476 Y106.2 E.06965
G1 X154.256 Y106.2 E.04046
G1 X155.741 Y107.685 E.06965
G1 X161.667 Y107.685 E.19659
G1 X163.152 Y106.2 E.06965
G1 X161.932 Y106.2 E.04046
G1 X163.417 Y107.685 E.06965
G1 X169.343 Y107.685 E.19659
G1 X170.828 Y106.2 E.06965
G1 X169.608 Y106.2 E.04046
G1 X171.093 Y107.685 E.06965
G1 X177.019 Y107.685 E.19659
G1 X178.504 Y106.2 E.06965
G1 X177.284 Y106.2 E.04046
G1 X178.769 Y107.685 E.06965
G1 X184.695 Y107.685 E.19659
G1 X186.179 Y106.2 E.06965
G1 X184.96 Y106.2 E.04046
G1 X186.444 Y107.685 E.06965
G1 X192.371 Y107.685 E.19659
G1 X193.855 Y106.2 E.06965
G1 X192.636 Y106.2 E.04046
G1 X194.12 Y107.685 E.06965
G1 X200.047 Y107.685 E.19659
G1 X201.531 Y106.2 E.06965
G1 X200.312 Y106.2 E.04046
G1 X201.796 Y107.685 E.06965
G1 X207.723 Y107.685 E.19659
G1 X209.207 Y106.2 E.06965
G1 X207.988 Y106.2 E.04046
G1 X209.472 Y107.685 E.06965
G1 X215.399 Y107.685 E.19659
G1 X216.517 Y106.566 E.05248
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X217.558 Y108.095 E.08051
G3 X219.45 Y109.987 I-1.767 J3.659 E.09045
G1 X221.171 Y111.708 E.08073
G2 X220.618 Y110.142 I-7.076 J1.62 E.05522
G1 X219.778 Y110.982 E.03939
G3 X219.865 Y112.604 I-6.72 J1.174 E.05403
G1 X219.421 Y111.743 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.521737
G1 F12000
G1 X219.328 Y110.972 E.03031
G1 X219.128 Y110.36 E.02513
G1 X218.861 Y109.84 E.02281
G1 X218.462 Y109.313 E.02579
M73 P82 R6
G1 X218.074 Y108.956 E.02058
G1 X217.502 Y108.567 E.02698
G1 X216.889 Y108.311 E.02593
G2 X215.805 Y108.128 I-1.152 J3.522 E.04306
G1 X40.183 Y108.128 E6.85231
G1 X39.613 Y108.188 E.02238
G1 X38.97 Y108.359 E.02593
G2 X36.684 Y110.937 I1.268 J3.428 E.14
G2 X36.578 Y111.745 I8.347 J1.508 E.03181
G1 X36.579 Y140.268 E1.11293
G1 X36.672 Y141.028 E.02986
G1 X36.872 Y141.64 E.02512
G2 X37.905 Y143.035 I3.498 J-1.509 E.06832
G1 X38.498 Y143.433 E.02787
G1 X39.111 Y143.689 E.02593
G2 X40.186 Y143.872 I1.15 J-3.512 E.04267
G1 X215.817 Y143.872 E6.85269
G1 X216.387 Y143.812 E.02238
G1 X217.03 Y143.641 E.02594
G1 X217.493 Y143.442 E.01965
G1 X218.023 Y143.094 E.02477
G1 X218.567 Y142.573 E.02941
G1 X218.984 Y141.948 E.02929
G1 X219.191 Y141.486 E.01974
G1 X219.357 Y140.881 E.02448
G2 X219.422 Y140.264 I-9.001 J-1.257 E.02421
G1 X219.421 Y111.803 E1.11048
; WIPE_START
G1 X219.421 Y113.803 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.889 Y115.041 Z3.6 F30000
G1 X39.698 Y143.348 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.521603
G1 F12000
G1 X38.972 Y143.134 E.0295
G1 X38.373 Y142.79 E.02694
G3 X37.73 Y142.184 I2.136 J-2.911 E.03455
G1 X37.34 Y141.54 E.02936
G3 X37.061 Y140.259 I3.446 J-1.421 E.0514
G1 X37.057 Y111.744 E1.11226
G1 X37.146 Y111.076 E.02631
G3 X37.771 Y109.77 I3.255 J.757 E.05692
G1 X38.315 Y109.243 E.02954
G1 X38.712 Y108.987 E.01843
G1 X39.42 Y108.714 E.02958
G1 X40.195 Y108.606 E.03055
G1 X215.805 Y108.606 E6.84991
G1 X216.309 Y108.654 E.01978
G1 X217.028 Y108.866 E.02922
G1 X217.619 Y109.205 E.02658
G1 X218.1 Y109.631 E.02506
G3 X218.851 Y111.016 I-2.634 J2.324 E.062
G1 X218.934 Y111.527 E.02018
G1 X218.939 Y111.743 E.00844
G1 X218.943 Y140.265 E1.11251
G1 X218.897 Y140.753 E.01914
G1 X218.726 Y141.356 E.02447
G3 X217.281 Y143.016 I-3.029 J-1.179 E.08757
G1 X216.582 Y143.285 E.02923
G1 X215.805 Y143.394 E.03059
G1 X40.186 Y143.393 E6.8503
G1 X39.757 Y143.353 E.01677
; WIPE_START
G1 X40.186 Y143.393 E-.1634
G1 X41.756 Y143.393 E-.5966
; WIPE_END
G1 E-.04 F1800
G1 X39.874 Y135.996 Z3.6 F30000
G1 X34.65 Y115.458 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X34.65 Y117.086 E.05401
G1 X36.135 Y118.57 E.06965
G1 X36.135 Y118.078 E.01635
G1 X34.65 Y119.562 E.06965
G1 X34.65 Y124.762 E.17248
G1 X36.135 Y126.246 E.06965
G1 X36.135 Y125.754 E.01635
G1 X34.65 Y127.238 E.06965
G1 X34.65 Y132.438 E.17248
G1 X36.135 Y133.922 E.06965
G1 X36.135 Y133.43 E.01635
G1 X34.65 Y134.914 E.06965
G1 X34.65 Y136.542 E.05401
; WIPE_START
G1 X34.65 Y134.914 E-.61876
G1 X34.913 Y134.651 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X42.543 Y134.847 Z3.6 F30000
G1 X219.865 Y139.397 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G3 X219.779 Y141.02 I-7.864 J.399 E.054
G1 X220.618 Y141.858 E.03932
G2 X221.171 Y140.292 I-6.523 J-3.187 E.05522
G1 X219.445 Y142.018 E.08097
G3 X217.568 Y143.895 I-3.574 J-1.697 E.0898
G1 X215.842 Y145.621 E.08097
G2 X216.517 Y145.434 I-.614 J-3.521 E.02328
G1 X215.399 Y144.315 E.05248
G1 X209.472 Y144.315 E.19659
G1 X207.988 Y145.8 E.06965
G1 X209.207 Y145.8 E.04046
G1 X207.723 Y144.315 E.06965
G1 X201.796 Y144.315 E.19659
G1 X200.312 Y145.8 E.06965
G1 X201.531 Y145.8 E.04046
G1 X200.047 Y144.315 E.06965
G1 X194.12 Y144.315 E.19659
G1 X192.636 Y145.8 E.06965
G1 X193.855 Y145.8 E.04046
G1 X192.371 Y144.315 E.06965
G1 X186.444 Y144.315 E.19659
G1 X184.96 Y145.8 E.06965
G1 X186.179 Y145.8 E.04046
G1 X184.695 Y144.315 E.06965
G1 X178.769 Y144.315 E.19659
G1 X177.284 Y145.8 E.06965
G1 X178.503 Y145.8 E.04046
G1 X177.019 Y144.315 E.06965
G1 X171.093 Y144.315 E.19659
G1 X169.608 Y145.8 E.06965
G1 X170.828 Y145.8 E.04046
G1 X169.343 Y144.315 E.06965
G1 X163.417 Y144.315 E.19659
G1 X161.932 Y145.8 E.06965
G1 X163.152 Y145.8 E.04046
G1 X161.667 Y144.315 E.06965
G1 X155.741 Y144.315 E.19659
G1 X154.256 Y145.8 E.06965
G1 X155.476 Y145.8 E.04046
G1 X153.991 Y144.315 E.06965
G1 X148.065 Y144.315 E.19659
G1 X146.58 Y145.8 E.06965
G1 X147.8 Y145.8 E.04046
G1 X146.315 Y144.315 E.06965
G1 X140.389 Y144.315 E.19659
G1 X138.904 Y145.8 E.06965
G1 X140.124 Y145.8 E.04046
G1 X138.639 Y144.315 E.06965
G1 X132.713 Y144.315 E.19659
G1 X131.228 Y145.8 E.06965
G1 X132.448 Y145.8 E.04046
G1 X130.963 Y144.315 E.06965
G1 X125.037 Y144.315 E.19659
G1 X123.552 Y145.8 E.06965
G1 X124.772 Y145.8 E.04046
G1 X123.287 Y144.315 E.06965
G1 X117.361 Y144.315 E.19659
G1 X115.876 Y145.8 E.06965
G1 X117.096 Y145.8 E.04046
G1 X115.611 Y144.315 E.06965
G1 X109.685 Y144.315 E.19659
G1 X108.2 Y145.8 E.06965
G1 X109.42 Y145.8 E.04046
G1 X107.935 Y144.315 E.06965
G1 X102.009 Y144.315 E.19659
G1 X100.524 Y145.8 E.06965
G1 X101.744 Y145.8 E.04046
G1 X100.259 Y144.315 E.06965
G1 X94.333 Y144.315 E.19659
G1 X92.848 Y145.8 E.06965
G1 X94.068 Y145.8 E.04046
G1 X92.583 Y144.315 E.06965
G1 X86.657 Y144.315 E.19659
G1 X85.172 Y145.8 E.06965
G1 X86.392 Y145.8 E.04046
G1 X84.907 Y144.315 E.06965
G1 X78.981 Y144.315 E.19659
G1 X77.496 Y145.8 E.06965
G1 X78.716 Y145.8 E.04046
G1 X77.231 Y144.315 E.06965
G1 X71.305 Y144.315 E.19659
G1 X69.821 Y145.8 E.06965
G1 X71.04 Y145.8 E.04046
G1 X69.556 Y144.315 E.06965
G1 X63.629 Y144.315 E.19659
G1 X62.145 Y145.8 E.06965
G1 X63.364 Y145.8 E.04046
G1 X61.88 Y144.315 E.06965
G1 X55.953 Y144.315 E.19659
G1 X54.469 Y145.8 E.06965
G1 X55.688 Y145.8 E.04046
G1 X54.204 Y144.315 E.06965
G1 X48.277 Y144.315 E.19659
G1 X46.793 Y145.8 E.06965
G1 X48.012 Y145.8 E.04046
G1 X46.528 Y144.315 E.06965
G1 X40.601 Y144.315 E.19659
G1 X39.483 Y145.434 E.05248
G2 X40.158 Y145.621 I1.29 J-3.335 E.02328
G1 X38.442 Y143.905 E.08051
G3 X36.55 Y142.013 I1.767 J-3.659 E.09045
G1 X34.829 Y140.292 E.08073
G2 X35.382 Y141.858 I7.076 J-1.62 E.05522
G1 X36.222 Y141.018 E.03939
G3 X36.135 Y139.396 I6.692 J-1.173 E.05403
; WIPE_START
G1 X36.136 Y140.297 E-.34228
G1 X36.222 Y141.018 E-.27625
G1 X35.959 Y141.282 E-.14147
; WIPE_END
G1 E-.04 F1800
G1 X43.589 Y141.087 Z3.6 F30000
G1 X221.35 Y136.542 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X221.35 Y134.914 E.05401
G1 X219.865 Y133.43 E.06965
G1 X219.865 Y133.922 E.01635
G1 X221.35 Y132.438 E.06965
G1 X221.35 Y127.238 E.17248
G1 X219.865 Y125.754 E.06965
G1 X219.865 Y126.246 E.01635
G1 X221.35 Y124.762 E.06965
G1 X221.35 Y119.562 E.17248
G1 X219.865 Y118.078 E.06965
G1 X219.865 Y118.57 E.01635
G1 X221.35 Y117.086 E.06965
G1 X221.35 Y115.458 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X221.35 Y117.086 E-.61876
G1 X221.087 Y117.349 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/35
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.6 I.052 J-1.216 P1  F30000
G1 X38.27 Y109.459 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X38.549 Y109.255 E.01148
G3 X40.029 Y108.754 I1.678 J2.522 E.05242
G1 X215.796 Y108.756 E5.83049
G3 X218.796 Y111.578 I.001 J3.004 E.15053
G1 X218.796 Y140.422 E.95682
G3 X215.971 Y143.246 I-3.023 J-.199 E.14466
G1 X40.028 Y143.246 E5.83635
G3 X37.204 Y140.421 I.199 J-3.023 E.14466
G1 X37.204 Y111.578 E.95678
G3 X38.227 Y109.502 I3.023 J.199 E.07878
M204 S250
G1 X38.507 Y109.771 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X38.766 Y109.582 E.00988
G3 X40.055 Y109.146 I1.458 J2.193 E.04227
G1 X215.798 Y109.148 E5.4001
G3 X218.404 Y111.604 I-.002 J2.612 E.12123
G1 X218.404 Y140.396 E.88468
G3 X215.945 Y142.854 I-2.628 J-.17 E.11666
G1 X40.054 Y142.854 E5.40464
G3 X37.596 Y140.395 I.17 J-2.628 E.11666
G1 X37.596 Y111.604 E.88467
G3 X38.466 Y109.814 I2.628 J.17 E.0627
; WIPE_START
M204 S10000
G1 X38.766 Y109.582 E-.14447
G1 X39.037 Y109.419 E-.12007
G1 X39.374 Y109.279 E-.1388
G1 X39.704 Y109.192 E-.12956
G1 X40.055 Y109.146 E-.13439
G1 X40.299 Y109.146 E-.09271
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.702 Y105.873 E.01383
G1 X215.025 Y105.888 E.01074
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.19 Y107.744 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.0003
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.721 Y105.481 E.01311
G1 X215.064 Y105.498 E.01054
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.15 Y107.789 E.02154
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02408
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.722 Y106.563 E-.15507
; WIPE_END
G1 E-.04 F1800
G1 X37.417 Y114.19 Z3.8 F30000
G1 X36.257 Y143.227 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M73 P82 R5
G3 X35.382 Y141.858 I17.013 J-11.828 E.0539
G1 X36.078 Y141.162 E.03263
G2 X36.23 Y141.693 I2.262 J-.361 E.01836
G1 X34.829 Y140.292 E.06574
G3 X34.65 Y138.727 I7.81 J-1.683 E.05235
G1 X34.65 Y134.914 E.12647
G1 X35.978 Y133.587 E.06226
G1 X35.978 Y133.765 E.00591
G1 X34.65 Y132.438 E.06226
G1 X34.65 Y127.238 E.17248
G1 X35.978 Y125.911 E.06226
G1 X35.978 Y126.089 E.00591
G1 X34.65 Y124.762 E.06226
G1 X34.65 Y119.562 E.17248
G1 X35.978 Y118.235 E.06226
G1 X35.978 Y118.413 E.00591
G1 X34.65 Y117.086 E.06226
G3 X34.685 Y112.559 I46.072 J-1.906 E.15022
G3 X34.829 Y111.708 I4.39 J.301 E.02868
G1 X36.234 Y110.303 E.06592
G2 X36.076 Y110.836 I2.197 J.941 E.01847
G1 X35.382 Y110.142 E.03254
G3 X36.257 Y108.773 I17.896 J10.464 E.0539
; WIPE_START
G1 X35.839 Y109.334 E-.26574
G1 X35.382 Y110.142 E-.35268
G1 X35.646 Y110.405 E-.14158
; WIPE_END
G1 E-.04 F1800
G1 X36.044 Y118.027 Z3.8 F30000
G1 X37.369 Y143.387 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X37.386 Y143.405 E.00082
G2 X38.757 Y144.22 I3.006 J-3.495 E.05316
G1 X40.158 Y145.621 E.06574
G3 X39.483 Y145.434 I.614 J-3.522 E.02328
G1 X40.443 Y144.474 E.04504
G1 X46.686 Y144.474 E.20711
G1 X48.012 Y145.8 E.06221
G1 X46.793 Y145.8 E.04046
G1 X48.119 Y144.474 E.06221
G1 X54.362 Y144.474 E.20711
G1 X55.688 Y145.8 E.06221
G1 X54.469 Y145.8 E.04046
G1 X55.795 Y144.474 E.06221
G1 X62.038 Y144.474 E.2071
G1 X63.364 Y145.8 E.06221
G1 X62.145 Y145.8 E.04046
G1 X63.471 Y144.474 E.06221
G1 X69.714 Y144.473 E.2071
G1 X71.04 Y145.8 E.06222
G1 X69.821 Y145.8 E.04046
G1 X71.147 Y144.473 E.06222
G1 X77.39 Y144.473 E.20709
G1 X78.716 Y145.8 E.06222
G1 X77.496 Y145.8 E.04046
G1 X78.823 Y144.473 E.06222
G1 X85.066 Y144.473 E.20709
G1 X86.392 Y145.8 E.06222
G1 X85.172 Y145.8 E.04046
G1 X86.499 Y144.473 E.06222
G1 X92.742 Y144.473 E.20709
G1 X94.068 Y145.8 E.06222
G1 X92.848 Y145.8 E.04046
G1 X94.175 Y144.473 E.06222
G1 X100.418 Y144.473 E.20708
G1 X101.744 Y145.8 E.06223
G1 X100.524 Y145.8 E.04046
M73 P83 R5
G1 X101.851 Y144.473 E.06223
G1 X108.093 Y144.473 E.20708
G1 X109.42 Y145.8 E.06223
G1 X108.2 Y145.8 E.04046
G1 X109.527 Y144.473 E.06223
G1 X115.769 Y144.473 E.20708
G1 X117.096 Y145.8 E.06223
G1 X115.876 Y145.8 E.04046
G1 X117.203 Y144.473 E.06223
G1 X123.445 Y144.473 E.20707
G1 X124.772 Y145.8 E.06223
G1 X123.552 Y145.8 E.04046
G1 X124.879 Y144.473 E.06223
G1 X131.121 Y144.473 E.20707
G1 X132.448 Y145.8 E.06224
G1 X131.228 Y145.8 E.04046
G1 X132.555 Y144.473 E.06224
G1 X138.797 Y144.473 E.20707
G1 X140.124 Y145.8 E.06224
G1 X138.904 Y145.8 E.04046
G1 X140.231 Y144.473 E.06224
G1 X146.473 Y144.473 E.20706
G1 X147.8 Y145.8 E.06224
G1 X146.58 Y145.8 E.04046
G1 X147.907 Y144.473 E.06224
G1 X154.149 Y144.473 E.20706
G1 X155.476 Y145.8 E.06224
G1 X154.256 Y145.8 E.04046
G1 X155.583 Y144.473 E.06224
G1 X161.825 Y144.473 E.20705
G1 X163.152 Y145.8 E.06225
G1 X161.932 Y145.8 E.04046
G1 X163.259 Y144.473 E.06225
G1 X169.501 Y144.473 E.20705
G1 X170.828 Y145.8 E.06225
G1 X169.608 Y145.8 E.04046
G1 X170.935 Y144.473 E.06225
G1 X177.177 Y144.473 E.20705
G1 X178.503 Y145.8 E.06225
G1 X177.284 Y145.8 E.04046
G1 X178.611 Y144.473 E.06225
G1 X184.852 Y144.473 E.20704
G1 X186.179 Y145.8 E.06225
G1 X184.96 Y145.8 E.04046
G1 X186.287 Y144.473 E.06225
G1 X192.528 Y144.473 E.20704
G1 X193.855 Y145.8 E.06226
G1 X192.636 Y145.8 E.04046
G1 X193.963 Y144.473 E.06226
G1 X200.204 Y144.473 E.20704
G1 X201.531 Y145.8 E.06226
G1 X200.312 Y145.8 E.04046
G1 X201.639 Y144.473 E.06226
G1 X207.88 Y144.473 E.20703
G1 X209.207 Y145.8 E.06226
G1 X207.988 Y145.8 E.04046
G1 X209.315 Y144.472 E.06226
G1 X215.556 Y144.472 E.20703
G1 X216.517 Y145.434 E.0451
G3 X215.842 Y145.621 I-1.29 J-3.336 E.02328
G1 X217.243 Y144.22 E.06574
G2 X218.629 Y143.385 I-1.35 J-3.81 E.05403
; WIPE_START
G1 X218.12 Y143.783 E-.24556
G1 X217.243 Y144.22 E-.37223
G1 X216.979 Y144.485 E-.1422
; WIPE_END
G1 E-.04 F1800
G1 X217.588 Y136.876 Z3.8 F30000
G1 X219.614 Y111.557 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.453043
G1 F12000
G2 X215.997 Y107.949 I-3.822 J.214 E.18691
G1 X215.785 Y107.935 E.00712
G1 X40.202 Y107.935 E5.86794
G1 X39.518 Y107.997 E.02298
G2 X36.387 Y111.564 I.708 J3.779 E.17094
G1 X36.386 Y140.456 E.96556
G2 X40.212 Y144.065 I3.828 J-.225 E.19368
G1 X215.984 Y144.064 E5.87429
G2 X219.615 Y140.238 I-.201 J-3.827 E.1944
G1 X219.614 Y111.617 E.95652
; WIPE_START
G1 X219.614 Y113.617 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.984 Y113.409 Z3.8 F30000
G1 X38.694 Y108.694 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.453065
G1 F12000
G3 X40.212 Y108.346 I1.563 J3.324 E.05245
G1 X215.785 Y108.345 E5.86794
G1 X216.439 Y108.404 E.02196
G3 X219.204 Y111.564 I-.663 J3.37 E.15099
G1 X219.204 Y140.238 E.95834
G1 X219.142 Y140.91 E.02255
G3 X215.984 Y143.654 I-3.362 J-.68 E.15037
G1 X40.212 Y143.654 E5.8746
G1 X39.54 Y143.592 E.02255
G3 X36.796 Y140.434 I.678 J-3.361 E.15038
G1 X36.796 Y111.564 E.96488
G3 X38.642 Y108.724 I3.413 J.198 E.11843
G1 X218.631 Y108.613 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X218.614 Y108.595 E.00082
G2 X217.243 Y107.78 I-3.006 J3.495 E.05316
G1 X215.842 Y106.379 E.06574
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X215.557 Y107.526 E.04504
G1 X209.314 Y107.526 E.20711
G1 X207.988 Y106.2 E.06221
G1 X209.207 Y106.2 E.04046
G1 X207.881 Y107.526 E.06221
G1 X201.638 Y107.526 E.20711
G1 X200.312 Y106.2 E.06221
G1 X201.531 Y106.2 E.04046
G1 X200.205 Y107.526 E.06221
G1 X193.962 Y107.526 E.20711
G1 X192.636 Y106.2 E.06221
G1 X193.855 Y106.2 E.04046
G1 X192.529 Y107.526 E.06221
G1 X186.286 Y107.526 E.20711
G1 X184.96 Y106.2 E.06221
G1 X186.179 Y106.2 E.04046
G1 X184.853 Y107.526 E.06221
G1 X178.61 Y107.526 E.20711
G1 X177.284 Y106.2 E.06221
G1 X178.504 Y106.2 E.04046
G1 X177.178 Y107.526 E.06221
G1 X170.934 Y107.526 E.20711
G1 X169.608 Y106.2 E.06221
G1 X170.828 Y106.2 E.04046
G1 X169.502 Y107.526 E.06221
G1 X163.258 Y107.526 E.20711
G1 X161.932 Y106.2 E.06221
G1 X163.152 Y106.2 E.04046
G1 X161.826 Y107.526 E.06221
G1 X155.582 Y107.526 E.20711
G1 X154.256 Y106.2 E.06221
G1 X155.476 Y106.2 E.04046
G1 X154.15 Y107.526 E.06221
G1 X147.906 Y107.526 E.20711
G1 X146.58 Y106.2 E.06221
G1 X147.8 Y106.2 E.04046
G1 X146.474 Y107.526 E.06221
G1 X140.23 Y107.526 E.20711
G1 X138.904 Y106.2 E.06221
G1 X140.124 Y106.2 E.04046
G1 X138.798 Y107.526 E.06221
G1 X132.554 Y107.526 E.20711
G1 X131.228 Y106.2 E.06221
G1 X132.448 Y106.2 E.04046
G1 X131.122 Y107.526 E.06221
G1 X124.878 Y107.526 E.20711
G1 X123.552 Y106.2 E.06221
G1 X124.772 Y106.2 E.04046
G1 X123.446 Y107.526 E.06221
G1 X117.202 Y107.526 E.20711
G1 X115.876 Y106.2 E.06221
G1 X117.096 Y106.2 E.04046
G1 X115.77 Y107.526 E.06221
G1 X109.526 Y107.526 E.20711
G1 X108.2 Y106.2 E.06221
G1 X109.42 Y106.2 E.04046
G1 X108.094 Y107.526 E.06221
G1 X101.85 Y107.526 E.20711
G1 X100.524 Y106.2 E.06221
G1 X101.744 Y106.2 E.04046
G1 X100.418 Y107.526 E.06221
G1 X94.174 Y107.526 E.20711
G1 X92.848 Y106.2 E.06221
G1 X94.068 Y106.2 E.04046
G1 X92.742 Y107.526 E.06221
G1 X86.498 Y107.526 E.20711
G1 X85.172 Y106.2 E.06221
G1 X86.392 Y106.2 E.04046
G1 X85.066 Y107.526 E.06221
G1 X78.822 Y107.526 E.20711
G1 X77.496 Y106.2 E.06221
G1 X78.716 Y106.2 E.04046
G1 X77.39 Y107.526 E.06221
G1 X71.147 Y107.526 E.20711
G1 X69.821 Y106.2 E.06221
G1 X71.04 Y106.2 E.04046
G1 X69.714 Y107.526 E.06221
G1 X63.471 Y107.526 E.20711
G1 X62.145 Y106.2 E.06221
G1 X63.364 Y106.2 E.04046
G1 X62.038 Y107.526 E.06221
G1 X55.795 Y107.526 E.20711
G1 X54.469 Y106.2 E.06221
G1 X55.688 Y106.2 E.04046
G1 X54.362 Y107.526 E.06221
G1 X48.119 Y107.526 E.20711
G1 X46.793 Y106.2 E.06221
G1 X48.012 Y106.2 E.04046
G1 X46.686 Y107.526 E.06221
G1 X40.443 Y107.526 E.20711
G1 X39.483 Y106.566 E.04504
G3 X40.158 Y106.379 I1.29 J3.334 E.02328
G1 X38.757 Y107.78 E.06574
G2 X37.369 Y108.613 I1.384 J3.879 E.05404
; WIPE_START
G1 X37.878 Y108.218 E-.24479
G1 X38.757 Y107.78 E-.37312
G1 X39.021 Y107.516 E-.14209
; WIPE_END
G1 E-.04 F1800
G1 X46.653 Y107.569 Z3.8 F30000
G1 X219.743 Y108.773 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G3 X220.618 Y110.142 I-17.029 J11.838 E.0539
G1 X219.922 Y110.837 E.03263
G2 X219.77 Y110.307 I-2.262 J.361 E.01836
G1 X221.171 Y111.708 E.06574
G3 X221.35 Y113.273 I-7.81 J1.683 E.05235
G1 X221.35 Y117.086 E.12647
G1 X220.023 Y118.413 E.06225
G1 X220.023 Y118.235 E.00589
G1 X221.35 Y119.562 E.06225
G1 X221.35 Y124.762 E.17248
G1 X220.023 Y126.088 E.06223
G1 X220.023 Y125.912 E.00586
G1 X221.35 Y127.238 E.06223
G1 X221.35 Y132.438 E.17248
G1 X220.023 Y133.764 E.06222
G1 X220.023 Y133.588 E.00584
G1 X221.35 Y134.914 E.06222
G3 X221.315 Y139.441 I-46.072 J1.906 E.15022
G3 X221.171 Y140.292 I-4.39 J-.301 E.02868
G1 X219.77 Y141.693 E.06574
G2 X219.922 Y141.163 I-2.109 J-.891 E.01836
G1 X220.618 Y141.858 E.03263
G3 X219.743 Y143.227 I-17.88 J-10.454 E.0539
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X220.161 Y142.666 E-.26574
G1 X220.618 Y141.858 E-.35268
G1 X220.354 Y141.595 E-.14158
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/35
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.8 I.212 J-1.198 P1  F30000
G1 X38.059 Y109.335 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X38.155 Y109.247 E.00431
G3 X40.176 Y108.509 I2.068 J2.525 E.07274
G1 X215.824 Y108.509 E5.82656
G3 X219.041 Y111.73 I-.06 J3.277 E.16696
G1 X219.041 Y140.274 E.94684
G3 X215.824 Y143.491 I-3.264 J-.046 E.167
G1 X40.176 Y143.491 E5.82656
G3 X36.959 Y140.27 I.06 J-3.277 E.16696
G1 X36.959 Y111.726 E.94684
G3 X37.846 Y109.535 I3.264 J.046 E.08022
G1 X38.015 Y109.376 E.00773
M204 S250
G1 X38.335 Y109.624 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X38.54 Y109.445 E.00836
G3 X40.192 Y108.901 I1.682 J2.327 E.05429
G1 X215.808 Y108.901 E5.39621
G3 X218.649 Y111.743 I-.042 J2.883 E.13662
G1 X218.649 Y140.258 E.87619
G3 X215.808 Y143.099 I-2.871 J-.03 E.13673
G1 X40.192 Y143.099 E5.39621
G3 X37.351 Y140.257 I.042 J-2.883 E.13662
G1 X37.351 Y111.742 E.87619
G3 X38.132 Y109.803 I2.871 J.03 E.06572
G1 X38.29 Y109.664 E.00648
; WIPE_START
M204 S10000
G1 X38.54 Y109.445 E-.12624
G1 X38.854 Y109.247 E-.14113
G1 X39.034 Y109.159 E-.07595
G1 X39.548 Y108.984 E-.20642
G1 X39.913 Y108.923 E-.14068
G1 X40.096 Y108.909 E-.06957
; WIPE_END
G1 E-.04 F1800
G1 X36.471 Y108.021 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.237 J5.237 E.19318
G1 X214.285 Y105.852 E5.72448
G1 X214.728 Y105.874 E.0147
G1 X215.025 Y105.888 E.00987
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.429 Y108.064 I7.406 J-.007 E.19118
M204 S250
G1 X36.189 Y107.745 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.192 Y107.742 E.00012
G3 X41.705 Y105.46 I5.51 J5.51 E.18814
G1 X214.295 Y105.46 E5.3032
G1 X214.747 Y105.482 E.01391
G1 X215.064 Y105.498 E.00973
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.679 Y108.309 I7.793 J-.002 E.16464
G1 X36.149 Y107.789 E.02153
M204 S10000
G1 X36.257 Y108.773 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X35.382 Y110.142 I17.023 J11.834 E.0539
G1 X35.964 Y110.724 E.0273
G1 X36.02 Y110.517 E.00711
G1 X34.829 Y111.708 E.05587
G2 X34.65 Y113.273 I7.81 J1.683 E.05235
G1 X34.65 Y117.086 E.12647
G1 X35.831 Y118.267 E.0554
G1 X35.831 Y118.381 E.00381
G1 X34.65 Y119.562 E.0554
G1 X34.65 Y124.762 E.17248
G1 X35.831 Y125.943 E.0554
G1 X35.831 Y126.057 E.00381
G1 X34.65 Y127.238 E.0554
G1 X34.65 Y132.438 E.17248
G1 X35.831 Y133.619 E.0554
G1 X35.831 Y133.733 E.00381
G1 X34.65 Y134.914 E.0554
G2 X34.685 Y139.441 I46.072 J1.906 E.15022
G2 X34.829 Y140.292 I4.39 J-.301 E.02868
G1 X36.02 Y141.483 E.05587
G1 X35.964 Y141.276 E.00711
G1 X35.382 Y141.858 E.0273
G2 X36.257 Y143.227 I17.903 J-10.469 E.0539
G1 X41.926 Y144.619 F30000
G1 F15476.087
G1 X40.298 Y144.619 E.05401
G1 X39.483 Y145.434 E.03823
G2 X40.158 Y145.621 I1.29 J-3.335 E.02328
G1 X38.962 Y144.429 E.05601
G3 X37.528 Y143.688 I1.269 J-4.212 E.05384
G1 X45.164 Y145.8 F30000
G1 F15476.087
G1 X46.793 Y145.8 E.05401
G1 X47.973 Y144.619 E.0554
G1 X46.831 Y144.619 E.03788
G1 X48.012 Y145.8 E.0554
G1 X54.469 Y145.8 E.21417
G1 X55.649 Y144.619 E.0554
G1 X54.507 Y144.619 E.03788
G1 X55.688 Y145.8 E.0554
G1 X62.145 Y145.8 E.21417
G1 X63.325 Y144.619 E.0554
G1 X62.183 Y144.619 E.03789
G1 X63.364 Y145.8 E.0554
M73 P84 R5
G1 X69.821 Y145.8 E.21417
G1 X71.001 Y144.619 E.0554
G1 X69.859 Y144.619 E.03789
G1 X71.04 Y145.8 E.0554
G1 X77.496 Y145.8 E.21417
G1 X78.677 Y144.619 E.0554
G1 X77.535 Y144.619 E.03789
G1 X78.716 Y145.8 E.0554
G1 X85.172 Y145.8 E.21417
G1 X86.353 Y144.619 E.0554
G1 X85.211 Y144.619 E.03789
G1 X86.392 Y145.8 E.0554
G1 X92.848 Y145.8 E.21417
G1 X94.029 Y144.619 E.0554
G1 X92.887 Y144.619 E.03789
G1 X94.068 Y145.8 E.0554
G1 X100.524 Y145.8 E.21417
G1 X101.705 Y144.619 E.0554
G1 X100.563 Y144.619 E.03789
G1 X101.744 Y145.8 E.0554
G1 X108.2 Y145.8 E.21417
G1 X109.381 Y144.619 E.0554
G1 X108.239 Y144.619 E.03789
G1 X109.42 Y145.8 E.0554
G1 X115.876 Y145.8 E.21417
G1 X117.057 Y144.619 E.0554
G1 X115.915 Y144.619 E.03789
G1 X117.096 Y145.8 E.0554
G1 X123.552 Y145.8 E.21417
G1 X124.733 Y144.619 E.0554
G1 X123.591 Y144.619 E.03789
G1 X124.772 Y145.8 E.0554
G1 X131.228 Y145.8 E.21417
G1 X132.409 Y144.619 E.0554
G1 X131.267 Y144.619 E.03789
G1 X132.448 Y145.8 E.0554
G1 X138.904 Y145.8 E.21417
G1 X140.085 Y144.619 E.0554
G1 X138.943 Y144.619 E.03789
G1 X140.124 Y145.8 E.0554
G1 X146.58 Y145.8 E.21417
G1 X147.761 Y144.619 E.0554
G1 X146.619 Y144.619 E.03789
G1 X147.8 Y145.8 E.0554
G1 X154.256 Y145.8 E.21417
G1 X155.437 Y144.619 E.0554
G1 X154.295 Y144.619 E.03789
G1 X155.476 Y145.8 E.0554
G1 X161.932 Y145.8 E.21417
G1 X163.113 Y144.619 E.0554
G1 X161.971 Y144.619 E.03789
G1 X163.152 Y145.8 E.0554
G1 X169.608 Y145.8 E.21417
G1 X170.789 Y144.619 E.0554
G1 X169.647 Y144.619 E.03789
G1 X170.828 Y145.8 E.0554
G1 X177.284 Y145.8 E.21417
G1 X178.465 Y144.619 E.0554
G1 X177.323 Y144.619 E.03789
G1 X178.503 Y145.8 E.0554
G1 X184.96 Y145.8 E.21417
G1 X186.141 Y144.619 E.0554
G1 X184.999 Y144.619 E.03789
G1 X186.179 Y145.8 E.0554
G1 X192.636 Y145.8 E.21417
G1 X193.817 Y144.619 E.0554
G1 X192.675 Y144.619 E.03789
G1 X193.855 Y145.8 E.0554
G1 X200.312 Y145.8 E.21417
G1 X201.493 Y144.619 E.0554
G1 X200.351 Y144.619 E.03789
G1 X201.531 Y145.8 E.0554
G1 X207.988 Y145.8 E.21417
G1 X209.169 Y144.619 E.0554
G1 X208.026 Y144.619 E.03789
G1 X209.207 Y145.8 E.0554
G1 X210.836 Y145.8 E.05401
G1 X218.472 Y143.688 F30000
G1 F15476.087
G3 X217.033 Y144.43 I-2.69 J-3.448 E.05401
G1 X215.842 Y145.621 E.05587
G2 X216.517 Y145.434 I-.615 J-3.524 E.02328
G1 X215.702 Y144.619 E.03823
G1 X214.074 Y144.619 E.05401
G1 X219.743 Y143.227 F30000
G1 F15476.087
G2 X220.618 Y141.858 I-5.852 J-4.7 E.05399
G1 X220.029 Y141.27 E.0276
G1 X219.98 Y141.483 E.00726
G1 X221.171 Y140.292 E.05587
G2 X221.35 Y138.727 I-7.81 J-1.683 E.05235
G1 X221.35 Y134.914 E.12647
G1 X220.168 Y133.733 E.05542
G1 X220.168 Y133.619 E.00377
G1 X221.35 Y132.438 E.05542
G1 X221.35 Y127.238 E.17248
G1 X220.168 Y126.056 E.05545
G1 X220.168 Y125.944 E.00372
G1 X221.35 Y124.762 E.05545
G1 X221.35 Y119.562 E.17248
G1 X220.167 Y118.38 E.05548
G1 X220.167 Y118.269 E.00368
G1 X221.35 Y117.086 E.05549
G2 X221.315 Y112.559 I-46.072 J-1.906 E.15022
G2 X221.171 Y111.708 I-4.39 J.301 E.02868
G1 X219.98 Y110.517 E.05587
G1 X220.036 Y110.724 E.00711
G1 X220.618 Y110.142 E.0273
G2 X219.743 Y108.773 I-17.906 J10.471 E.0539
G1 X219.781 Y111.689 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.403447
G1 F12000
G1 X219.666 Y110.879 E.02405
G1 X219.44 Y110.157 E.02222
G1 X219.197 Y109.689 E.01548
G1 X218.726 Y109.066 E.02293
G2 X215.813 Y107.765 I-3.017 J2.843 E.09623
G1 X40.178 Y107.765 E5.15986
G2 X38.125 Y108.365 I.156 J4.346 E.06348
G1 X37.483 Y108.855 E.02375
G1 X36.987 Y109.419 E.02207
G1 X36.583 Y110.111 E.02353
G2 X36.215 Y111.727 I3.839 J1.724 E.04902
G1 X36.217 Y140.265 E.83838
G1 X36.334 Y141.121 E.0254
G1 X36.56 Y141.843 E.02222
G1 X36.803 Y142.311 E.01548
G1 X37.274 Y142.934 E.02293
G2 X40.178 Y144.235 I3.017 J-2.843 E.09595
G1 X215.822 Y144.235 E5.16015
G2 X219.274 Y142.174 I-.086 J-4.065 E.12356
G1 X219.586 Y141.446 E.02327
G2 X219.785 Y140.272 I-4.091 J-1.296 E.03507
G1 X219.781 Y111.749 E.83797
; WIPE_START
G1 X219.781 Y113.749 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.15 Y113.587 Z4 F30000
G1 X37.122 Y109.861 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.403263
G1 F12000
G1 X37.559 Y109.286 E.0212
G1 X38.08 Y108.827 E.02038
G1 X38.698 Y108.461 E.02109
G3 X40.187 Y108.125 I1.721 J4.16 E.04504
G1 X215.813 Y108.125 E5.15696
G3 X217.495 Y108.558 I-.156 J4.095 E.05139
G1 X217.922 Y108.824 E.01479
G1 X218.42 Y109.258 E.01938
G1 X218.865 Y109.832 E.02133
G1 X219.102 Y110.277 E.01481
G1 X219.313 Y110.907 E.01952
G1 X219.412 Y111.532 E.01857
G1 X219.425 Y140.273 E.84392
G3 X218.993 Y141.945 I-4.13 J-.174 E.05109
G1 X218.612 Y142.522 E.0203
G1 X218.102 Y143.034 E.02122
G1 X217.688 Y143.323 E.01482
G1 X217.091 Y143.626 E.01966
G1 X216.396 Y143.816 E.02116
G3 X215.813 Y143.875 I-.808 J-5.102 E.01722
G1 X40.178 Y143.875 E5.15725
G3 X38.505 Y143.442 I.168 J-4.1 E.0511
G1 X38.078 Y143.176 E.01479
G1 X37.58 Y142.742 E.01938
G1 X37.135 Y142.168 E.02133
G1 X36.898 Y141.723 E.01481
G1 X36.686 Y141.093 E.01952
G1 X36.589 Y140.468 E.01857
G1 X36.575 Y111.727 E.84392
G1 X36.629 Y111.182 E.01608
G1 X36.814 Y110.486 E.02115
G1 X37.096 Y109.914 E.01872
G1 X37.528 Y108.312 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X38.967 Y107.57 I2.69 J3.449 E.05401
G1 X40.158 Y106.379 E.05587
G2 X39.483 Y106.566 I.614 J3.521 E.02328
G1 X40.298 Y107.381 E.03823
G1 X41.926 Y107.381 E.05401
G1 X210.836 Y106.2 F30000
G1 F15476.087
G1 X209.207 Y106.2 E.05401
G1 X208.026 Y107.381 E.0554
G1 X209.169 Y107.381 E.03788
G1 X207.988 Y106.2 E.0554
G1 X201.531 Y106.2 E.21417
G1 X200.351 Y107.381 E.0554
G1 X201.493 Y107.381 E.03788
G1 X200.312 Y106.2 E.0554
G1 X193.855 Y106.2 E.21417
G1 X192.675 Y107.381 E.0554
G1 X193.817 Y107.381 E.03789
G1 X192.636 Y106.2 E.0554
G1 X186.179 Y106.2 E.21417
G1 X184.999 Y107.381 E.0554
G1 X186.141 Y107.381 E.03789
G1 X184.96 Y106.2 E.0554
G1 X178.504 Y106.2 E.21417
G1 X177.323 Y107.381 E.0554
G1 X178.465 Y107.381 E.03789
G1 X177.284 Y106.2 E.0554
G1 X170.828 Y106.2 E.21417
G1 X169.647 Y107.381 E.0554
G1 X170.789 Y107.381 E.03789
G1 X169.608 Y106.2 E.0554
G1 X163.152 Y106.2 E.21417
G1 X161.971 Y107.381 E.0554
G1 X163.113 Y107.381 E.03789
G1 X161.932 Y106.2 E.0554
G1 X155.476 Y106.2 E.21417
G1 X154.295 Y107.381 E.0554
G1 X155.437 Y107.381 E.03789
G1 X154.256 Y106.2 E.0554
G1 X147.8 Y106.2 E.21417
G1 X146.619 Y107.381 E.0554
G1 X147.761 Y107.381 E.03789
G1 X146.58 Y106.2 E.0554
G1 X140.124 Y106.2 E.21417
G1 X138.943 Y107.381 E.0554
G1 X140.085 Y107.381 E.03789
G1 X138.904 Y106.2 E.0554
G1 X132.448 Y106.2 E.21417
G1 X131.267 Y107.381 E.0554
G1 X132.409 Y107.381 E.03789
G1 X131.228 Y106.2 E.0554
G1 X124.772 Y106.2 E.21417
G1 X123.591 Y107.381 E.0554
G1 X124.733 Y107.381 E.03789
G1 X123.552 Y106.2 E.0554
G1 X117.096 Y106.2 E.21417
G1 X115.915 Y107.381 E.0554
G1 X117.057 Y107.381 E.03789
G1 X115.876 Y106.2 E.0554
G1 X109.42 Y106.2 E.21417
G1 X108.239 Y107.381 E.0554
G1 X109.381 Y107.381 E.03789
G1 X108.2 Y106.2 E.0554
G1 X101.744 Y106.2 E.21417
G1 X100.563 Y107.381 E.0554
G1 X101.705 Y107.381 E.03789
G1 X100.524 Y106.2 E.0554
G1 X94.068 Y106.2 E.21417
G1 X92.887 Y107.381 E.0554
G1 X94.029 Y107.381 E.03789
G1 X92.848 Y106.2 E.0554
G1 X86.392 Y106.2 E.21417
G1 X85.211 Y107.381 E.0554
G1 X86.353 Y107.381 E.03789
G1 X85.172 Y106.2 E.0554
G1 X78.716 Y106.2 E.21417
G1 X77.535 Y107.381 E.0554
G1 X78.677 Y107.381 E.03789
G1 X77.496 Y106.2 E.0554
G1 X71.04 Y106.2 E.21417
G1 X69.859 Y107.381 E.0554
G1 X71.001 Y107.381 E.03789
G1 X69.821 Y106.2 E.0554
G1 X63.364 Y106.2 E.21417
G1 X62.183 Y107.381 E.0554
G1 X63.325 Y107.381 E.03789
G1 X62.145 Y106.2 E.0554
G1 X55.688 Y106.2 E.21417
G1 X54.507 Y107.381 E.0554
G1 X55.649 Y107.381 E.03789
G1 X54.469 Y106.2 E.0554
G1 X48.012 Y106.2 E.21417
G1 X46.831 Y107.381 E.0554
G1 X47.974 Y107.381 E.03789
G1 X46.793 Y106.2 E.0554
G1 X45.164 Y106.2 E.05401
G1 X214.074 Y107.381 F30000
G1 F15476.087
G1 X215.702 Y107.381 E.05401
G1 X216.517 Y106.566 E.03823
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X217.038 Y107.571 E.05601
G3 X218.472 Y108.312 I-1.269 J4.212 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X217.861 Y107.909 E-.27803
G1 X217.038 Y107.571 E-.33809
G1 X216.77 Y107.303 E-.14389
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/35
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4 I-.013 J-1.217 P1  F30000
G1 X37.899 Y109.18 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X38.083 Y109.019 E.00811
G3 X40.179 Y108.294 I2.118 J2.733 E.07487
G1 X215.821 Y108.294 E5.8264
G3 X219.256 Y111.73 I-.04 J3.475 E.17848
G1 X219.256 Y140.271 E.94676
G3 X215.821 Y143.706 I-3.458 J-.023 E.17865
G1 X40.179 Y143.706 E5.8264
G3 X36.744 Y140.27 I.04 J-3.475 E.17848
G1 X36.744 Y111.73 E.94671
G3 X37.767 Y109.296 I3.458 J.022 E.08987
G1 X37.854 Y109.219 E.00384
M204 S250
G1 X38.157 Y109.474 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X38.324 Y109.331 E.00676
G3 X40.193 Y108.686 I1.884 J2.427 E.06184
G1 X215.807 Y108.686 E5.39616
G3 X218.864 Y111.743 I-.026 J3.082 E.14722
G1 X218.864 Y140.257 E.87616
G3 X215.807 Y143.314 I-3.071 J-.015 E.14735
G1 X40.193 Y143.314 E5.39616
G3 X37.136 Y140.257 I.026 J-3.082 E.14722
G1 X37.136 Y111.743 E.87615
G3 X38.046 Y109.575 I3.072 J.015 E.07415
G1 X38.113 Y109.515 E.00277
; WIPE_START
M204 S10000
G1 X38.324 Y109.331 E-.10635
G1 X38.655 Y109.105 E-.15223
G1 X39.042 Y108.914 E-.16405
G1 X39.422 Y108.787 E-.1523
G1 X39.785 Y108.715 E-.14045
G1 X39.902 Y108.707 E-.04463
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.754 Y105.875 E.01557
G1 X215.025 Y105.888 E.009
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I-.007 J-7.406 E.38635
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.189 Y107.745 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00031
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.773 Y105.483 E.01472
G1 X215.064 Y105.498 E.00893
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I-.002 J-7.793 E.37628
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.149 Y107.79 E.0215
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02447
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.721 Y106.564 E-.15468
; WIPE_END
G1 E-.04 F1800
G1 X41.806 Y107.261 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X40.178 Y107.261 E.05401
G1 X39.483 Y106.566 E.0326
G3 X40.158 Y106.379 I1.29 J3.335 E.02328
G1 X39.152 Y107.384 E.04717
G2 X37.674 Y108.042 I.9 J4.012 E.05402
G1 X45.164 Y106.2 F30000
G1 F15476.087
G1 X46.793 Y106.2 E.05401
G1 X47.854 Y107.261 E.04977
G1 X46.951 Y107.261 E.02993
G1 X48.012 Y106.2 E.04977
G1 X54.469 Y106.2 E.21417
G1 X55.53 Y107.261 E.04977
G1 X54.627 Y107.261 E.02993
G1 X55.688 Y106.2 E.04977
G1 X62.145 Y106.2 E.21417
G1 X63.206 Y107.261 E.04977
G1 X62.303 Y107.261 E.02993
G1 X63.364 Y106.2 E.04977
G1 X69.821 Y106.2 E.21417
G1 X70.882 Y107.261 E.04977
G1 X69.979 Y107.261 E.02993
G1 X71.04 Y106.2 E.04977
G1 X77.496 Y106.2 E.21417
G1 X78.557 Y107.261 E.04977
G1 X77.655 Y107.261 E.02993
G1 X78.716 Y106.2 E.04977
G1 X85.172 Y106.2 E.21417
G1 X86.233 Y107.261 E.04977
G1 X85.331 Y107.261 E.02993
G1 X86.392 Y106.2 E.04977
G1 X92.848 Y106.2 E.21417
G1 X93.909 Y107.261 E.04977
G1 X93.007 Y107.261 E.02993
G1 X94.068 Y106.2 E.04977
G1 X100.524 Y106.2 E.21417
G1 X101.585 Y107.261 E.04977
M73 P85 R5
G1 X100.683 Y107.261 E.02993
G1 X101.744 Y106.2 E.04977
G1 X108.2 Y106.2 E.21417
G1 X109.261 Y107.261 E.04977
G1 X108.359 Y107.261 E.02993
G1 X109.42 Y106.2 E.04977
G1 X115.876 Y106.2 E.21417
G1 X116.937 Y107.261 E.04977
G1 X116.035 Y107.261 E.02993
G1 X117.096 Y106.2 E.04977
G1 X123.552 Y106.2 E.21417
G1 X124.613 Y107.261 E.04977
G1 X123.711 Y107.261 E.02993
G1 X124.772 Y106.2 E.04977
G1 X131.228 Y106.2 E.21417
G1 X132.289 Y107.261 E.04977
G1 X131.387 Y107.261 E.02993
G1 X132.448 Y106.2 E.04977
G1 X138.904 Y106.2 E.21417
G1 X139.965 Y107.261 E.04977
G1 X139.063 Y107.261 E.02993
G1 X140.124 Y106.2 E.04977
G1 X146.58 Y106.2 E.21417
G1 X147.641 Y107.261 E.04977
G1 X146.739 Y107.261 E.02993
G1 X147.8 Y106.2 E.04977
G1 X154.256 Y106.2 E.21417
G1 X155.317 Y107.261 E.04977
G1 X154.415 Y107.261 E.02993
G1 X155.476 Y106.2 E.04977
G1 X161.932 Y106.2 E.21417
G1 X162.993 Y107.261 E.04977
G1 X162.091 Y107.261 E.02993
G1 X163.152 Y106.2 E.04977
G1 X169.608 Y106.2 E.21417
G1 X170.669 Y107.261 E.04977
G1 X169.767 Y107.261 E.02993
G1 X170.828 Y106.2 E.04977
G1 X177.284 Y106.2 E.21417
G1 X178.345 Y107.261 E.04977
G1 X177.443 Y107.261 E.02993
G1 X178.504 Y106.2 E.04977
G1 X184.96 Y106.2 E.21417
G1 X186.021 Y107.261 E.04977
G1 X185.119 Y107.261 E.02993
G1 X186.179 Y106.2 E.04977
G1 X192.636 Y106.2 E.21417
G1 X193.697 Y107.261 E.04977
G1 X192.794 Y107.261 E.02993
G1 X193.855 Y106.2 E.04977
G1 X200.312 Y106.2 E.21417
G1 X201.373 Y107.261 E.04977
G1 X200.47 Y107.261 E.02993
G1 X201.531 Y106.2 E.04977
G1 X207.988 Y106.2 E.21417
G1 X209.049 Y107.261 E.04977
G1 X208.146 Y107.261 E.02993
G1 X209.207 Y106.2 E.04977
G1 X210.836 Y106.2 E.05401
G1 X218.326 Y108.042 F30000
G1 F15476.087
G2 X216.848 Y107.384 I-2.378 J3.355 E.05402
G1 X215.842 Y106.379 E.04717
G3 X216.517 Y106.566 I-.615 J3.522 E.02328
G1 X215.822 Y107.261 E.0326
G1 X214.194 Y107.261 E.05401
G1 X219.743 Y108.773 F30000
G1 F15476.087
G3 X220.618 Y110.142 I-17.032 J11.84 E.0539
G1 X220.148 Y110.612 E.02205
G1 X220.166 Y110.702 E.00307
G1 X221.171 Y111.708 E.04717
G3 X221.35 Y113.273 I-7.81 J1.683 E.05235
G1 X221.35 Y117.086 E.12647
G1 X220.289 Y118.147 E.04977
G1 X220.289 Y118.501 E.01176
G1 X221.35 Y119.562 E.04977
G1 X221.35 Y124.762 E.17248
G1 X220.289 Y125.823 E.04977
G1 X220.289 Y126.177 E.01176
G1 X221.35 Y127.238 E.04977
G1 X221.35 Y132.438 E.17248
G1 X220.289 Y133.499 E.04977
G1 X220.289 Y133.853 E.01176
G1 X221.35 Y134.914 E.04977
G3 X221.315 Y139.441 I-46.072 J1.906 E.15022
G3 X221.171 Y140.292 I-4.393 J-.302 E.02868
G1 X220.166 Y141.298 E.04717
G1 X220.148 Y141.388 E.00307
G1 X220.618 Y141.858 E.02205
G3 X219.743 Y143.227 I-6.651 J-3.284 E.05399
G1 X214.194 Y144.739 F30000
G1 F15476.087
G1 X215.822 Y144.739 E.05401
G1 X216.517 Y145.434 E.0326
G3 X215.842 Y145.621 I-1.29 J-3.334 E.02328
G1 X216.848 Y144.616 E.04717
G2 X218.326 Y143.958 I-.9 J-4.012 E.05402
G1 X210.836 Y145.8 F30000
G1 F15476.087
G1 X209.207 Y145.8 E.05401
G1 X208.146 Y144.739 E.04977
G1 X209.049 Y144.739 E.02993
G1 X207.988 Y145.8 E.04977
G1 X201.531 Y145.8 E.21417
G1 X200.47 Y144.739 E.04977
G1 X201.373 Y144.739 E.02993
G1 X200.312 Y145.8 E.04977
G1 X193.855 Y145.8 E.21417
G1 X192.794 Y144.739 E.04977
G1 X193.697 Y144.739 E.02993
G1 X192.636 Y145.8 E.04977
G1 X186.179 Y145.8 E.21417
G1 X185.118 Y144.739 E.04977
G1 X186.021 Y144.739 E.02993
G1 X184.96 Y145.8 E.04977
G1 X178.503 Y145.8 E.21417
G1 X177.443 Y144.739 E.04977
G1 X178.345 Y144.739 E.02993
G1 X177.284 Y145.8 E.04977
G1 X170.828 Y145.8 E.21417
G1 X169.767 Y144.739 E.04977
G1 X170.669 Y144.739 E.02993
G1 X169.608 Y145.8 E.04977
G1 X163.152 Y145.8 E.21417
G1 X162.091 Y144.739 E.04977
G1 X162.993 Y144.739 E.02993
G1 X161.932 Y145.8 E.04977
G1 X155.476 Y145.8 E.21417
G1 X154.415 Y144.739 E.04977
G1 X155.317 Y144.739 E.02993
G1 X154.256 Y145.8 E.04977
G1 X147.8 Y145.8 E.21417
G1 X146.739 Y144.739 E.04977
G1 X147.641 Y144.739 E.02993
G1 X146.58 Y145.8 E.04977
G1 X140.124 Y145.8 E.21417
G1 X139.063 Y144.739 E.04977
G1 X139.965 Y144.739 E.02993
G1 X138.904 Y145.8 E.04977
G1 X132.448 Y145.8 E.21417
G1 X131.387 Y144.739 E.04977
G1 X132.289 Y144.739 E.02993
G1 X131.228 Y145.8 E.04977
G1 X124.772 Y145.8 E.21417
G1 X123.711 Y144.739 E.04977
G1 X124.613 Y144.739 E.02993
G1 X123.552 Y145.8 E.04977
G1 X117.096 Y145.8 E.21417
G1 X116.035 Y144.739 E.04977
G1 X116.937 Y144.739 E.02993
G1 X115.876 Y145.8 E.04977
G1 X109.42 Y145.8 E.21417
G1 X108.359 Y144.739 E.04977
G1 X109.261 Y144.739 E.02993
G1 X108.2 Y145.8 E.04977
G1 X101.744 Y145.8 E.21417
G1 X100.683 Y144.739 E.04977
G1 X101.585 Y144.739 E.02993
G1 X100.524 Y145.8 E.04977
G1 X94.068 Y145.8 E.21417
G1 X93.007 Y144.739 E.04977
G1 X93.909 Y144.739 E.02993
G1 X92.848 Y145.8 E.04977
G1 X86.392 Y145.8 E.21417
G1 X85.331 Y144.739 E.04977
G1 X86.233 Y144.739 E.02993
G1 X85.172 Y145.8 E.04977
G1 X78.716 Y145.8 E.21417
G1 X77.655 Y144.739 E.04977
G1 X78.557 Y144.739 E.02993
G1 X77.496 Y145.8 E.04977
G1 X71.04 Y145.8 E.21417
G1 X69.979 Y144.739 E.04977
G1 X70.881 Y144.739 E.02993
G1 X69.821 Y145.8 E.04977
G1 X63.364 Y145.8 E.21417
G1 X62.303 Y144.739 E.04977
G1 X63.206 Y144.739 E.02993
G1 X62.145 Y145.8 E.04977
G1 X55.688 Y145.8 E.21417
G1 X54.627 Y144.739 E.04977
G1 X55.53 Y144.739 E.02993
G1 X54.469 Y145.8 E.04977
G1 X48.012 Y145.8 E.21417
G1 X46.951 Y144.739 E.04977
G1 X47.854 Y144.739 E.02993
G1 X46.793 Y145.8 E.04977
G1 X45.164 Y145.8 E.05401
G1 X37.674 Y143.958 F30000
G1 F15476.087
G2 X39.152 Y144.616 I2.378 J-3.355 E.05402
G1 X40.158 Y145.621 E.04717
G3 X39.483 Y145.434 I.615 J-3.522 E.02328
G1 X40.178 Y144.739 E.0326
G1 X41.806 Y144.739 E.05401
G1 X36.257 Y143.227 F30000
G1 F15476.087
G3 X35.382 Y141.858 I17.029 J-11.838 E.0539
G1 X35.852 Y141.388 E.02205
G1 X35.834 Y141.298 E.00307
G1 X34.829 Y140.292 E.04717
G3 X34.65 Y138.727 I7.81 J-1.683 E.05235
G1 X34.65 Y134.914 E.12647
G1 X35.711 Y133.853 E.04977
G1 X35.711 Y133.499 E.01176
G1 X34.65 Y132.438 E.04977
G1 X34.65 Y127.238 E.17248
G1 X35.711 Y126.177 E.04977
G1 X35.711 Y125.823 E.01176
G1 X34.65 Y124.762 E.04977
G1 X34.65 Y119.562 E.17248
G1 X35.711 Y118.501 E.04977
G1 X35.711 Y118.147 E.01176
G1 X34.65 Y117.086 E.04977
G3 X34.685 Y112.559 I46.072 J-1.906 E.15022
G3 X34.829 Y111.708 I4.393 J.302 E.02868
G1 X35.834 Y110.702 E.04717
G1 X35.852 Y110.612 E.00307
G1 X35.382 Y110.142 E.02205
G3 X36.257 Y108.773 I17.9 J10.467 E.0539
; WIPE_START
G1 X35.839 Y109.334 E-.26574
G1 X35.382 Y110.142 E-.35268
G1 X35.646 Y110.405 E-.14158
; WIPE_END
G1 E-.04 F1800
G1 X43.278 Y110.461 Z4.2 F30000
G1 X219.929 Y111.739 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.355735
G1 F12000
G2 X215.811 Y107.621 I-4.146 J.028 E.16458
G1 X40.185 Y107.621 E4.47679
G2 X36.071 Y111.733 I.032 J4.145 E.16432
G1 X36.071 Y140.265 E.7273
G2 X40.183 Y144.379 I4.146 J-.032 E.16431
G1 X215.815 Y144.379 E4.47695
G2 X219.929 Y140.267 I-.031 J-4.144 E.16433
G1 X219.929 Y111.799 E.72567
; WIPE_START
G1 X219.929 Y113.799 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.299 Y113.6 Z4.2 F30000
G1 X37.504 Y109.047 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.355736
G1 F12000
G3 X40.189 Y107.934 I2.693 J2.701 E.07601
G1 X215.811 Y107.934 E4.47669
G3 X219.616 Y111.739 I-.03 J3.835 E.15204
G1 X219.616 Y140.267 E.7272
G3 X215.811 Y144.066 I-3.813 J-.014 E.15211
G1 X40.183 Y144.066 E4.47685
G3 X36.384 Y140.261 I.037 J-3.836 E.15187
G1 X36.384 Y111.733 E.7272
G3 X37.465 Y109.092 I3.784 J.007 E.07457
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X37.169 Y109.429 E-.17042
G1 X36.908 Y109.818 E-.17779
G1 X36.677 Y110.278 E-.1957
G1 X36.511 Y110.766 E-.19571
G1 X36.501 Y110.818 E-.02039
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/35
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.2 I.987 J.712 P1  F30000
G1 X37.775 Y109.053 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X38.105 Y108.789 E.01401
G3 X40.177 Y108.112 I2.122 J2.987 E.07344
G1 X215.823 Y108.112 E5.82648
G3 X219.438 Y111.73 I-.062 J3.677 E.1876
G1 X219.438 Y140.273 E.9468
G3 X215.823 Y143.888 I-3.664 J-.049 E.18767
G1 X40.177 Y143.888 E5.82648
G3 X36.562 Y140.273 I.049 J-3.664 E.18767
G1 X36.562 Y111.727 E.9469
G3 X37.731 Y109.094 I3.664 J.049 E.09822
M204 S250
G1 X38.029 Y109.353 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X38.473 Y109.014 E.01717
G3 X40.192 Y108.505 I1.753 J2.762 E.05581
G1 X215.808 Y108.505 E5.39618
G3 X219.045 Y111.743 I-.045 J3.283 E.15572
G1 X219.045 Y140.258 E.87618
G3 X215.808 Y143.495 I-3.272 J-.034 E.15583
G1 X40.192 Y143.495 E5.39618
G3 X36.955 Y140.258 I.034 J-3.272 E.15583
G1 X36.955 Y111.742 E.87621
G3 X37.985 Y109.393 I3.272 J.034 E.08099
; WIPE_START
M204 S10000
G1 X38.473 Y109.014 E-.23501
G1 X38.693 Y108.885 E-.09686
G1 X39.08 Y108.713 E-.16089
G1 X39.651 Y108.559 E-.22491
G1 X39.762 Y108.548 E-.04233
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.78 Y105.876 E.01644
M73 P85 R4
G1 X215.025 Y105.888 E.00813
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.189 Y107.745 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00032
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.799 Y105.485 E.01552
G1 X215.064 Y105.498 E.00813
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.149 Y107.79 E.02149
M204 S10000
G1 X36.257 Y108.773 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X35.382 Y110.142 I17.023 J11.834 E.0539
G1 X35.775 Y110.534 E.01842
G2 X35.709 Y110.828 I1.62 J.518 E.00998
G1 X34.829 Y111.708 E.04129
G2 X34.65 Y113.273 I7.81 J1.683 E.05235
G1 X34.65 Y117.086 E.12647
G1 X35.602 Y118.038 E.04466
G1 X35.602 Y118.61 E.01899
G1 X34.65 Y119.562 E.04466
G1 X34.65 Y124.762 E.17248
G1 X35.602 Y125.714 E.04466
G1 X35.602 Y126.286 E.01899
G1 X34.65 Y127.238 E.04466
G1 X34.65 Y132.438 E.17248
G1 X35.602 Y133.39 E.04466
G1 X35.602 Y133.962 E.01899
G1 X34.65 Y134.914 E.04466
G2 X34.685 Y139.441 I46.073 J1.906 E.15022
G2 X34.829 Y140.292 I4.39 J-.301 E.02868
G1 X35.709 Y141.172 E.04129
G2 X35.775 Y141.466 I1.686 J-.225 E.00998
G1 X35.382 Y141.858 E.01842
G2 X36.257 Y143.227 I17.903 J-10.469 E.0539
G1 X41.704 Y144.848 F30000
G1 F15476.087
G3 X40.076 Y144.84 I-.77 J-9.253 E.05407
G1 X39.483 Y145.434 E.02785
G2 X40.158 Y145.621 I1.29 J-3.334 E.02328
G1 X39.275 Y144.739 E.0414
G3 X37.769 Y144.144 I.91 J-4.507 E.05399
G1 X45.164 Y145.8 F30000
G1 F15476.087
G1 X46.793 Y145.8 E.05401
G1 X47.745 Y144.848 E.04466
G1 X47.06 Y144.848 E.0227
G1 X48.012 Y145.8 E.04466
G1 X54.469 Y145.8 E.21417
G1 X55.421 Y144.848 E.04466
G1 X54.736 Y144.848 E.0227
G1 X55.688 Y145.8 E.04466
G1 X62.145 Y145.8 E.21417
G1 X63.096 Y144.848 E.04466
G1 X62.412 Y144.848 E.0227
G1 X63.364 Y145.8 E.04466
M73 P86 R4
G1 X69.821 Y145.8 E.21417
G1 X70.772 Y144.848 E.04466
G1 X70.088 Y144.848 E.0227
G1 X71.04 Y145.8 E.04466
G1 X77.496 Y145.8 E.21417
G1 X78.448 Y144.848 E.04466
G1 X77.764 Y144.848 E.0227
G1 X78.716 Y145.8 E.04466
G1 X85.172 Y145.8 E.21417
G1 X86.124 Y144.848 E.04466
G1 X85.44 Y144.848 E.0227
G1 X86.392 Y145.8 E.04466
G1 X92.848 Y145.8 E.21417
G1 X93.8 Y144.848 E.04466
G1 X93.116 Y144.848 E.0227
G1 X94.068 Y145.8 E.04466
G1 X100.524 Y145.8 E.21417
G1 X101.476 Y144.848 E.04466
G1 X100.792 Y144.848 E.0227
G1 X101.744 Y145.8 E.04466
G1 X108.2 Y145.8 E.21417
G1 X109.152 Y144.848 E.04466
G1 X108.468 Y144.848 E.0227
G1 X109.42 Y145.8 E.04466
G1 X115.876 Y145.8 E.21417
G1 X116.828 Y144.848 E.04466
G1 X116.144 Y144.848 E.0227
G1 X117.096 Y145.8 E.04466
G1 X123.552 Y145.8 E.21417
G1 X124.504 Y144.848 E.04466
G1 X123.82 Y144.848 E.0227
G1 X124.772 Y145.8 E.04466
G1 X131.228 Y145.8 E.21417
G1 X132.18 Y144.848 E.04466
G1 X131.496 Y144.848 E.0227
G1 X132.448 Y145.8 E.04466
G1 X138.904 Y145.8 E.21417
G1 X139.856 Y144.848 E.04466
G1 X139.172 Y144.848 E.0227
G1 X140.124 Y145.8 E.04466
G1 X146.58 Y145.8 E.21417
G1 X147.532 Y144.848 E.04466
G1 X146.848 Y144.848 E.0227
G1 X147.8 Y145.8 E.04466
G1 X154.256 Y145.8 E.21417
G1 X155.208 Y144.848 E.04466
G1 X154.524 Y144.848 E.0227
G1 X155.476 Y145.8 E.04466
G1 X161.932 Y145.8 E.21417
G1 X162.884 Y144.848 E.04466
G1 X162.2 Y144.848 E.0227
G1 X163.152 Y145.8 E.04466
G1 X169.608 Y145.8 E.21417
G1 X170.56 Y144.848 E.04466
G1 X169.876 Y144.848 E.0227
G1 X170.828 Y145.8 E.04466
G1 X177.284 Y145.8 E.21417
G1 X178.236 Y144.848 E.04466
G1 X177.552 Y144.848 E.0227
G1 X178.503 Y145.8 E.04466
G1 X184.96 Y145.8 E.21417
G1 X185.912 Y144.848 E.04466
G1 X185.228 Y144.848 E.0227
G1 X186.179 Y145.8 E.04466
G1 X192.636 Y145.8 E.21417
G1 X193.588 Y144.848 E.04466
G1 X192.903 Y144.848 E.0227
G1 X193.855 Y145.8 E.04466
G1 X200.312 Y145.8 E.21417
G1 X201.264 Y144.848 E.04466
G1 X200.579 Y144.848 E.0227
G1 X201.531 Y145.8 E.04466
G1 X207.988 Y145.8 E.21417
G1 X208.94 Y144.848 E.04466
G1 X208.255 Y144.848 E.0227
G1 X209.207 Y145.8 E.04466
G1 X210.836 Y145.8 E.05401
G1 X218.224 Y144.148 F30000
G1 F15476.087
G3 X216.718 Y144.745 I-2.67 J-4.537 E.05396
G1 X215.842 Y145.621 E.04109
G2 X216.517 Y145.434 I-.615 J-3.524 E.02328
G1 X215.924 Y144.84 E.02785
G1 X215.851 Y144.847 E.00241
G3 X214.296 Y144.848 I-.787 J-16.831 E.05162
G1 X219.743 Y143.227 F30000
G1 F15476.087
G2 X220.618 Y141.858 I-5.703 J-4.605 E.05399
G1 X220.223 Y141.463 E.01854
G1 X220.289 Y141.175 E.00982
G1 X221.171 Y140.292 E.0414
G2 X221.35 Y138.727 I-7.81 J-1.683 E.05235
G1 X221.35 Y134.914 E.12647
G1 X220.398 Y133.962 E.04466
G1 X220.398 Y133.39 E.01899
G1 X221.35 Y132.438 E.04466
G1 X221.35 Y127.238 E.17248
G1 X220.398 Y126.286 E.04466
G1 X220.398 Y125.714 E.01899
G1 X221.35 Y124.762 E.04466
G1 X221.35 Y119.562 E.17248
G1 X220.398 Y118.61 E.04466
G1 X220.398 Y118.038 E.01899
G1 X221.35 Y117.086 E.04466
G2 X221.315 Y112.559 I-46.073 J-1.906 E.15022
G2 X221.171 Y111.708 I-4.39 J.301 E.02868
G1 X220.291 Y110.828 E.04129
G2 X220.225 Y110.534 I-1.686 J.225 E.00998
G1 X220.618 Y110.142 E.01842
G2 X219.743 Y108.773 I-17.906 J10.471 E.0539
G1 X219.918 Y111.734 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.595662
G1 F11397.731
G1 X219.805 Y110.871 E.03918
G1 X219.551 Y110.073 E.03774
G1 X219.296 Y109.59 E.0246
G1 X218.83 Y108.978 E.03463
G2 X215.861 Y107.635 I-3.101 J2.903 E.15062
G1 X40.181 Y107.633 E7.91289
G1 X39.531 Y107.706 E.02946
G1 X38.8 Y107.888 E.03393
G1 X38.035 Y108.258 E.03825
G1 X37.43 Y108.72 E.0343
G1 X36.864 Y109.352 E.03823
G1 X36.479 Y110.014 E.03449
G1 X36.2 Y110.811 E.03802
G2 X36.082 Y111.735 I10.39 J1.793 E.04196
G1 X36.082 Y140.266 E1.28511
G1 X36.195 Y141.129 E.03919
G1 X36.449 Y141.927 E.03773
G1 X36.704 Y142.41 E.0246
G1 X37.17 Y143.022 E.03463
G2 X40.139 Y144.365 I3.102 J-2.904 E.15062
G1 X215.819 Y144.367 E7.91289
G1 X216.469 Y144.294 E.02946
G1 X217.2 Y144.112 E.03393
G1 X217.696 Y143.886 E.02454
G1 X218.397 Y143.422 E.03787
G1 X218.944 Y142.894 E.03422
G2 X219.917 Y140.274 I-3.364 J-2.741 E.1282
G1 X219.918 Y111.794 E1.2828
; WIPE_START
G1 X219.918 Y113.794 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.986 Y107.968 Z4.4 F30000
G1 X214.296 Y107.152 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X215.924 Y107.16 I.77 J9.253 E.05407
G1 X216.517 Y106.566 E.02785
G2 X215.842 Y106.379 I-1.29 J3.335 E.02328
G1 X216.725 Y107.261 E.0414
G3 X218.231 Y107.856 I-.91 J4.507 E.05399
G1 X210.836 Y106.2 F30000
G1 F15476.087
G1 X209.207 Y106.2 E.05401
G1 X208.255 Y107.152 E.04466
G1 X208.94 Y107.152 E.0227
G1 X207.988 Y106.2 E.04466
G1 X201.531 Y106.2 E.21417
G1 X200.579 Y107.152 E.04466
G1 X201.264 Y107.152 E.0227
G1 X200.312 Y106.2 E.04466
G1 X193.855 Y106.2 E.21417
G1 X192.904 Y107.152 E.04466
G1 X193.588 Y107.152 E.0227
G1 X192.636 Y106.2 E.04466
G1 X186.179 Y106.2 E.21417
G1 X185.228 Y107.152 E.04466
G1 X185.912 Y107.152 E.0227
G1 X184.96 Y106.2 E.04466
G1 X178.504 Y106.2 E.21417
G1 X177.552 Y107.152 E.04466
G1 X178.236 Y107.152 E.0227
G1 X177.284 Y106.2 E.04466
G1 X170.828 Y106.2 E.21417
G1 X169.876 Y107.152 E.04466
G1 X170.56 Y107.152 E.0227
G1 X169.608 Y106.2 E.04466
G1 X163.152 Y106.2 E.21417
G1 X162.2 Y107.152 E.04466
G1 X162.884 Y107.152 E.0227
G1 X161.932 Y106.2 E.04466
G1 X155.476 Y106.2 E.21417
G1 X154.524 Y107.152 E.04466
G1 X155.208 Y107.152 E.0227
G1 X154.256 Y106.2 E.04466
G1 X147.8 Y106.2 E.21417
G1 X146.848 Y107.152 E.04466
G1 X147.532 Y107.152 E.0227
G1 X146.58 Y106.2 E.04466
G1 X140.124 Y106.2 E.21417
G1 X139.172 Y107.152 E.04466
G1 X139.856 Y107.152 E.0227
G1 X138.904 Y106.2 E.04466
G1 X132.448 Y106.2 E.21417
G1 X131.496 Y107.152 E.04466
G1 X132.18 Y107.152 E.0227
G1 X131.228 Y106.2 E.04466
G1 X124.772 Y106.2 E.21417
G1 X123.82 Y107.152 E.04466
G1 X124.504 Y107.152 E.0227
G1 X123.552 Y106.2 E.04466
G1 X117.096 Y106.2 E.21417
G1 X116.144 Y107.152 E.04466
G1 X116.828 Y107.152 E.0227
G1 X115.876 Y106.2 E.04466
G1 X109.42 Y106.2 E.21417
G1 X108.468 Y107.152 E.04466
G1 X109.152 Y107.152 E.0227
G1 X108.2 Y106.2 E.04466
G1 X101.744 Y106.2 E.21417
G1 X100.792 Y107.152 E.04466
G1 X101.476 Y107.152 E.0227
G1 X100.524 Y106.2 E.04466
G1 X94.068 Y106.2 E.21417
G1 X93.116 Y107.152 E.04466
G1 X93.8 Y107.152 E.0227
G1 X92.848 Y106.2 E.04466
G1 X86.392 Y106.2 E.21417
G1 X85.44 Y107.152 E.04466
G1 X86.124 Y107.152 E.0227
G1 X85.172 Y106.2 E.04466
G1 X78.716 Y106.2 E.21417
G1 X77.764 Y107.152 E.04466
G1 X78.448 Y107.152 E.0227
G1 X77.496 Y106.2 E.04466
G1 X71.04 Y106.2 E.21417
G1 X70.088 Y107.152 E.04466
G1 X70.772 Y107.152 E.0227
G1 X69.821 Y106.2 E.04466
G1 X63.364 Y106.2 E.21417
G1 X62.412 Y107.152 E.04466
G1 X63.096 Y107.152 E.0227
G1 X62.145 Y106.2 E.04466
G1 X55.688 Y106.2 E.21417
G1 X54.736 Y107.152 E.04466
G1 X55.421 Y107.152 E.0227
G1 X54.469 Y106.2 E.04466
G1 X48.012 Y106.2 E.21417
G1 X47.06 Y107.152 E.04466
G1 X47.745 Y107.152 E.0227
G1 X46.793 Y106.2 E.04466
G1 X45.164 Y106.2 E.05401
G1 X37.776 Y107.852 F30000
G1 F15476.087
G3 X39.282 Y107.255 I2.67 J4.537 E.05396
G1 X40.158 Y106.379 E.04109
G2 X39.483 Y106.566 I.614 J3.521 E.02328
G1 X40.076 Y107.16 E.02785
G1 X40.149 Y107.153 E.00241
G3 X41.704 Y107.152 I.787 J16.831 E.05162
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X40.149 Y107.153 E-.5911
G1 X40.076 Y107.16 E-.02766
G1 X39.813 Y106.897 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/35
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.4 I-.836 J-.885 P1  F30000
G1 X37.579 Y109.008 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X37.686 Y108.913 E.00475
G3 X40.198 Y107.954 I2.532 J2.861 E.09117
G1 X215.802 Y107.954 E5.82508
G3 X219.595 Y111.539 I-.019 J3.82 E.1906
G1 X219.596 Y140.252 E.95245
G3 X216.011 Y144.045 I-3.816 J-.016 E.19065
G1 X40.198 Y144.046 E5.83203
G3 X36.405 Y140.461 I.019 J-3.82 E.1906
G1 X36.405 Y111.537 E.95946
G3 X37.337 Y109.266 I3.813 J.237 E.08292
G1 X37.538 Y109.052 E.00973
M204 S250
G1 X37.858 Y109.284 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.945 Y109.207 E.00357
G3 X40.199 Y108.346 I2.272 J2.565 E.07578
G1 X215.801 Y108.346 E5.39573
G3 X219.203 Y111.563 I-.018 J3.427 E.15841
G1 X219.204 Y140.251 E.88147
G3 X215.987 Y143.653 I-3.423 J-.015 E.15845
G1 X40.199 Y143.654 E5.40145
G3 X36.797 Y140.437 I.018 J-3.427 E.15841
G1 X36.797 Y111.563 E.88721
G3 X37.632 Y109.523 I3.42 J.21 E.06895
G1 X37.817 Y109.328 E.00826
; WIPE_START
M204 S10000
G1 X37.945 Y109.207 E-.06692
G1 X38.322 Y108.907 E-.18315
G1 X38.676 Y108.703 E-.15535
G1 X39.087 Y108.53 E-.16927
G1 X39.553 Y108.405 E-.18344
G1 X39.558 Y108.405 E-.00187
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.806 Y105.878 E.01731
G1 X215.025 Y105.888 E.00727
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.188 Y107.746 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00033
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.826 Y105.486 E.01633
G1 X215.064 Y105.498 E.00732
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.148 Y107.791 E.02147
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02486
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.721 Y106.564 E-.15429
; WIPE_END
G1 E-.04 F1800
G1 X38.011 Y107.253 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X39.483 Y106.566 I6.44 J11.875 E.0539
G1 X39.983 Y107.067 E.02349
G2 X39.401 Y107.136 I.083 J3.209 E.01948
G1 X40.158 Y106.379 E.03551
G3 X41.723 Y106.2 I1.683 J7.809 E.05235
G1 X46.793 Y106.2 E.16816
G1 X47.65 Y107.058 E.04022
G1 X47.155 Y107.058 E.01642
G1 X48.012 Y106.2 E.04022
G1 X54.469 Y106.2 E.21417
G1 X55.326 Y107.058 E.04022
G1 X54.831 Y107.058 E.01642
G1 X55.688 Y106.2 E.04022
G1 X62.145 Y106.2 E.21417
G1 X63.002 Y107.058 E.04022
G1 X62.507 Y107.058 E.01642
G1 X63.364 Y106.2 E.04022
G1 X69.821 Y106.2 E.21417
G1 X70.678 Y107.058 E.04022
G1 X70.183 Y107.058 E.01642
G1 X71.04 Y106.2 E.04022
G1 X77.496 Y106.2 E.21417
G1 X78.354 Y107.058 E.04022
G1 X77.859 Y107.058 E.01642
G1 X78.716 Y106.2 E.04022
G1 X85.172 Y106.2 E.21417
G1 X86.03 Y107.058 E.04022
G1 X85.535 Y107.058 E.01642
G1 X86.392 Y106.2 E.04022
G1 X92.848 Y106.2 E.21417
G1 X93.706 Y107.058 E.04022
G1 X93.211 Y107.058 E.01642
G1 X94.068 Y106.2 E.04022
G1 X100.524 Y106.2 E.21417
G1 X101.382 Y107.058 E.04022
G1 X100.887 Y107.058 E.01642
G1 X101.744 Y106.2 E.04022
G1 X108.2 Y106.2 E.21417
G1 X109.058 Y107.058 E.04022
G1 X108.563 Y107.058 E.01642
G1 X109.42 Y106.2 E.04022
G1 X115.876 Y106.2 E.21417
G1 X116.734 Y107.058 E.04022
G1 X116.239 Y107.058 E.01642
G1 X117.096 Y106.2 E.04022
G1 X123.552 Y106.2 E.21417
G1 X124.41 Y107.058 E.04022
G1 X123.914 Y107.058 E.01642
G1 X124.772 Y106.2 E.04022
G1 X131.228 Y106.2 E.21417
G1 X132.085 Y107.058 E.04022
G1 X131.59 Y107.058 E.01642
G1 X132.448 Y106.2 E.04022
G1 X138.904 Y106.2 E.21417
G1 X139.761 Y107.058 E.04022
G1 X139.266 Y107.058 E.01642
G1 X140.124 Y106.2 E.04022
G1 X146.58 Y106.2 E.21417
G1 X147.437 Y107.058 E.04022
G1 X146.942 Y107.058 E.01642
G1 X147.8 Y106.2 E.04022
G1 X154.256 Y106.2 E.21417
G1 X155.113 Y107.058 E.04022
G1 X154.618 Y107.058 E.01642
G1 X155.476 Y106.2 E.04022
G1 X161.932 Y106.2 E.21417
G1 X162.789 Y107.058 E.04022
G1 X162.294 Y107.058 E.01642
G1 X163.152 Y106.2 E.04022
G1 X169.608 Y106.2 E.21417
G1 X170.465 Y107.058 E.04022
G1 X169.97 Y107.058 E.01642
G1 X170.828 Y106.2 E.04022
G1 X177.284 Y106.2 E.21417
G1 X178.141 Y107.058 E.04022
G1 X177.646 Y107.058 E.01642
G1 X178.504 Y106.2 E.04022
G1 X184.96 Y106.2 E.21417
G1 X185.817 Y107.058 E.04022
G1 X185.322 Y107.058 E.01642
G1 X186.179 Y106.2 E.04022
G1 X192.636 Y106.2 E.21417
G1 X193.493 Y107.058 E.04022
G1 X192.998 Y107.058 E.01642
G1 X193.855 Y106.2 E.04022
G1 X200.312 Y106.2 E.21417
G1 X201.169 Y107.058 E.04022
G1 X200.674 Y107.058 E.01642
G1 X201.531 Y106.2 E.04022
G1 X207.988 Y106.2 E.21417
G1 X208.845 Y107.058 E.04022
G1 X208.35 Y107.058 E.01642
G1 X209.207 Y106.2 E.04022
G1 X214.789 Y106.226 E.18516
G3 X215.842 Y106.379 I-.586 J7.718 E.03532
G1 X216.593 Y107.13 E.03523
G2 X216.017 Y107.067 I-.68 J3.569 E.01926
G1 X216.517 Y106.566 E.02349
G3 X217.989 Y107.253 I-2.297 J6.839 E.05398
G1 X219.454 Y109.604 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.531874
G1 F12000
G1 X219.805 Y110.351 E.03287
G3 X220.044 Y111.743 I-4.759 J1.533 E.05646
G1 X220.044 Y140.255 E1.13601
G1 X219.973 Y141.024 E.03077
G3 X219.467 Y142.377 I-4.869 J-1.048 E.05778
G1 X217.959 Y143.897 F30000
; LINE_WIDTH: 0.532355
G1 F12000
G1 X217.215 Y144.251 E.03288
G3 X215.806 Y144.494 I-1.428 J-4.083 E.05728
G1 X40.195 Y144.494 E7.00383
G1 X39.427 Y144.423 E.03077
G3 X38.112 Y143.936 I.956 J-4.605 E.05612
G1 X36.564 Y142.43 F30000
; LINE_WIDTH: 0.53209
G1 F12000
G3 X35.956 Y140.257 I3.805 J-2.235 E.09093
G1 X35.956 Y111.744 E1.13655
G1 X36.028 Y110.977 E.03071
G3 X36.527 Y109.645 I4.932 J1.085 E.0569
G1 X38.023 Y108.114 F30000
; LINE_WIDTH: 0.531987
G1 F12000
G1 X38.791 Y107.746 E.03394
G3 X39.871 Y107.528 I1.3 J3.65 E.04407
G1 X40.195 Y107.506 E.01293
G1 X215.801 Y107.506 E6.99838
G1 X216.573 Y107.577 E.03089
G3 X217.925 Y108.083 I-.971 J4.654 E.05775
G1 X217.977 Y108.113 F30000
; LINE_WIDTH: 0.509999
G1 F12000
G1 X218.109 Y108.226 E.0066
; LINE_WIDTH: 0.473995
G1 X218.24 Y108.339 E.00609
; LINE_WIDTH: 0.422586
G3 X219.099 Y109.177 I-4.324 J5.29 E.03718
; LINE_WIDTH: 0.437485
G1 X219.217 Y109.319 E.00595
; LINE_WIDTH: 0.472475
G1 X219.336 Y109.462 E.00648
; LINE_WIDTH: 0.494489
G1 X219.454 Y109.604 E.00681
G1 X219.487 Y109.338 E.00988
; LINE_WIDTH: 0.425671
G1 X219.851 Y108.99 E.01571
G2 X218.56 Y107.699 I-6.285 J4.994 E.05709
G1 X218.21 Y108.069 E.01588
; LINE_WIDTH: 0.475208
G1 X218.123 Y108.086 E.00312
; LINE_WIDTH: 0.510403
G1 X218.036 Y108.102 E.00337
G1 X218.609 Y108.19 F30000
; LINE_WIDTH: 0.368298
G1 F12000
G3 X219.322 Y108.896 I-2.903 J3.638 E.02665
; WIPE_START
G1 X219.006 Y108.545 E-.35755
G1 X218.609 Y108.19 E-.40245
; WIPE_END
G1 E-.04 F1800
G1 X218.794 Y115.82 Z4.6 F30000
G1 X219.438 Y142.43 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.512599
G1 F12000
G1 X219.324 Y142.562 E.00666
; LINE_WIDTH: 0.475555
G1 X219.211 Y142.693 E.00613
; LINE_WIDTH: 0.422676
G3 X218.373 Y143.549 I-5.466 J-4.513 E.0371
; LINE_WIDTH: 0.437612
G1 X218.235 Y143.665 E.0058
; LINE_WIDTH: 0.472855
G1 X218.097 Y143.781 E.00631
; LINE_WIDTH: 0.496306
G1 X217.959 Y143.897 E.00666
G1 X218.212 Y143.935 E.00946
; LINE_WIDTH: 0.426084
G1 X218.56 Y144.301 E.01576
G2 X219.851 Y143.01 I-5.123 J-6.415 E.05715
M73 P87 R4
G1 X219.483 Y142.664 E.01578
; LINE_WIDTH: 0.476445
G1 X219.466 Y142.576 E.00314
; LINE_WIDTH: 0.512895
G1 X219.449 Y142.489 E.00341
G1 X219.362 Y143.059 F30000
; LINE_WIDTH: 0.368063
G1 F12000
G3 X218.654 Y143.771 I-3.765 J-3.034 E.02665
; WIPE_START
G1 X219.005 Y143.455 E-.35724
G1 X219.362 Y143.059 E-.40276
; WIPE_END
G1 E-.04 F1800
G1 X211.729 Y143.095 Z4.6 F30000
G1 X37.903 Y143.901 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.50126
G1 F12000
G1 X38.06 Y143.907 E.00587
; LINE_WIDTH: 0.506932
G1 X37.916 Y143.787 E.00707
; LINE_WIDTH: 0.472155
G1 X37.772 Y143.668 E.00654
; LINE_WIDTH: 0.422664
G3 X36.901 Y142.823 I3.982 J-4.979 E.03761
; LINE_WIDTH: 0.438092
G1 X36.788 Y142.692 E.00556
; LINE_WIDTH: 0.474295
G1 X36.676 Y142.561 E.00607
; LINE_WIDTH: 0.500347
G1 X36.564 Y142.43 E.00644
G1 X36.519 Y142.663 E.00885
; LINE_WIDTH: 0.42348
G1 X36.149 Y143.01 E.01572
G2 X37.44 Y144.301 I6.284 J-4.993 E.05677
G1 X37.68 Y144.014 E.01159
; LINE_WIDTH: 0.434543
G1 X37.765 Y143.971 E.00303
; LINE_WIDTH: 0.463648
G1 X37.849 Y143.928 E.00326
G1 X37.391 Y143.81 F30000
; LINE_WIDTH: 0.368327
G1 F12000
G3 X36.678 Y143.104 I2.902 J-3.638 E.02665
; WIPE_START
G1 X36.994 Y143.456 E-.35761
G1 X37.391 Y143.81 E-.40239
; WIPE_END
G1 E-.04 F1800
G1 X37.204 Y136.18 Z4.6 F30000
G1 X36.554 Y109.591 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.510099
G1 F12000
G1 X36.669 Y109.454 E.00682
; LINE_WIDTH: 0.474055
G1 X36.784 Y109.316 E.0063
; LINE_WIDTH: 0.422648
G3 X37.631 Y108.449 I4.951 J3.993 E.03757
; LINE_WIDTH: 0.437339
G1 X37.762 Y108.338 E.00552
; LINE_WIDTH: 0.472035
G1 X37.893 Y108.226 E.00601
; LINE_WIDTH: 0.497167
G1 X38.023 Y108.114 E.00636
G1 X37.791 Y108.072 E.00874
; LINE_WIDTH: 0.426006
G1 X37.44 Y107.699 E.01598
G2 X36.149 Y108.99 I5.019 J6.31 E.05714
G1 X36.515 Y109.337 E.01576
; LINE_WIDTH: 0.470273
G1 X36.53 Y109.435 E.00343
; LINE_WIDTH: 0.508838
G1 X36.545 Y109.532 E.00374
G1 X36.638 Y108.941 F30000
; LINE_WIDTH: 0.367113
G1 F12000
G3 X37.346 Y108.23 I3.654 J2.93 E.02656
; WIPE_START
G1 X36.994 Y108.545 E-.3569
G1 X36.638 Y108.941 E-.4031
; WIPE_END
G1 E-.04 F1800
G1 X36.481 Y116.572 Z4.6 F30000
G1 X35.955 Y142.241 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X35.962 Y142.259 E.00065
G2 X36.112 Y142.53 I2.128 J-1.001 E.01026
G1 X35.881 Y142.722 E.00996
G3 X35.382 Y141.858 I7.396 J-4.846 E.03312
G1 X35.697 Y141.543 E.01477
G3 X35.586 Y141.049 I2.141 J-.742 E.01684
G1 X34.829 Y140.292 E.03551
G3 X34.65 Y138.727 I7.81 J-1.683 E.05235
G1 X34.65 Y134.914 E.12647
G1 X35.508 Y134.057 E.04022
G1 X35.508 Y133.295 E.02527
G1 X34.65 Y132.438 E.04022
G1 X34.65 Y127.238 E.17248
G1 X35.508 Y126.381 E.04022
G1 X35.508 Y125.619 E.02527
G1 X34.65 Y124.762 E.04022
G1 X34.65 Y119.562 E.17248
G1 X35.508 Y118.705 E.04022
G1 X35.508 Y117.943 E.02527
G1 X34.65 Y117.086 E.04022
G3 X34.685 Y112.559 I46.072 J-1.906 E.15022
G3 X34.829 Y111.708 I4.392 J.302 E.02868
G1 X35.587 Y110.901 E.03674
G3 X35.703 Y110.462 I3.367 J.654 E.01505
G1 X35.382 Y110.142 E.01503
G3 X35.881 Y109.278 I7.892 J3.98 E.03311
G1 X36.112 Y109.47 E.00996
G2 X35.955 Y109.759 I1.419 J.959 E.01092
; WIPE_START
G1 X36.112 Y109.47 E-.12495
G1 X35.881 Y109.278 E-.11408
G1 X35.382 Y110.142 E-.37915
G1 X35.646 Y110.406 E-.14183
; WIPE_END
G1 E-.03999 F1800
G1 X43.279 Y110.379 Z4.6 F30000
G1 X220.045 Y109.759 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X220.038 Y109.741 E.00065
G2 X219.888 Y109.47 I-2.128 J1.001 E.01026
G1 X220.119 Y109.278 E.00996
G3 X220.618 Y110.142 I-7.397 J4.846 E.03312
G1 X220.303 Y110.457 E.01477
G3 X220.414 Y110.951 I-2.141 J.742 E.01684
G1 X221.171 Y111.708 E.03551
G3 X221.35 Y113.273 I-7.81 J1.683 E.05235
G1 X221.35 Y117.086 E.12647
G1 X220.492 Y117.943 E.04022
G1 X220.492 Y118.705 E.02527
G1 X221.35 Y119.562 E.04022
G1 X221.35 Y124.762 E.17248
G1 X220.492 Y125.619 E.04022
G1 X220.492 Y126.381 E.02527
G1 X221.35 Y127.238 E.04022
G1 X221.35 Y132.438 E.17248
G1 X220.492 Y133.295 E.04022
G1 X220.492 Y134.057 E.02527
G1 X221.35 Y134.914 E.04022
G3 X221.315 Y139.441 I-46.072 J1.906 E.15022
G3 X221.171 Y140.292 I-4.392 J-.302 E.02868
G1 X220.413 Y141.098 E.03671
G3 X220.301 Y141.542 I-3.779 J-.713 E.01519
G1 X220.618 Y141.858 E.01483
G3 X220.119 Y142.722 I-7.896 J-3.982 E.03312
G1 X219.891 Y142.532 E.00984
G2 X220.04 Y142.236 I-1.153 J-.765 E.01104
G1 X217.989 Y144.747 F30000
G1 F15476.087
G3 X216.517 Y145.434 I-3.77 J-6.156 E.05398
G1 X216.017 Y144.933 E.02349
G2 X216.593 Y144.87 I-.103 J-3.633 E.01926
G1 X215.842 Y145.621 E.03523
G3 X214.277 Y145.8 I-1.683 J-7.809 E.05235
G1 X209.207 Y145.8 E.16816
G1 X208.35 Y144.942 E.04022
G1 X208.845 Y144.942 E.01642
G1 X207.988 Y145.8 E.04022
G1 X201.531 Y145.8 E.21417
G1 X200.674 Y144.942 E.04022
G1 X201.169 Y144.942 E.01642
G1 X200.312 Y145.8 E.04022
G1 X193.855 Y145.8 E.21417
G1 X192.998 Y144.942 E.04022
G1 X193.493 Y144.942 E.01642
G1 X192.636 Y145.8 E.04022
G1 X186.179 Y145.8 E.21417
G1 X185.322 Y144.942 E.04022
G1 X185.817 Y144.942 E.01642
G1 X184.96 Y145.8 E.04022
G1 X178.503 Y145.8 E.21417
G1 X177.646 Y144.942 E.04022
G1 X178.141 Y144.942 E.01642
G1 X177.284 Y145.8 E.04022
G1 X170.828 Y145.8 E.21417
G1 X169.97 Y144.942 E.04022
G1 X170.465 Y144.942 E.01642
G1 X169.608 Y145.8 E.04022
G1 X163.152 Y145.8 E.21417
G1 X162.294 Y144.942 E.04022
G1 X162.789 Y144.942 E.01642
G1 X161.932 Y145.8 E.04022
G1 X155.476 Y145.8 E.21417
G1 X154.618 Y144.942 E.04022
G1 X155.113 Y144.942 E.01642
G1 X154.256 Y145.8 E.04022
G1 X147.8 Y145.8 E.21417
G1 X146.942 Y144.942 E.04022
G1 X147.437 Y144.942 E.01642
G1 X146.58 Y145.8 E.04022
G1 X140.124 Y145.8 E.21417
G1 X139.266 Y144.942 E.04022
G1 X139.761 Y144.942 E.01642
G1 X138.904 Y145.8 E.04022
G1 X132.448 Y145.8 E.21417
G1 X131.59 Y144.942 E.04022
G1 X132.085 Y144.942 E.01642
G1 X131.228 Y145.8 E.04022
G1 X124.772 Y145.8 E.21417
G1 X123.915 Y144.942 E.04022
G1 X124.41 Y144.942 E.01642
G1 X123.552 Y145.8 E.04022
G1 X117.096 Y145.8 E.21417
G1 X116.239 Y144.942 E.04022
G1 X116.734 Y144.942 E.01642
G1 X115.876 Y145.8 E.04022
G1 X109.42 Y145.8 E.21417
G1 X108.563 Y144.942 E.04022
G1 X109.058 Y144.942 E.01642
G1 X108.2 Y145.8 E.04022
G1 X101.744 Y145.8 E.21417
G1 X100.887 Y144.942 E.04022
G1 X101.382 Y144.942 E.01642
G1 X100.524 Y145.8 E.04022
G1 X94.068 Y145.8 E.21417
G1 X93.211 Y144.942 E.04022
G1 X93.706 Y144.942 E.01642
G1 X92.848 Y145.8 E.04022
G1 X86.392 Y145.8 E.21417
G1 X85.535 Y144.942 E.04022
G1 X86.03 Y144.942 E.01642
G1 X85.172 Y145.8 E.04022
G1 X78.716 Y145.8 E.21417
G1 X77.859 Y144.942 E.04022
G1 X78.354 Y144.942 E.01642
G1 X77.496 Y145.8 E.04022
G1 X71.04 Y145.8 E.21417
G1 X70.183 Y144.942 E.04022
G1 X70.678 Y144.942 E.01642
G1 X69.821 Y145.8 E.04022
G1 X63.364 Y145.8 E.21417
G1 X62.507 Y144.942 E.04022
G1 X63.002 Y144.942 E.01642
G1 X62.145 Y145.8 E.04022
G1 X55.688 Y145.8 E.21417
G1 X54.831 Y144.942 E.04022
G1 X55.326 Y144.942 E.01642
G1 X54.469 Y145.8 E.04022
G1 X48.012 Y145.8 E.21417
G1 X47.155 Y144.942 E.04022
G1 X47.65 Y144.942 E.01642
G1 X46.793 Y145.8 E.04022
G1 X41.723 Y145.8 E.16816
G3 X40.158 Y145.621 I.117 J-7.987 E.05235
G1 X39.407 Y144.87 E.03523
G2 X39.983 Y144.933 I.68 J-3.569 E.01926
G1 X39.483 Y145.434 E.02349
G3 X38.011 Y144.747 I2.297 J-6.839 E.05398
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X39.003 Y145.262 E-.4245
G1 X39.483 Y145.434 E-.19378
G1 X39.746 Y145.17 E-.14172
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/35
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.6 I1.215 J-.077 P1  F30000
G1 X37.446 Y108.951 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X37.504 Y108.891 E.00274
G3 X40.175 Y107.809 I2.726 J2.888 E.09785
G1 X215.825 Y107.809 E5.82661
G3 X219.739 Y111.679 I-.053 J3.968 E.20177
G1 X219.741 Y140.275 E.94858
G3 X215.825 Y144.191 I-3.971 J-.054 E.20333
G1 X40.175 Y144.191 E5.82661
G3 X36.259 Y140.275 I.054 J-3.971 E.20333
G1 X36.259 Y111.725 E.94703
G3 X37.154 Y109.268 I3.971 J.054 E.08842
G1 X37.406 Y108.995 E.01232
M204 S250
G1 X37.733 Y109.217 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.772 Y109.177 E.00172
G3 X40.191 Y108.201 I2.457 J2.602 E.08206
G1 X215.809 Y108.201 E5.39622
G3 X219.347 Y111.696 I-.036 J3.575 E.16898
G1 X219.349 Y140.259 E.87766
G3 X215.809 Y143.799 I-3.578 J-.038 E.17041
G1 X40.191 Y143.799 E5.39622
G3 X36.651 Y140.259 I.038 J-3.578 E.17041
G1 X36.651 Y111.741 E.87625
G3 X37.457 Y109.516 I3.578 J.038 E.07412
G1 X37.692 Y109.261 E.01066
; WIPE_START
M204 S10000
G1 X37.772 Y109.177 E-.04403
G1 X37.965 Y109.006 E-.09825
G1 X38.343 Y108.738 E-.17583
G1 X38.52 Y108.635 E-.0778
G1 X38.941 Y108.443 E-.17588
G1 X39.383 Y108.307 E-.1759
G1 X39.415 Y108.3 E-.01231
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.832 Y105.879 E.01817
G1 X215.025 Y105.888 E.0064
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.188 Y107.746 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00033
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.852 Y105.487 E.01713
G1 X215.064 Y105.498 E.00652
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.148 Y107.791 E.02146
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02506
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.72 Y106.565 E-.1541
; WIPE_END
G1 E-.04 F1800
G1 X38.633 Y107.692 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.466376
G1 F12000
G1 X39.44 Y107.469 E.0289
G3 X40.19 Y107.393 I1.222 J8.36 E.02604
G1 X215.81 Y107.393 E6.05997
G3 X217.309 Y107.681 I-.186 J5.018 E.0529
G1 X219.852 Y110.203 F30000
; LINE_WIDTH: 0.468231
G1 F12000
G1 X220.025 Y110.733 E.01933
G3 X220.155 Y111.743 I-6.446 J1.345 E.03532
G1 X220.157 Y140.26 E.98832
G1 X220.093 Y140.931 E.02338
G3 X219.873 Y141.752 I-4.778 J-.837 E.02948
G1 X217.362 Y144.309 F30000
; LINE_WIDTH: 0.466374
G1 F12000
G1 X216.56 Y144.531 E.02869
G3 X215.81 Y144.607 I-1.222 J-8.36 E.02604
G1 X40.19 Y144.607 E6.05994
G3 X38.684 Y144.316 I.184 J-5.009 E.05313
G1 X36.155 Y141.823 F30000
; LINE_WIDTH: 0.466595
G1 F12000
G1 X35.975 Y141.267 E.02017
G3 X35.843 Y140.257 I7.305 J-1.465 E.03518
G1 X35.843 Y111.742 E.98445
G3 X36.127 Y110.265 I5.367 J.265 E.0521
G1 X36.118 Y109.986 F30000
; LINE_WIDTH: 0.50344
G1 F12000
G1 X36.147 Y110.209 E.00844
; LINE_WIDTH: 0.49853
G1 X36.239 Y109.949 E.01021
; LINE_WIDTH: 0.529145
G1 X36.33 Y109.69 E.0109
G1 X36.713 Y109.127 E.02696
G3 X38.101 Y107.909 I4.126 J3.302 E.07354
G1 X38.419 Y107.755 E.01403
; LINE_WIDTH: 0.50843
G1 X38.633 Y107.692 E.00843
G1 X38.405 Y107.651 E.00877
; LINE_WIDTH: 0.529885
G1 X38.244 Y107.502 E.00869
G1 X38.18 Y107.277 E.00928
G2 X35.703 Y109.767 I3.186 J5.647 E.14115
G1 X35.957 Y109.796 E.01017
G1 X36.08 Y109.94 E.0075
G1 X35.706 Y142.235 F30000
; LINE_WIDTH: 0.527569
G1 F12000
G2 X38.208 Y144.74 I5.704 J-3.196 E.14159
G1 X38.236 Y144.486 E.01009
G1 X38.441 Y144.325 E.01029
; LINE_WIDTH: 0.503247
G1 X38.628 Y144.296 E.0071
G1 X38.249 Y144.17 E.01498
; LINE_WIDTH: 0.528867
G1 X37.58 Y143.744 E.0314
G3 X36.359 Y142.349 I3.43 J-4.236 E.07376
G1 X36.203 Y142.02 E.01444
; LINE_WIDTH: 0.502334
G1 X36.155 Y141.823 E.00758
G1 X36.095 Y142.043 E.00853
; LINE_WIDTH: 0.541289
G1 X35.958 Y142.206 E.00864
G1 X35.766 Y142.228 E.00787
; WIPE_START
G1 X35.958 Y142.206 E-.36232
G1 X36.095 Y142.043 E-.39768
; WIPE_END
G1 E-.04 F1800
G1 X43.727 Y142.125 Z4.8 F30000
G1 X218.84 Y144.015 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.528466
G1 F12000
G2 X220.286 Y142.244 I-4.487 J-5.142 E.09087
G1 X220.034 Y142.214 E.01007
G1 X219.876 Y142.014 E.01006
G1 X219.845 Y141.889 E.00511
G1 X219.634 Y142.353 E.0202
G1 X219.294 Y142.87 E.02446
G3 X217.899 Y144.091 I-4.236 J-3.43 E.07371
G1 X217.581 Y144.246 E.01401
; LINE_WIDTH: 0.508609
G1 X217.362 Y144.309 E.00867
G1 X217.594 Y144.355 E.00899
; LINE_WIDTH: 0.533482
G1 X217.75 Y144.5 E.00852
G1 X217.816 Y144.725 E.00938
G2 X218.792 Y144.051 I-3.206 J-5.687 E.04752
; WIPE_START
G1 X218.344 Y144.393 E-.26219
G1 X217.816 Y144.725 E-.28988
G1 X217.75 Y144.5 E-.10897
G1 X217.594 Y144.355 E-.09896
; WIPE_END
G1 E-.04 F1800
G1 X218.187 Y136.746 Z4.8 F30000
G1 X220.29 Y109.759 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.527631
G1 F12000
G2 X217.785 Y107.256 I-5.701 J3.202 E.14161
G1 X217.758 Y107.511 E.01012
G1 X217.557 Y107.67 E.01011
; LINE_WIDTH: 0.503578
G1 X217.366 Y107.702 E.00729
G1 X217.745 Y107.826 E.01498
; LINE_WIDTH: 0.529034
G1 X218.42 Y108.256 E.0317
G3 X219.641 Y109.65 I-3.43 J4.236 E.07378
G1 X219.798 Y109.98 E.01445
; LINE_WIDTH: 0.501814
G1 X219.852 Y110.203 E.00857
G1 X219.897 Y109.955 E.0094
; LINE_WIDTH: 0.541788
G1 X220.039 Y109.788 E.0089
G1 X220.231 Y109.766 E.00784
G1 X216.986 Y107.141 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X217.312 Y107.232 I-.187 J1.297 E.01125
G3 X217.393 Y106.925 I.194 J-.113 E.0117
G2 X216.517 Y106.566 I-2.259 J4.264 E.03144
G1 X216.091 Y106.993 E.02001
G1 X216.205 Y106.999 E.00381
G3 X216.501 Y107.037 I-.347 J3.838 E.00989
G1 X215.842 Y106.379 E.0309
G2 X214.277 Y106.2 I-1.94 J10.066 E.05231
G1 X209.207 Y106.2 E.16816
G1 X208.43 Y106.978 E.03649
G1 X208.766 Y106.978 E.01114
G1 X207.988 Y106.2 E.03649
G1 X201.531 Y106.2 E.21417
G1 X200.754 Y106.978 E.03649
G1 X201.09 Y106.978 E.01114
G1 X200.312 Y106.2 E.03649
G1 X193.855 Y106.2 E.21417
G1 X193.078 Y106.978 E.03649
G1 X193.414 Y106.978 E.01114
G1 X192.636 Y106.2 E.03649
G1 X186.179 Y106.2 E.21417
G1 X185.402 Y106.978 E.03649
G1 X185.738 Y106.978 E.01114
G1 X184.96 Y106.2 E.03649
G1 X178.504 Y106.2 E.21417
G1 X177.726 Y106.978 E.03649
G1 X178.062 Y106.978 E.01114
G1 X177.284 Y106.2 E.03649
G1 X170.828 Y106.2 E.21417
G1 X170.05 Y106.978 E.03649
G1 X170.386 Y106.978 E.01114
G1 X169.608 Y106.2 E.03649
G1 X163.152 Y106.2 E.21417
G1 X162.374 Y106.978 E.03649
G1 X162.71 Y106.978 E.01114
G1 X161.932 Y106.2 E.03649
G1 X155.476 Y106.2 E.21417
G1 X154.698 Y106.978 E.03649
G1 X155.034 Y106.978 E.01114
G1 X154.256 Y106.2 E.03649
G1 X147.8 Y106.2 E.21417
G1 X147.022 Y106.978 E.03649
G1 X147.358 Y106.978 E.01114
G1 X146.58 Y106.2 E.03649
G1 X140.124 Y106.2 E.21417
G1 X139.346 Y106.978 E.03649
G1 X139.682 Y106.978 E.01114
G1 X138.904 Y106.2 E.03649
G1 X132.448 Y106.2 E.21417
G1 X131.67 Y106.978 E.03649
G1 X132.006 Y106.978 E.01114
G1 X131.228 Y106.2 E.03649
G1 X124.772 Y106.2 E.21417
G1 X123.994 Y106.978 E.03649
G1 X124.33 Y106.978 E.01114
G1 X123.552 Y106.2 E.03649
G1 X117.096 Y106.2 E.21417
G1 X116.318 Y106.978 E.03649
G1 X116.654 Y106.978 E.01114
G1 X115.876 Y106.2 E.03649
G1 X109.42 Y106.2 E.21417
G1 X108.642 Y106.978 E.03649
G1 X108.978 Y106.978 E.01114
G1 X108.2 Y106.2 E.03649
G1 X101.744 Y106.2 E.21417
G1 X100.966 Y106.978 E.03649
G1 X101.302 Y106.978 E.01114
G1 X100.524 Y106.2 E.03649
G1 X94.068 Y106.2 E.21417
G1 X93.29 Y106.978 E.03649
G1 X93.626 Y106.978 E.01114
G1 X92.848 Y106.2 E.03649
G1 X86.392 Y106.2 E.21417
G1 X85.614 Y106.978 E.03649
G1 X85.95 Y106.978 E.01114
G1 X85.172 Y106.2 E.03649
G1 X78.716 Y106.2 E.21417
G1 X77.938 Y106.978 E.03649
G1 X78.274 Y106.978 E.01114
G1 X77.496 Y106.2 E.03649
G1 X71.04 Y106.2 E.21417
G1 X70.262 Y106.978 E.03649
G1 X70.598 Y106.978 E.01114
G1 X69.821 Y106.2 E.03649
G1 X63.364 Y106.2 E.21417
G1 X62.586 Y106.978 E.03649
G1 X62.922 Y106.978 E.01114
G1 X62.145 Y106.2 E.03649
G1 X55.688 Y106.2 E.21417
G1 X54.91 Y106.978 E.03649
G1 X55.246 Y106.978 E.01114
G1 X54.469 Y106.2 E.03649
G1 X48.012 Y106.2 E.21417
G1 X47.234 Y106.978 E.03649
G1 X47.57 Y106.978 E.01114
G1 X46.793 Y106.2 E.03649
G1 X41.723 Y106.2 E.16816
G2 X40.158 Y106.379 I.117 J7.987 E.05235
G1 X39.499 Y107.037 E.0309
G3 X39.909 Y106.993 I.512 J2.802 E.0137
G1 X39.483 Y106.566 E.02001
G2 X38.604 Y106.927 I1.39 J4.642 E.03155
G3 X38.682 Y107.237 I-.116 J.194 E.01178
G1 X39.004 Y107.151 E.01104
; WIPE_START
G1 X38.682 Y107.237 E-.12641
G1 X38.714 Y107.105 E-.05143
G1 X38.604 Y106.927 E-.0796
M73 P88 R4
G1 X39.483 Y106.566 E-.36089
G1 X39.746 Y106.83 E-.14167
; WIPE_END
G1 E-.04 F1800
G1 X35.428 Y112.667 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G3 X35.494 Y111.043 I7.929 J-.492 E.05402
G1 X34.829 Y111.708 E.0312
G2 X34.65 Y113.273 I7.81 J1.683 E.05235
G1 X34.65 Y117.086 E.12647
G1 X35.428 Y117.864 E.03649
G1 X35.428 Y118.784 E.03055
G1 X34.65 Y119.562 E.03649
G1 X34.65 Y124.762 E.17248
G1 X35.428 Y125.54 E.03649
G1 X35.428 Y126.46 E.03055
G1 X34.65 Y127.238 E.03649
G1 X34.65 Y132.438 E.17248
G1 X35.428 Y133.216 E.03649
G1 X35.428 Y134.136 E.03055
G1 X34.65 Y134.914 E.03649
G2 X34.685 Y139.441 I46.073 J1.906 E.15022
G2 X34.829 Y140.292 I4.392 J-.302 E.02868
G1 X35.494 Y140.957 E.0312
G3 X35.428 Y139.333 I7.865 J-1.132 E.05402
; WIPE_START
G1 X35.494 Y140.957 E-.61779
G1 X35.229 Y140.693 E-.14222
; WIPE_END
G1 E-.04 F1800
G1 X39.003 Y144.856 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G3 X38.682 Y144.765 I.185 J-1.264 E.01111
G3 X38.604 Y145.073 I-.193 J.115 E.01171
G2 X39.483 Y145.434 I2.269 J-4.282 E.03157
G1 X39.909 Y145.007 E.02001
G1 X39.795 Y145.001 E.00381
G3 X39.499 Y144.963 I.347 J-3.838 E.00989
G1 X40.158 Y145.621 E.0309
G2 X41.723 Y145.8 I1.683 J-7.809 E.05235
G1 X46.793 Y145.8 E.16816
G1 X47.57 Y145.022 E.03649
G1 X47.234 Y145.022 E.01114
G1 X48.012 Y145.8 E.03649
G1 X54.469 Y145.8 E.21417
G1 X55.246 Y145.022 E.03649
G1 X54.91 Y145.022 E.01114
G1 X55.688 Y145.8 E.03649
G1 X62.145 Y145.8 E.21417
G1 X62.922 Y145.022 E.03649
G1 X62.586 Y145.022 E.01114
G1 X63.364 Y145.8 E.03649
G1 X69.821 Y145.8 E.21417
G1 X70.598 Y145.022 E.03649
G1 X70.262 Y145.022 E.01114
G1 X71.04 Y145.8 E.03649
G1 X77.496 Y145.8 E.21417
G1 X78.274 Y145.022 E.03649
G1 X77.938 Y145.022 E.01114
G1 X78.716 Y145.8 E.03649
G1 X85.172 Y145.8 E.21417
G1 X85.95 Y145.022 E.03649
G1 X85.614 Y145.022 E.01114
G1 X86.392 Y145.8 E.03649
G1 X92.848 Y145.8 E.21417
G1 X93.626 Y145.022 E.03649
G1 X93.29 Y145.022 E.01114
G1 X94.068 Y145.8 E.03649
G1 X100.524 Y145.8 E.21417
G1 X101.302 Y145.022 E.03649
G1 X100.966 Y145.022 E.01114
G1 X101.744 Y145.8 E.03649
G1 X108.2 Y145.8 E.21417
G1 X108.978 Y145.022 E.03649
G1 X108.642 Y145.022 E.01114
G1 X109.42 Y145.8 E.03649
G1 X115.876 Y145.8 E.21417
G1 X116.654 Y145.022 E.03649
G1 X116.318 Y145.022 E.01114
G1 X117.096 Y145.8 E.03649
G1 X123.552 Y145.8 E.21417
G1 X124.33 Y145.022 E.03649
G1 X123.994 Y145.022 E.01114
G1 X124.772 Y145.8 E.03649
G1 X131.228 Y145.8 E.21417
G1 X132.006 Y145.022 E.03649
G1 X131.67 Y145.022 E.01114
G1 X132.448 Y145.8 E.03649
G1 X138.904 Y145.8 E.21417
G1 X139.682 Y145.022 E.03649
G1 X139.346 Y145.022 E.01114
G1 X140.124 Y145.8 E.03649
G1 X146.58 Y145.8 E.21417
G1 X147.358 Y145.022 E.03649
G1 X147.022 Y145.022 E.01114
G1 X147.8 Y145.8 E.03649
G1 X154.256 Y145.8 E.21417
G1 X155.034 Y145.022 E.03649
G1 X154.698 Y145.022 E.01114
G1 X155.476 Y145.8 E.03649
G1 X161.932 Y145.8 E.21417
G1 X162.71 Y145.022 E.03649
G1 X162.374 Y145.022 E.01114
G1 X163.152 Y145.8 E.03649
G1 X169.608 Y145.8 E.21417
G1 X170.386 Y145.022 E.03649
G1 X170.05 Y145.022 E.01114
G1 X170.828 Y145.8 E.03649
G1 X177.284 Y145.8 E.21417
G1 X178.062 Y145.022 E.03649
G1 X177.726 Y145.022 E.01114
G1 X178.503 Y145.8 E.03649
G1 X184.96 Y145.8 E.21417
G1 X185.738 Y145.022 E.03649
G1 X185.402 Y145.022 E.01114
G1 X186.179 Y145.8 E.03649
G1 X192.636 Y145.8 E.21417
G1 X193.414 Y145.022 E.03649
G1 X193.078 Y145.022 E.01114
G1 X193.855 Y145.8 E.03649
G1 X200.312 Y145.8 E.21417
G1 X201.09 Y145.022 E.03649
G1 X200.754 Y145.022 E.01114
G1 X201.531 Y145.8 E.03649
G1 X207.988 Y145.8 E.21417
G1 X208.766 Y145.022 E.03649
G1 X208.43 Y145.022 E.01114
G1 X209.207 Y145.8 E.03649
G1 X214.277 Y145.8 E.16816
G2 X215.842 Y145.621 I-.118 J-7.988 E.05235
G1 X216.501 Y144.963 E.0309
G3 X216.091 Y145.007 I-.512 J-2.802 E.0137
G1 X216.517 Y145.434 E.02001
G1 X216.832 Y145.321 E.01108
G2 X217.393 Y145.075 I-.971 J-2.972 E.02035
G3 X217.312 Y144.765 I.115 J-.195 E.01181
G1 X216.987 Y144.852 E.01115
G1 X221.122 Y140.49 F30000
G1 F15476.087
G3 X220.623 Y141.846 I-6.884 J-1.759 E.04803
G3 X220.367 Y141.607 I.374 J-.659 E.01174
G2 X220.513 Y140.951 I-3.035 J-1.018 E.02234
G1 X221.171 Y140.292 E.0309
G2 X221.35 Y138.727 I-7.81 J-1.683 E.05235
G1 X221.35 Y134.914 E.12647
G1 X220.572 Y134.136 E.03649
G1 X220.572 Y133.216 E.03055
G1 X221.35 Y132.438 E.03649
G1 X221.35 Y127.238 E.17248
G1 X220.572 Y126.46 E.03649
G1 X220.572 Y125.54 E.03055
G1 X221.35 Y124.762 E.03649
G1 X221.35 Y119.562 E.17248
G1 X220.572 Y118.784 E.03649
G1 X220.572 Y117.864 E.03055
G1 X221.35 Y117.086 E.03649
G2 X221.315 Y112.559 I-46.073 J-1.906 E.15022
G2 X221.171 Y111.708 I-4.392 J.302 E.02868
G1 X220.506 Y111.043 E.0312
G2 X220.368 Y110.392 I-3.099 J.318 E.02212
G3 X220.623 Y110.154 I.629 J.419 E.01169
G3 X221.122 Y111.51 I-6.382 J3.115 E.04803
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X220.623 Y110.154 E-.54924
G1 X220.368 Y110.392 E-.13269
G1 X220.41 Y110.593 E-.07807
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/35
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.8 I.012 J-1.217 P1  F30000
G1 X37.385 Y108.82 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X37.724 Y108.523 E.01495
G3 X40.184 Y107.689 I2.46 J3.211 E.08771
G1 X215.816 Y107.689 E5.82606
G3 X219.861 Y111.734 I-.001 J4.046 E.21075
G1 X219.861 Y140.266 E.94648
G3 X215.816 Y144.311 I-4.046 J-.001 E.21075
G1 X40.184 Y144.311 E5.82606
G3 X36.139 Y140.266 I.001 J-4.046 E.21075
G1 X36.139 Y111.734 E.94648
G3 X37.324 Y108.874 I4.046 J.001 E.10538
G1 X37.34 Y108.86 E.00071
M204 S250
G1 X37.644 Y109.115 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.963 Y108.835 E.01306
G3 X40.194 Y108.081 I2.223 J2.902 E.07368
G1 X215.806 Y108.081 E5.39605
G3 X219.469 Y111.744 I.008 J3.656 E.17692
G1 X219.469 Y140.256 E.87607
G3 X215.806 Y143.919 I-3.656 J.008 E.17692
G1 X40.194 Y143.919 E5.39605
G3 X36.531 Y140.256 I-.008 J-3.656 E.17692
G1 X36.531 Y111.744 E.87607
G3 X37.599 Y109.155 I3.656 J-.008 E.08833
; WIPE_START
M204 S10000
G1 X37.963 Y108.835 E-.18432
G1 X38.363 Y108.568 E-.18262
G1 X38.794 Y108.355 E-.18267
G1 X39.249 Y108.201 E-.18264
G1 X39.321 Y108.186 E-.02776
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.859 Y105.88 E.01904
G1 X215.025 Y105.888 E.00553
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.422 J-.009 E.38612
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.188 Y107.747 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00034
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.878 Y105.489 E.01794
G1 X215.064 Y105.498 E.00571
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.814 J-.019 E.37599
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.148 Y107.791 E.02144
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02525
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29052
G1 X37.72 Y106.565 E-.1539
; WIPE_END
G1 E-.04 F1800
G1 X39.039 Y107.454 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.417747
G1 F12000
G3 X40.181 Y107.298 I1.497 J6.679 E.03525
G1 X215.822 Y107.298 E5.36472
G3 X216.909 Y107.444 I-.06 J4.574 E.03359
G1 X220.444 Y109.974 F30000
; LINE_WIDTH: 0.488975
G1 F12000
G1 X220.107 Y109.383 E.02475
; LINE_WIDTH: 0.457432
G2 X217.738 Y107.213 I-5.295 J3.403 E.10973
; LINE_WIDTH: 0.491392
G1 X217.437 Y107.051 E.01246
G1 X217.295 Y107.335 E.0116
; LINE_WIDTH: 0.47685
G1 X217.186 Y107.394 E.00438
; LINE_WIDTH: 0.44383
G1 X217.077 Y107.454 E.00405
; LINE_WIDTH: 0.41381
G1 X216.968 Y107.457 E.00332
; LINE_WIDTH: 0.423565
G1 X217.214 Y107.516 E.00786
; LINE_WIDTH: 0.472339
G1 X217.461 Y107.575 E.00887
G3 X218.49 Y108.176 I-1.803 J4.271 E.04183
; LINE_WIDTH: 0.449399
G3 X219.674 Y109.497 I-3.371 J4.212 E.05904
; LINE_WIDTH: 0.479615
G1 X219.949 Y110.016 E.02087
; LINE_WIDTH: 0.471945
G1 X220.023 Y110.301 E.01031
; LINE_WIDTH: 0.429446
G1 X220.097 Y110.586 E.00929
G1 X220.13 Y110.369 E.00694
; LINE_WIDTH: 0.497554
G1 X220.218 Y110.249 E.0055
M73 P88 R3
G1 X220.505 Y110.104 E.01194
G1 X220.47 Y110.028 E.0031
G1 X220.097 Y110.586 F30000
; LINE_WIDTH: 0.416878
G1 F12000
G3 X220.252 Y111.73 I-7.021 J1.537 E.03521
G1 X220.252 Y140.272 E.86975
G3 X220.108 Y141.353 I-4.56 J-.058 E.03331
; WIPE_START
G1 X220.213 Y140.813 E-.209
G1 X220.252 Y140.272 E-.20609
G1 X220.252 Y139.364 E-.34491
; WIPE_END
G1 E-.04 F1800
G1 X216.963 Y144.545 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.41778
G1 F12000
G3 X215.819 Y144.702 I-1.202 J-4.512 E.03535
G1 X40.178 Y144.702 E5.3652
G3 X39.091 Y144.556 I.06 J-4.575 E.03359
; WIPE_START
G1 X39.637 Y144.663 E-.21153
G1 X40.178 Y144.702 E-.20609
G1 X41.079 Y144.702 E-.34238
; WIPE_END
G1 E-.04 F1800
G1 X35.904 Y141.415 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.417083
G1 F12000
G3 X35.748 Y140.27 I7.017 J-1.538 E.03528
G1 X35.748 Y111.728 E.87023
G3 X35.889 Y110.645 I6.424 J.289 E.03335
G1 X35.901 Y110.478 F30000
; LINE_WIDTH: 0.416815
G1 F12000
G1 X35.903 Y110.586 E.0033
; LINE_WIDTH: 0.426375
G1 X35.964 Y110.338 E.008
; LINE_WIDTH: 0.472519
G1 X36.025 Y110.089 E.00896
G3 X36.626 Y109.06 I4.272 J1.803 E.04185
; LINE_WIDTH: 0.449406
G3 X37.947 Y107.876 I4.212 J3.371 E.05904
; LINE_WIDTH: 0.467378
G1 X38.466 Y107.601 E.02029
G1 X38.98 Y107.46 E.01845
G1 X38.825 Y107.424 E.00551
; LINE_WIDTH: 0.491566
G1 X38.7 Y107.335 E.00558
G1 X38.554 Y107.045 E.0119
G1 X37.833 Y107.443 E.03013
; LINE_WIDTH: 0.45744
G2 X35.663 Y109.812 I3.403 J5.295 E.10973
; LINE_WIDTH: 0.49139
G1 X35.501 Y110.113 E.01247
G1 X35.78 Y110.253 E.01142
; LINE_WIDTH: 0.477433
G1 X35.827 Y110.339 E.00346
; LINE_WIDTH: 0.445538
G1 X35.873 Y110.425 E.00321
G1 X35.893 Y142.617 F30000
; LINE_WIDTH: 0.457436
G1 F12000
G2 X38.262 Y144.787 I5.295 J-3.403 E.10974
; LINE_WIDTH: 0.491397
G1 X38.563 Y144.949 E.01246
G1 X38.705 Y144.665 E.0116
; LINE_WIDTH: 0.47686
G1 X38.814 Y144.606 E.00438
; LINE_WIDTH: 0.44384
G1 X38.923 Y144.546 E.00404
; LINE_WIDTH: 0.413815
G1 X39.032 Y144.543 E.00332
; LINE_WIDTH: 0.423568
G1 X38.786 Y144.484 E.00786
; LINE_WIDTH: 0.472349
G1 X38.539 Y144.425 E.00887
G3 X37.51 Y143.824 I1.803 J-4.271 E.04183
; LINE_WIDTH: 0.449412
G3 X36.326 Y142.503 I3.371 J-4.212 E.05904
; LINE_WIDTH: 0.479635
G1 X36.051 Y141.984 E.02087
; LINE_WIDTH: 0.472033
G1 X35.977 Y141.7 E.01028
; LINE_WIDTH: 0.429544
G1 X35.904 Y141.415 E.00926
G1 X35.87 Y141.631 E.00689
; LINE_WIDTH: 0.491854
G1 X35.782 Y141.751 E.00543
G1 X35.495 Y141.896 E.01179
G1 X35.864 Y142.565 E.02795
; WIPE_START
G1 X35.495 Y141.896 E-.47026
G1 X35.782 Y141.751 E-.19833
G1 X35.87 Y141.631 E-.09141
; WIPE_END
G1 E-.04 F1800
G1 X43.502 Y141.754 Z5 F30000
G1 X216.963 Y144.545 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.415495
G1 F12000
G1 X217.069 Y144.561 E.00325
; LINE_WIDTH: 0.444565
G1 X217.175 Y144.576 E.00351
; LINE_WIDTH: 0.491543
G1 X217.3 Y144.665 E.00558
G1 X217.446 Y144.955 E.0119
G1 X218.167 Y144.557 E.03012
; LINE_WIDTH: 0.457427
G2 X220.337 Y142.188 I-3.403 J-5.295 E.10974
; LINE_WIDTH: 0.491392
G1 X220.499 Y141.887 E.01246
G1 X220.217 Y141.745 E.01154
; LINE_WIDTH: 0.476283
G1 X220.157 Y141.628 E.00464
; LINE_WIDTH: 0.437596
G3 X220.091 Y141.465 I.198 J-.175 E.00579
; LINE_WIDTH: 0.44102
G1 X220.024 Y141.71 E.00826
; LINE_WIDTH: 0.459199
G1 X219.958 Y141.956 E.00864
G3 X218.053 Y144.124 I-4.561 J-2.086 E.0993
; LINE_WIDTH: 0.479605
G1 X217.534 Y144.399 E.02088
; LINE_WIDTH: 0.471175
G1 X217.278 Y144.465 E.00924
; LINE_WIDTH: 0.424365
G1 X217.021 Y144.53 E.00823
G1 X216.624 Y145.013 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X216.956 Y144.946 I-.451 J-3.093 E.01122
G1 X217.092 Y145.217 E.01008
G3 X216.517 Y145.434 I-2.173 J-4.895 E.02039
G1 X216.149 Y145.065 E.01728
G1 X216.423 Y145.04 E.00912
G1 X215.842 Y145.621 E.02725
G3 X214.277 Y145.8 I-1.683 J-7.81 E.05235
G1 X209.207 Y145.8 E.16816
G1 X208.501 Y145.093 E.03313
G1 X208.694 Y145.093 E.0064
G1 X207.988 Y145.8 E.03313
G1 X201.531 Y145.8 E.21417
G1 X200.825 Y145.093 E.03313
G1 X201.018 Y145.093 E.0064
G1 X200.312 Y145.8 E.03313
G1 X193.855 Y145.8 E.21417
G1 X193.149 Y145.093 E.03313
G1 X193.342 Y145.093 E.0064
G1 X192.636 Y145.8 E.03313
G1 X186.179 Y145.8 E.21417
G1 X185.473 Y145.093 E.03313
G1 X185.666 Y145.093 E.0064
G1 X184.96 Y145.8 E.03313
G1 X178.503 Y145.8 E.21417
G1 X177.797 Y145.093 E.03313
G1 X177.99 Y145.093 E.0064
G1 X177.284 Y145.8 E.03313
G1 X170.828 Y145.8 E.21417
G1 X170.121 Y145.093 E.03313
G1 X170.314 Y145.093 E.0064
G1 X169.608 Y145.8 E.03313
G1 X163.152 Y145.8 E.21417
G1 X162.445 Y145.093 E.03313
G1 X162.638 Y145.093 E.0064
G1 X161.932 Y145.8 E.03313
G1 X155.476 Y145.8 E.21417
G1 X154.769 Y145.093 E.03313
G1 X154.962 Y145.093 E.0064
G1 X154.256 Y145.8 E.03313
G1 X147.8 Y145.8 E.21417
G1 X147.093 Y145.093 E.03313
G1 X147.286 Y145.093 E.0064
G1 X146.58 Y145.8 E.03313
G1 X140.124 Y145.8 E.21417
G1 X139.418 Y145.093 E.03313
G1 X139.61 Y145.093 E.0064
G1 X138.904 Y145.8 E.03313
G1 X132.448 Y145.8 E.21417
G1 X131.742 Y145.093 E.03313
G1 X131.934 Y145.093 E.0064
G1 X131.228 Y145.8 E.03313
G1 X124.772 Y145.8 E.21417
G1 X124.066 Y145.093 E.03313
G1 X124.258 Y145.093 E.0064
G1 X123.552 Y145.8 E.03313
G1 X117.096 Y145.8 E.21417
G1 X116.39 Y145.093 E.03313
G1 X116.582 Y145.093 E.0064
G1 X115.876 Y145.8 E.03313
G1 X109.42 Y145.8 E.21417
G1 X108.714 Y145.093 E.03313
G1 X108.907 Y145.093 E.0064
G1 X108.2 Y145.8 E.03313
G1 X101.744 Y145.8 E.21417
G1 X101.038 Y145.093 E.03313
G1 X101.231 Y145.093 E.0064
G1 X100.524 Y145.8 E.03313
G1 X94.068 Y145.8 E.21417
G1 X93.362 Y145.093 E.03313
G1 X93.555 Y145.093 E.0064
G1 X92.848 Y145.8 E.03313
G1 X86.392 Y145.8 E.21417
G1 X85.686 Y145.093 E.03313
G1 X85.879 Y145.093 E.0064
G1 X85.172 Y145.8 E.03313
G1 X78.716 Y145.8 E.21417
G1 X78.01 Y145.093 E.03313
G1 X78.203 Y145.093 E.0064
G1 X77.496 Y145.8 E.03313
G1 X71.04 Y145.8 E.21417
G1 X70.334 Y145.093 E.03313
G1 X70.527 Y145.093 E.0064
G1 X69.821 Y145.8 E.03313
G1 X63.364 Y145.8 E.21417
G1 X62.658 Y145.093 E.03313
G1 X62.851 Y145.093 E.0064
G1 X62.145 Y145.8 E.03313
G1 X55.688 Y145.8 E.21417
G1 X54.982 Y145.093 E.03313
G1 X55.175 Y145.093 E.0064
G1 X54.469 Y145.8 E.03313
G1 X48.012 Y145.8 E.21417
G1 X47.306 Y145.093 E.03313
G1 X47.499 Y145.093 E.0064
G1 X46.793 Y145.8 E.03313
G1 X41.723 Y145.8 E.16816
G3 X40.158 Y145.621 I.117 J-7.987 E.05235
G1 X39.577 Y145.04 E.02725
G1 X39.851 Y145.065 E.00912
G1 X39.483 Y145.434 E.01728
G3 X38.908 Y145.217 I.812 J-3.027 E.02041
G1 X39.048 Y144.938 E.01036
G1 X39.376 Y145.011 E.01114
; WIPE_START
G1 X39.048 Y144.938 E-.12766
G1 X38.908 Y145.217 E-.11867
G1 X39.483 Y145.434 E-.23346
G1 X39.851 Y145.065 E-.19792
G1 X39.635 Y145.046 E-.0823
; WIPE_END
G1 E-.04 F1800
G1 X35.357 Y139.247 Z5 F30000
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X35.409 Y140.872 I9.379 J.511 E.05402
G1 X34.829 Y140.292 E.02722
G3 X34.65 Y138.727 I7.811 J-1.683 E.05235
G1 X34.65 Y134.914 E.12647
G1 X35.357 Y134.208 E.03313
G1 X35.357 Y133.144 E.03529
G1 X34.65 Y132.438 E.03313
G1 X34.65 Y127.238 E.17248
G1 X35.357 Y126.532 E.03313
G1 X35.357 Y125.468 E.03529
G1 X34.65 Y124.762 E.03313
G1 X34.65 Y119.562 E.17248
G1 X35.357 Y118.856 E.03313
G1 X35.357 Y117.792 E.03529
G1 X34.65 Y117.086 E.03313
G3 X34.685 Y112.559 I46.073 J-1.906 E.15022
G3 X34.829 Y111.708 I4.392 J.302 E.02868
G1 X35.409 Y111.128 E.02722
G1 X35.395 Y111.208 E.00272
G2 X35.357 Y112.753 I12.312 J1.077 E.0513
; WIPE_START
G1 X35.395 Y111.208 E-.58723
G1 X35.409 Y111.128 E-.03116
G1 X35.145 Y111.391 E-.14161
; WIPE_END
G1 E-.04 F1800
G1 X39.376 Y106.987 Z5 F30000
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X39.044 Y107.054 I.458 J3.126 E.01122
G1 X38.908 Y106.783 E.01008
G3 X39.483 Y106.566 I1.387 J2.809 E.02041
G1 X39.851 Y106.935 E.01728
G1 X39.577 Y106.96 E.00912
G1 X40.158 Y106.379 E.02725
G3 X41.723 Y106.2 I1.683 J7.809 E.05235
G1 X46.793 Y106.2 E.16816
G1 X47.499 Y106.907 E.03313
G1 X47.306 Y106.907 E.0064
G1 X48.012 Y106.2 E.03313
G1 X54.469 Y106.2 E.21417
G1 X55.175 Y106.907 E.03313
G1 X54.982 Y106.907 E.0064
G1 X55.688 Y106.2 E.03313
G1 X62.145 Y106.2 E.21417
G1 X62.851 Y106.907 E.03313
G1 X62.658 Y106.907 E.0064
G1 X63.364 Y106.2 E.03313
G1 X69.821 Y106.2 E.21417
G1 X70.527 Y106.907 E.03313
G1 X70.334 Y106.907 E.0064
G1 X71.04 Y106.2 E.03313
G1 X77.496 Y106.2 E.21417
G1 X78.203 Y106.907 E.03313
G1 X78.01 Y106.907 E.0064
G1 X78.716 Y106.2 E.03313
G1 X85.172 Y106.2 E.21417
G1 X85.879 Y106.907 E.03313
G1 X85.686 Y106.907 E.0064
G1 X86.392 Y106.2 E.03313
G1 X92.848 Y106.2 E.21417
G1 X93.555 Y106.907 E.03313
G1 X93.362 Y106.907 E.0064
G1 X94.068 Y106.2 E.03313
G1 X100.524 Y106.2 E.21417
G1 X101.231 Y106.907 E.03313
G1 X101.038 Y106.907 E.0064
G1 X101.744 Y106.2 E.03313
G1 X108.2 Y106.2 E.21417
G1 X108.907 Y106.907 E.03313
G1 X108.714 Y106.907 E.0064
G1 X109.42 Y106.2 E.03313
G1 X115.876 Y106.2 E.21417
G1 X116.582 Y106.907 E.03313
G1 X116.39 Y106.907 E.0064
G1 X117.096 Y106.2 E.03313
G1 X123.552 Y106.2 E.21417
G1 X124.258 Y106.907 E.03313
G1 X124.066 Y106.907 E.0064
G1 X124.772 Y106.2 E.03313
G1 X131.228 Y106.2 E.21417
G1 X131.934 Y106.907 E.03313
G1 X131.742 Y106.907 E.0064
G1 X132.448 Y106.2 E.03313
G1 X138.904 Y106.2 E.21417
G1 X139.61 Y106.907 E.03313
G1 X139.418 Y106.907 E.0064
G1 X140.124 Y106.2 E.03313
G1 X146.58 Y106.2 E.21417
G1 X147.286 Y106.907 E.03313
G1 X147.093 Y106.907 E.0064
G1 X147.8 Y106.2 E.03313
G1 X154.256 Y106.2 E.21417
G1 X154.962 Y106.907 E.03313
G1 X154.769 Y106.907 E.0064
G1 X155.476 Y106.2 E.03313
G1 X161.932 Y106.2 E.21417
G1 X162.638 Y106.907 E.03313
G1 X162.445 Y106.907 E.0064
G1 X163.152 Y106.2 E.03313
G1 X169.608 Y106.2 E.21417
G1 X170.314 Y106.907 E.03313
G1 X170.121 Y106.907 E.0064
G1 X170.828 Y106.2 E.03313
G1 X177.284 Y106.2 E.21417
G1 X177.99 Y106.907 E.03313
G1 X177.797 Y106.907 E.0064
G1 X178.504 Y106.2 E.03313
G1 X184.96 Y106.2 E.21417
G1 X185.666 Y106.907 E.03313
G1 X185.473 Y106.907 E.0064
G1 X186.179 Y106.2 E.03313
M73 P89 R3
G1 X192.636 Y106.2 E.21417
G1 X193.342 Y106.907 E.03313
G1 X193.149 Y106.907 E.0064
G1 X193.855 Y106.2 E.03313
G1 X200.312 Y106.2 E.21417
G1 X201.018 Y106.907 E.03313
G1 X200.825 Y106.907 E.0064
G1 X201.531 Y106.2 E.03313
G1 X207.988 Y106.2 E.21417
G1 X208.694 Y106.907 E.03313
G1 X208.501 Y106.907 E.0064
G1 X209.207 Y106.2 E.03313
G1 X214.841 Y106.228 E.1869
G3 X215.842 Y106.379 I-.708 J8.103 E.03359
G1 X216.423 Y106.96 E.02725
G1 X216.149 Y106.935 E.00912
G1 X216.517 Y106.566 E.01728
G3 X217.092 Y106.783 I-.813 J3.027 E.02041
G1 X216.952 Y107.062 E.01036
G1 X216.624 Y106.989 E.01115
; WIPE_START
G1 X216.952 Y107.062 E-.12768
G1 X217.092 Y106.783 E-.11867
G1 X216.517 Y106.566 E-.23346
G1 X216.149 Y106.935 E-.19792
G1 X216.365 Y106.954 E-.08228
; WIPE_END
G1 E-.04 F1800
G1 X220.643 Y112.753 Z5 F30000
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X220.591 Y111.128 I-9.379 J-.511 E.05402
G1 X221.171 Y111.708 E.02722
G3 X221.35 Y113.273 I-7.811 J1.683 E.05235
G1 X221.35 Y117.086 E.12647
G1 X220.643 Y117.792 E.03313
G1 X220.643 Y118.856 E.03529
G1 X221.35 Y119.562 E.03313
G1 X221.35 Y124.762 E.17248
G1 X220.643 Y125.468 E.03313
G1 X220.643 Y126.532 E.03529
G1 X221.35 Y127.238 E.03313
G1 X221.35 Y132.438 E.17248
G1 X220.643 Y133.144 E.03313
G1 X220.643 Y134.208 E.03529
G1 X221.35 Y134.914 E.03313
G3 X221.315 Y139.441 I-46.073 J1.906 E.15022
G3 X221.171 Y140.292 I-4.392 J-.302 E.02868
G1 X220.59 Y140.873 E.02725
G2 X220.643 Y139.247 I-9.005 J-1.107 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X220.59 Y140.873 E-.61818
G1 X220.854 Y140.609 E-.14182
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/35
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5 I.208 J-1.199 P1  F30000
G1 X37.243 Y108.83 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X37.345 Y108.722 E.00493
G3 X40.178 Y107.58 I2.876 J3.05 E.10372
G1 X215.822 Y107.58 E5.8264
G3 X219.97 Y111.728 I-.043 J4.192 E.21557
G1 X219.97 Y140.272 E.94683
G3 X215.822 Y144.42 I-4.192 J-.043 E.21557
G1 X40.178 Y144.42 E5.8264
G3 X36.03 Y140.272 I.043 J-4.192 E.21557
G1 X36.03 Y111.728 E.94683
G3 X36.974 Y109.12 I4.192 J.043 E.09378
G1 X37.202 Y108.874 E.01114
M204 S250
G1 X37.529 Y109.096 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.613 Y109.008 E.00375
G3 X40.192 Y107.972 I2.608 J2.763 E.08743
G1 X215.808 Y107.972 E5.39616
G3 X219.578 Y111.742 I-.029 J3.8 E.18161
G1 X219.578 Y140.258 E.87619
G3 X215.808 Y144.028 I-3.8 J-.029 E.18161
G1 X40.192 Y144.028 E5.39616
G3 X36.422 Y140.258 I.029 J-3.8 E.18161
G1 X36.422 Y111.742 E.87619
G3 X37.278 Y109.369 I3.8 J.029 E.07902
G1 X37.489 Y109.14 E.00956
; WIPE_START
M204 S10000
G1 X37.613 Y109.008 E-.06912
G1 X37.818 Y108.826 E-.10402
G1 X38.22 Y108.541 E-.18737
G1 X38.411 Y108.431 E-.08357
G1 X38.859 Y108.226 E-.18743
G1 X39.182 Y108.126 E-.12849
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.885 Y105.882 E.01991
G1 X215.025 Y105.888 E.00466
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.419 J-.006 E.38616
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.187 Y107.747 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00035
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.904 Y105.49 E.01874
G1 X215.064 Y105.498 E.00491
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.812 J-.017 E.37603
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.147 Y107.792 E.02142
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02544
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.719 Y106.565 E-.15372
; WIPE_END
G1 E-.04 F1800
G1 X35.302 Y112.831 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X35.333 Y111.204 I13.939 J-.554 E.05402
G1 X34.829 Y111.708 E.02364
G2 X34.65 Y113.273 I7.81 J1.683 E.05235
G1 X34.65 Y117.086 E.12647
G1 X35.302 Y117.738 E.03058
G1 X35.302 Y118.91 E.03889
G1 X34.65 Y119.562 E.03058
G1 X34.65 Y124.762 E.17248
G1 X35.302 Y125.414 E.03058
G1 X35.302 Y126.586 E.03889
G1 X34.65 Y127.238 E.03058
G1 X34.65 Y132.438 E.17248
G1 X35.302 Y133.09 E.03058
G1 X35.302 Y134.262 E.03889
G1 X34.65 Y134.914 E.03058
G2 X34.685 Y139.441 I46.075 J1.906 E.15022
G2 X34.829 Y140.292 I4.392 J-.302 E.02868
G1 X35.333 Y140.796 E.02364
G3 X35.302 Y139.169 I13.907 J-1.074 E.05402
; WIPE_START
G1 X35.333 Y140.796 E-.61853
G1 X35.069 Y140.533 E-.14147
; WIPE_END
G1 E-.04 F1800
G1 X39.448 Y145.089 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X39.352 Y145.069 E.00328
G1 X39.239 Y145.346 E.00993
G1 X39.483 Y145.434 E.0086
G1 X39.793 Y145.123 E.01458
G1 X39.65 Y145.113 E.00477
G1 X40.158 Y145.621 E.02382
G2 X41.723 Y145.8 I1.683 J-7.809 E.05235
G1 X46.793 Y145.8 E.16816
G1 X47.445 Y145.148 E.03058
G1 X47.36 Y145.148 E.0028
G1 X48.012 Y145.8 E.03058
G1 X54.469 Y145.8 E.21417
G1 X55.121 Y145.148 E.03058
G1 X55.036 Y145.148 E.0028
G1 X55.688 Y145.8 E.03058
G1 X62.145 Y145.8 E.21417
G1 X62.797 Y145.148 E.03058
G1 X62.712 Y145.148 E.0028
G1 X63.364 Y145.8 E.03058
G1 X69.821 Y145.8 E.21417
G1 X70.472 Y145.148 E.03058
G1 X70.388 Y145.148 E.0028
G1 X71.04 Y145.8 E.03058
G1 X77.496 Y145.8 E.21417
G1 X78.148 Y145.148 E.03058
G1 X78.064 Y145.148 E.0028
G1 X78.716 Y145.8 E.03058
G1 X85.172 Y145.8 E.21417
G1 X85.824 Y145.148 E.03058
G1 X85.74 Y145.148 E.0028
G1 X86.392 Y145.8 E.03058
G1 X92.848 Y145.8 E.21417
G1 X93.5 Y145.148 E.03058
G1 X93.416 Y145.148 E.0028
G1 X94.068 Y145.8 E.03058
G1 X100.524 Y145.8 E.21417
G1 X101.176 Y145.148 E.03058
G1 X101.092 Y145.148 E.0028
G1 X101.744 Y145.8 E.03058
G1 X108.2 Y145.8 E.21417
G1 X108.852 Y145.148 E.03058
G1 X108.768 Y145.148 E.0028
G1 X109.42 Y145.8 E.03058
G1 X115.876 Y145.8 E.21417
G1 X116.528 Y145.148 E.03058
G1 X116.444 Y145.148 E.0028
G1 X117.096 Y145.8 E.03058
G1 X123.552 Y145.8 E.21417
G1 X124.204 Y145.148 E.03058
G1 X124.12 Y145.148 E.0028
G1 X124.772 Y145.8 E.03058
G1 X131.228 Y145.8 E.21417
G1 X131.88 Y145.148 E.03058
G1 X131.796 Y145.148 E.0028
G1 X132.448 Y145.8 E.03058
G1 X138.904 Y145.8 E.21417
G1 X139.556 Y145.148 E.03058
G1 X139.472 Y145.148 E.0028
G1 X140.124 Y145.8 E.03058
G1 X146.58 Y145.8 E.21417
G1 X147.232 Y145.148 E.03058
G1 X147.148 Y145.148 E.0028
G1 X147.8 Y145.8 E.03058
G1 X154.256 Y145.8 E.21417
G1 X154.908 Y145.148 E.03058
G1 X154.824 Y145.148 E.0028
G1 X155.476 Y145.8 E.03058
G1 X161.932 Y145.8 E.21417
G1 X162.584 Y145.148 E.03058
G1 X162.5 Y145.148 E.0028
G1 X163.152 Y145.8 E.03058
G1 X169.608 Y145.8 E.21417
G1 X170.26 Y145.148 E.03058
G1 X170.176 Y145.148 E.0028
G1 X170.828 Y145.8 E.03058
G1 X177.284 Y145.8 E.21417
G1 X177.936 Y145.148 E.03058
G1 X177.852 Y145.148 E.0028
G1 X178.503 Y145.8 E.03058
G1 X184.96 Y145.8 E.21417
G1 X185.612 Y145.148 E.03058
G1 X185.528 Y145.148 E.0028
G1 X186.179 Y145.8 E.03058
G1 X192.636 Y145.8 E.21417
G1 X193.288 Y145.148 E.03058
G1 X193.203 Y145.148 E.0028
G1 X193.855 Y145.8 E.03058
G1 X200.312 Y145.8 E.21417
G1 X200.964 Y145.148 E.03058
G1 X200.879 Y145.148 E.0028
G1 X201.531 Y145.8 E.03058
G1 X207.988 Y145.8 E.21417
G1 X208.64 Y145.148 E.03058
G1 X208.555 Y145.148 E.0028
G1 X209.207 Y145.8 E.03058
G1 X214.277 Y145.8 E.16816
G2 X215.842 Y145.621 I-.117 J-7.987 E.05235
G1 X216.35 Y145.113 E.02382
G1 X216.207 Y145.123 E.00477
G1 X216.517 Y145.434 E.01458
G1 X216.753 Y145.349 E.00832
G1 X216.642 Y145.071 E.00995
G1 X216.552 Y145.089 E.00305
; WIPE_START
G1 X216.642 Y145.071 E-.03489
G1 X216.753 Y145.349 E-.11393
G1 X216.517 Y145.434 E-.0953
G1 X216.207 Y145.123 E-.16702
G1 X216.35 Y145.113 E-.0546
G1 X215.842 Y145.621 E-.27288
G1 X215.787 Y145.631 E-.02138
; WIPE_END
G1 E-.04 F1800
G1 X220.407 Y139.555 Z5.2 F30000
G1 X220.698 Y139.173 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G3 X220.663 Y140.8 I-12.456 J.552 E.05403
G1 X221.171 Y140.292 E.02382
G2 X221.35 Y138.727 I-7.81 J-1.683 E.05235
G1 X221.35 Y134.914 E.12647
G1 X220.698 Y134.262 E.03058
G1 X220.698 Y133.09 E.03889
G1 X221.35 Y132.438 E.03058
G1 X221.35 Y127.238 E.17248
G1 X220.698 Y126.586 E.03058
G1 X220.698 Y125.414 E.03889
G1 X221.35 Y124.762 E.03058
G1 X221.35 Y119.562 E.17248
G1 X220.698 Y118.91 E.03058
G1 X220.698 Y117.738 E.03889
G1 X221.35 Y117.086 E.03058
G2 X221.315 Y112.559 I-46.075 J-1.906 E.15022
G2 X221.171 Y111.708 I-4.392 J.302 E.02868
G1 X220.667 Y111.204 E.02364
G3 X220.698 Y112.831 I-13.907 J1.074 E.05402
G1 X220.235 Y110.87 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F12000
G1 X220.334 Y111.733 E.02407
G1 X220.334 Y140.272 E.79071
G3 X220.249 Y141.077 I-3.896 J-.006 E.02246
G1 X220.246 Y141.23 F30000
; LINE_WIDTH: 0.394345
G1 F12000
G1 X220.238 Y141.136 E.00269
; LINE_WIDTH: 0.406248
G1 X220.207 Y141.371 E.007
; LINE_WIDTH: 0.457073
G1 X220.177 Y141.605 E.00798
G1 X219.972 Y142.106 E.01826
; LINE_WIDTH: 0.40826
G3 X219.329 Y143.112 I-4.482 J-2.155 E.03562
G1 X218.682 Y143.761 E.0273
G1 X217.977 Y144.253 E.02558
; LINE_WIDTH: 0.445819
G1 X217.438 Y144.521 E.01977
G1 X216.898 Y144.659 E.01828
; LINE_WIDTH: 0.427253
G1 X216.788 Y144.673 E.00349
; LINE_WIDTH: 0.40747
G1 X216.677 Y144.686 E.00331
G1 X216.89 Y144.733 E.00646
; LINE_WIDTH: 0.475242
G1 X217 Y144.825 E.00507
G1 X217.119 Y145.12 E.01121
G1 X217.583 Y144.914 E.01789
; LINE_WIDTH: 0.44361
G1 X218.126 Y144.61 E.02032
; LINE_WIDTH: 0.411662
G2 X220.304 Y142.324 I-3.49 J-5.506 E.09583
; LINE_WIDTH: 0.466242
G2 X220.672 Y141.565 I-15.413 J-7.957 E.02909
G1 X220.377 Y141.446 E.011
; LINE_WIDTH: 0.458615
G1 X220.327 Y141.364 E.00327
; LINE_WIDTH: 0.423385
G1 X220.277 Y141.281 E.00299
; WIPE_START
G1 X220.327 Y141.364 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.677 Y144.686 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F12000
G3 X215.819 Y144.784 I-1.408 J-8.547 E.02393
G1 X40.177 Y144.784 E4.86629
G1 X39.573 Y144.736 E.01679
G1 X39.367 Y144.697 E.00581
; WIPE_START
G1 X39.573 Y144.736 E-.07962
G1 X40.177 Y144.784 E-.23034
G1 X41.361 Y144.784 E-.45003
; WIPE_END
G1 E-.04 F1800
G1 X35.768 Y141.159 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.382923
G1 F12000
G1 X35.666 Y140.267 E.02488
G1 X35.666 Y111.727 E.79072
G3 X35.755 Y110.94 I3.385 J-.016 E.022
; WIPE_START
G1 X35.709 Y111.174 E-.09048
G1 X35.666 Y111.727 E-.21105
G1 X35.666 Y112.934 E-.45847
; WIPE_END
G1 E-.04 F1800
G1 X39.323 Y107.314 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F12000
G3 X40.181 Y107.216 I1.408 J8.548 E.02393
G1 X215.823 Y107.216 E4.86629
G1 X216.427 Y107.264 E.01679
G1 X216.633 Y107.303 E.0058
; WIPE_START
G1 X216.427 Y107.264 E-.07957
G1 X215.823 Y107.216 E-.23034
G1 X214.638 Y107.216 E-.45008
; WIPE_END
G1 E-.04 F1800
G1 X220.46 Y109.969 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.449045
G1 F12000
G1 X220.125 Y109.369 E.02274
; LINE_WIDTH: 0.411281
G2 X217.874 Y107.246 I-5.478 J3.555 E.09378
; LINE_WIDTH: 0.466251
G2 X217.123 Y106.88 I-7.958 J15.391 E.02882
G1 X217.002 Y107.177 E.01105
; LINE_WIDTH: 0.458493
G1 X216.893 Y107.241 E.00428
; LINE_WIDTH: 0.423158
G1 X216.784 Y107.306 E.00392
; LINE_WIDTH: 0.394205
G1 X216.692 Y107.314 E.00266
; LINE_WIDTH: 0.40623
G1 X216.927 Y107.345 E.00702
; LINE_WIDTH: 0.457014
G1 X217.162 Y107.376 E.008
G1 X217.656 Y107.578 E.01803
; LINE_WIDTH: 0.409595
G3 X218.662 Y108.221 I-2.155 J4.482 E.03575
G1 X219.311 Y108.868 E.0274
G3 X219.958 Y109.868 I-3.777 J3.154 E.03566
; LINE_WIDTH: 0.455212
G1 X220.158 Y110.38 E.01846
G1 X220.238 Y110.761 E.01308
; LINE_WIDTH: 0.40692
G1 X220.235 Y110.87 E.00324
G1 X220.281 Y110.655 E.00653
; LINE_WIDTH: 0.476756
G1 X220.372 Y110.545 E.00505
G1 X220.665 Y110.426 E.01116
G1 X220.485 Y110.024 E.01558
; WIPE_START
G1 X220.665 Y110.426 E-.37243
G1 X220.372 Y110.545 E-.26685
G1 X220.281 Y110.655 E-.12071
; WIPE_END
G1 E-.04 F1800
G1 X212.648 Y110.659 Z5.2 F30000
G1 X35.762 Y110.761 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.397975
G1 F12000
G1 X35.767 Y110.881 E.00349
; LINE_WIDTH: 0.406775
G1 X35.795 Y110.639 E.00724
; LINE_WIDTH: 0.452185
G1 X35.823 Y110.396 E.00815
G1 X36.179 Y109.603 E.02899
; LINE_WIDTH: 0.412946
G1 X36.575 Y109.021 E.02121
G3 X38.023 Y107.747 I4.676 J3.852 E.0584
; LINE_WIDTH: 0.445827
G1 X38.562 Y107.479 E.01977
G1 X39.102 Y107.341 E.01828
; LINE_WIDTH: 0.42726
G1 X39.212 Y107.327 E.00349
; LINE_WIDTH: 0.407474
G1 X39.323 Y107.314 E.00331
G1 X39.11 Y107.267 E.00646
; LINE_WIDTH: 0.475259
G1 X39 Y107.175 E.00507
G1 X38.881 Y106.88 E.01121
G1 X38.417 Y107.086 E.0179
; LINE_WIDTH: 0.443615
G1 X37.874 Y107.39 E.02032
; LINE_WIDTH: 0.410355
G2 X36.392 Y108.672 I3.983 J6.105 E.05885
G1 X35.885 Y109.35 E.02534
; LINE_WIDTH: 0.447995
G1 X35.551 Y109.95 E.02267
; LINE_WIDTH: 0.474735
G1 X35.33 Y110.428 E.01854
G1 X35.627 Y110.548 E.01124
; LINE_WIDTH: 0.460513
G1 X35.678 Y110.629 E.00327
; LINE_WIDTH: 0.428458
G1 X35.73 Y110.71 E.00302
G1 X35.54 Y142.031 F30000
; LINE_WIDTH: 0.449055
G1 F12000
G1 X35.875 Y142.631 E.02274
; LINE_WIDTH: 0.411292
G2 X38.126 Y144.754 I5.478 J-3.555 E.09379
; LINE_WIDTH: 0.466244
G2 X38.877 Y145.12 I7.96 J-15.394 E.02882
G1 X38.998 Y144.823 E.01105
; LINE_WIDTH: 0.458485
G1 X39.107 Y144.759 E.00428
; LINE_WIDTH: 0.423155
G1 X39.216 Y144.694 E.00392
; LINE_WIDTH: 0.394205
G1 X39.308 Y144.686 E.00266
; LINE_WIDTH: 0.406228
G1 X39.073 Y144.655 E.00701
; LINE_WIDTH: 0.457012
G1 X38.838 Y144.624 E.008
G1 X38.344 Y144.422 E.01803
; LINE_WIDTH: 0.409608
G3 X37.338 Y143.779 I2.155 J-4.482 E.03575
G1 X36.689 Y143.132 E.0274
G3 X36.042 Y142.132 I3.777 J-3.154 E.03567
; LINE_WIDTH: 0.45371
G1 X35.842 Y141.62 E.01839
G1 X35.767 Y141.239 E.01302
; LINE_WIDTH: 0.403873
G1 X35.768 Y141.159 E.00233
G1 X35.716 Y141.344 E.00564
; LINE_WIDTH: 0.476192
G1 X35.628 Y141.455 E.00502
G1 X35.335 Y141.574 E.01115
G1 X35.515 Y141.976 E.01556
; WIPE_START
G1 X35.335 Y141.574 E-.37268
G1 X35.628 Y141.455 E-.26703
G1 X35.716 Y141.344 E-.12029
; WIPE_END
G1 E-.04 F1800
G1 X43.214 Y139.916 Z5.2 F30000
G1 X216.552 Y106.911 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X216.648 Y106.931 E.00328
G1 X216.761 Y106.654 E.00993
G1 X216.517 Y106.566 E.00859
G1 X216.207 Y106.877 E.01458
G1 X216.35 Y106.887 E.00477
G1 X215.842 Y106.379 E.02382
G2 X214.277 Y106.2 I-1.885 J9.579 E.05232
G1 X209.207 Y106.2 E.16816
G1 X208.555 Y106.852 E.03058
G1 X208.64 Y106.852 E.0028
G1 X207.988 Y106.2 E.03058
G1 X201.531 Y106.2 E.21417
G1 X200.879 Y106.852 E.03058
G1 X200.964 Y106.852 E.0028
G1 X200.312 Y106.2 E.03058
G1 X193.855 Y106.2 E.21417
G1 X193.203 Y106.852 E.03058
G1 X193.288 Y106.852 E.0028
G1 X192.636 Y106.2 E.03058
G1 X186.179 Y106.2 E.21417
G1 X185.528 Y106.852 E.03058
G1 X185.612 Y106.852 E.0028
G1 X184.96 Y106.2 E.03058
G1 X178.504 Y106.2 E.21417
G1 X177.852 Y106.852 E.03058
G1 X177.936 Y106.852 E.0028
G1 X177.284 Y106.2 E.03058
G1 X170.828 Y106.2 E.21417
G1 X170.176 Y106.852 E.03058
G1 X170.26 Y106.852 E.0028
G1 X169.608 Y106.2 E.03058
G1 X163.152 Y106.2 E.21417
G1 X162.5 Y106.852 E.03058
G1 X162.584 Y106.852 E.0028
G1 X161.932 Y106.2 E.03058
G1 X155.476 Y106.2 E.21417
G1 X154.824 Y106.852 E.03058
G1 X154.908 Y106.852 E.0028
G1 X154.256 Y106.2 E.03058
G1 X147.8 Y106.2 E.21417
G1 X147.148 Y106.852 E.03058
G1 X147.232 Y106.852 E.0028
G1 X146.58 Y106.2 E.03058
G1 X140.124 Y106.2 E.21417
G1 X139.472 Y106.852 E.03058
G1 X139.556 Y106.852 E.0028
G1 X138.904 Y106.2 E.03058
G1 X132.448 Y106.2 E.21417
G1 X131.796 Y106.852 E.03058
G1 X131.88 Y106.852 E.0028
G1 X131.228 Y106.2 E.03058
G1 X124.772 Y106.2 E.21417
G1 X124.12 Y106.852 E.03058
G1 X124.204 Y106.852 E.0028
G1 X123.552 Y106.2 E.03058
G1 X117.096 Y106.2 E.21417
G1 X116.444 Y106.852 E.03058
G1 X116.528 Y106.852 E.0028
G1 X115.876 Y106.2 E.03058
G1 X109.42 Y106.2 E.21417
G1 X108.768 Y106.852 E.03058
G1 X108.852 Y106.852 E.0028
G1 X108.2 Y106.2 E.03058
G1 X101.744 Y106.2 E.21417
G1 X101.092 Y106.852 E.03058
G1 X101.176 Y106.852 E.0028
G1 X100.524 Y106.2 E.03058
G1 X94.068 Y106.2 E.21417
G1 X93.416 Y106.852 E.03058
G1 X93.5 Y106.852 E.0028
G1 X92.848 Y106.2 E.03058
G1 X86.392 Y106.2 E.21417
G1 X85.74 Y106.852 E.03058
G1 X85.824 Y106.852 E.0028
G1 X85.172 Y106.2 E.03058
G1 X78.716 Y106.2 E.21417
G1 X78.064 Y106.852 E.03058
G1 X78.148 Y106.852 E.0028
G1 X77.496 Y106.2 E.03058
G1 X71.04 Y106.2 E.21417
G1 X70.388 Y106.852 E.03058
G1 X70.472 Y106.852 E.0028
G1 X69.821 Y106.2 E.03058
G1 X63.364 Y106.2 E.21417
G1 X62.712 Y106.852 E.03058
G1 X62.797 Y106.852 E.0028
G1 X62.145 Y106.2 E.03058
G1 X55.688 Y106.2 E.21417
G1 X55.036 Y106.852 E.03058
G1 X55.121 Y106.852 E.0028
G1 X54.469 Y106.2 E.03058
G1 X48.012 Y106.2 E.21417
G1 X47.36 Y106.852 E.03058
G1 X47.445 Y106.852 E.0028
G1 X46.793 Y106.2 E.03058
G1 X41.723 Y106.2 E.16816
G2 X40.154 Y106.383 I.079 J7.509 E.05252
G1 X39.65 Y106.887 E.02362
G1 X39.793 Y106.877 E.00477
G1 X39.483 Y106.566 E.01458
G1 X39.247 Y106.651 E.00832
G1 X39.358 Y106.929 E.00995
G1 X39.448 Y106.911 E.00304
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X39.358 Y106.929 E-.03485
G1 X39.247 Y106.651 E-.11393
G1 X39.483 Y106.566 E-.09527
G1 X39.793 Y106.877 E-.16702
G1 X39.65 Y106.887 E-.0546
G1 X40.154 Y106.383 E-.27057
G1 X40.215 Y106.372 E-.02376
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/35
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.2 I-.751 J-.957 P1  F30000
G1 X37.177 Y108.756 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X37.433 Y108.515 E.01167
G3 X40.19 Y107.485 I2.786 J3.255 E.09964
G1 X215.81 Y107.485 E5.82564
G3 X220.065 Y111.74 I-.03 J4.285 E.22128
G1 X220.065 Y140.26 E.94607
G3 X215.81 Y144.515 I-4.285 J-.03 E.22128
G1 X40.19 Y144.515 E5.82564
G3 X35.935 Y140.26 I.03 J-4.285 E.22128
G1 X35.935 Y111.74 E.94607
G3 X37.035 Y108.904 I4.285 J.03 E.10316
G1 X37.136 Y108.799 E.00481
M204 S250
G1 X37.45 Y109.037 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.682 Y108.818 E.0098
G3 X40.196 Y107.877 I2.538 J2.952 E.08421
G1 X215.804 Y107.877 E5.39592
G3 X219.673 Y111.746 I-.023 J3.893 E.18645
G1 X219.673 Y140.254 E.87594
G3 X215.804 Y144.123 I-3.893 J-.023 E.18645
G1 X40.196 Y144.123 E5.39592
G3 X36.327 Y140.254 I.023 J-3.893 E.18645
G1 X36.327 Y111.746 E.87594
G3 X37.321 Y109.172 I3.893 J.023 E.08669
G1 X37.409 Y109.08 E.00389
; WIPE_START
M204 S10000
G1 X37.682 Y108.818 E-.144
G1 X38.016 Y108.554 E-.16167
G1 X38.524 Y108.261 E-.22297
G1 X38.918 Y108.098 E-.16181
G1 X39.094 Y108.049 E-.06955
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19307
G1 X214.285 Y105.852 E5.72448
G1 X214.911 Y105.883 E.02078
G1 X215.025 Y105.888 E.00379
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.416 J-.003 E.3862
M73 P90 R3
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.187 Y107.747 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.198 Y107.748 E.00036
G3 X41.705 Y105.46 I5.525 J5.525 E.188
G1 X214.295 Y105.46 E5.3032
G1 X214.93 Y105.491 E.01954
G1 X215.064 Y105.498 E.00411
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.809 J-.014 E.37606
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.686 Y108.314 I7.813 J.018 E.16453
G1 X36.147 Y107.792 E.02141
; WIPE_START
M204 S10000
G1 X36.198 Y107.748 E-.02562
G1 X36.758 Y107.228 E-.29033
G1 X37.372 Y106.773 E-.29051
G1 X37.719 Y106.565 E-.15353
; WIPE_END
G1 E-.04 F1800
G1 X36.257 Y109.035 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.649908
G1 F10379.124
G3 X37.485 Y107.807 I5.703 J4.476 E.08607
G1 X41.687 Y107.137 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X40.059 Y107.143 I-.753 J16.959 E.05403
G1 X39.483 Y106.566 E.02705
G3 X40.158 Y106.379 I1.29 J3.335 E.02329
G1 X39.307 Y107.229 E.03992
G2 X37.904 Y107.766 I2.095 J7.577 E.04991
G1 X37.829 Y107.676 E.00389
G1 X45.164 Y106.2 F30000
G1 F15476.087
G1 X46.793 Y106.2 E.05401
G1 X47.729 Y107.137 E.04395
G1 X47.076 Y107.137 E.02169
G1 X48.012 Y106.2 E.04395
G1 X54.469 Y106.2 E.21416
G1 X55.405 Y107.137 E.04395
G1 X54.752 Y107.137 E.02169
G1 X55.688 Y106.2 E.04395
G1 X62.144 Y106.2 E.21416
G1 X63.081 Y107.137 E.04395
G1 X62.427 Y107.137 E.02169
G1 X63.364 Y106.2 E.04395
G1 X69.82 Y106.2 E.21416
G1 X70.757 Y107.137 E.04395
G1 X70.103 Y107.137 E.02169
G1 X71.04 Y106.2 E.04395
G1 X77.496 Y106.2 E.21416
G1 X78.433 Y107.137 E.04395
G1 X77.779 Y107.137 E.02169
G1 X78.716 Y106.2 E.04395
G1 X85.172 Y106.2 E.21416
G1 X86.109 Y107.137 E.04395
G1 X85.455 Y107.137 E.02169
G1 X86.392 Y106.2 E.04395
G1 X92.848 Y106.2 E.21416
G1 X93.785 Y107.137 E.04395
G1 X93.131 Y107.137 E.02169
G1 X94.068 Y106.2 E.04395
G1 X100.524 Y106.2 E.21416
G1 X101.461 Y107.137 E.04395
G1 X100.807 Y107.137 E.02169
G1 X101.744 Y106.2 E.04395
G1 X108.2 Y106.2 E.21416
G1 X109.137 Y107.137 E.04395
G1 X108.483 Y107.137 E.02169
G1 X109.42 Y106.2 E.04395
G1 X115.876 Y106.2 E.21416
G1 X116.813 Y107.137 E.04395
G1 X116.159 Y107.137 E.02169
G1 X117.096 Y106.2 E.04395
G1 X123.552 Y106.2 E.21416
G1 X124.489 Y107.137 E.04395
G1 X123.835 Y107.137 E.02169
G1 X124.772 Y106.2 E.04395
G1 X131.228 Y106.2 E.21416
G1 X132.165 Y107.137 E.04395
G1 X131.511 Y107.137 E.02169
G1 X132.448 Y106.2 E.04395
G1 X138.904 Y106.2 E.21416
G1 X139.841 Y107.137 E.04395
G1 X139.187 Y107.137 E.02169
G1 X140.124 Y106.2 E.04395
G1 X146.58 Y106.2 E.21416
G1 X147.517 Y107.137 E.04395
G1 X146.863 Y107.137 E.02169
G1 X147.8 Y106.2 E.04395
G1 X154.256 Y106.2 E.21416
G1 X155.193 Y107.137 E.04395
G1 X154.539 Y107.137 E.02169
G1 X155.476 Y106.2 E.04395
G1 X161.932 Y106.2 E.21416
G1 X162.869 Y107.137 E.04395
G1 X162.215 Y107.137 E.02169
G1 X163.152 Y106.2 E.04395
G1 X169.608 Y106.2 E.21416
G1 X170.545 Y107.137 E.04395
G1 X169.891 Y107.137 E.02169
G1 X170.828 Y106.2 E.04395
G1 X177.284 Y106.2 E.21416
G1 X178.221 Y107.137 E.04395
G1 X177.567 Y107.137 E.02169
G1 X178.504 Y106.2 E.04395
G1 X184.96 Y106.2 E.21416
G1 X185.897 Y107.137 E.04395
G1 X185.243 Y107.137 E.02169
G1 X186.18 Y106.2 E.04395
G1 X192.636 Y106.2 E.21416
G1 X193.573 Y107.137 E.04395
G1 X192.919 Y107.137 E.02169
G1 X193.856 Y106.2 E.04395
G1 X200.312 Y106.2 E.21416
G1 X201.248 Y107.137 E.04395
G1 X200.595 Y107.137 E.02169
G1 X201.531 Y106.2 E.04395
G1 X207.988 Y106.2 E.21416
G1 X208.924 Y107.137 E.04395
G1 X208.271 Y107.137 E.02169
G1 X209.207 Y106.2 E.04395
G1 X210.836 Y106.2 E.05401
G1 X218.173 Y107.674 F30000
G1 F15476.087
G1 X218.099 Y107.763 E.00386
G2 X216.692 Y107.229 I-2.393 J4.184 E.0501
G1 X215.842 Y106.379 E.0399
G3 X216.517 Y106.566 I-.614 J3.523 E.02329
G1 X215.941 Y107.143 E.02705
G2 X214.313 Y107.137 I-.875 J16.957 E.05403
G1 X218.515 Y107.807 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.649915
G1 F10379.001
G3 X219.743 Y109.035 I-4.477 J5.705 E.08607
G1 X219.874 Y109.607 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X219.787 Y109.451 E.00593
G1 X220.072 Y109.214 E.0123
G3 X220.618 Y110.142 I-6.382 J4.382 E.03575
G1 X220.238 Y110.521 E.01781
G3 X220.321 Y110.857 I-1.369 J.514 E.01149
G1 X221.171 Y111.708 E.03992
G3 X221.35 Y113.273 I-7.811 J1.683 E.05234
G1 X221.35 Y117.086 E.12647
G1 X220.413 Y118.023 E.04395
G1 X220.413 Y118.626 E.02
G1 X221.35 Y119.562 E.04395
G1 X221.35 Y124.762 E.17247
G1 X220.413 Y125.698 E.04395
G1 X220.413 Y126.302 E.02
G1 X221.35 Y127.238 E.04395
G1 X221.35 Y132.438 E.17247
G1 X220.413 Y133.374 E.04395
G1 X220.413 Y133.977 E.02
G1 X221.35 Y134.914 E.04395
G3 X221.315 Y139.441 I-46.072 J1.906 E.15022
G3 X221.171 Y140.292 I-4.39 J-.301 E.02868
G1 X220.321 Y141.142 E.03988
G1 X220.236 Y141.477 E.01145
G1 X220.615 Y141.856 E.01778
G3 X220.072 Y142.786 I-6.415 J-3.123 E.03578
G1 X219.789 Y142.55 E.01221
G1 X219.879 Y142.394 E.00599
G1 X219.743 Y142.965 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.649906
G1 F10379.159
G3 X218.515 Y144.193 I-5.703 J-4.476 E.08606
G1 X214.313 Y144.863 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X215.941 Y144.857 I.753 J-16.989 E.05403
G1 X216.517 Y145.434 E.02705
G3 X215.842 Y145.621 I-1.291 J-3.338 E.02329
G1 X216.692 Y144.771 E.0399
G2 X218.099 Y144.237 I-.9 J-4.487 E.05013
G1 X218.173 Y144.326 E.00387
G1 X210.836 Y145.8 F30000
G1 F15476.087
G1 X209.207 Y145.8 E.05401
G1 X208.271 Y144.863 E.04395
G1 X208.924 Y144.863 E.02169
G1 X207.988 Y145.8 E.04395
G1 X201.531 Y145.8 E.21416
G1 X200.595 Y144.863 E.04395
G1 X201.248 Y144.863 E.02169
G1 X200.312 Y145.8 E.04395
G1 X193.856 Y145.8 E.21416
G1 X192.919 Y144.863 E.04395
G1 X193.573 Y144.863 E.02169
G1 X192.636 Y145.8 E.04395
G1 X186.18 Y145.8 E.21416
G1 X185.243 Y144.863 E.04395
G1 X185.897 Y144.863 E.02169
G1 X184.96 Y145.8 E.04395
G1 X178.504 Y145.8 E.21416
G1 X177.567 Y144.863 E.04395
G1 X178.221 Y144.863 E.02169
G1 X177.284 Y145.8 E.04395
G1 X170.828 Y145.8 E.21416
G1 X169.891 Y144.863 E.04395
G1 X170.545 Y144.863 E.02169
G1 X169.608 Y145.8 E.04395
G1 X163.152 Y145.8 E.21416
G1 X162.215 Y144.863 E.04395
G1 X162.869 Y144.863 E.02169
G1 X161.932 Y145.8 E.04395
G1 X155.476 Y145.8 E.21416
G1 X154.539 Y144.863 E.04395
G1 X155.193 Y144.863 E.02169
G1 X154.256 Y145.8 E.04395
G1 X147.8 Y145.8 E.21416
G1 X146.863 Y144.863 E.04395
G1 X147.517 Y144.863 E.02169
G1 X146.58 Y145.8 E.04395
G1 X140.124 Y145.8 E.21416
G1 X139.187 Y144.863 E.04395
G1 X139.841 Y144.863 E.02169
G1 X138.904 Y145.8 E.04395
G1 X132.448 Y145.8 E.21416
G1 X131.511 Y144.863 E.04395
G1 X132.165 Y144.863 E.02169
G1 X131.228 Y145.8 E.04395
G1 X124.772 Y145.8 E.21416
G1 X123.835 Y144.863 E.04395
G1 X124.489 Y144.863 E.02169
G1 X123.552 Y145.8 E.04395
G1 X117.096 Y145.8 E.21416
G1 X116.159 Y144.863 E.04395
G1 X116.813 Y144.863 E.02169
G1 X115.876 Y145.8 E.04395
G1 X109.42 Y145.8 E.21416
G1 X108.483 Y144.863 E.04395
G1 X109.137 Y144.863 E.02169
G1 X108.2 Y145.8 E.04395
G1 X101.744 Y145.8 E.21416
G1 X100.807 Y144.863 E.04395
G1 X101.461 Y144.863 E.02169
G1 X100.524 Y145.8 E.04395
G1 X94.068 Y145.8 E.21416
G1 X93.131 Y144.863 E.04395
G1 X93.785 Y144.863 E.02169
G1 X92.848 Y145.8 E.04395
G1 X86.392 Y145.8 E.21416
G1 X85.455 Y144.863 E.04395
G1 X86.109 Y144.863 E.02169
G1 X85.172 Y145.8 E.04395
G1 X78.716 Y145.8 E.21416
G1 X77.779 Y144.863 E.04395
G1 X78.433 Y144.863 E.02169
G1 X77.496 Y145.8 E.04395
G1 X71.04 Y145.8 E.21416
G1 X70.103 Y144.863 E.04395
G1 X70.757 Y144.863 E.02169
G1 X69.82 Y145.8 E.04395
G1 X63.364 Y145.8 E.21416
G1 X62.427 Y144.863 E.04395
G1 X63.081 Y144.863 E.02169
G1 X62.144 Y145.8 E.04395
G1 X55.688 Y145.8 E.21416
G1 X54.752 Y144.863 E.04395
G1 X55.405 Y144.863 E.02169
G1 X54.469 Y145.8 E.04395
G1 X48.012 Y145.8 E.21416
G1 X47.076 Y144.863 E.04395
G1 X47.729 Y144.863 E.02169
G1 X46.793 Y145.8 E.04395
G1 X45.164 Y145.8 E.05401
G1 X37.827 Y144.326 F30000
G1 F15476.087
G1 X37.901 Y144.237 E.00386
G2 X39.308 Y144.771 I2.393 J-4.184 E.05011
G1 X40.158 Y145.621 E.0399
G3 X39.483 Y145.434 I.614 J-3.522 E.02329
G1 X40.059 Y144.857 E.02705
G2 X41.687 Y144.863 I.875 J-16.957 E.05403
G1 X37.485 Y144.193 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.649905
G1 F10379.172
G3 X36.257 Y142.965 I4.476 J-5.703 E.08606
G1 X36.126 Y142.393 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X36.213 Y142.549 E.00593
G1 X35.928 Y142.786 E.0123
G3 X35.382 Y141.858 I6.386 J-4.384 E.03575
G1 X35.762 Y141.479 E.01781
G3 X35.679 Y141.143 I1.369 J-.514 E.01149
G1 X34.829 Y140.292 E.03992
G3 X34.65 Y138.727 I7.811 J-1.683 E.05234
G1 X34.65 Y134.914 E.12647
G1 X35.587 Y133.977 E.04395
G1 X35.587 Y133.374 E.02
G1 X34.65 Y132.438 E.04395
G1 X34.65 Y127.238 E.17247
G1 X35.587 Y126.302 E.04395
G1 X35.587 Y125.698 E.02
G1 X34.65 Y124.762 E.04395
G1 X34.65 Y119.562 E.17247
G1 X35.587 Y118.626 E.04395
G1 X35.587 Y118.023 E.02
G1 X34.65 Y117.086 E.04395
G3 X34.685 Y112.559 I46.072 J-1.906 E.15022
G3 X34.829 Y111.708 I4.39 J.301 E.02868
G1 X35.679 Y110.858 E.0399
G1 X35.768 Y110.527 E.01135
G1 X35.385 Y110.144 E.01796
G3 X35.928 Y109.214 I6.419 J3.126 E.03578
G1 X36.213 Y109.451 E.0123
G1 X36.126 Y109.606 E.00589
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X36.213 Y109.451 E-.0675
G1 X35.928 Y109.214 E-.14092
G1 X35.385 Y110.144 E-.40953
G1 X35.649 Y110.409 E-.14206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/35
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.4 I.922 J.794 P1  F30000
G1 X37.087 Y108.739 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X37.277 Y108.548 E.00894
G3 X40.19 Y107.406 I2.944 J3.223 E.10616
G1 X215.81 Y107.406 E5.82564
G3 X220.144 Y111.74 I-.03 J4.365 E.22542
G1 X220.144 Y140.26 E.94607
G3 X215.81 Y144.594 I-4.365 J-.03 E.22542
G1 X40.19 Y144.594 E5.82564
G3 X35.856 Y140.26 I.03 J-4.365 E.22542
G1 X35.856 Y111.74 E.94607
G3 X36.884 Y108.956 I4.365 J.03 E.10043
G1 X37.046 Y108.783 E.00788
M204 S250
G1 X37.369 Y109.01 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.545 Y108.834 E.00764
G3 X40.196 Y107.798 I2.675 J2.936 E.08947
G1 X215.804 Y107.798 E5.39592
G3 X219.752 Y111.746 I-.024 J3.972 E.19028
G1 X219.752 Y140.254 E.87594
G3 X215.804 Y144.202 I-3.972 J-.024 E.19028
G1 X40.196 Y144.202 E5.39592
G3 X36.248 Y140.254 I.024 J-3.972 E.19028
G1 X36.248 Y111.746 E.87594
G3 X37.187 Y109.205 I3.972 J.024 E.08495
G1 X37.328 Y109.054 E.00637
; WIPE_START
M204 S10000
G1 X37.545 Y108.834 E-.11729
G1 X38.068 Y108.427 E-.25182
G1 X38.388 Y108.242 E-.14051
G1 X38.861 Y108.035 E-.19624
G1 X38.999 Y107.999 E-.05414
; WIPE_END
G1 E-.04 F1800
G1 X36.473 Y108.023 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.242 J5.242 E.19313
G1 X214.285 Y105.852 E5.72448
G1 X214.937 Y105.884 E.02165
G1 X215.025 Y105.888 E.00293
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
G3 X214.285 Y146.148 I-7.413 J0 E.38625
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.431 Y108.066 I7.413 J0 E.19113
M204 S250
G1 X36.198 Y107.737 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.764 Y107.236 E.02324
G3 X41.705 Y105.46 I4.959 J6.038 E.16453
G1 X214.295 Y105.46 E5.3032
G1 X214.956 Y105.492 E.02035
G1 X215.064 Y105.498 E.0033
G3 X222.09 Y113.255 I-.791 J7.777 E.35237
G1 X222.09 Y138.745 E.78322
G3 X220.713 Y143.164 I-7.828 J-.015 E.14439
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.295 Y146.54 I-6.415 J-4.407 E.2318
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.011 J-7.806 E.3761
G1 X33.91 Y113.255 E.78322
G3 X36.165 Y107.783 I7.813 J.018 E.18653
; WIPE_START
M204 S10000
G1 X36.764 Y107.236 E-.30837
G1 X37.372 Y106.773 E-.29036
G1 X37.736 Y106.555 E-.16127
; WIPE_END
G1 E-.04 F1800
G1 X37.31 Y107.901 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.576131
G1 F11815.224
G1 X36.95 Y108.211 E.02066
G2 X36.13 Y109.165 I3.963 J4.234 E.05473
; LINE_WIDTH: 0.621347
G1 F10891.605
G1 X35.968 Y109.412 E.01395
G1 X35.567 Y109.507 E.01943
G1 X34.878 Y111.511 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X35.367 Y110.173 I6.865 J1.753 E.04731
G1 X35.697 Y110.457 E.01442
G2 X35.589 Y110.948 I2.154 J.733 E.01673
G1 X34.829 Y111.708 E.03565
G2 X34.65 Y113.273 I7.812 J1.683 E.05234
G1 X34.65 Y117.086 E.12647
G1 X35.507 Y117.943 E.04022
G1 X35.507 Y118.705 E.02528
G1 X34.65 Y119.562 E.04022
G1 X34.65 Y124.762 E.17247
G1 X35.507 Y125.619 E.04022
G1 X35.507 Y126.381 E.02528
G1 X34.65 Y127.238 E.04022
G1 X34.65 Y132.438 E.17247
G1 X35.507 Y133.295 E.04022
G1 X35.507 Y134.057 E.02528
G1 X34.65 Y134.914 E.04022
M73 P91 R3
G2 X34.685 Y139.441 I46.073 J1.906 E.15022
G2 X34.829 Y140.292 I4.389 J-.301 E.02868
G1 X35.589 Y141.052 E.03565
G2 X35.697 Y141.543 I2.262 J-.241 E.01673
G1 X35.367 Y141.826 E.01442
G3 X34.878 Y140.489 I6.371 J-3.088 E.04731
G1 X35.567 Y142.493 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.621378
G1 F10891.022
G1 X35.968 Y142.588 E.01943
G1 X36.13 Y142.835 E.01396
; LINE_WIDTH: 0.576132
G1 F11815.196
G2 X36.95 Y143.789 I4.783 J-3.281 E.05473
G1 X37.31 Y144.099 E.02065
; LINE_WIDTH: 0.610527
G1 F11099.233
G1 X37.862 Y144.482 E.03107
G1 X37.957 Y144.883 E.01906
G1 X38.752 Y144.708 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X38.569 Y144.633 E.00655
G1 X38.673 Y145.071 E.01495
G1 X38.624 Y145.083 E.0017
G2 X39.483 Y145.434 I2.212 J-4.187 E.03083
G1 X39.985 Y144.932 E.02355
G3 X39.407 Y144.87 I.115 J-3.822 E.01929
G1 X40.158 Y145.621 E.03524
G2 X41.723 Y145.8 I1.683 J-7.81 E.05234
G1 X46.793 Y145.8 E.16816
G1 X47.65 Y144.943 E.04022
G1 X47.155 Y144.943 E.01641
G1 X48.012 Y145.8 E.04022
G1 X54.469 Y145.8 E.21416
G1 X55.326 Y144.943 E.04022
G1 X54.831 Y144.943 E.01641
G1 X55.688 Y145.8 E.04022
G1 X62.144 Y145.8 E.21416
G1 X63.002 Y144.943 E.04022
G1 X62.507 Y144.943 E.01641
G1 X63.364 Y145.8 E.04022
G1 X69.82 Y145.8 E.21416
G1 X70.678 Y144.943 E.04022
G1 X70.183 Y144.943 E.01641
G1 X71.04 Y145.8 E.04022
G1 X77.496 Y145.8 E.21416
G1 X78.354 Y144.943 E.04022
G1 X77.859 Y144.943 E.01641
G1 X78.716 Y145.8 E.04022
G1 X85.172 Y145.8 E.21416
G1 X86.03 Y144.943 E.04022
G1 X85.535 Y144.943 E.01641
G1 X86.392 Y145.8 E.04022
G1 X92.848 Y145.8 E.21416
G1 X93.706 Y144.943 E.04022
G1 X93.211 Y144.943 E.01641
G1 X94.068 Y145.8 E.04022
G1 X100.524 Y145.8 E.21416
G1 X101.382 Y144.943 E.04022
G1 X100.887 Y144.943 E.01641
G1 X101.744 Y145.8 E.04022
G1 X108.2 Y145.8 E.21416
G1 X109.057 Y144.943 E.04022
G1 X108.563 Y144.943 E.01641
G1 X109.42 Y145.8 E.04022
G1 X115.876 Y145.8 E.21416
G1 X116.733 Y144.943 E.04022
G1 X116.239 Y144.943 E.01641
G1 X117.096 Y145.8 E.04022
G1 X123.552 Y145.8 E.21416
G1 X124.409 Y144.943 E.04022
G1 X123.915 Y144.943 E.01641
G1 X124.772 Y145.8 E.04022
G1 X131.228 Y145.8 E.21416
G1 X132.085 Y144.943 E.04022
G1 X131.591 Y144.943 E.01641
G1 X132.448 Y145.8 E.04022
G1 X138.904 Y145.8 E.21416
G1 X139.761 Y144.943 E.04022
G1 X139.267 Y144.943 E.01641
G1 X140.124 Y145.8 E.04022
G1 X146.58 Y145.8 E.21416
G1 X147.437 Y144.943 E.04022
G1 X146.943 Y144.943 E.01641
G1 X147.8 Y145.8 E.04022
G1 X154.256 Y145.8 E.21416
G1 X155.113 Y144.943 E.04022
G1 X154.618 Y144.943 E.01641
G1 X155.476 Y145.8 E.04022
G1 X161.932 Y145.8 E.21416
G1 X162.789 Y144.943 E.04022
G1 X162.294 Y144.943 E.01641
G1 X163.152 Y145.8 E.04022
G1 X169.608 Y145.8 E.21416
G1 X170.465 Y144.943 E.04022
G1 X169.97 Y144.943 E.01641
G1 X170.828 Y145.8 E.04022
G1 X177.284 Y145.8 E.21416
G1 X178.141 Y144.943 E.04022
G1 X177.646 Y144.943 E.01641
G1 X178.504 Y145.8 E.04022
G1 X184.96 Y145.8 E.21416
G1 X185.817 Y144.943 E.04022
G1 X185.322 Y144.943 E.01641
G1 X186.18 Y145.8 E.04022
G1 X192.636 Y145.8 E.21416
G1 X193.493 Y144.943 E.04022
G1 X192.998 Y144.943 E.01641
G1 X193.856 Y145.8 E.04022
G1 X200.312 Y145.8 E.21416
G1 X201.169 Y144.943 E.04022
G1 X200.674 Y144.943 E.01641
G1 X201.531 Y145.8 E.04022
G1 X207.988 Y145.8 E.21416
G1 X208.845 Y144.943 E.04022
G1 X208.35 Y144.943 E.01641
G1 X209.207 Y145.8 E.04022
G1 X214.277 Y145.8 E.16816
G2 X215.842 Y145.621 I-.118 J-7.989 E.05234
G1 X216.593 Y144.87 E.03524
G3 X216.015 Y144.932 I-.692 J-3.762 E.01929
G1 X216.517 Y145.434 E.02355
G2 X217.377 Y145.083 I-1.353 J-4.538 E.03084
G1 X217.321 Y145.069 E.00191
G1 X217.421 Y144.649 E.01434
G3 X217.22 Y144.707 I-.322 J-.732 E.00695
G1 X218.042 Y144.883 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.621247
G1 F10893.499
G1 X218.138 Y144.482 E.01944
G1 X218.386 Y144.32 E.01396
; LINE_WIDTH: 0.576127
G1 F11815.312
G2 X219.339 Y143.5 I-3.283 J-4.785 E.05473
G1 X219.649 Y143.14 E.02066
; LINE_WIDTH: 0.6105
G1 F11099.769
G1 X220.032 Y142.588 E.03106
G1 X220.433 Y142.493 E.01907
G1 X221.122 Y140.489 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X220.633 Y141.827 I-6.866 J-1.754 E.04732
G1 X220.301 Y141.542 E.01451
G2 X220.42 Y141.043 I-2.181 J-.785 E.01704
G1 X221.171 Y140.292 E.03524
G2 X221.35 Y138.727 I-7.812 J-1.683 E.05234
G1 X221.35 Y134.914 E.12647
G1 X220.493 Y134.057 E.04022
G1 X220.493 Y133.295 E.02528
G1 X221.35 Y132.438 E.04022
G1 X221.35 Y127.238 E.17247
G1 X220.493 Y126.381 E.04022
G1 X220.493 Y125.619 E.02528
G1 X221.35 Y124.762 E.04022
G1 X221.35 Y119.562 E.17247
G1 X220.493 Y118.705 E.04022
G1 X220.493 Y117.943 E.02528
G1 X221.35 Y117.086 E.04022
G2 X221.315 Y112.559 I-46.073 J-1.906 E.15022
G2 X221.171 Y111.708 I-4.389 J.301 E.02868
G1 X220.411 Y110.948 E.03565
G2 X220.303 Y110.457 I-2.262 J.241 E.01673
G1 X220.633 Y110.173 E.01442
G3 X221.122 Y111.511 I-6.371 J3.089 E.04731
G1 X220.433 Y109.507 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.610608
G1 F11097.66
G1 X220.032 Y109.412 E.01907
G1 X219.649 Y108.86 E.03108
; LINE_WIDTH: 0.576135
G1 F11815.126
G1 X219.339 Y108.5 E.02065
G2 X218.386 Y107.68 I-4.236 J3.965 E.05473
; LINE_WIDTH: 0.621248
G1 F10893.487
G1 X218.138 Y107.518 E.01396
G1 X218.043 Y107.117 E.01942
G1 X217.243 Y107.29 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X217.425 Y107.365 E.00651
G1 X217.321 Y106.93 E.01482
G1 X217.376 Y106.917 E.00187
G2 X216.517 Y106.566 I-2.211 J4.186 E.03083
G1 X216.015 Y107.068 E.02355
G3 X216.593 Y107.13 I-.115 J3.822 E.01929
G1 X215.842 Y106.379 E.03524
G2 X214.277 Y106.2 I-1.804 J8.876 E.05232
G1 X209.207 Y106.2 E.16816
G1 X208.35 Y107.057 E.04022
G1 X208.845 Y107.057 E.01641
G1 X207.988 Y106.2 E.04022
G1 X201.531 Y106.2 E.21416
G1 X200.674 Y107.057 E.04022
G1 X201.169 Y107.057 E.01641
G1 X200.312 Y106.2 E.04022
G1 X193.856 Y106.2 E.21416
G1 X192.998 Y107.057 E.04022
G1 X193.493 Y107.057 E.01641
G1 X192.636 Y106.2 E.04022
G1 X186.18 Y106.2 E.21416
G1 X185.322 Y107.057 E.04022
G1 X185.817 Y107.057 E.01641
G1 X184.96 Y106.2 E.04022
G1 X178.504 Y106.2 E.21416
G1 X177.646 Y107.057 E.04022
G1 X178.141 Y107.057 E.01641
G1 X177.284 Y106.2 E.04022
G1 X170.828 Y106.2 E.21416
G1 X169.97 Y107.057 E.04022
G1 X170.465 Y107.057 E.01641
G1 X169.608 Y106.2 E.04022
G1 X163.152 Y106.2 E.21416
G1 X162.294 Y107.057 E.04022
G1 X162.789 Y107.057 E.01641
G1 X161.932 Y106.2 E.04022
G1 X155.476 Y106.2 E.21416
G1 X154.618 Y107.057 E.04022
G1 X155.113 Y107.057 E.01641
G1 X154.256 Y106.2 E.04022
G1 X147.8 Y106.2 E.21416
G1 X146.943 Y107.057 E.04022
G1 X147.437 Y107.057 E.01641
G1 X146.58 Y106.2 E.04022
G1 X140.124 Y106.2 E.21416
G1 X139.267 Y107.057 E.04022
G1 X139.761 Y107.057 E.01641
G1 X138.904 Y106.2 E.04022
G1 X132.448 Y106.2 E.21416
G1 X131.591 Y107.057 E.04022
G1 X132.085 Y107.057 E.01641
G1 X131.228 Y106.2 E.04022
G1 X124.772 Y106.2 E.21416
G1 X123.915 Y107.057 E.04022
G1 X124.409 Y107.057 E.01641
G1 X123.552 Y106.2 E.04022
G1 X117.096 Y106.2 E.21416
G1 X116.239 Y107.057 E.04022
G1 X116.733 Y107.057 E.01641
G1 X115.876 Y106.2 E.04022
G1 X109.42 Y106.2 E.21416
G1 X108.563 Y107.057 E.04022
G1 X109.057 Y107.057 E.01641
G1 X108.2 Y106.2 E.04022
G1 X101.744 Y106.2 E.21416
G1 X100.887 Y107.057 E.04022
G1 X101.382 Y107.057 E.01641
G1 X100.524 Y106.2 E.04022
G1 X94.068 Y106.2 E.21416
G1 X93.211 Y107.057 E.04022
G1 X93.706 Y107.057 E.01641
G1 X92.848 Y106.2 E.04022
G1 X86.392 Y106.2 E.21416
G1 X85.535 Y107.057 E.04022
G1 X86.03 Y107.057 E.01641
G1 X85.172 Y106.2 E.04022
G1 X78.716 Y106.2 E.21416
G1 X77.859 Y107.057 E.04022
G1 X78.354 Y107.057 E.01641
G1 X77.496 Y106.2 E.04022
G1 X71.04 Y106.2 E.21416
G1 X70.183 Y107.057 E.04022
G1 X70.678 Y107.057 E.01641
G1 X69.82 Y106.2 E.04022
G1 X63.364 Y106.2 E.21416
G1 X62.507 Y107.057 E.04022
G1 X63.002 Y107.057 E.01641
G1 X62.144 Y106.2 E.04022
G1 X55.688 Y106.2 E.21416
G1 X54.831 Y107.057 E.04022
G1 X55.326 Y107.057 E.01641
G1 X54.469 Y106.2 E.04022
G1 X48.012 Y106.2 E.21416
G1 X47.155 Y107.057 E.04022
G1 X47.65 Y107.057 E.01641
G1 X46.793 Y106.2 E.04022
G1 X41.723 Y106.2 E.16816
G2 X40.158 Y106.379 I.118 J7.988 E.05234
G1 X39.407 Y107.13 E.03524
G3 X39.985 Y107.068 I.692 J3.762 E.01929
G1 X39.483 Y106.566 E.02355
G2 X38.623 Y106.917 I1.353 J4.538 E.03084
G1 X38.674 Y106.929 E.00173
G1 X38.573 Y107.354 E.01447
G3 X38.775 Y107.294 I.327 J.737 E.007
G1 X37.958 Y107.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.610572
G1 F11098.361
G1 X37.862 Y107.518 E.01908
G1 X37.31 Y107.901 E.03107
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11098.361
G1 X37.862 Y107.518 E-.47087
M73 P91 R2
G1 X37.958 Y107.117 E-.28913
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/35
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.6 I-1.048 J-.619 P1  F30000
G1 X37.009 Y108.721 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X37.155 Y108.564 E.00713
G3 X40.178 Y107.334 I3.066 J3.208 E.11085
G1 X215.822 Y107.334 E5.82645
G3 X220.216 Y111.728 I-.044 J4.437 E.22832
G1 X220.216 Y140.272 E.94687
G3 X215.822 Y144.666 I-4.437 J-.044 E.22832
G1 X40.178 Y144.666 E5.82645
G3 X35.784 Y140.272 I.044 J-4.437 E.22832
G1 X35.784 Y111.728 E.94687
G3 X36.765 Y108.988 I4.437 J.044 E.09834
G1 X36.969 Y108.766 E.01
M204 S250
G1 X37.297 Y108.992 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.423 Y108.85 E.00584
G3 X40.192 Y107.726 I2.798 J2.921 E.09405
G1 X215.808 Y107.726 E5.39618
G3 X219.824 Y111.742 I-.029 J4.045 E.19346
G1 X219.824 Y140.258 E.87621
G3 X215.808 Y144.274 I-4.045 J-.029 E.19346
G1 X40.192 Y144.274 E5.39618
G3 X36.176 Y140.258 I.029 J-4.045 E.19346
G1 X36.176 Y111.742 E.87621
G3 X36.962 Y109.375 I4.045 J.029 E.0779
G1 X37.258 Y109.037 E.0138
; WIPE_START
M204 S10000
G1 X37.423 Y108.85 E-.09507
G1 X37.825 Y108.511 E-.19959
G1 X38.117 Y108.316 E-.13343
G1 X38.744 Y108.007 E-.26573
G1 X38.91 Y107.955 E-.06618
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19306
G1 X214.285 Y105.852 E5.72448
G1 X214.963 Y105.885 E.02252
G1 X215.025 Y105.888 E.00206
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.41 J.003 E.3863
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19107
M204 S250
G1 X36.186 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.196 Y107.746 E.00031
G3 X41.705 Y105.46 I5.519 J5.519 E.18806
G1 X214.295 Y105.46 E5.3032
G1 X214.982 Y105.494 E.02115
G1 X215.064 Y105.498 E.0025
G3 X222.09 Y113.255 I-.791 J7.777 E.35237
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.803 J-.007 E.37615
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.683 Y108.312 I7.805 J.01 E.16458
G1 X36.146 Y107.793 E.02138
; WIPE_START
M204 S10000
G1 X36.196 Y107.746 E-.02592
G1 X36.758 Y107.228 E-.29039
G1 X37.372 Y106.773 E-.29052
G1 X37.718 Y106.566 E-.15318
; WIPE_END
G1 E-.04 F1800
G1 X37.288 Y107.873 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533207
G1 F12849.634
G3 X37.678 Y107.596 I16.884 J23.363 E.01915
G1 X37.848 Y107.485 E.0081
; LINE_WIDTH: 0.577245
G1 F11790.591
G3 X38.215 Y107.284 I4.17 J7.186 E.01822
; LINE_WIDTH: 0.604196
G1 F11224.44
G3 X38.587 Y107.096 I5.806 J11.055 E.01905
G1 X39.29 Y107.086 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X39.004 Y107.15 I.153 J1.347 E.00974
G1 X38.836 Y106.817 E.01238
G3 X39.483 Y106.566 I1.596 J3.16 E.02304
G1 X39.924 Y107.008 E.02071
G1 X39.489 Y107.047 E.01448
G1 X40.156 Y106.381 E.03127
G3 X41.723 Y106.2 I1.666 J7.572 E.05242
G1 X46.793 Y106.2 E.16816
G1 X47.578 Y106.986 E.03686
G1 X47.227 Y106.986 E.01166
G1 X48.012 Y106.2 E.03686
G1 X54.469 Y106.2 E.21416
G1 X55.254 Y106.986 E.03686
G1 X54.903 Y106.986 E.01166
G1 X55.688 Y106.2 E.03686
G1 X62.144 Y106.2 E.21416
G1 X62.93 Y106.986 E.03686
G1 X62.579 Y106.986 E.01166
G1 X63.364 Y106.2 E.03686
G1 X69.82 Y106.2 E.21416
G1 X70.606 Y106.986 E.03686
G1 X70.255 Y106.986 E.01166
G1 X71.04 Y106.2 E.03686
G1 X77.496 Y106.2 E.21416
G1 X78.282 Y106.986 E.03686
G1 X77.93 Y106.986 E.01166
G1 X78.716 Y106.2 E.03686
G1 X85.172 Y106.2 E.21416
G1 X85.958 Y106.986 E.03686
G1 X85.606 Y106.986 E.01166
G1 X86.392 Y106.2 E.03686
G1 X92.848 Y106.2 E.21416
G1 X93.634 Y106.986 E.03686
G1 X93.282 Y106.986 E.01166
G1 X94.068 Y106.2 E.03686
G1 X100.524 Y106.2 E.21416
G1 X101.31 Y106.986 E.03686
G1 X100.958 Y106.986 E.01166
G1 X101.744 Y106.2 E.03686
G1 X108.2 Y106.2 E.21416
G1 X108.986 Y106.986 E.03686
G1 X108.634 Y106.986 E.01166
G1 X109.42 Y106.2 E.03686
G1 X115.876 Y106.2 E.21416
G1 X116.662 Y106.986 E.03686
G1 X116.31 Y106.986 E.01166
G1 X117.096 Y106.2 E.03686
G1 X123.552 Y106.2 E.21416
G1 X124.338 Y106.986 E.03686
G1 X123.986 Y106.986 E.01166
G1 X124.772 Y106.2 E.03686
G1 X131.228 Y106.2 E.21416
G1 X132.014 Y106.986 E.03686
G1 X131.662 Y106.986 E.01166
G1 X132.448 Y106.2 E.03686
G1 X138.904 Y106.2 E.21416
G1 X139.69 Y106.986 E.03686
G1 X139.338 Y106.986 E.01166
G1 X140.124 Y106.2 E.03686
G1 X146.58 Y106.2 E.21416
G1 X147.366 Y106.986 E.03686
G1 X147.014 Y106.986 E.01166
G1 X147.8 Y106.2 E.03686
G1 X154.256 Y106.2 E.21416
G1 X155.042 Y106.986 E.03686
G1 X154.69 Y106.986 E.01166
G1 X155.476 Y106.2 E.03686
G1 X161.932 Y106.2 E.21416
G1 X162.718 Y106.986 E.03686
G1 X162.366 Y106.986 E.01166
G1 X163.152 Y106.2 E.03686
G1 X169.608 Y106.2 E.21416
G1 X170.394 Y106.986 E.03686
G1 X170.042 Y106.986 E.01166
G1 X170.828 Y106.2 E.03686
G1 X177.284 Y106.2 E.21416
G1 X178.069 Y106.986 E.03686
G1 X177.718 Y106.986 E.01166
G1 X178.504 Y106.2 E.03686
G1 X184.96 Y106.2 E.21416
G1 X185.745 Y106.986 E.03686
G1 X185.394 Y106.986 E.01166
G1 X186.18 Y106.2 E.03686
G1 X192.636 Y106.2 E.21416
G1 X193.421 Y106.986 E.03686
G1 X193.07 Y106.986 E.01166
G1 X193.856 Y106.2 E.03686
G1 X200.312 Y106.2 E.21416
G1 X201.097 Y106.986 E.03686
G1 X200.746 Y106.986 E.01166
G1 X201.531 Y106.2 E.03686
G1 X207.988 Y106.2 E.21416
G1 X208.773 Y106.986 E.03686
G1 X208.422 Y106.986 E.01166
G1 X209.207 Y106.2 E.03686
G1 X214.277 Y106.2 E.16816
G3 X215.842 Y106.379 I-.201 J8.723 E.05233
G1 X216.511 Y107.047 E.03137
G1 X216.076 Y107.008 E.01448
G1 X216.517 Y106.566 E.02071
G3 X217.164 Y106.817 I-.949 J3.41 E.02304
G1 X216.995 Y107.153 E.01248
G1 X216.71 Y107.089 E.0097
G1 X217.413 Y107.096 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.604612
G1 F11216.12
G1 X217.769 Y107.275 E.01823
; LINE_WIDTH: 0.579115
G1 F11749.462
G3 X218.128 Y107.471 I-5.848 J11.174 E.01786
; LINE_WIDTH: 0.551236
G1 F12393.875
G3 X218.322 Y107.596 I-.948 J1.679 E.00956
; LINE_WIDTH: 0.509778
G1 F13494.474
G3 X219.297 Y108.404 I-3.088 J4.72 E.04828
G1 X219.677 Y108.838 E.02193
; LINE_WIDTH: 0.533218
G1 F12849.336
G3 X219.954 Y109.228 I-23.543 J17.012 E.01915
G1 X220.065 Y109.398 E.00809
; LINE_WIDTH: 0.577223
G1 F11791.074
G3 X220.266 Y109.765 I-7.109 J4.128 E.01823
; LINE_WIDTH: 0.604199
G1 F11224.369
G3 X220.454 Y110.137 I-11.293 J5.927 E.01905
G1 X220.564 Y112.654 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X220.493 Y111.03 I-7.829 J-.472 E.05402
G1 X221.171 Y111.708 E.03181
G3 X221.35 Y113.273 I-7.811 J1.683 E.05234
G1 X221.35 Y117.086 E.12647
G1 X220.564 Y117.871 E.03686
G1 X220.564 Y118.777 E.03003
G1 X221.35 Y119.562 E.03686
G1 X221.35 Y124.762 E.17247
G1 X220.564 Y125.547 E.03686
G1 X220.564 Y126.453 E.03003
G1 X221.35 Y127.238 E.03686
G1 X221.35 Y132.438 E.17247
G1 X220.564 Y133.223 E.03686
G1 X220.564 Y134.129 E.03003
G1 X221.35 Y134.914 E.03686
G3 X221.315 Y139.441 I-46.072 J1.906 E.15022
G3 X221.171 Y140.292 I-4.391 J-.301 E.02868
G1 X220.503 Y140.961 E.03137
G2 X220.564 Y139.335 I-8.883 J-1.149 E.05403
G1 X220.454 Y141.863 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.604208
G1 F11224.2
G3 X220.266 Y142.235 I-11.25 J-5.438 E.01905
; LINE_WIDTH: 0.57725
G1 F11790.472
G3 X220.065 Y142.602 I-7.387 J-3.803 E.01822
; LINE_WIDTH: 0.533214
G1 F12849.453
G1 X219.954 Y142.772 E.0081
G3 X219.677 Y143.162 I-23.796 J-16.604 E.01915
; LINE_WIDTH: 0.509778
G1 F13494.463
G1 X219.297 Y143.596 E.02193
G3 X218.322 Y144.404 I-4.064 J-3.912 E.04828
; LINE_WIDTH: 0.551252
G1 F12393.484
G3 X218.128 Y144.529 I-1.144 J-1.558 E.00956
; LINE_WIDTH: 0.579116
G1 F11749.438
G3 X217.769 Y144.725 I-6.207 J-10.978 E.01786
; LINE_WIDTH: 0.604599
G1 F11216.375
G1 X217.413 Y144.904 E.01823
G1 X216.71 Y144.914 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X216.996 Y144.85 I-.154 J-1.347 E.00974
G1 X217.164 Y145.183 E.01237
G3 X216.517 Y145.434 I-1.596 J-3.159 E.02304
G1 X216.076 Y144.992 E.02071
G1 X216.511 Y144.953 E.01448
G1 X215.842 Y145.621 E.03137
G3 X214.277 Y145.8 I-1.683 J-7.808 E.05234
G1 X209.207 Y145.8 E.16816
G1 X208.422 Y145.014 E.03686
G1 X208.773 Y145.014 E.01166
G1 X207.988 Y145.8 E.03686
G1 X201.531 Y145.8 E.21416
G1 X200.746 Y145.014 E.03686
G1 X201.097 Y145.014 E.01166
G1 X200.312 Y145.8 E.03686
G1 X193.856 Y145.8 E.21416
G1 X193.07 Y145.014 E.03686
G1 X193.421 Y145.014 E.01166
G1 X192.636 Y145.8 E.03686
G1 X186.18 Y145.8 E.21416
G1 X185.394 Y145.014 E.03686
G1 X185.745 Y145.014 E.01166
G1 X184.96 Y145.8 E.03686
G1 X178.504 Y145.8 E.21416
G1 X177.718 Y145.014 E.03686
G1 X178.07 Y145.014 E.01166
G1 X177.284 Y145.8 E.03686
G1 X170.828 Y145.8 E.21416
G1 X170.042 Y145.014 E.03686
G1 X170.394 Y145.014 E.01166
G1 X169.608 Y145.8 E.03686
G1 X163.152 Y145.8 E.21416
G1 X162.366 Y145.014 E.03686
G1 X162.718 Y145.014 E.01166
G1 X161.932 Y145.8 E.03686
G1 X155.476 Y145.8 E.21416
G1 X154.69 Y145.014 E.03686
G1 X155.042 Y145.014 E.01166
G1 X154.256 Y145.8 E.03686
G1 X147.8 Y145.8 E.21416
G1 X147.014 Y145.014 E.03686
G1 X147.366 Y145.014 E.01166
G1 X146.58 Y145.8 E.03686
G1 X140.124 Y145.8 E.21416
G1 X139.338 Y145.014 E.03686
G1 X139.69 Y145.014 E.01166
G1 X138.904 Y145.8 E.03686
G1 X132.448 Y145.8 E.21416
G1 X131.662 Y145.014 E.03686
G1 X132.014 Y145.014 E.01166
G1 X131.228 Y145.8 E.03686
G1 X124.772 Y145.8 E.21416
G1 X123.986 Y145.014 E.03686
G1 X124.338 Y145.014 E.01166
G1 X123.552 Y145.8 E.03686
G1 X117.096 Y145.8 E.21416
G1 X116.31 Y145.014 E.03686
G1 X116.662 Y145.014 E.01166
G1 X115.876 Y145.8 E.03686
G1 X109.42 Y145.8 E.21416
G1 X108.634 Y145.014 E.03686
G1 X108.986 Y145.014 E.01166
G1 X108.2 Y145.8 E.03686
G1 X101.744 Y145.8 E.21416
G1 X100.958 Y145.014 E.03686
G1 X101.31 Y145.014 E.01166
G1 X100.524 Y145.8 E.03686
G1 X94.068 Y145.8 E.21416
G1 X93.282 Y145.014 E.03686
G1 X93.634 Y145.014 E.01166
G1 X92.848 Y145.8 E.03686
G1 X86.392 Y145.8 E.21416
G1 X85.606 Y145.014 E.03686
G1 X85.958 Y145.014 E.01166
G1 X85.172 Y145.8 E.03686
G1 X78.716 Y145.8 E.21416
G1 X77.93 Y145.014 E.03686
G1 X78.282 Y145.014 E.01166
G1 X77.496 Y145.8 E.03686
M73 P92 R2
G1 X71.04 Y145.8 E.21416
G1 X70.255 Y145.014 E.03686
G1 X70.606 Y145.014 E.01166
G1 X69.82 Y145.8 E.03686
G1 X63.364 Y145.8 E.21416
G1 X62.579 Y145.014 E.03686
G1 X62.93 Y145.014 E.01166
G1 X62.144 Y145.8 E.03686
G1 X55.688 Y145.8 E.21416
G1 X54.903 Y145.014 E.03686
G1 X55.254 Y145.014 E.01166
G1 X54.469 Y145.8 E.03686
G1 X48.012 Y145.8 E.21416
G1 X47.227 Y145.014 E.03686
G1 X47.578 Y145.014 E.01166
G1 X46.793 Y145.8 E.03686
G1 X41.723 Y145.8 E.16816
G3 X40.158 Y145.621 I.118 J-7.988 E.05234
G1 X39.489 Y144.953 E.03137
G1 X39.924 Y144.992 E.01448
G1 X39.483 Y145.434 E.02071
G3 X38.836 Y145.183 I.95 J-3.411 E.02304
G1 X39.005 Y144.847 E.01248
G1 X39.29 Y144.911 E.0097
G1 X38.587 Y144.904 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.604205
G1 F11224.256
G3 X38.215 Y144.716 I5.438 J-11.251 E.01905
; LINE_WIDTH: 0.577236
G1 F11790.777
G3 X37.848 Y144.515 I3.848 J-7.469 E.01823
; LINE_WIDTH: 0.533205
G1 F12849.681
G1 X37.678 Y144.404 E.0081
G3 X37.287 Y144.127 I16.49 J-23.636 E.01915
; LINE_WIDTH: 0.509782
G1 F13494.348
G1 X36.854 Y143.747 E.02192
G3 X36.046 Y142.772 I3.911 J-4.063 E.04828
; LINE_WIDTH: 0.551249
G1 F12393.559
G3 X35.921 Y142.578 I1.56 J-1.145 E.00956
; LINE_WIDTH: 0.579103
G1 F11749.73
G3 X35.725 Y142.219 I10.64 J-6.022 E.01786
; LINE_WIDTH: 0.604605
G1 F11216.259
G1 X35.546 Y141.863 E.01823
G1 X35.436 Y139.346 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X35.507 Y140.97 I7.829 J.472 E.05402
G1 X34.829 Y140.292 E.03181
G3 X34.65 Y138.727 I7.811 J-1.683 E.05234
G1 X34.65 Y134.914 E.12647
G1 X35.436 Y134.129 E.03686
G1 X35.436 Y133.223 E.03003
G1 X34.65 Y132.438 E.03686
G1 X34.65 Y127.238 E.17247
G1 X35.436 Y126.453 E.03686
G1 X35.436 Y125.547 E.03003
G1 X34.65 Y124.762 E.03686
G1 X34.65 Y119.562 E.17247
G1 X35.436 Y118.777 E.03686
G1 X35.436 Y117.871 E.03003
G1 X34.65 Y117.086 E.03686
G3 X34.685 Y112.559 I46.072 J-1.906 E.15022
G3 X34.829 Y111.708 I4.391 J.301 E.02868
G1 X35.507 Y111.03 E.03181
G2 X35.436 Y112.654 I7.759 J1.152 E.05402
G1 X35.546 Y110.137 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.604598
G1 F11216.397
G1 X35.725 Y109.781 E.01823
; LINE_WIDTH: 0.579096
G1 F11749.889
G3 X35.921 Y109.422 I10.674 J5.576 E.01786
; LINE_WIDTH: 0.551243
G1 F12393.713
G3 X36.046 Y109.228 I1.68 J.948 E.00956
; LINE_WIDTH: 0.509779
G1 F13494.436
G3 X37.168 Y107.973 I4.985 J3.327 E.06425
G1 X37.288 Y107.873 E.00594
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13494.436
G1 X37.168 Y107.973 E-.06431
G1 X36.693 Y108.415 E-.267
G1 X36.323 Y108.838 E-.23133
G1 X36.046 Y109.228 E-.19736
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/35
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.8 I.618 J1.048 P1  F30000
G1 X36.936 Y108.704 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X37.057 Y108.58 E.00575
G3 X40.183 Y107.28 I3.158 J3.185 E.11515
G1 X215.817 Y107.28 E5.82611
G3 X220.27 Y111.732 I-.036 J4.489 E.23151
G1 X220.27 Y140.267 E.94655
G3 X215.817 Y144.72 I-4.474 J-.021 E.23173
G1 X40.183 Y144.72 E5.82611
G3 X35.73 Y140.268 I.036 J-4.489 E.23151
G1 X35.73 Y111.732 E.94657
G3 X36.647 Y109.048 I4.486 J.033 E.09575
G1 X36.897 Y108.75 E.01291
M204 S250
G1 X37.23 Y108.962 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.334 Y108.858 E.00451
G3 X40.194 Y107.672 I2.882 J2.907 E.09757
G1 X215.806 Y107.672 E5.39607
G3 X219.878 Y111.744 I-.024 J4.096 E.19622
G1 X219.878 Y140.256 E.8761
G3 X215.806 Y144.328 I-4.081 J-.009 E.19643
G1 X40.194 Y144.328 E5.39607
G3 X36.122 Y140.256 I.024 J-4.096 E.19622
G1 X36.122 Y111.744 E.87611
G3 X36.958 Y109.286 I4.093 J.022 E.08119
G1 X37.192 Y109.008 E.01114
; WIPE_START
M204 S10000
G1 X37.334 Y108.858 E-.07855
G1 X37.73 Y108.502 E-.20264
G1 X38.144 Y108.225 E-.18913
G1 X38.655 Y107.973 E-.21652
G1 X38.838 Y107.912 E-.07316
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19306
G1 X214.285 Y105.852 E5.72448
G1 X214.989 Y105.887 E.02338
G1 X215.025 Y105.888 E.00119
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I.009 J-7.421 E.38613
G1 X34.302 Y113.265 E.8449
G3 X36.434 Y108.068 I7.421 J.009 E.19108
M204 S250
G1 X36.186 Y107.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.194 Y107.744 E.00028
G3 X41.705 Y105.46 I5.515 J5.515 E.1881
G1 X214.295 Y105.46 E5.3032
G1 X215.008 Y105.495 E.02196
G1 X215.064 Y105.498 E.00169
G3 X222.09 Y113.255 I-.791 J7.777 E.35237
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I.018 J-7.813 E.37601
G1 X33.91 Y113.255 E.78322
G3 X35.681 Y108.31 I7.799 J.004 E.16461
G1 X36.146 Y107.793 E.02137
; WIPE_START
M204 S10000
G1 X36.194 Y107.744 E-.02609
G1 X36.758 Y107.229 E-.2904
G1 X37.372 Y106.773 E-.29055
G1 X37.718 Y106.566 E-.15296
; WIPE_END
G1 E-.04 F1800
G1 X37.267 Y107.848 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.471283
G1 F14707.156
G3 X37.748 Y107.51 I5.39 J7.168 E.02054
G1 X37.831 Y107.46 E.00339
; LINE_WIDTH: 0.5241
G1 F13092.814
G1 X38.317 Y107.195 E.02169
; LINE_WIDTH: 0.54928
G1 F12441.76
G1 X38.347 Y107.18 E.00142
; LINE_WIDTH: 0.582367
G1 F11678.624
G3 X38.906 Y106.95 I2.617 J5.573 E.02656
G1 X37.267 Y107.848 F30000
; LINE_WIDTH: 0.451089
G1 F15000
G1 X37.255 Y107.858 E.0005
G2 X35.955 Y109.306 I4.058 J4.948 E.06499
; LINE_WIDTH: 0.491542
G1 F14043.013
G1 X35.909 Y109.38 E.00319
; LINE_WIDTH: 0.521611
G1 F13160.911
G2 X35.647 Y109.863 I7.245 J4.243 E.02141
; LINE_WIDTH: 0.560394
G1 F12174.522
G1 X35.591 Y109.985 E.00567
; LINE_WIDTH: 0.587338
G1 F11572.007
G1 X35.403 Y110.45 E.02225
G1 X34.994 Y111.225 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43609
G1 F12000
G1 X34.93 Y111.553 E.01068
; LINE_WIDTH: 0.47049
G1 X34.866 Y111.88 E.01161
; LINE_WIDTH: 0.51202
G1 X34.789 Y112.557 E.02607
; LINE_WIDTH: 0.552827
G2 X34.761 Y113.282 I25.579 J1.353 E.03015
G1 X34.761 Y138.724 E1.05714
G1 X34.786 Y139.419 E.02888
; LINE_WIDTH: 0.51203
G1 X34.862 Y140.099 E.02616
; LINE_WIDTH: 0.4705
G1 X34.928 Y140.437 E.012
; LINE_WIDTH: 0.43608
G1 X34.994 Y140.775 E.01103
; LINE_WIDTH: 0.394139
G1 X35.146 Y141.25 E.01428
G1 X35.442 Y141.13 E.00914
G1 X35.415 Y140.992 E.00404
; LINE_WIDTH: 0.403955
G1 X35.367 Y140.639 E.01048
; LINE_WIDTH: 0.440965
G1 X35.318 Y140.286 E.01155
; LINE_WIDTH: 0.47869
G1 X35.299 Y139.846 E.01563
; LINE_WIDTH: 0.51713
G1 X35.28 Y139.407 E.017
; LINE_WIDTH: 0.552836
G1 X35.28 Y112.593 E1.11414
; LINE_WIDTH: 0.51202
G1 X35.304 Y111.934 E.02524
; LINE_WIDTH: 0.47049
G1 X35.334 Y111.608 E.0114
; LINE_WIDTH: 0.43609
G1 X35.364 Y111.282 E.01048
; LINE_WIDTH: 0.397649
G1 X35.442 Y110.87 E.01213
G1 X35.146 Y110.75 E.00924
G1 X35.012 Y111.168 E.01269
G1 X35.403 Y141.55 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.587338
G1 F11571.991
G1 X35.591 Y142.015 E.02225
; LINE_WIDTH: 0.560417
G1 F12173.989
G1 X35.647 Y142.137 E.00567
; LINE_WIDTH: 0.521604
G1 F13161.091
G2 X35.909 Y142.62 I7.443 J-3.726 E.02141
; LINE_WIDTH: 0.49153
G1 F14043.395
G1 X35.955 Y142.694 E.00319
; LINE_WIDTH: 0.451088
G1 F15000
G2 X37.255 Y144.143 I5.341 J-3.484 E.06502
; LINE_WIDTH: 0.471571
G1 F14697.291
G2 X37.78 Y144.51 I37.918 J-53.579 E.02236
G1 X37.83 Y144.541 E.00208
; LINE_WIDTH: 0.520157
G1 F13201.002
G1 X38.282 Y144.787 E.01999
; LINE_WIDTH: 0.55693
G1 F12256.585
G2 X38.434 Y144.859 I1.22 J-2.382 E.00708
; LINE_WIDTH: 0.586447
G1 F11590.963
G1 X38.898 Y145.048 E.02218
G1 X39.734 Y145.084 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.39776
G1 F12000
G1 X39.319 Y145.008 E.0122
G1 X39.198 Y145.304 E.00925
G1 X39.676 Y145.455 E.01448
; LINE_WIDTH: 0.437243
G1 X40.003 Y145.52 E.01071
; LINE_WIDTH: 0.470868
G1 X40.33 Y145.584 E.01162
; LINE_WIDTH: 0.51201
G1 X41.007 Y145.661 E.02607
; LINE_WIDTH: 0.553187
G2 X41.732 Y145.689 I1.355 J-25.648 E.03017
G1 X214.274 Y145.689 E7.17434
G1 X214.969 Y145.664 E.0289
; LINE_WIDTH: 0.51202
G1 X215.649 Y145.588 E.02615
; LINE_WIDTH: 0.47087
G1 X215.987 Y145.522 E.01201
; LINE_WIDTH: 0.43721
G1 X216.324 Y145.455 E.01106
; LINE_WIDTH: 0.395655
G1 X216.794 Y145.307 E.01414
G1 X216.674 Y145.01 E.00919
; LINE_WIDTH: 0.403468
G1 X216.256 Y145.071 E.01242
; LINE_WIDTH: 0.440603
G1 X215.838 Y145.131 E.0137
; LINE_WIDTH: 0.478463
G1 X215.397 Y145.151 E.01565
; LINE_WIDTH: 0.517048
G1 X214.957 Y145.17 E.01703
; LINE_WIDTH: 0.553188
G1 X41.043 Y145.17 E7.23138
; LINE_WIDTH: 0.51201
G1 X40.384 Y145.146 E.02523
; LINE_WIDTH: 0.470868
G1 X40.089 Y145.118 E.01033
; LINE_WIDTH: 0.437243
G1 X39.794 Y145.089 E.00952
G1 X217.094 Y145.05 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.586153
G1 F11597.234
G1 X217.566 Y144.86 E.02251
; LINE_WIDTH: 0.559095
G1 F12205.169
G2 X217.681 Y144.806 I-.767 J-1.778 E.00533
; LINE_WIDTH: 0.523194
G1 F13117.534
G1 X218.169 Y144.541 E.02176
; LINE_WIDTH: 0.491339
G1 F14049.363
G1 X218.245 Y144.494 E.00324
; LINE_WIDTH: 0.450767
G1 F15000
G2 X219.667 Y143.226 I-3.444 J-5.293 E.0636
G1 X219.701 Y143.182 E.00182
; LINE_WIDTH: 0.472959
G1 F14649.85
G2 X220.061 Y142.669 I-7.363 J-5.551 E.02196
G1 X220.091 Y142.62 E.00204
; LINE_WIDTH: 0.523163
G1 F13118.359
G1 X220.356 Y142.131 E.02177
; LINE_WIDTH: 0.549724
G1 F12430.856
G1 X220.371 Y142.101 E.00137
; LINE_WIDTH: 0.582433
G1 F11677.211
G2 X220.6 Y141.544 I-5.544 J-2.603 E.02647
G1 X221.005 Y140.774 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43723
G1 F12000
G1 X221.07 Y140.447 E.01071
; LINE_WIDTH: 0.47087
G1 X221.134 Y140.12 E.01162
; LINE_WIDTH: 0.512015
G1 X221.211 Y139.443 E.02607
; LINE_WIDTH: 0.552815
G2 X221.239 Y138.718 I-25.579 J-1.353 E.03015
G1 X221.239 Y113.282 E1.05685
G1 X221.214 Y112.581 E.02914
; LINE_WIDTH: 0.51202
G1 X221.138 Y111.901 E.02616
; LINE_WIDTH: 0.470488
G1 X221.072 Y111.563 E.012
; LINE_WIDTH: 0.436063
G1 X221.006 Y111.225 E.01103
; LINE_WIDTH: 0.395638
G1 X220.854 Y110.75 E.01434
G1 X220.558 Y110.87 E.00918
; LINE_WIDTH: 0.403958
G1 X220.62 Y111.292 E.01255
; LINE_WIDTH: 0.440953
G1 X220.682 Y111.714 E.01384
; LINE_WIDTH: 0.478673
G1 X220.701 Y112.154 E.01563
; LINE_WIDTH: 0.517118
G1 X220.72 Y112.593 E.017
; LINE_WIDTH: 0.552826
G1 X220.72 Y139.407 E1.11411
; LINE_WIDTH: 0.512015
G1 X220.696 Y140.066 E.02524
; LINE_WIDTH: 0.47087
G1 X220.665 Y140.391 E.01138
; LINE_WIDTH: 0.43723
G1 X220.634 Y140.716 E.01048
; LINE_WIDTH: 0.397786
G1 X220.56 Y141.125 E.012
G1 X220.857 Y141.244 E.00924
G1 X220.987 Y140.831 E.0125
G1 X220.597 Y110.45 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.587338
G1 F11572
G1 X220.409 Y109.985 E.02225
; LINE_WIDTH: 0.55713
G1 F12251.818
G2 X220.338 Y109.833 I-2.353 J1.015 E.00701
; LINE_WIDTH: 0.520202
G1 F13199.752
G1 X220.091 Y109.38 E.02006
; LINE_WIDTH: 0.471645
G1 F14694.757
G1 X220.06 Y109.33 E.00207
G2 X219.694 Y108.807 I-56.781 J39.368 E.02229
; LINE_WIDTH: 0.451081
G1 F15000
G2 X218.244 Y107.505 I-4.952 J4.058 E.06508
; LINE_WIDTH: 0.491544
G1 F14042.942
G1 X218.17 Y107.459 E.0032
; LINE_WIDTH: 0.521496
G1 F13164.069
G2 X217.69 Y107.198 I-4.357 J7.457 E.02128
; LINE_WIDTH: 0.560047
G1 F12182.703
G1 X217.565 Y107.14 E.00579
; LINE_WIDTH: 0.586461
G1 F11590.659
G1 X217.102 Y106.952 E.02218
G1 X216.266 Y106.916 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.397761
G1 F12000
G1 X216.681 Y106.992 E.0122
G1 X216.802 Y106.696 E.00925
G1 X216.324 Y106.545 E.01448
; LINE_WIDTH: 0.43719
G1 X215.998 Y106.48 E.01068
; LINE_WIDTH: 0.47073
G1 X215.672 Y106.416 E.01159
; LINE_WIDTH: 0.51234
G1 X214.957 Y106.337 E.02749
; LINE_WIDTH: 0.55319
G2 X214.268 Y106.311 I-1.29 J24.472 E.0287
G1 X41.726 Y106.311 E7.17439
G1 X41.031 Y106.336 E.0289
; LINE_WIDTH: 0.51201
G1 X40.351 Y106.412 E.02616
; LINE_WIDTH: 0.470863
G1 X40.013 Y106.478 E.012
; LINE_WIDTH: 0.437228
G1 X39.676 Y106.545 E.01106
; LINE_WIDTH: 0.39568
G1 X39.206 Y106.693 E.01415
G1 X39.326 Y106.989 E.00919
; LINE_WIDTH: 0.40348
G1 X39.744 Y106.929 E.01242
; LINE_WIDTH: 0.4406
G1 X40.162 Y106.869 E.0137
; LINE_WIDTH: 0.478455
G1 X40.603 Y106.849 E.01565
; LINE_WIDTH: 0.517045
G1 X41.043 Y106.83 E.01703
; LINE_WIDTH: 0.553192
G1 X214.922 Y106.829 E7.23
; LINE_WIDTH: 0.51234
G1 X215.618 Y106.854 E.02662
; LINE_WIDTH: 0.47073
G1 X215.912 Y106.882 E.0103
; LINE_WIDTH: 0.43719
G1 X216.206 Y106.911 E.00949
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X215.912 Y106.882 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/35
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6 I-.012 J-1.217 P1  F30000
G1 X36.888 Y108.69 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X36.915 Y108.661 E.00131
G3 X40.177 Y107.23 I3.313 J3.117 E.12142
G1 X215.823 Y107.23 E5.82647
G3 X220.32 Y111.727 I-.051 J4.549 E.23364
G1 X220.32 Y140.273 E.9469
G3 X215.823 Y144.77 I-4.549 J-.051 E.23364
G1 X40.177 Y144.77 E5.82647
G3 X35.68 Y140.273 I.051 J-4.549 E.23364
G1 X35.68 Y111.727 E.9469
G3 X36.709 Y108.897 I4.549 J.051 E.10184
G1 X36.849 Y108.735 E.00708
M204 S250
G1 X37.183 Y108.948 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.202 Y108.929 E.00082
G3 X40.192 Y107.622 I3.027 J2.849 E.10306
G1 X215.808 Y107.622 E5.39619
G3 X219.928 Y111.742 I-.036 J4.157 E.1984
G1 X219.928 Y140.258 E.87621
G3 X215.808 Y144.378 I-4.157 J-.036 E.1984
G1 X40.192 Y144.378 E5.39619
G3 X36.072 Y140.258 I.036 J-4.157 E.1984
G1 X36.072 Y111.742 E.87621
G3 X37.012 Y109.145 I4.157 J.036 E.08651
G1 X37.143 Y108.993 E.00617
; WIPE_START
M204 S10000
G1 X37.202 Y108.929 E-.03289
G1 X37.594 Y108.561 E-.20466
G1 X37.794 Y108.407 E-.09567
G1 X38.251 Y108.122 E-.20463
G1 X38.508 Y107.995 E-.10928
G1 X38.787 Y107.891 E-.11287
; WIPE_END
G1 E-.04 F1800
G1 X36.476 Y108.026 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.248 J5.248 E.19306
G1 X214.285 Y105.852 E5.72448
G1 X215.015 Y105.888 E.02425
G1 X215.025 Y105.888 E.00032
G3 X221.698 Y113.265 I-.751 J7.386 E.36156
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.421 J-.009 E.38613
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I-.007 J-7.406 E.38635
G1 X34.302 Y113.265 E.8449
G3 X36.433 Y108.068 I7.421 J.009 E.19108
M204 S250
G1 X36.199 Y107.736 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.76 Y107.23 E.0232
G3 X41.705 Y105.46 I4.947 J6.026 E.16462
G1 X214.295 Y105.46 E5.3032
G1 X215.035 Y105.496 E.02276
G1 X215.064 Y105.498 E.00089
G3 X222.09 Y113.255 I-.791 J7.777 E.35236
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.813 J-.018 E.37601
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I0 J-7.795 E.37624
G1 X33.91 Y113.255 E.78322
G3 X36.158 Y107.779 I7.797 J.001 E.18656
; WIPE_START
M204 S10000
G1 X36.76 Y107.23 E-.30955
G1 X37.372 Y106.773 E-.2905
G1 X37.733 Y106.557 E-.15995
; WIPE_END
G1 E-.04 F1800
G1 X37.255 Y107.834 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.406407
G1 F15000
G1 X36.846 Y108.191 E.01607
G2 X36.023 Y109.171 I3.946 J4.15 E.03798
; LINE_WIDTH: 0.449393
G2 X35.859 Y109.427 I2.493 J1.777 E.01009
; LINE_WIDTH: 0.475371
G1 F14568.123
G1 X35.696 Y109.727 E.01203
; LINE_WIDTH: 0.512292
G1 F13422.187
G2 X35.559 Y110.002 I2.26 J1.293 E.01176
; LINE_WIDTH: 0.552304
G1 F12367.894
G1 X35.43 Y110.321 E.01429
; LINE_WIDTH: 0.583403
G1 F11656.253
G1 X35.293 Y110.695 E.01754
G1 X35.234 Y113.282 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51974
G1 F13212.533
G1 X35.242 Y112.591 E.02684
; LINE_WIDTH: 0.486835
G1 F14191.906
G1 X35.266 Y111.929 E.02397
; LINE_WIDTH: 0.447168
G1 F15000
G1 X35.302 Y111.606 E.01069
; LINE_WIDTH: 0.411808
G2 X35.354 Y111.125 I-17.169 J-2.073 E.01453
M73 P93 R2
G1 X35.059 Y111.017 E.00945
G1 X34.899 Y111.633 E.01911
; LINE_WIDTH: 0.452288
G1 X34.838 Y112.095 E.01555
; LINE_WIDTH: 0.491603
G1 F14041.109
G1 X34.776 Y112.557 E.01704
; LINE_WIDTH: 0.527775
G1 F12993.581
G2 X34.748 Y113.282 I25.098 J1.331 E.02867
G1 X34.748 Y138.724 E1.00524
G1 X34.774 Y139.421 E.02752
; LINE_WIDTH: 0.486835
G1 F14191.906
G1 X34.849 Y140.102 E.0248
; LINE_WIDTH: 0.44784
G1 F15000
G1 X34.918 Y140.44 E.01136
; LINE_WIDTH: 0.40896
G2 X35.059 Y140.981 I2.021 J-.237 E.01675
G1 X35.359 Y140.871 E.00953
G1 X35.342 Y140.713 E.00473
; LINE_WIDTH: 0.4187
G1 X35.304 Y140.392 E.0099
; LINE_WIDTH: 0.44784
G1 X35.266 Y140.071 E.01067
; LINE_WIDTH: 0.486835
G1 F14191.906
G1 X35.242 Y139.409 E.02397
; LINE_WIDTH: 0.527996
G1 F12987.674
G1 X35.234 Y113.342 E1.03039
; WIPE_START
G1 X35.234 Y115.342 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.218 Y107.971 Z6.2 F30000
G1 X37.255 Y107.834 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43042
G1 F15000
G1 X37.82 Y107.442 E.02169
; LINE_WIDTH: 0.472357
G1 F14670.391
G1 X38.164 Y107.252 E.01376
; LINE_WIDTH: 0.509115
G1 F13513.674
G1 X38.424 Y107.121 E.01108
; LINE_WIDTH: 0.549605
G1 F12433.758
G1 X38.755 Y106.986 E.01476
; LINE_WIDTH: 0.582907
G1 F11666.964
G3 X39.145 Y106.843 I4.508 J11.652 E.01828
; WIPE_START
G1 X38.755 Y106.986 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.989 Y114.58 Z6.2 F30000
G1 X35.293 Y141.305 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.583405
G1 F11656.205
G1 X35.43 Y141.678 E.01754
; LINE_WIDTH: 0.552319
G1 F12367.536
G1 X35.559 Y141.998 E.01429
; LINE_WIDTH: 0.512307
G1 F13421.773
G2 X35.696 Y142.273 I2.408 J-1.023 E.01176
; LINE_WIDTH: 0.475386
G1 F14567.634
G1 X35.859 Y142.573 E.01203
; LINE_WIDTH: 0.449393
G1 F15000
G2 X36.023 Y142.829 I2.665 J-1.525 E.01009
; LINE_WIDTH: 0.406402
G2 X36.846 Y143.809 I4.769 J-3.17 E.03798
G1 X37.255 Y144.166 E.01608
; LINE_WIDTH: 0.430413
G1 X37.82 Y144.558 E.02169
; LINE_WIDTH: 0.47234
G1 F14670.963
G1 X38.164 Y144.748 E.01377
; LINE_WIDTH: 0.509114
G1 F13513.7
G1 X38.424 Y144.879 E.01107
; LINE_WIDTH: 0.549598
G1 F12433.944
G1 X38.755 Y145.014 E.01476
; LINE_WIDTH: 0.582888
G1 F11667.358
G2 X39.145 Y145.157 I4.661 J-12.068 E.01828
G1 X41.732 Y145.216 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51973
G1 F13212.811
G1 X41.041 Y145.208 E.02684
; LINE_WIDTH: 0.48683
G1 F14192.065
G1 X40.379 Y145.184 E.02397
; LINE_WIDTH: 0.447168
G1 F15000
G1 X40.056 Y145.148 E.01069
; LINE_WIDTH: 0.411806
G2 X39.575 Y145.096 I-2.071 J17.145 E.01453
G1 X39.467 Y145.391 E.00945
G1 X40.083 Y145.551 E.01911
; LINE_WIDTH: 0.452278
G1 X40.545 Y145.612 E.01555
; LINE_WIDTH: 0.491593
G1 F14041.422
G1 X41.006 Y145.674 E.01704
; LINE_WIDTH: 0.528137
G1 F12983.9
G2 X41.732 Y145.702 I1.392 J-26.655 E.02869
G1 X214.274 Y145.702 E6.82217
G1 X214.971 Y145.676 E.02755
; LINE_WIDTH: 0.486825
G1 F14192.225
G1 X215.652 Y145.601 E.0248
; LINE_WIDTH: 0.447158
G1 F15000
G1 X215.99 Y145.532 E.01135
; LINE_WIDTH: 0.411236
G2 X216.533 Y145.391 I-.229 J-1.998 E.0169
G1 X216.425 Y145.096 E.00943
G1 X215.851 Y145.168 E.01734
; LINE_WIDTH: 0.452278
G1 X215.405 Y145.188 E.01489
; LINE_WIDTH: 0.491593
G1 F14041.422
G1 X214.959 Y145.208 E.01633
; LINE_WIDTH: 0.528172
G1 F12982.967
G1 X41.792 Y145.216 E6.84736
G1 X216.855 Y145.157 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583407
G1 F11656.166
G1 X217.228 Y145.02 E.01753
; LINE_WIDTH: 0.552313
G1 F12367.66
G1 X217.548 Y144.891 E.0143
; LINE_WIDTH: 0.512299
G1 F13421.988
G2 X217.823 Y144.754 I-1.026 J-2.413 E.01176
; LINE_WIDTH: 0.475394
G1 F14567.357
G1 X218.123 Y144.591 E.01203
; LINE_WIDTH: 0.449404
G1 F15000
G2 X218.379 Y144.427 I-1.52 J-2.657 E.01009
; LINE_WIDTH: 0.406399
G2 X219.359 Y143.604 I-3.17 J-4.77 E.03798
G1 X219.716 Y143.195 E.01608
; LINE_WIDTH: 0.430424
G1 X220.107 Y142.631 E.02168
; LINE_WIDTH: 0.472349
G1 F14670.647
G1 X220.298 Y142.286 E.01377
; LINE_WIDTH: 0.509123
G1 F13513.45
G1 X220.429 Y142.026 E.01108
; LINE_WIDTH: 0.549605
G1 F12433.773
G1 X220.564 Y141.695 E.01476
; LINE_WIDTH: 0.582898
G1 F11667.152
G2 X220.707 Y141.305 I-12.189 J-4.705 E.01829
G1 X220.766 Y138.718 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519725
G1 F13212.948
G1 X220.758 Y139.409 E.02684
; LINE_WIDTH: 0.48682
G1 F14192.386
G1 X220.734 Y140.071 E.02397
; LINE_WIDTH: 0.44716
G1 F15000
G1 X220.698 Y140.394 E.01069
; LINE_WIDTH: 0.411806
G2 X220.646 Y140.875 I17.076 J2.063 E.01453
G1 X220.941 Y140.983 E.00945
G1 X221.101 Y140.367 E.01911
; LINE_WIDTH: 0.452275
G1 X221.162 Y139.905 E.01555
; LINE_WIDTH: 0.491585
G1 F14041.656
G1 X221.224 Y139.443 E.01704
; LINE_WIDTH: 0.527763
G1 F12993.905
G2 X221.252 Y138.718 I-26.65 J-1.392 E.02866
G1 X221.252 Y113.282 E1.00498
G1 X221.226 Y112.579 E.02776
; LINE_WIDTH: 0.48682
G1 F14192.386
G1 X221.151 Y111.898 E.0248
; LINE_WIDTH: 0.44783
G1 F15000
G1 X221.082 Y111.56 E.01136
; LINE_WIDTH: 0.413184
G2 X220.941 Y111.019 I-2.02 J.237 E.01694
G1 X220.641 Y111.129 E.00964
G1 X220.717 Y111.699 E.01735
; LINE_WIDTH: 0.452223
G1 X220.738 Y112.145 E.0149
; LINE_WIDTH: 0.491568
G1 F14042.204
G1 X220.758 Y112.591 E.01633
; LINE_WIDTH: 0.527986
G1 F12987.945
G1 X220.766 Y138.658 E1.03036
G1 X220.707 Y110.695 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.582895
G1 F11667.22
G2 X220.564 Y110.305 I-11.881 J4.149 E.01828
; LINE_WIDTH: 0.549597
G1 F12433.966
G1 X220.429 Y109.974 E.01476
; LINE_WIDTH: 0.509118
G1 F13513.576
G1 X220.298 Y109.714 E.01107
; LINE_WIDTH: 0.472344
G1 F14670.837
G1 X220.107 Y109.369 E.01377
; LINE_WIDTH: 0.430431
G1 F15000
G1 X219.716 Y108.806 E.02167
; LINE_WIDTH: 0.406407
G1 X219.359 Y108.396 E.01609
G2 X218.379 Y107.573 I-4.149 J3.946 E.03798
; LINE_WIDTH: 0.449376
G2 X218.123 Y107.409 I-1.775 J2.491 E.01009
; LINE_WIDTH: 0.475371
G1 F14568.138
G1 X217.823 Y107.246 E.01203
; LINE_WIDTH: 0.512288
G1 F13422.313
G2 X217.548 Y107.109 I-1.293 J2.26 E.01176
; LINE_WIDTH: 0.552301
G1 F12367.957
G1 X217.228 Y106.98 E.0143
; LINE_WIDTH: 0.583413
G1 F11656.042
G1 X216.855 Y106.843 E.01754
G1 X214.268 Y106.784 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51984
G1 F13209.762
G1 X214.95 Y106.792 E.02648
; LINE_WIDTH: 0.486905
G1 F14189.668
G1 X215.622 Y106.816 E.02433
; LINE_WIDTH: 0.447108
G1 F15000
G1 X215.944 Y106.852 E.01068
; LINE_WIDTH: 0.4118
G2 X216.425 Y106.904 I2.056 J-17.011 E.01452
G1 X216.533 Y106.609 E.00945
G1 X215.917 Y106.449 E.01911
; LINE_WIDTH: 0.452335
G1 X215.451 Y106.388 E.01571
; LINE_WIDTH: 0.491765
G1 F14036.025
G1 X214.984 Y106.326 E.01722
; LINE_WIDTH: 0.528143
G1 F12983.744
G2 X214.268 Y106.298 I-1.314 J24.785 E.02831
G1 X41.726 Y106.298 E6.82225
G1 X41.029 Y106.324 E.02755
; LINE_WIDTH: 0.48683
G1 F14192.065
G1 X40.348 Y106.399 E.0248
; LINE_WIDTH: 0.447838
G1 F15000
G1 X40.01 Y106.468 E.01136
; LINE_WIDTH: 0.413187
G2 X39.469 Y106.609 I.237 J2.02 E.01694
G1 X39.579 Y106.909 E.00964
G1 X40.149 Y106.833 E.01735
; LINE_WIDTH: 0.452233
G1 X40.595 Y106.812 E.0149
; LINE_WIDTH: 0.491578
G1 F14041.892
G1 X41.041 Y106.792 E.01633
; LINE_WIDTH: 0.528177
G1 F12982.833
G1 X214.208 Y106.784 E6.84743
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12982.833
G1 X212.208 Y106.784 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/35
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.2 I-.013 J-1.217 P1  F30000
G1 X36.862 Y108.668 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X37.16 Y108.371 E.01392
G3 X40.195 Y107.198 I3.057 J3.395 E.11036
G1 X215.805 Y107.198 E5.82533
G3 X220.352 Y111.744 I-.022 J4.569 E.23659
G1 X220.352 Y140.255 E.94576
G3 X215.805 Y144.802 I-4.569 J-.022 E.23659
G1 X40.195 Y144.802 E5.82533
G3 X35.648 Y140.255 I.022 J-4.569 E.23659
G1 X35.648 Y111.744 E.94576
G3 X36.745 Y108.797 I4.569 J.022 E.1065
G1 X36.822 Y108.712 E.00381
M204 S250
G1 X37.142 Y108.941 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.428 Y108.657 E.01236
G3 X40.198 Y107.59 I2.789 J3.109 E.09326
G1 X215.802 Y107.59 E5.39582
G3 X219.96 Y111.748 I-.019 J4.177 E.20044
G1 X219.96 Y140.252 E.87585
G3 X215.802 Y144.41 I-4.177 J-.019 E.20044
G1 X40.198 Y144.41 E5.39582
G3 X36.04 Y140.252 I.019 J-4.177 E.20044
G1 X36.04 Y111.748 E.87585
G3 X37.048 Y109.046 I4.177 J.019 E.09048
G1 X37.102 Y108.985 E.0025
; WIPE_START
M204 S10000
G1 X37.428 Y108.657 E-.17559
G1 X37.927 Y108.267 E-.24082
G1 X38.32 Y108.04 E-.17249
G1 X38.734 Y107.863 E-.17111
; WIPE_END
G1 E-.04 F1800
G1 X36.471 Y108.021 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.852 I5.236 J5.237 E.19316
G1 X214.285 Y105.852 E5.72448
G1 X215.012 Y105.888 E.02415
G3 X221.698 Y113.265 I-.737 J7.386 E.36197
G1 X221.698 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y146.148 I-7.406 J.007 E.38635
G1 X41.715 Y146.148 E5.72448
G3 X34.302 Y138.735 I-.007 J-7.406 E.38635
G1 X34.302 Y113.265 E.8449
G3 X36.429 Y108.063 I7.406 J-.007 E.1912
M204 S250
G1 X36.185 Y107.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.193 Y107.743 E.00031
G3 X41.705 Y105.46 I5.511 J5.511 E.18813
G1 X214.295 Y105.46 E5.3032
G1 X215.051 Y105.497 E.02325
G3 X222.09 Y113.255 I-.777 J7.777 E.35276
G1 X222.09 Y138.745 E.78322
G3 X214.295 Y146.54 I-7.793 J.002 E.37628
G1 X41.705 Y146.54 E5.3032
G3 X33.91 Y138.745 I-.002 J-7.793 E.37628
G1 X33.91 Y113.255 E.78322
G3 X35.671 Y108.319 I7.794 J-.002 E.16424
G1 X36.145 Y107.794 E.02173
; WIPE_START
M204 S10000
G1 X36.193 Y107.743 E-.02665
G1 X36.758 Y107.228 E-.29037
G1 X37.372 Y106.773 E-.29054
G1 X37.716 Y106.567 E-.15244
; WIPE_END
G1 E-.04 F1800
G1 X37.244 Y107.82 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.36578
G1 F15000
G1 X36.906 Y108.108 E.01168
G2 X36.063 Y109.077 I4.169 J4.482 E.03386
; LINE_WIDTH: 0.41094
G2 X35.792 Y109.504 I4.925 J3.415 E.01517
; LINE_WIDTH: 0.432391
G1 X35.724 Y109.629 E.00452
; LINE_WIDTH: 0.452429
G1 X35.64 Y109.797 E.00626
; LINE_WIDTH: 0.493132
G1 F13993.428
G2 X35.453 Y110.207 I3.401 J1.796 E.01653
; LINE_WIDTH: 0.516475
G1 F13303.65
G1 X35.448 Y110.222 E.0006
; LINE_WIDTH: 0.535347
G1 F12793.773
G1 X35.379 Y110.409 E.008
; LINE_WIDTH: 0.571724
G1 F11913.68
G1 X35.311 Y110.596 E.00859
G1 X34.959 Y110.764 E.01682
G1 X35.212 Y113.281 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50545
G1 F13620.738
G1 X35.221 Y112.59 E.02607
; LINE_WIDTH: 0.460259
G1 F15000
G3 X35.262 Y111.386 I30.682 J.452 E.04094
G1 X35.035 Y111.49 E.00848
G1 X34.953 Y111.451 E.00311
G1 X34.842 Y111.896 E.01559
G1 X34.769 Y112.556 E.02258
; LINE_WIDTH: 0.512748
G1 F13409.175
G2 X34.741 Y113.281 I26.516 J1.386 E.02778
G1 X34.74 Y138.719 E.97388
G1 X34.766 Y139.422 E.02693
; LINE_WIDTH: 0.47107
G1 F14714.468
G1 X34.841 Y140.101 E.02383
; LINE_WIDTH: 0.425917
G1 F15000
G1 X34.947 Y140.565 E.01486
G1 X35.068 Y140.537 E.0039
G1 X35.293 Y140.644 E.00777
G1 X35.243 Y140.071 E.01795
; LINE_WIDTH: 0.47107
G1 F14714.468
G1 X35.218 Y139.411 E.02306
; LINE_WIDTH: 0.51295
G1 F13403.405
G1 X35.212 Y113.341 E.9985
; WIPE_START
G1 X35.213 Y115.341 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.203 Y107.973 Z6.4 F30000
G1 X37.244 Y107.82 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.391626
G1 F15000
G1 X37.809 Y107.427 E.01956
; LINE_WIDTH: 0.437402
G1 X38.248 Y107.19 E.01602
; LINE_WIDTH: 0.480151
G1 F14408.872
G1 X38.416 Y107.105 E.0067
; LINE_WIDTH: 0.502785
G1 F13699.677
G1 X38.657 Y107.003 E.00982
; LINE_WIDTH: 0.534618
G1 F12812.748
G1 X38.858 Y106.929 E.0086
; LINE_WIDTH: 0.571772
G1 F11912.611
G1 X39.045 Y106.86 E.00857
; LINE_WIDTH: 0.583223
G1 F11660.133
G1 X39.213 Y106.509 E.01713
; WIPE_START
G1 X39.045 Y106.86 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.144 Y114.439 Z6.4 F30000
G1 X34.959 Y141.237 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.57942
G1 F11742.79
G1 X35.31 Y141.405 E.01702
G1 X35.379 Y141.592 E.0087
; LINE_WIDTH: 0.536023
G1 F12776.255
G1 X35.447 Y141.779 E.008
; LINE_WIDTH: 0.517007
G1 F13288.697
G1 X35.453 Y141.793 E.0006
; LINE_WIDTH: 0.493348
G1 F13986.701
G2 X35.64 Y142.202 I3.614 J-1.401 E.01653
; LINE_WIDTH: 0.452473
G1 F15000
G1 X35.724 Y142.371 E.00628
; LINE_WIDTH: 0.432398
G1 X35.792 Y142.496 E.00453
; LINE_WIDTH: 0.410939
G2 X36.063 Y142.923 I5.21 J-2.998 E.01517
; LINE_WIDTH: 0.366033
G2 X36.906 Y143.892 I4.948 J-3.457 E.03389
G1 X37.244 Y144.18 E.01168
; LINE_WIDTH: 0.391623
G1 X37.809 Y144.573 E.01957
; LINE_WIDTH: 0.43739
G1 X38.247 Y144.81 E.01601
; LINE_WIDTH: 0.480069
G1 F14411.58
G1 X38.415 Y144.895 E.00669
; LINE_WIDTH: 0.502461
G1 F13709.328
G1 X38.657 Y144.997 E.00985
; LINE_WIDTH: 0.533973
G1 F12829.591
G1 X38.859 Y145.071 E.0086
; LINE_WIDTH: 0.570842
G1 F11933.579
G1 X39.046 Y145.139 E.00857
; LINE_WIDTH: 0.572239
G1 F11902.097
G1 X39.214 Y145.491 E.01684
G1 X214.269 Y145.238 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513153
G1 F13397.617
G1 X41.039 Y145.232 E6.63781
; LINE_WIDTH: 0.470905
G1 F14720.142
G1 X40.376 Y145.207 E.02316
; LINE_WIDTH: 0.427131
G1 F15000
G1 X39.806 Y145.16 E.0179
G1 X39.925 Y145.418 E.0089
G1 X39.882 Y145.509 E.00315
G1 X40.346 Y145.609 E.01485
; LINE_WIDTH: 0.470905
G1 F14720.142
G1 X41.006 Y145.682 E.02316
; LINE_WIDTH: 0.513121
G1 F13398.526
G2 X41.731 Y145.71 I1.395 J-26.777 E.0278
G1 X214.275 Y145.709 E6.61108
G1 X214.972 Y145.683 E.02673
; LINE_WIDTH: 0.460598
G1 F15000
G1 X215.651 Y145.608 E.02324
G1 X216.095 Y145.491 E.01563
G3 X216.11 Y145.294 I.139 J-.088 E.0072
G1 X216.159 Y145.19 E.00393
G2 X214.961 Y145.229 I1.567 J66.036 E.04083
; LINE_WIDTH: 0.505505
G1 F13619.118
G1 X214.329 Y145.237 E.02381
G1 X216.787 Y145.491 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.579462
G1 F11741.859
G1 X216.955 Y145.14 E.01701
G1 X217.142 Y145.071 E.0087
; LINE_WIDTH: 0.536007
G1 F12776.653
G1 X217.329 Y145.003 E.008
; LINE_WIDTH: 0.51698
G1 F13289.46
G1 X217.343 Y144.997 E.0006
; LINE_WIDTH: 0.49333
G1 F13987.274
G2 X217.752 Y144.81 I-1.4 J-3.612 E.01652
; LINE_WIDTH: 0.452471
G1 F15000
G1 X217.92 Y144.726 E.00628
; LINE_WIDTH: 0.432389
G1 X218.046 Y144.658 E.00452
; LINE_WIDTH: 0.410939
G2 X218.473 Y144.387 I-3.002 J-5.218 E.01517
; LINE_WIDTH: 0.366039
G2 X219.442 Y143.544 I-3.457 J-4.948 E.03389
G1 X219.73 Y143.206 E.01169
; LINE_WIDTH: 0.391638
G1 X220.123 Y142.641 E.01956
; LINE_WIDTH: 0.437387
G1 X220.36 Y142.203 E.01601
; LINE_WIDTH: 0.480069
G1 F14411.582
G1 X220.445 Y142.035 E.00669
; LINE_WIDTH: 0.502468
G1 F13709.125
G1 X220.547 Y141.793 E.00985
; LINE_WIDTH: 0.533984
G1 F12829.291
G1 X220.621 Y141.591 E.00859
; LINE_WIDTH: 0.570839
G1 F11933.646
G1 X220.689 Y141.404 E.00857
; LINE_WIDTH: 0.572193
G1 F11903.132
G1 X221.041 Y141.236 E.01684
G1 X220.79 Y138.719 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.503875
G1 F13667.277
G1 X220.782 Y139.411 E.02599
; LINE_WIDTH: 0.4709
G1 F14720.314
G1 X220.757 Y140.074 E.02316
; LINE_WIDTH: 0.427123
G1 F15000
G1 X220.71 Y140.644 E.01791
G1 X220.968 Y140.525 E.00889
G1 X221.059 Y140.568 E.00315
G1 X221.159 Y140.104 E.01485
; LINE_WIDTH: 0.4709
G1 F14720.314
G1 X221.232 Y139.444 E.02316
; LINE_WIDTH: 0.511922
G1 F13432.783
M73 P94 R2
G2 X221.26 Y138.719 I-26.703 J-1.392 E.02773
G1 X221.26 Y113.281 E.97217
G1 X221.234 Y112.578 E.02688
; LINE_WIDTH: 0.471025
G1 F14716.015
G1 X221.159 Y111.899 E.02383
; LINE_WIDTH: 0.426009
G1 F15000
G1 X221.053 Y111.436 E.01482
G1 X220.931 Y111.465 E.00393
G1 X220.707 Y111.358 E.00773
G1 X220.757 Y111.929 E.01788
; LINE_WIDTH: 0.471025
G1 F14716.015
G1 X220.782 Y112.589 E.02306
; LINE_WIDTH: 0.512145
G1 F13426.407
G1 X220.79 Y138.659 E.99679
G1 X221.041 Y110.763 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583415
G1 F11655.997
G1 X220.69 Y110.595 E.01715
; LINE_WIDTH: 0.571794
G1 F11912.118
G1 X220.621 Y110.408 E.00858
; LINE_WIDTH: 0.534653
G1 F12811.832
G1 X220.547 Y110.207 E.0086
; LINE_WIDTH: 0.502797
G1 F13699.317
G1 X220.445 Y109.966 E.00982
; LINE_WIDTH: 0.480157
G1 F14408.672
G1 X220.36 Y109.798 E.0067
; LINE_WIDTH: 0.437408
G1 F15000
G1 X220.123 Y109.359 E.01603
; LINE_WIDTH: 0.39163
G1 X219.73 Y108.794 E.01956
; LINE_WIDTH: 0.366034
G1 X219.442 Y108.456 E.01169
G2 X218.473 Y107.613 I-4.425 J4.104 E.03389
; LINE_WIDTH: 0.410934
G2 X218.046 Y107.342 I-3.423 J4.937 E.01517
; LINE_WIDTH: 0.43239
G1 X217.92 Y107.274 E.00453
; LINE_WIDTH: 0.452465
G1 X217.752 Y107.19 E.00628
; LINE_WIDTH: 0.493332
G1 F13987.214
G2 X217.343 Y107.003 I-1.809 J3.426 E.01652
; LINE_WIDTH: 0.516975
G1 F13289.621
G1 X217.329 Y106.997 E.0006
; LINE_WIDTH: 0.536009
G1 F12776.599
G1 X217.142 Y106.929 E.00799
; LINE_WIDTH: 0.57937
G1 F11743.871
G1 X216.955 Y106.86 E.0087
G1 X216.787 Y106.509 E.01703
G1 X214.269 Y106.76 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.504025
G1 F13662.832
G1 X214.948 Y106.768 E.02553
; LINE_WIDTH: 0.470975
G1 F14717.735
G1 X215.626 Y106.793 E.02364
; LINE_WIDTH: 0.427213
G1 F15000
G1 X216.191 Y106.839 E.01776
G1 X216.073 Y106.583 E.00885
G1 X216.116 Y106.491 E.00319
G1 X215.655 Y106.392 E.01477
; LINE_WIDTH: 0.470975
G1 F14717.735
G1 X214.981 Y106.318 E.02364
; LINE_WIDTH: 0.512308
G1 F13421.753
G2 X214.269 Y106.29 I-1.369 J26.296 E.02727
G1 X41.725 Y106.29 E6.59964
G1 X41.028 Y106.316 E.02668
; LINE_WIDTH: 0.47094
G1 F14718.938
G1 X40.347 Y106.391 E.02391
; LINE_WIDTH: 0.427259
G1 F15000
G1 X39.885 Y106.491 E.0148
G1 X39.916 Y106.619 E.00413
G1 X39.811 Y106.839 E.00763
G1 X40.377 Y106.793 E.01778
; LINE_WIDTH: 0.47094
G1 F14718.938
G1 X41.039 Y106.768 E.02313
; LINE_WIDTH: 0.512341
G1 F13420.786
G1 X214.209 Y106.76 E6.62406
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13420.786
G1 X212.209 Y106.76 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/35
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.4 I-.013 J-1.217 P1  F30000
G1 X36.827 Y108.668 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X37.123 Y108.372 E.0139
G3 X40.182 Y107.168 I3.107 J3.408 E.1115
G1 X215.818 Y107.168 E5.82614
G3 X220.382 Y111.732 I-.048 J4.612 E.23714
G1 X220.382 Y140.268 E.94657
G3 X215.834 Y144.831 I-4.612 J-.048 E.2366
G1 X40.182 Y144.832 E5.82668
G3 X35.618 Y140.268 I.048 J-4.612 E.23714
G1 X35.619 Y111.716 E.94711
G3 X36.735 Y108.771 I4.612 J.064 E.10661
G1 X36.787 Y108.713 E.0026
M204 S250
G1 X37.107 Y108.942 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.394 Y108.656 E.01245
G3 X40.194 Y107.56 I2.836 J3.124 E.09446
G1 X215.806 Y107.56 E5.39609
G3 X219.99 Y111.744 I-.036 J4.22 E.20143
G1 X219.99 Y140.256 E.87612
G3 X215.822 Y144.439 I-4.219 J-.036 E.20095
G1 X40.194 Y144.44 E5.39657
G3 X36.01 Y140.256 I.036 J-4.22 E.20143
G1 X36.011 Y111.728 E.8766
G3 X37.036 Y109.023 I4.219 J.052 E.09073
G1 X37.067 Y108.987 E.00146
; WIPE_START
M204 S10000
G1 X37.394 Y108.656 E-.17673
G1 X37.875 Y108.271 E-.23423
G1 X38.318 Y108.014 E-.19435
G1 X38.692 Y107.854 E-.15468
; WIPE_END
G1 E-.04 F1800
G1 X36.542 Y108.093 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y105.952 I5.168 J5.168 E.19056
G1 X214.285 Y105.952 E5.72448
G1 X214.976 Y105.986 E.02295
G1 X215.015 Y105.988 E.0013
G3 X221.598 Y113.265 I-.741 J7.286 E.35668
G1 X221.598 Y138.735 E.8449
G3 X214.285 Y146.048 I-7.321 J-.008 E.38092
G1 X41.715 Y146.048 E5.72448
G3 X34.402 Y138.735 I.008 J-7.321 E.38092
G1 X34.402 Y113.265 E.8449
G3 X36.5 Y108.135 I7.308 J-.005 E.18856
M204 S250
G1 X36.259 Y107.816 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X36.263 Y107.813 E.00016
G3 X41.705 Y105.56 I5.442 J5.444 E.18571
G1 X214.295 Y105.56 E5.3032
G1 X214.995 Y105.594 E.02155
G1 X215.054 Y105.597 E.00179
G3 X221.99 Y113.255 I-.781 J7.677 E.34784
G1 X221.99 Y138.745 E.78322
G3 X221.424 Y141.638 I-7.656 J.004 E.09115
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X221.404 Y141.693 E.00179
G3 X214.295 Y146.44 I-7.136 J-2.99 E.2783
G1 X41.705 Y146.44 E5.3032
G3 X34.01 Y138.745 I.018 J-7.713 E.37118
G1 X34.01 Y113.255 E.78322
G3 X34.576 Y110.362 I7.656 J-.004 E.09115
G1 X34.596 Y110.307 E.00179
G3 X35.757 Y108.372 I7.11 J2.95 E.06958
G1 X36.219 Y107.861 E.02118
; WIPE_START
M204 S10000
G1 X36.263 Y107.813 E-.02475
G1 X36.822 Y107.306 E-.28674
G1 X37.428 Y106.856 E-.28678
M73 P94 R1
G1 X37.793 Y106.637 E-.16173
; WIPE_END
G1 E-.04 F1800
G1 X37.268 Y107.85 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.268602
G1 F15000
G1 X37.831 Y107.459 E.01259
; LINE_WIDTH: 0.314507
G1 X38.276 Y107.218 E.01122
; LINE_WIDTH: 0.357127
G1 X38.434 Y107.139 E.00451
; LINE_WIDTH: 0.378255
G1 X38.654 Y107.045 E.00655
; LINE_WIDTH: 0.409358
G1 X38.867 Y106.966 E.00678
; LINE_WIDTH: 0.44952
G1 X39.067 Y106.894 E.00704
; LINE_WIDTH: 0.476633
G1 F14525.736
G3 X39.238 Y106.841 I.921 J2.711 E.00631
; LINE_WIDTH: 0.509896
G1 F13491.077
G1 X39.461 Y106.787 E.00877
; LINE_WIDTH: 0.558112
G1 F12228.456
G1 X39.685 Y106.732 E.00967
; LINE_WIDTH: 0.56715
G1 F12017.623
G1 X39.788 Y106.566 E.00835
; LINE_WIDTH: 0.537025
G1 F12750.331
G1 X39.89 Y106.399 E.00787
G1 X37.268 Y107.85 F30000
; LINE_WIDTH: 0.242023
G1 F15000
G1 X36.913 Y108.154 E.00759
G2 X36.133 Y109.041 I4.005 J4.307 E.01919
; LINE_WIDTH: 0.285224
G2 X35.818 Y109.535 I5.578 J3.902 E.01158
; LINE_WIDTH: 0.310691
G1 X35.747 Y109.669 E.00331
; LINE_WIDTH: 0.331247
G1 X35.668 Y109.826 E.00413
; LINE_WIDTH: 0.370044
G2 X35.489 Y110.218 I3.253 J1.717 E.01148
; LINE_WIDTH: 0.410721
G1 X35.416 Y110.418 E.00636
; LINE_WIDTH: 0.449528
G1 X35.344 Y110.617 E.00704
; LINE_WIDTH: 0.476642
G1 F14525.44
G2 X35.291 Y110.788 I2.702 J.918 E.00631
; LINE_WIDTH: 0.509846
G1 F13492.501
G1 X35.237 Y111.011 E.00875
; LINE_WIDTH: 0.553599
G1 F12336.514
G1 X35.183 Y111.234 E.00957
G1 X34.85 Y111.44 E.01628
G1 X35.213 Y113.28 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44552
G1 F15000
G2 X35.232 Y111.984 I-197.084 J-3.565 E.04252
G1 X34.989 Y112.128 E.00929
G1 X34.894 Y112.095 E.00329
G2 X34.808 Y113.28 I11.48 J1.431 E.03899
G1 X34.808 Y138.72 E.83463
G2 X34.901 Y139.904 I5.892 J.131 E.039
G1 X35.024 Y139.889 E.00405
G1 X35.233 Y140.018 E.00808
G3 X35.213 Y138.72 I83.605 J-1.983 E.04257
G1 X35.213 Y113.34 E.83266
G1 X34.849 Y140.56 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.554284
G1 F12319.996
G1 X35.183 Y140.765 E.0163
G1 X35.237 Y140.989 E.0096
; LINE_WIDTH: 0.509897
G1 F13491.032
G1 X35.291 Y141.212 E.00877
; LINE_WIDTH: 0.476633
G1 F14525.753
G2 X35.344 Y141.383 I2.751 J-.747 E.00631
; LINE_WIDTH: 0.44952
G1 F15000
G1 X35.416 Y141.582 E.00704
; LINE_WIDTH: 0.410708
G1 X35.489 Y141.782 E.00636
; LINE_WIDTH: 0.370037
G2 X35.668 Y142.174 I3.434 J-1.326 E.01148
; LINE_WIDTH: 0.331235
G1 X35.747 Y142.331 E.00413
; LINE_WIDTH: 0.310696
G1 X35.818 Y142.465 E.00331
; LINE_WIDTH: 0.285016
G2 X36.136 Y142.964 I5.919 J-3.423 E.01168
; LINE_WIDTH: 0.241807
G2 X36.913 Y143.846 I4.792 J-3.435 E.01908
G1 X37.268 Y144.15 E.00758
; LINE_WIDTH: 0.26908
G2 X37.831 Y144.541 I3.499 J-4.44 E.01263
; LINE_WIDTH: 0.314611
G1 X38.276 Y144.782 E.01122
; LINE_WIDTH: 0.357115
G1 X38.434 Y144.861 E.00451
; LINE_WIDTH: 0.378252
G1 X38.654 Y144.955 E.00655
; LINE_WIDTH: 0.409353
G1 X38.867 Y145.034 E.00678
; LINE_WIDTH: 0.449504
G1 X39.067 Y145.106 E.00704
; LINE_WIDTH: 0.476624
G1 F14526.046
G2 X39.238 Y145.159 I.921 J-2.711 E.00631
; LINE_WIDTH: 0.509895
G1 F13491.096
G1 X39.462 Y145.213 E.00877
; LINE_WIDTH: 0.558111
G1 F12228.477
G1 X39.685 Y145.267 E.00967
; LINE_WIDTH: 0.567145
G1 F12017.746
G1 X39.788 Y145.434 E.00835
; LINE_WIDTH: 0.53703
G1 F12750.22
G1 X39.89 Y145.6 E.00787
G1 X214.27 Y145.237 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447274
G1 F15000
G1 X41.73 Y145.237 E5.68518
G3 X40.432 Y145.218 I1.015 J-110.78 E.04276
G1 X40.571 Y145.463 E.0093
G1 X40.539 Y145.555 E.00321
G2 X41.73 Y145.642 I1.437 J-11.518 E.03935
G1 X214.275 Y145.642 E5.68534
G2 X215.455 Y145.549 I.127 J-5.885 E.03904
G1 X215.44 Y145.426 E.00406
G1 X215.569 Y145.217 E.00811
G3 X214.33 Y145.237 I-1.898 J-79.133 E.04082
G1 X216.11 Y145.6 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.553679
G1 F12334.588
G1 X216.316 Y145.267 E.01628
G1 X216.539 Y145.213 E.00957
; LINE_WIDTH: 0.509863
G1 F13492.026
G1 X216.762 Y145.159 E.00875
; LINE_WIDTH: 0.47664
G1 F14525.511
G2 X216.933 Y145.106 I-.737 J-2.719 E.00631
; LINE_WIDTH: 0.449513
G1 F15000
G1 X217.133 Y145.034 E.00704
; LINE_WIDTH: 0.410683
G1 X217.332 Y144.961 E.00637
; LINE_WIDTH: 0.37003
G2 X217.724 Y144.782 I-1.329 J-3.439 E.01148
; LINE_WIDTH: 0.331227
G1 X217.881 Y144.703 E.00413
; LINE_WIDTH: 0.310665
G1 X218.015 Y144.632 E.00331
; LINE_WIDTH: 0.284988
G2 X218.514 Y144.314 I-3.43 J-5.929 E.01168
; LINE_WIDTH: 0.241816
G2 X219.396 Y143.537 I-3.435 J-4.792 E.01908
G1 X219.7 Y143.182 E.00758
; LINE_WIDTH: 0.269101
G2 X220.091 Y142.619 I-4.439 J-3.499 E.01263
; LINE_WIDTH: 0.314611
G1 X220.332 Y142.174 E.01122
; LINE_WIDTH: 0.357116
G1 X220.411 Y142.016 E.00451
; LINE_WIDTH: 0.378271
G1 X220.505 Y141.796 E.00656
; LINE_WIDTH: 0.409392
G1 X220.584 Y141.582 E.00678
; LINE_WIDTH: 0.449528
G1 X220.656 Y141.383 E.00704
; LINE_WIDTH: 0.476641
G1 F14525.47
G2 X220.709 Y141.212 I-2.71 J-.921 E.00631
; LINE_WIDTH: 0.509895
G1 F13491.104
G1 X220.763 Y140.989 E.00877
; LINE_WIDTH: 0.558105
G1 F12228.624
G1 X220.817 Y140.765 E.00967
; LINE_WIDTH: 0.567101
G1 F12018.751
G1 X220.984 Y140.662 E.00835
; LINE_WIDTH: 0.536893
G1 F12753.738
G1 X221.151 Y140.559 E.00787
G1 X220.787 Y138.72 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445444
G1 F15000
G3 X220.768 Y140.018 I-111.113 J-1.022 E.04257
G1 X221.013 Y139.879 E.00926
G1 X221.105 Y139.911 E.00319
G2 X221.192 Y138.72 I-11.531 J-1.438 E.03917
G1 X221.192 Y113.28 E.83448
G2 X221.097 Y112.083 I-6.012 J-.126 E.03944
G1 X220.991 Y112.1 E.00352
G1 X220.766 Y111.973 E.00849
G3 X220.787 Y113.28 I-74.496 J1.881 E.04286
G1 X220.787 Y138.66 E.83251
G1 X221.151 Y111.441 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536874
G1 F12754.235
G1 X220.984 Y111.338 E.00787
; LINE_WIDTH: 0.567093
G1 F12018.946
G1 X220.817 Y111.235 E.00835
; LINE_WIDTH: 0.558108
G1 F12228.548
G1 X220.763 Y111.011 E.00967
; LINE_WIDTH: 0.509895
G1 F13491.11
G1 X220.709 Y110.788 E.00877
; LINE_WIDTH: 0.476623
G1 F14526.068
G2 X220.656 Y110.617 I-2.753 J.747 E.00631
; LINE_WIDTH: 0.449518
G1 F15000
G1 X220.584 Y110.418 E.00703
; LINE_WIDTH: 0.409388
G1 X220.505 Y110.204 E.00678
; LINE_WIDTH: 0.378275
G1 X220.411 Y109.984 E.00656
; LINE_WIDTH: 0.357137
G1 X220.332 Y109.826 E.0045
; LINE_WIDTH: 0.314634
G1 X220.091 Y109.381 E.01123
; LINE_WIDTH: 0.269096
G2 X219.7 Y108.818 I-4.827 J2.934 E.01263
; LINE_WIDTH: 0.241806
G1 X219.396 Y108.463 E.00758
G2 X218.514 Y107.686 I-4.317 J4.016 E.01908
; LINE_WIDTH: 0.284986
G2 X218.015 Y107.368 I-3.92 J5.597 E.01168
; LINE_WIDTH: 0.310669
G1 X217.881 Y107.297 E.00331
; LINE_WIDTH: 0.331225
G1 X217.724 Y107.218 E.00413
; LINE_WIDTH: 0.370018
G2 X217.332 Y107.039 I-1.721 J3.261 E.01148
; LINE_WIDTH: 0.410669
G1 X217.132 Y106.966 E.00637
; LINE_WIDTH: 0.449499
G1 X216.933 Y106.894 E.00704
; LINE_WIDTH: 0.476618
G1 F14526.237
G2 X216.762 Y106.841 I-.91 J2.674 E.0063
; LINE_WIDTH: 0.50988
G1 F13491.54
G1 X216.538 Y106.787 E.00877
; LINE_WIDTH: 0.554312
G1 F12319.329
G1 X216.315 Y106.733 E.0096
G1 X216.11 Y106.4 E.0163
G1 X214.27 Y106.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447199
G1 F15000
G3 X215.566 Y106.782 I-1.028 J110.272 E.04269
G1 X215.421 Y106.539 E.00933
G1 X215.455 Y106.445 E.0033
G2 X214.27 Y106.358 I-1.471 J11.958 E.03913
G1 X41.725 Y106.358 E5.68429
G2 X40.539 Y106.452 I-.126 J5.901 E.03924
G1 X40.556 Y106.565 E.00374
G1 X40.429 Y106.784 E.00834
G3 X41.73 Y106.763 I1.898 J76.444 E.04286
G1 X214.21 Y106.763 E5.68215
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X212.21 Y106.763 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/35
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.6 I-.013 J-1.217 P1  F30000
G1 X36.799 Y108.679 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X37.039 Y108.428 E.01153
G3 X40.184 Y107.158 I3.177 J3.338 E.11521
G1 X215.816 Y107.158 E5.82605
G3 X220.392 Y111.734 I-.032 J4.608 E.23798
G1 X220.392 Y140.266 E.94648
G3 X215.816 Y144.842 I-4.608 J-.032 E.23798
G1 X40.184 Y144.842 E5.82605
G3 X35.608 Y140.266 I.032 J-4.608 E.23798
G1 X35.608 Y111.734 E.94648
G3 X36.688 Y108.801 I4.608 J.032 E.10577
G1 X36.759 Y108.724 E.00347
M204 S250
G1 X37.083 Y108.948 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.309 Y108.712 E.01006
G3 X40.194 Y107.55 I2.907 J3.054 E.09788
G1 X215.806 Y107.55 E5.39605
G3 X220 Y111.744 I-.022 J4.216 E.20217
G1 X220 Y140.256 E.87607
G3 X215.806 Y144.45 I-4.216 J-.022 E.20217
G1 X40.194 Y144.45 E5.39605
G3 X36 Y140.256 I.022 J-4.216 E.20217
G1 X36 Y111.744 E.87607
G3 X36.99 Y109.051 I4.216 J.022 E.08998
G1 X37.043 Y108.993 E.00241
M204 S10000
G1 X36.688 Y108.238 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y106.152 I5.035 J5.035 E.18526
G1 X214.285 Y106.152 E5.72448
G1 X214.819 Y106.178 E.01774
G1 X214.996 Y106.187 E.00586
G3 X221.398 Y113.265 I-.721 J7.087 E.34692
G1 X221.398 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.285 Y145.848 I-7.106 J.007 E.37072
G1 X41.715 Y145.848 E5.72448
G3 X34.602 Y138.735 I.003 J-7.115 E.37058
G1 X34.602 Y113.265 E.8449
G3 X36.645 Y108.28 I7.12 J.008 E.18326
M204 S250
G1 X36.41 Y107.96 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.76 I5.312 J5.312 E.18077
G1 X214.295 Y105.76 E5.3032
G1 X214.839 Y105.787 E.01673
G1 X215.034 Y105.796 E.00602
G3 X221.79 Y113.255 I-.76 J7.478 E.3388
G1 X221.79 Y138.745 E.78322
G3 X214.295 Y146.24 I-7.513 J-.017 E.36154
G1 X41.705 Y146.24 E5.3032
G3 X34.21 Y138.745 I.013 J-7.508 E.3616
G1 X34.21 Y113.255 E.78322
G3 X36.368 Y108.003 I7.513 J.017 E.17893
; WIPE_START
M204 S10000
G1 X36.949 Y107.46 E-.30192
G1 X37.539 Y107.022 E-.27932
G1 X37.942 Y106.781 E-.17875
; WIPE_END
G1 E-.04 F1800
G1 X35.89 Y109.6 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106322
G1 F15000
G1 X35.787 Y109.793 E.00113
; LINE_WIDTH: 0.135072
G1 X35.67 Y110.027 E.00196
; LINE_WIDTH: 0.16934
G1 X35.561 Y110.291 E.00294
; LINE_WIDTH: 0.201791
G1 X35.496 Y110.472 E.00249
; LINE_WIDTH: 0.248417
G2 X35.389 Y110.786 I3.147 J1.242 E.00556
; LINE_WIDTH: 0.26989
G1 X35.386 Y110.799 E.00024
; LINE_WIDTH: 0.288246
G1 X35.345 Y110.965 E.00342
; LINE_WIDTH: 0.323038
G1 X35.304 Y111.131 E.00391
; LINE_WIDTH: 0.360235
G1 X35.258 Y111.322 E.00507
; LINE_WIDTH: 0.397597
G1 X35.228 Y111.519 E.00578
; LINE_WIDTH: 0.436896
G1 X35.197 Y111.728 E.00678
; LINE_WIDTH: 0.471122
G1 F14712.692
G1 X35.183 Y111.84 E.00392
; LINE_WIDTH: 0.498605
G1 F13825.337
G1 X35.169 Y111.951 E.00417
; LINE_WIDTH: 0.536367
G1 F12767.349
G1 X35.145 Y112.277 E.01312
; LINE_WIDTH: 0.584379
G1 F11635.235
G1 X35.121 Y112.602 E.0144
; LINE_WIDTH: 0.640705
G1 F10538.917
M73 P95 R1
G1 X35.105 Y113.277 E.0329
G1 X35.105 Y138.723 E1.23949
G1 X35.121 Y139.398 E.0329
; LINE_WIDTH: 0.584387
G1 F11635.069
G1 X35.145 Y139.723 E.0144
; LINE_WIDTH: 0.53636
G1 F12767.519
G1 X35.169 Y140.049 E.01312
; LINE_WIDTH: 0.498613
G1 F13825.103
G1 X35.183 Y140.16 E.00417
; LINE_WIDTH: 0.46976
G1 F14759.652
G1 X35.198 Y140.283 E.0043
; LINE_WIDTH: 0.435831
G1 F15000
G1 X35.228 Y140.481 E.0064
; LINE_WIDTH: 0.395296
G1 X35.263 Y140.703 E.00646
; LINE_WIDTH: 0.357942
G1 X35.303 Y140.868 E.00437
; LINE_WIDTH: 0.323344
G1 X35.344 Y141.033 E.00389
; LINE_WIDTH: 0.276768
G1 X35.43 Y141.347 E.00621
; LINE_WIDTH: 0.238255
G1 X35.496 Y141.53 E.00309
; LINE_WIDTH: 0.201013
G1 X35.565 Y141.718 E.00258
; LINE_WIDTH: 0.167645
G2 X35.68 Y141.994 I2.808 J-1.014 E.00303
; LINE_WIDTH: 0.133224
G1 X35.788 Y142.208 E.00177
; LINE_WIDTH: 0.106245
G1 X35.89 Y142.4 E.00112
; WIPE_START
G1 X35.788 Y142.208 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.05 Y144.559 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.106265
G1 F15000
G1 X38.242 Y144.662 E.00112
; LINE_WIDTH: 0.133265
G1 X38.457 Y144.77 E.00177
; LINE_WIDTH: 0.167822
G2 X38.735 Y144.887 I1.308 J-2.735 E.00307
; LINE_WIDTH: 0.201201
G1 X38.922 Y144.954 E.00257
; LINE_WIDTH: 0.238125
G1 X39.103 Y145.02 E.00306
; LINE_WIDTH: 0.276464
G1 X39.415 Y145.105 E.00616
; LINE_WIDTH: 0.32306
G1 X39.581 Y145.146 E.00391
; LINE_WIDTH: 0.357867
G1 X39.747 Y145.187 E.00439
; LINE_WIDTH: 0.395305
G1 X39.969 Y145.222 E.00645
; LINE_WIDTH: 0.435836
G1 X40.167 Y145.252 E.0064
; LINE_WIDTH: 0.469779
G1 F14758.978
G1 X40.29 Y145.267 E.00429
; LINE_WIDTH: 0.49861
G1 F13825.186
G1 X40.401 Y145.281 E.00417
; LINE_WIDTH: 0.536366
G1 F12767.364
G1 X40.726 Y145.305 E.01312
; LINE_WIDTH: 0.584377
G1 F11635.276
G1 X41.052 Y145.329 E.0144
; LINE_WIDTH: 0.641412
G1 F10526.47
G1 X41.727 Y145.345 E.03294
G1 X214.273 Y145.345 E8.41494
G1 X214.948 Y145.329 E.03294
; LINE_WIDTH: 0.584381
G1 F11635.193
G1 X215.273 Y145.305 E.0144
; LINE_WIDTH: 0.536343
G1 F12767.967
G1 X215.599 Y145.28 E.01313
; LINE_WIDTH: 0.498604
G1 F13825.385
G1 X215.71 Y145.267 E.00417
; LINE_WIDTH: 0.471131
G1 F14712.393
G1 X215.822 Y145.253 E.00392
; LINE_WIDTH: 0.43691
G1 F15000
G1 X216.031 Y145.222 E.00678
; LINE_WIDTH: 0.397613
G1 X216.228 Y145.192 E.00578
; LINE_WIDTH: 0.360258
G1 X216.419 Y145.146 E.00507
; LINE_WIDTH: 0.323055
G1 X216.585 Y145.105 E.00391
; LINE_WIDTH: 0.288262
G1 X216.751 Y145.064 E.00342
; LINE_WIDTH: 0.26991
G1 X216.764 Y145.061 E.00024
; LINE_WIDTH: 0.248432
G2 X217.078 Y144.954 I-.926 J-3.251 E.00556
; LINE_WIDTH: 0.201804
G1 X217.259 Y144.889 E.00249
; LINE_WIDTH: 0.169334
G1 X217.523 Y144.78 E.00294
; LINE_WIDTH: 0.135086
G1 X217.757 Y144.663 E.00196
; LINE_WIDTH: 0.106343
G1 X217.95 Y144.559 E.00113
; WIPE_START
G1 X217.757 Y144.663 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X220.11 Y142.4 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.106245
G1 F15000
G1 X220.212 Y142.208 E.00112
; LINE_WIDTH: 0.133224
G1 X220.32 Y141.993 E.00177
; LINE_WIDTH: 0.167825
G2 X220.437 Y141.715 I-2.767 J-1.322 E.00307
; LINE_WIDTH: 0.201195
G1 X220.504 Y141.528 E.00256
; LINE_WIDTH: 0.238105
G1 X220.57 Y141.347 E.00306
; LINE_WIDTH: 0.276449
G1 X220.655 Y141.035 E.00616
; LINE_WIDTH: 0.323038
G1 X220.696 Y140.869 E.00391
; LINE_WIDTH: 0.35783
G1 X220.737 Y140.703 E.00439
; LINE_WIDTH: 0.395281
G1 X220.772 Y140.481 E.00646
; LINE_WIDTH: 0.435817
G1 X220.801 Y140.283 E.0064
; LINE_WIDTH: 0.469764
G1 F14759.496
G1 X220.817 Y140.16 E.0043
; LINE_WIDTH: 0.498605
G1 F13825.337
G1 X220.831 Y140.049 E.00417
; LINE_WIDTH: 0.536367
G1 F12767.349
G1 X220.855 Y139.723 E.01312
; LINE_WIDTH: 0.584379
G1 F11635.235
G1 X220.879 Y139.398 E.0144
; LINE_WIDTH: 0.640705
G1 F10538.917
G1 X220.895 Y138.723 E.0329
G1 X220.895 Y113.277 E1.23949
G1 X220.879 Y112.602 E.0329
; LINE_WIDTH: 0.584381
G1 F11635.193
G1 X220.855 Y112.276 E.0144
; LINE_WIDTH: 0.536343
G1 F12767.971
G1 X220.83 Y111.951 E.01313
; LINE_WIDTH: 0.498604
G1 F13825.385
G1 X220.817 Y111.84 E.00417
; LINE_WIDTH: 0.471131
G1 F14712.393
G1 X220.803 Y111.728 E.00391
; LINE_WIDTH: 0.436929
G1 F15000
G1 X220.772 Y111.519 E.00678
; LINE_WIDTH: 0.397629
G1 X220.742 Y111.322 E.00578
; LINE_WIDTH: 0.360366
G1 X220.697 Y111.132 E.00504
; LINE_WIDTH: 0.323364
G1 X220.656 Y110.967 E.00389
; LINE_WIDTH: 0.288755
G1 X220.615 Y110.802 E.00341
; LINE_WIDTH: 0.27049
G1 X220.612 Y110.789 E.00024
; LINE_WIDTH: 0.248767
G2 X220.504 Y110.47 I-3.304 J.941 E.00565
; LINE_WIDTH: 0.201609
G1 X220.438 Y110.288 E.00251
; LINE_WIDTH: 0.16917
G1 X220.33 Y110.027 E.0029
; LINE_WIDTH: 0.135082
G1 X220.213 Y109.793 E.00196
; LINE_WIDTH: 0.106322
G1 X220.11 Y109.6 E.00113
; WIPE_START
G1 X220.213 Y109.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X217.95 Y107.441 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.106348
G1 F15000
G1 X217.757 Y107.337 E.00113
; LINE_WIDTH: 0.135089
G1 X217.523 Y107.22 E.00196
; LINE_WIDTH: 0.169334
G1 X217.259 Y107.111 E.00294
; LINE_WIDTH: 0.201787
G1 X217.078 Y107.046 E.00249
; LINE_WIDTH: 0.248401
G2 X216.764 Y106.939 I-1.242 J3.15 E.00556
; LINE_WIDTH: 0.269886
G1 X216.751 Y106.936 E.00024
; LINE_WIDTH: 0.288232
G1 X216.585 Y106.895 E.00342
; LINE_WIDTH: 0.323037
G1 X216.419 Y106.854 E.00391
; LINE_WIDTH: 0.360242
G1 X216.228 Y106.808 E.00507
; LINE_WIDTH: 0.397597
G1 X216.031 Y106.778 E.00578
; LINE_WIDTH: 0.436896
G1 X215.822 Y106.747 E.00678
; LINE_WIDTH: 0.471122
G1 F14712.692
G1 X215.71 Y106.733 E.00392
; LINE_WIDTH: 0.498605
G1 F13825.337
G1 X215.599 Y106.719 E.00417
; LINE_WIDTH: 0.536366
G1 F12767.364
G1 X215.273 Y106.695 E.01312
; LINE_WIDTH: 0.584377
G1 F11635.276
G1 X214.948 Y106.671 E.0144
; LINE_WIDTH: 0.641412
G1 F10526.471
G1 X214.273 Y106.655 E.03295
G1 X41.727 Y106.655 E8.41494
G1 X41.052 Y106.671 E.03294
; LINE_WIDTH: 0.584387
G1 F11635.069
G1 X40.727 Y106.695 E.0144
; LINE_WIDTH: 0.53636
G1 F12767.519
G1 X40.401 Y106.719 E.01312
; LINE_WIDTH: 0.498613
G1 F13825.103
G1 X40.29 Y106.733 E.00417
; LINE_WIDTH: 0.469761
G1 F14759.606
G1 X40.167 Y106.748 E.0043
; LINE_WIDTH: 0.435825
G1 F15000
G1 X39.969 Y106.778 E.0064
; LINE_WIDTH: 0.395285
G1 X39.747 Y106.813 E.00645
; LINE_WIDTH: 0.357831
G1 X39.581 Y106.854 E.00439
; LINE_WIDTH: 0.323029
G1 X39.415 Y106.895 E.00391
; LINE_WIDTH: 0.276433
G1 X39.103 Y106.98 E.00616
; LINE_WIDTH: 0.238099
G1 X38.922 Y107.046 E.00306
; LINE_WIDTH: 0.20119
G1 X38.735 Y107.113 E.00256
; LINE_WIDTH: 0.16782
G2 X38.457 Y107.23 I1.037 J2.869 E.00307
; LINE_WIDTH: 0.133255
G1 X38.242 Y107.338 E.00177
; LINE_WIDTH: 0.106258
G1 X38.05 Y107.441 E.00112
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X38.242 Y107.338 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/35
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.8 I-.509 J-1.105 P1  F30000
G1 X37.905 Y107.493 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X41.715 Y106.352 I3.835 J5.876 E.13375
G1 X214.285 Y106.352 E5.72448
G1 X214.663 Y106.371 E.01253
G3 X218.095 Y107.493 I-.311 J6.761 E.12126
G1 X217.985 Y107.698 E.00771
G2 X215.815 Y107.148 I-2.23 J4.242 E.07496
G1 X40.185 Y107.148 E5.82596
G2 X38.015 Y107.698 I.06 J4.792 E.07496
G1 X37.933 Y107.546 E.00572
; WIPE_START
G1 X38.449 Y107.167 E-.24298
G1 X39.061 Y106.878 E-.25717
G1 X39.698 Y106.65 E-.25726
G1 X39.705 Y106.648 E-.0026
; WIPE_END
G1 E-.04 F1800
G1 X47.336 Y106.772 Z7 F30000
G1 X219.852 Y109.565 Z7
G1 Z6.6
G1 E.8 F1800
G1 F15476.087
G1 X220.057 Y109.455 E.00771
G1 X220.383 Y109.999 E.02102
G3 X221.198 Y113.265 I-6.373 J3.325 E.11271
G1 X221.198 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X220.057 Y142.545 I-7.031 J-.03 E.13375
G1 X219.852 Y142.435 E.00771
G2 X220.402 Y140.265 I-4.242 J-2.23 E.07497
G1 X220.402 Y111.735 E.94638
G2 X219.88 Y109.618 I-4.792 J.06 E.07298
; WIPE_START
G1 X220.057 Y109.455 E-.09154
G1 X220.383 Y109.999 E-.24083
G1 X220.672 Y110.611 E-.25718
G1 X220.823 Y111.033 E-.17045
; WIPE_END
G1 E-.04 F1800
G1 X213.191 Y110.946 Z7 F30000
G1 X37.063 Y108.95 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.223 Y108.773 E.00733
G3 X40.195 Y107.54 I2.977 J2.977 E.10145
G1 X215.805 Y107.54 E5.39602
G3 X220.01 Y111.745 I-.005 J4.209 E.20289
G1 X220.01 Y140.255 E.87604
G3 X215.805 Y144.46 I-4.209 J-.005 E.20289
G1 X40.195 Y144.46 E5.39602
G3 X35.99 Y140.255 I.005 J-4.209 E.20289
G1 X35.99 Y111.745 E.87604
G3 X36.945 Y109.079 I4.209 J.005 E.08874
G1 X37.022 Y108.994 E.00352
; WIPE_START
M204 S10000
G1 X37.223 Y108.773 E-.11345
G1 X37.529 Y108.495 E-.15702
G1 X37.861 Y108.249 E-.157
G1 X38.215 Y108.037 E-.15699
G1 X38.589 Y107.86 E-.15702
G1 X38.635 Y107.844 E-.01853
; WIPE_END
G1 E-.04 F1800
G1 X36.148 Y109.565 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X35.598 Y111.735 I4.242 J2.23 E.07496
G1 X35.598 Y140.265 E.94638
G2 X36.148 Y142.435 I4.792 J-.06 E.07497
G1 X35.943 Y142.545 E.00771
G3 X34.802 Y138.735 I5.767 J-3.803 E.13381
G1 X34.802 Y113.265 E.8449
G3 X35.943 Y109.455 I6.908 J-.007 E.13381
G1 X36.095 Y109.537 E.00572
; WIPE_START
G1 X35.948 Y109.989 E-.18072
G1 X35.795 Y110.414 E-.17165
G1 X35.686 Y110.852 E-.17161
G1 X35.619 Y111.299 E-.17168
G1 X35.611 Y111.468 E-.06435
; WIPE_END
G1 E-.04 F1800
G1 X36.168 Y119.08 Z7 F30000
G1 X38.015 Y144.302 Z7
G1 Z6.6
G1 E.8 F1800
G1 F15476.087
G1 X38.439 Y144.502 E.01555
G2 X40.185 Y144.852 I1.757 J-4.239 E.05946
G1 X215.815 Y144.852 E5.82596
G2 X217.985 Y144.302 I-.06 J-4.792 E.07496
G1 X218.095 Y144.507 E.00771
G3 X214.285 Y145.648 I-3.803 J-5.766 E.13381
G1 X41.715 Y145.648 E5.72448
G3 X37.905 Y144.507 I.03 J-7.031 E.13374
G1 X37.987 Y144.355 E.00572
; WIPE_START
G1 X38.439 Y144.502 E-.1807
G1 X38.864 Y144.655 E-.17166
G1 X39.302 Y144.764 E-.17162
G1 X39.749 Y144.831 E-.17168
G1 X39.918 Y144.839 E-.06434
; WIPE_END
G1 E-.04 F1800
G1 X39.222 Y137.238 Z7 F30000
G1 X36.552 Y108.102 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y105.96 I5.171 J5.171 E.17594
G1 X214.295 Y105.96 E5.3032
G1 X214.682 Y105.979 E.0119
G3 X221.59 Y113.255 I-.375 J7.273 E.34009
G1 X221.59 Y138.745 E.78322
G3 X214.295 Y146.04 I-7.313 J-.017 E.35188
G1 X41.705 Y146.04 E5.3032
G3 X34.41 Y138.745 I.017 J-7.312 E.35189
G1 X34.41 Y113.255 E.78322
G3 X36.51 Y108.144 I7.313 J.017 E.1741
M204 S10000
G1 X36.32 Y109.102 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.61508
G1 F11010.915
G3 X37.552 Y107.87 I4.286 J3.053 E.08165
G1 X37.576 Y107.875 E.00112
; LINE_WIDTH: 0.573723
G1 F11868.826
G1 X37.599 Y107.88 E.00104
; LINE_WIDTH: 0.542373
G1 F12613.807
G1 X37.767 Y107.922 E.00703
; LINE_WIDTH: 0.516067
G1 F13315.111
G1 X37.935 Y107.964 E.00666
; WIPE_START
G1 X37.767 Y107.922 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.437 Y106.985 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.109972
G1 F15000
G1 X39.579 Y106.95 E.0008
; LINE_WIDTH: 0.136077
G1 X39.721 Y106.914 E.00111
; LINE_WIDTH: 0.15694
G1 X39.775 Y106.903 E.00051
; LINE_WIDTH: 0.184808
G1 X39.975 Y106.874 E.00234
; LINE_WIDTH: 0.224471
G1 X40.175 Y106.844 E.00299
; LINE_WIDTH: 0.25957
G1 X40.3 Y106.828 E.00222
; LINE_WIDTH: 0.289713
G1 X40.42 Y106.814 E.00243
; LINE_WIDTH: 0.328149
G1 X40.741 Y106.79 E.00748
; LINE_WIDTH: 0.37549
G1 X41.061 Y106.766 E.00872
; LINE_WIDTH: 0.431596
G1 X41.725 Y106.75 E.02102
G1 X214.275 Y106.75 E5.46505
G1 X214.939 Y106.766 E.02102
; LINE_WIDTH: 0.375496
G1 X215.259 Y106.79 E.00872
; LINE_WIDTH: 0.328152
G1 X215.58 Y106.814 E.00748
; LINE_WIDTH: 0.28971
G1 X215.7 Y106.828 E.00243
; LINE_WIDTH: 0.26017
G1 X215.82 Y106.843 E.00214
; LINE_WIDTH: 0.224975
G1 X216.025 Y106.874 E.00308
; LINE_WIDTH: 0.184822
G1 X216.225 Y106.903 E.00234
; LINE_WIDTH: 0.141768
G1 X216.421 Y106.95 E.00162
; LINE_WIDTH: 0.10998
G1 X216.563 Y106.985 E.0008
; WIPE_START
G1 X216.421 Y106.95 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X218.065 Y107.964 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.515954
G1 F13318.29
G1 X218.233 Y107.922 E.00666
; LINE_WIDTH: 0.542265
G1 F12616.549
G1 X218.401 Y107.88 E.00703
; LINE_WIDTH: 0.573649
G1 F11870.473
G1 X218.424 Y107.875 E.00104
; LINE_WIDTH: 0.610085
G1 F11107.883
G1 X218.448 Y107.87 E.00111
; LINE_WIDTH: 0.615085
G1 F11010.816
G3 X219.68 Y109.102 I-3.053 J4.286 E.08164
G1 X219.675 Y109.126 E.00112
; LINE_WIDTH: 0.573506
G1 F11873.671
G1 X219.67 Y109.149 E.00104
; LINE_WIDTH: 0.542085
G1 F12621.085
G1 X219.628 Y109.317 E.00703
; LINE_WIDTH: 0.515779
G1 F13323.223
G1 X219.586 Y109.484 E.00666
; WIPE_START
G1 X219.628 Y109.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X220.565 Y110.987 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.109983
G1 F15000
G1 X220.6 Y111.129 E.0008
; LINE_WIDTH: 0.136094
G1 X220.636 Y111.271 E.00111
; LINE_WIDTH: 0.15694
G1 X220.647 Y111.325 E.00051
; LINE_WIDTH: 0.184795
G1 X220.676 Y111.525 E.00234
; LINE_WIDTH: 0.22448
G1 X220.706 Y111.725 E.00299
; LINE_WIDTH: 0.259577
G1 X220.722 Y111.85 E.00222
; LINE_WIDTH: 0.289729
G1 X220.736 Y111.97 E.00243
; LINE_WIDTH: 0.328164
G1 X220.76 Y112.291 E.00748
; LINE_WIDTH: 0.375495
G1 X220.784 Y112.611 E.00872
; LINE_WIDTH: 0.430914
G1 X220.8 Y113.275 E.02098
G1 X220.8 Y138.725 E.80466
G1 X220.784 Y139.389 E.02098
; LINE_WIDTH: 0.375496
G1 X220.76 Y139.709 E.00872
; LINE_WIDTH: 0.328152
G1 X220.736 Y140.03 E.00748
; LINE_WIDTH: 0.289729
G1 X220.722 Y140.15 E.00243
; LINE_WIDTH: 0.26019
G1 X220.707 Y140.27 E.00214
; LINE_WIDTH: 0.224964
G1 X220.676 Y140.475 E.00308
; LINE_WIDTH: 0.184798
G1 X220.647 Y140.675 E.00234
; LINE_WIDTH: 0.141765
G1 X220.6 Y140.871 E.00162
; LINE_WIDTH: 0.109981
G1 X220.565 Y141.013 E.0008
; WIPE_START
G1 X220.6 Y140.871 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X219.586 Y142.516 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.515774
G1 F13323.373
G1 X219.628 Y142.683 E.00666
; LINE_WIDTH: 0.54209
G1 F12620.969
G1 X219.67 Y142.851 E.00703
; LINE_WIDTH: 0.573502
G1 F11873.752
G1 X219.675 Y142.874 E.00104
; LINE_WIDTH: 0.615083
G1 F11010.853
G1 X219.68 Y142.898 E.00112
G3 X218.448 Y144.13 I-4.286 J-3.053 E.08164
; LINE_WIDTH: 0.610119
G1 F11107.214
G1 X218.424 Y144.125 E.00111
; LINE_WIDTH: 0.573768
G1 F11867.822
G1 X218.401 Y144.12 E.00104
; LINE_WIDTH: 0.542437
G1 F12612.186
G1 X218.233 Y144.078 E.00704
; LINE_WIDTH: 0.516125
G1 F13313.481
G1 X218.065 Y144.036 E.00667
; WIPE_START
G1 X218.233 Y144.078 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.563 Y145.015 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.109978
G1 F15000
G1 X216.421 Y145.05 E.0008
; LINE_WIDTH: 0.141762
G1 X216.225 Y145.097 E.00162
; LINE_WIDTH: 0.184808
G1 X216.025 Y145.126 E.00234
; LINE_WIDTH: 0.224961
G1 X215.82 Y145.157 E.00308
; LINE_WIDTH: 0.260183
G1 X215.7 Y145.172 E.00214
; LINE_WIDTH: 0.289714
G1 X215.58 Y145.186 E.00243
; LINE_WIDTH: 0.328149
G1 X215.259 Y145.21 E.00748
; LINE_WIDTH: 0.37549
G1 X214.939 Y145.234 E.00872
; LINE_WIDTH: 0.431596
G1 X214.275 Y145.25 E.02102
G1 X41.725 Y145.25 E5.46505
G1 X41.061 Y145.234 E.02102
; LINE_WIDTH: 0.375496
G1 X40.741 Y145.21 E.00872
; LINE_WIDTH: 0.328152
G1 X40.42 Y145.186 E.00748
; LINE_WIDTH: 0.28971
G1 X40.3 Y145.172 E.00243
; LINE_WIDTH: 0.259563
G1 X40.175 Y145.156 E.00222
; LINE_WIDTH: 0.224473
G1 X39.975 Y145.126 E.00299
; LINE_WIDTH: 0.184796
G1 X39.775 Y145.097 E.00234
; LINE_WIDTH: 0.156942
G1 X39.721 Y145.086 E.00051
; LINE_WIDTH: 0.136085
G1 X39.579 Y145.05 E.00111
; LINE_WIDTH: 0.109978
G1 X39.437 Y145.015 E.0008
; WIPE_START
G1 X39.579 Y145.05 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.935 Y144.036 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.516036
G1 F13315.991
G1 X37.767 Y144.078 E.00666
; LINE_WIDTH: 0.54234
G1 F12614.649
G1 X37.599 Y144.12 E.00703
; LINE_WIDTH: 0.573687
G1 F11869.62
G1 X37.576 Y144.125 E.00104
; LINE_WIDTH: 0.615082
G1 F11010.87
G1 X37.552 Y144.13 E.00112
G3 X36.32 Y142.898 I3.053 J-4.286 E.08165
; LINE_WIDTH: 0.61007
G1 F11108.178
G1 X36.325 Y142.874 E.00111
; LINE_WIDTH: 0.573618
G1 F11871.171
G1 X36.33 Y142.851 E.00104
; LINE_WIDTH: 0.542231
G1 F12617.391
G1 X36.372 Y142.683 E.00703
; LINE_WIDTH: 0.515924
G1 F13319.147
G1 X36.414 Y142.515 E.00666
; WIPE_START
G1 X36.372 Y142.683 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X35.435 Y141.013 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.109978
G1 F15000
G1 X35.4 Y140.871 E.0008
; LINE_WIDTH: 0.136079
G1 X35.364 Y140.729 E.00111
; LINE_WIDTH: 0.156922
G1 X35.353 Y140.675 E.00051
; LINE_WIDTH: 0.18479
G1 X35.324 Y140.475 E.00234
; LINE_WIDTH: 0.224465
G1 X35.294 Y140.275 E.00299
; LINE_WIDTH: 0.259561
G1 X35.278 Y140.15 E.00222
; LINE_WIDTH: 0.289723
G1 X35.264 Y140.03 E.00243
; LINE_WIDTH: 0.328164
G1 X35.24 Y139.709 E.00748
; LINE_WIDTH: 0.375495
G1 X35.216 Y139.389 E.00872
; LINE_WIDTH: 0.430913
G1 X35.2 Y138.725 E.02098
G1 X35.2 Y113.275 E.80466
G1 X35.216 Y112.611 E.02098
; LINE_WIDTH: 0.375486
G1 X35.24 Y112.291 E.00872
; LINE_WIDTH: 0.328162
G1 X35.264 Y111.97 E.00748
; LINE_WIDTH: 0.289724
G1 X35.278 Y111.85 E.00243
; LINE_WIDTH: 0.260175
G1 X35.293 Y111.73 E.00214
; LINE_WIDTH: 0.224943
G1 X35.324 Y111.525 E.00308
; LINE_WIDTH: 0.184781
G1 X35.353 Y111.325 E.00234
; LINE_WIDTH: 0.14175
G1 X35.4 Y111.129 E.00162
; LINE_WIDTH: 0.10998
G1 X35.435 Y110.987 E.0008
; WIPE_START
G1 X35.4 Y111.129 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.414 Y109.485 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.516058
G1 F13315.354
G1 X36.372 Y109.317 E.00667
; LINE_WIDTH: 0.542385
G1 F12613.517
G1 X36.33 Y109.149 E.00704
; LINE_WIDTH: 0.573727
G1 F11868.727
G1 X36.325 Y109.126 E.00104
; LINE_WIDTH: 0.610094
G1 F11107.716
G1 X36.32 Y109.102 E.00111
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11107.716
G1 X36.325 Y109.126 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/35
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7 I.67 J1.016 P1  F30000
G1 X39.294 Y107.168 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X39.257 Y107.02 E.00509
G3 X41.715 Y106.552 I2.447 J6.171 E.08349
G1 X214.506 Y106.563 E5.73179
G3 X216.743 Y107.02 I-.102 J6.209 E.07617
G1 X216.689 Y107.234 E.00734
G2 X215.815 Y107.148 I-.876 J4.394 E.02918
G1 X40.185 Y107.148 E5.82596
G2 X39.311 Y107.234 I.001 J4.48 E.02919
G1 X39.309 Y107.227 E.00026
; WIPE_START
G1 X39.257 Y107.02 E-.08113
G1 X39.756 Y106.841 E-.20126
G1 X40.393 Y106.681 E-.24979
G1 X40.987 Y106.593 E-.22783
; WIPE_END
G1 E-.04 F1800
G1 X48.617 Y106.775 Z7.2 F30000
G1 X220.316 Y110.861 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F15476.087
G1 X220.53 Y110.807 E.00734
G1 X220.709 Y111.306 E.01757
G3 X220.998 Y113.265 I-7.265 J2.073 E.06588
G1 X220.998 Y138.735 E.8449
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X220.53 Y141.193 I-7.02 J-.062 E.08343
G1 X220.316 Y141.139 E.00734
G2 X220.402 Y140.265 I-4.394 J-.876 E.02918
G1 X220.402 Y111.735 E.94638
G2 X220.327 Y110.92 I-4.481 J.001 E.0272
; WIPE_START
G1 X220.53 Y110.807 E-.08836
G1 X220.709 Y111.306 E-.20124
G1 X220.869 Y111.943 E-.24978
G1 X220.954 Y112.518 E-.22062
; WIPE_END
G1 E-.04 F1800
G1 X213.323 Y112.37 Z7.2 F30000
G1 X37.051 Y108.963 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.223 Y108.773 E.00788
G3 X40.195 Y107.54 I2.977 J2.977 E.10144
G1 X215.805 Y107.54 E5.39602
G3 X220.01 Y111.745 I-.017 J4.222 E.20273
G1 X220.01 Y140.255 E.87604
G3 X215.805 Y144.46 I-4.209 J-.005 E.20289
G1 X40.195 Y144.46 E5.39602
G3 X35.99 Y140.255 I.017 J-4.222 E.20273
G1 X35.99 Y111.745 E.87604
G3 X36.945 Y109.079 I4.209 J.005 E.08874
G1 X37.01 Y109.007 E.00297
; WIPE_START
M204 S10000
G1 X37.223 Y108.773 E-.12026
G1 X37.529 Y108.495 E-.15702
G1 X37.861 Y108.249 E-.157
G1 X38.215 Y108.037 E-.15702
G1 X38.589 Y107.86 E-.15695
G1 X38.618 Y107.85 E-.01175
; WIPE_END
G1 E-.04 F1800
G1 X35.684 Y110.861 Z7.2 F30000
M73 P96 R1
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X35.598 Y111.735 I4.394 J.876 E.02918
G1 X35.598 Y140.265 E.94638
G2 X35.684 Y141.139 I4.481 J-.001 E.02918
G1 X35.47 Y141.193 E.00734
G1 X35.291 Y140.694 E.01757
G3 X35.002 Y138.735 I7.265 J-2.073 E.06587
G1 X35.002 Y113.265 E.8449
G3 X35.47 Y110.807 I7.02 J.062 E.08343
G1 X35.626 Y110.846 E.00535
; WIPE_START
G1 X35.619 Y111.299 E-.17195
G1 X35.598 Y111.735 E-.16597
G1 X35.598 Y112.846 E-.42207
; WIPE_END
G1 E-.04 F1800
G1 X36.48 Y120.427 Z7.2 F30000
G1 X39.311 Y144.766 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F15476.087
G1 X39.749 Y144.831 E.01469
G1 X40.185 Y144.852 E.01449
G1 X215.815 Y144.852 E5.82596
G2 X216.689 Y144.766 I-.001 J-4.481 E.02918
G1 X216.743 Y144.98 E.00734
G1 X216.244 Y145.159 E.01757
G3 X214.285 Y145.448 I-2.073 J-7.265 E.06587
G1 X41.715 Y145.448 E5.72448
G3 X39.257 Y144.98 I.062 J-7.021 E.08343
G1 X39.296 Y144.824 E.00535
; WIPE_START
G1 X39.749 Y144.831 E-.17197
G1 X40.185 Y144.852 E-.16597
G1 X41.296 Y144.852 E-.42206
; WIPE_END
G1 E-.04 F1800
G1 X40.344 Y137.279 Z7.2 F30000
G1 X36.693 Y108.243 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X41.705 Y106.16 I5.029 J5.029 E.17112
G1 X214.525 Y106.171 E5.31027
G3 X221.39 Y113.255 I-.219 J7.081 E.33529
G1 X221.39 Y138.745 E.78322
G3 X214.295 Y145.84 I-7.111 J-.016 E.34225
G1 X41.705 Y145.84 E5.3032
G3 X34.61 Y138.745 I-.002 J-7.093 E.34249
G1 X34.61 Y113.255 E.78322
G3 X36.651 Y108.285 I7.111 J.016 E.16928
M204 S10000
G1 X37.449 Y108.07 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.414122
G1 F15000
G1 X37.296 Y108.197 E.00602
G2 X36.37 Y109.203 I3.77 J4.397 E.04144
; LINE_WIDTH: 0.451484
G2 X36.121 Y109.581 I2.925 J2.199 E.01512
; LINE_WIDTH: 0.492598
G1 F14010.042
G2 X35.906 Y109.984 I8.169 J4.612 E.01672
; LINE_WIDTH: 0.530726
G1 F12914.991
G1 X35.842 Y110.119 E.00593
; LINE_WIDTH: 0.5622
G1 F12132.196
G1 X35.728 Y110.395 E.01266
G1 X35.916 Y110.717 E.01576
; WIPE_START
G1 X35.728 Y110.395 E-.42148
G1 X35.842 Y110.119 E-.33852
; WIPE_END
G1 E-.04 F1800
G1 X35.371 Y111.924 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.101733
G1 F15000
G1 X35.363 Y111.989 E.00032
; LINE_WIDTH: 0.129847
G1 X35.339 Y112.305 E.00224
; LINE_WIDTH: 0.176462
G1 X35.316 Y112.621 E.00345
; LINE_WIDTH: 0.230943
G1 X35.3 Y113.272 E.00998
G1 X35.3 Y138.728 E.39001
G1 X35.316 Y139.379 E.00998
; LINE_WIDTH: 0.176457
G1 X35.339 Y139.695 E.00345
; LINE_WIDTH: 0.12985
G1 X35.363 Y140.011 E.00224
; LINE_WIDTH: 0.101729
G1 X35.371 Y140.076 E.00032
; WIPE_START
G1 X35.363 Y140.011 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X35.916 Y141.283 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.562203
G1 F12132.11
G1 X35.728 Y141.605 E.01575
G1 X35.842 Y141.881 E.01267
; LINE_WIDTH: 0.530724
G1 F12915.036
G1 X35.906 Y142.016 E.00593
; LINE_WIDTH: 0.492598
G1 F14010.033
G2 X36.121 Y142.419 I8.254 J-4.14 E.01672
; LINE_WIDTH: 0.451492
G1 F15000
G2 X36.37 Y142.797 I3.175 J-1.82 E.01512
; LINE_WIDTH: 0.414122
G2 X37.296 Y143.803 I4.423 J-3.14 E.04145
G1 X37.449 Y143.93 E.00602
; LINE_WIDTH: 0.441317
G2 X37.989 Y144.304 I4.207 J-5.48 E.02133
; LINE_WIDTH: 0.489158
G1 F14118.04
G2 X38.413 Y144.533 I2.952 J-4.964 E.01755
; LINE_WIDTH: 0.528534
G1 F12973.286
G1 X38.569 Y144.608 E.00683
; LINE_WIDTH: 0.562167
G1 F12132.971
G1 X38.845 Y144.722 E.01265
G1 X39.167 Y144.534 E.01576
; WIPE_START
G1 X38.845 Y144.722 E-.42151
G1 X38.569 Y144.608 E-.33849
; WIPE_END
G1 E-.04 F1800
G1 X40.374 Y145.079 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.101723
G1 F15000
G1 X40.439 Y145.087 E.00032
; LINE_WIDTH: 0.129847
G1 X40.755 Y145.111 E.00224
; LINE_WIDTH: 0.176461
G1 X41.071 Y145.134 E.00345
; LINE_WIDTH: 0.231601
G1 X41.722 Y145.15 E.01001
G1 X214.278 Y145.15 E2.65305
G1 X214.929 Y145.134 E.01001
; LINE_WIDTH: 0.176452
G1 X215.245 Y145.111 E.00345
; LINE_WIDTH: 0.129835
G1 X215.561 Y145.087 E.00224
; LINE_WIDTH: 0.101729
G1 X215.626 Y145.079 E.00032
; WIPE_START
G1 X215.561 Y145.087 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X216.833 Y144.534 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.5622
G1 F12132.189
G1 X217.155 Y144.722 E.01576
G1 X217.431 Y144.608 E.01266
; LINE_WIDTH: 0.530701
G1 F12915.639
G1 X217.566 Y144.544 E.00593
; LINE_WIDTH: 0.492578
G1 F14010.656
G2 X217.969 Y144.329 I-4.211 J-8.386 E.01672
; LINE_WIDTH: 0.451491
G1 F15000
G2 X218.347 Y144.08 I-1.824 J-3.181 E.01512
; LINE_WIDTH: 0.414123
G2 X219.353 Y143.154 I-3.39 J-4.695 E.04143
G1 X219.48 Y143.001 E.00602
; LINE_WIDTH: 0.441324
G2 X219.854 Y142.461 I-5.482 J-4.209 E.02134
; LINE_WIDTH: 0.489167
G1 F14117.749
G2 X220.083 Y142.037 I-4.996 J-2.97 E.01754
; LINE_WIDTH: 0.528521
G1 F12973.613
G1 X220.158 Y141.881 E.00682
; LINE_WIDTH: 0.562184
G1 F12132.56
G1 X220.272 Y141.605 E.01266
G1 X220.084 Y141.283 E.01575
; WIPE_START
G1 X220.272 Y141.605 E-.42136
G1 X220.158 Y141.881 E-.33864
; WIPE_END
G1 E-.04 F1800
G1 X220.629 Y140.076 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.101733
G1 F15000
G1 X220.637 Y140.011 E.00032
; LINE_WIDTH: 0.129847
G1 X220.661 Y139.695 E.00224
; LINE_WIDTH: 0.176462
G1 X220.684 Y139.379 E.00345
; LINE_WIDTH: 0.230943
G1 X220.7 Y138.728 E.00998
G1 X220.7 Y113.272 E.39001
G1 X220.684 Y112.621 E.00998
; LINE_WIDTH: 0.176457
G1 X220.661 Y112.305 E.00345
; LINE_WIDTH: 0.12985
G1 X220.637 Y111.989 E.00224
; LINE_WIDTH: 0.10174
G1 X220.629 Y111.924 E.00032
; WIPE_START
G1 X220.637 Y111.989 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X220.084 Y110.717 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.562167
G1 F12132.969
G1 X220.272 Y110.395 E.01575
G1 X220.158 Y110.119 E.01266
; LINE_WIDTH: 0.528497
G1 F12974.253
G1 X220.083 Y109.963 E.00683
; LINE_WIDTH: 0.489154
G1 F14118.175
G2 X219.854 Y109.539 I-5.182 J2.522 E.01754
; LINE_WIDTH: 0.441334
G1 F15000
G2 X219.48 Y108.999 I-5.856 J3.669 E.02134
; LINE_WIDTH: 0.414123
G1 X219.353 Y108.845 E.00602
G2 X218.347 Y107.92 I-4.396 J3.77 E.04143
; LINE_WIDTH: 0.451492
G2 X217.969 Y107.671 I-2.208 J2.939 E.01512
; LINE_WIDTH: 0.492589
G1 F14010.302
G2 X217.566 Y107.456 I-4.543 J8.04 E.01672
; LINE_WIDTH: 0.530716
G1 F12915.238
G1 X217.431 Y107.392 E.00593
; LINE_WIDTH: 0.562228
G1 F12131.544
G1 X217.154 Y107.278 E.01266
G1 X216.833 Y107.466 E.01576
; WIPE_START
G1 X217.154 Y107.278 E-.42139
G1 X217.431 Y107.392 E-.33861
; WIPE_END
G1 E-.04 F1800
G1 X215.626 Y106.921 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.101723
G1 F15000
G1 X215.561 Y106.913 E.00032
; LINE_WIDTH: 0.129842
G1 X215.245 Y106.889 E.00224
; LINE_WIDTH: 0.176447
G1 X214.929 Y106.866 E.00345
; LINE_WIDTH: 0.231601
G1 X214.278 Y106.85 E.01001
G1 X41.722 Y106.85 E2.65305
G1 X41.071 Y106.866 E.01001
; LINE_WIDTH: 0.176457
G1 X40.755 Y106.889 E.00345
; LINE_WIDTH: 0.12985
G1 X40.439 Y106.913 E.00224
; LINE_WIDTH: 0.101729
G1 X40.374 Y106.921 E.00032
; WIPE_START
G1 X40.439 Y106.913 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.167 Y107.466 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.562153
G1 F12133.301
G1 X38.845 Y107.278 E.01576
G1 X38.569 Y107.392 E.01266
; LINE_WIDTH: 0.528496
G1 F12974.303
G1 X38.413 Y107.467 E.00683
; LINE_WIDTH: 0.48914
G1 F14118.613
G2 X37.989 Y107.696 I2.531 J5.199 E.01754
; LINE_WIDTH: 0.441332
G1 F15000
G2 X37.449 Y108.07 I3.671 J5.859 E.02133
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X37.989 Y107.696 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/35
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.2 I-.977 J-.725 P1  F30000
G1 X37.04 Y108.975 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X37.223 Y108.773 E.00839
G3 X40.195 Y107.54 I2.977 J2.977 E.10144
G1 X215.805 Y107.54 E5.39602
G3 X220.01 Y111.745 I-.017 J4.222 E.20273
G1 X220.01 Y140.255 E.87604
G3 X215.805 Y144.46 I-4.222 J-.017 E.20273
G1 X40.195 Y144.46 E5.39602
G3 X35.99 Y140.255 I.005 J-4.209 E.20289
G1 X35.99 Y111.745 E.87604
G3 X36.945 Y109.079 I4.209 J.005 E.08874
G1 X36.999 Y109.02 E.00246
M204 S250
G1 X36.829 Y108.379 F30000
G1 F12000
M204 S5000
G3 X41.705 Y106.36 I4.874 J4.874 E.16642
G1 X214.368 Y106.364 E5.30545
G3 X221.19 Y113.255 I-.067 J6.889 E.33053
G1 X221.19 Y138.745 E.78322
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X214.295 Y145.64 I-6.911 J-.016 E.3326
G1 X41.705 Y145.64 E5.3032
G3 X34.81 Y138.745 I-.002 J-6.893 E.33284
G1 X34.81 Y113.255 E.78322
G3 X36.787 Y108.421 I6.893 J-.002 E.16457
M204 S10000
G1 X37.513 Y108.148 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.241762
G1 F15000
G1 X38.044 Y107.779 E.01048
; LINE_WIDTH: 0.289566
G3 X38.456 Y107.557 I2.736 J4.588 E.00941
; LINE_WIDTH: 0.329209
G1 X38.616 Y107.481 E.00414
; LINE_WIDTH: 0.359798
G1 X38.865 Y107.378 E.00696
; LINE_WIDTH: 0.391283
G1 X39.048 Y107.312 E.00551
; LINE_WIDTH: 0.427716
G1 X39.216 Y107.252 E.00558
; LINE_WIDTH: 0.448999
G1 X39.29 Y107.229 E.00259
; LINE_WIDTH: 0.475175
G1 F14574.737
G3 X39.521 Y107.171 I1.298 J4.651 E.00837
; LINE_WIDTH: 0.519715
G1 F13213.244
G1 X39.732 Y107.118 E.00844
; LINE_WIDTH: 0.549599
G1 F12433.919
G3 X40.027 Y107.059 I1.371 J6.055 E.01244
; WIPE_START
G1 X39.732 Y107.118 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.513 Y108.148 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.214287
G1 F15000
G1 X37.026 Y108.576 E.00906
G1 X36.727 Y108.905 E.00621
G2 X36.456 Y109.254 I5.117 J4.254 E.00617
; LINE_WIDTH: 0.25089
G2 X36.211 Y109.624 I2.992 J2.246 E.00753
; LINE_WIDTH: 0.291835
G2 X36.001 Y110.018 I8.141 J4.597 E.00905
; LINE_WIDTH: 0.330474
G1 X35.931 Y110.166 E.00385
; LINE_WIDTH: 0.360608
G2 X35.822 Y110.431 I5.306 J2.344 E.0074
; LINE_WIDTH: 0.392845
G1 X35.762 Y110.598 E.00507
; LINE_WIDTH: 0.435704
G2 X35.674 Y110.86 I2.652 J1.037 E.00885
; LINE_WIDTH: 0.477121
G1 F14509.436
G1 X35.621 Y111.071 E.00769
; LINE_WIDTH: 0.522194
G1 F13144.892
G2 X35.563 Y111.306 I4.711 J1.292 E.00945
; LINE_WIDTH: 0.550099
G1 F12421.669
G1 X35.509 Y111.577 E.01143
G1 X35.783 Y112.438 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X35.175 Y111.831 E.02639
G1 X35.096 Y112.285
G1 X35.783 Y112.971 E.02983
G1 X35.783 Y113.505
G1 X35.042 Y112.764 E.03219
G1 X35.017 Y113.273
G1 X35.783 Y114.038 E.03325
G1 X35.783 Y114.571
G1 X35.017 Y113.806 E.03325
G1 X35.017 Y114.339
G1 X35.783 Y115.104 E.03325
G1 X35.783 Y115.638
G1 X35.017 Y114.872 E.03325
G1 X35.017 Y115.406
G1 X35.783 Y116.171 E.03325
G1 X35.783 Y116.704
G1 X35.017 Y115.939 E.03325
G1 X35.017 Y116.472
G1 X35.783 Y117.237 E.03325
G1 X35.783 Y117.771
G1 X35.017 Y117.005 E.03325
G1 X35.017 Y117.539
G1 X35.783 Y118.304 E.03325
G1 X35.783 Y118.837
G1 X35.017 Y118.072 E.03325
G1 X35.017 Y118.605
G1 X35.783 Y119.371 E.03325
G1 X35.783 Y119.904
G1 X35.017 Y119.139 E.03325
G1 X35.017 Y119.672
G1 X35.783 Y120.437 E.03325
G1 X35.783 Y120.97
G1 X35.017 Y120.205 E.03325
G1 X35.017 Y120.738
G1 X35.783 Y121.504 E.03325
G1 X35.783 Y122.037
G1 X35.017 Y121.272 E.03325
G1 X35.017 Y121.805
G1 X35.783 Y122.57 E.03325
G1 X35.783 Y123.103
G1 X35.017 Y122.338 E.03325
G1 X35.017 Y122.871
G1 X35.783 Y123.637 E.03325
G1 X35.783 Y124.17
G1 X35.017 Y123.405 E.03325
G1 X35.017 Y123.938
G1 X35.783 Y124.703 E.03325
G1 X35.783 Y125.236
G1 X35.017 Y124.471 E.03325
G1 X35.017 Y125.004
G1 X35.783 Y125.77 E.03325
G1 X35.783 Y126.303
G1 X35.017 Y125.538 E.03325
G1 X35.017 Y126.071
G1 X35.783 Y126.836 E.03325
G1 X35.783 Y127.369
G1 X35.017 Y126.604 E.03325
G1 X35.017 Y127.137
G1 X35.783 Y127.903 E.03325
G1 X35.783 Y128.436
G1 X35.017 Y127.671 E.03325
G1 X35.017 Y128.204
G1 X35.783 Y128.969 E.03325
G1 X35.783 Y129.502
G1 X35.017 Y128.737 E.03325
G1 X35.017 Y129.27
G1 X35.783 Y130.036 E.03325
G1 X35.783 Y130.569
G1 X35.017 Y129.804 E.03325
G1 X35.017 Y130.337
G1 X35.783 Y131.102 E.03325
G1 X35.783 Y131.635
G1 X35.017 Y130.87 E.03325
G1 X35.017 Y131.403
G1 X35.783 Y132.169 E.03325
G1 X35.783 Y132.702
G1 X35.017 Y131.937 E.03325
G1 X35.017 Y132.47
G1 X35.783 Y133.235 E.03325
G1 X35.783 Y133.768
G1 X35.017 Y133.003 E.03325
G1 X35.017 Y133.536
G1 X35.783 Y134.302 E.03325
G1 X35.783 Y134.835
G1 X35.017 Y134.07 E.03325
G1 X35.017 Y134.603
G1 X35.783 Y135.368 E.03325
G1 X35.783 Y135.901
G1 X35.017 Y135.136 E.03325
G1 X35.017 Y135.67
G1 X35.783 Y136.435 E.03325
G1 X35.783 Y136.968
G1 X35.017 Y136.203 E.03325
G1 X35.017 Y136.736
G1 X35.783 Y137.501 E.03325
G1 X35.783 Y138.035
G1 X35.017 Y137.269 E.03325
G1 X35.017 Y137.803
G1 X35.783 Y138.568 E.03325
G1 X35.783 Y139.101
G1 X35.017 Y138.336 E.03325
G1 X35.024 Y138.876
G1 X35.783 Y139.634 E.03296
G1 X35.774 Y140.159
G1 X35.055 Y139.44 E.03124
; WIPE_START
M204 S10000
G1 X35.774 Y140.159 E-.38633
G1 X35.783 Y139.634 E-.19945
G1 X35.458 Y139.31 E-.17421
; WIPE_END
G1 E-.04 F1800
G1 X35.509 Y140.423 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.550081
G1 F12422.088
G1 X35.563 Y140.694 E.01142
; LINE_WIDTH: 0.522185
G1 F13145.138
G2 X35.621 Y140.929 I4.846 J-1.076 E.00945
; LINE_WIDTH: 0.477103
G1 F14510.017
G1 X35.674 Y141.14 E.00769
; LINE_WIDTH: 0.435681
G1 F15000
G2 X35.762 Y141.402 I2.748 J-.778 E.00885
; LINE_WIDTH: 0.392829
G1 X35.822 Y141.569 E.00507
; LINE_WIDTH: 0.36062
G2 X35.931 Y141.834 I5.413 J-2.079 E.0074
; LINE_WIDTH: 0.330465
G1 X36.001 Y141.982 E.00385
; LINE_WIDTH: 0.291837
G2 X36.211 Y142.376 I8.122 J-4.081 E.00905
; LINE_WIDTH: 0.250889
G2 X36.456 Y142.746 I3.236 J-1.875 E.00753
; LINE_WIDTH: 0.214292
G2 X36.727 Y143.095 I5.399 J-3.913 E.00617
G1 X37.026 Y143.424 E.00621
G1 X37.513 Y143.852 E.00905
; LINE_WIDTH: 0.241754
G1 X38.044 Y144.221 E.01048
; LINE_WIDTH: 0.289552
G2 X38.456 Y144.443 I2.729 J-4.576 E.0094
; LINE_WIDTH: 0.329186
G1 X38.616 Y144.519 E.00415
; LINE_WIDTH: 0.359794
G1 X38.865 Y144.622 E.00695
; LINE_WIDTH: 0.391268
G1 X39.048 Y144.688 E.00551
; LINE_WIDTH: 0.427696
G1 X39.215 Y144.748 E.00558
; LINE_WIDTH: 0.448987
G1 X39.29 Y144.771 E.0026
; LINE_WIDTH: 0.475167
G1 F14575.028
G2 X39.521 Y144.829 I1.299 J-4.656 E.00837
; LINE_WIDTH: 0.519708
G1 F13213.417
G1 X39.732 Y144.882 E.00844
; LINE_WIDTH: 0.549602
G1 F12433.849
G2 X40.027 Y144.941 I1.375 J-6.073 E.01244
; WIPE_START
G1 X39.732 Y144.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.364 Y144.872 Z7.4 F30000
G1 X215.191 Y144.667 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X215.781 Y145.257 E.02564
G1 X215.334 Y145.344
G1 X214.658 Y144.667 E.02939
G1 X214.124 Y144.667
G1 X214.862 Y145.405 E.03203
G1 X214.353 Y145.43
G1 X213.591 Y144.667 E.03312
G1 X213.058 Y144.667
G1 X213.823 Y145.433 E.03325
G1 X213.29 Y145.433
G1 X212.525 Y144.667 E.03325
G1 X211.991 Y144.667
G1 X212.757 Y145.433 E.03325
G1 X212.223 Y145.433
G1 X211.458 Y144.667 E.03325
G1 X210.925 Y144.667
G1 X211.69 Y145.433 E.03325
G1 X211.157 Y145.433
G1 X210.392 Y144.667 E.03325
G1 X209.858 Y144.667
G1 X210.624 Y145.433 E.03325
G1 X210.09 Y145.433
G1 X209.325 Y144.667 E.03325
G1 X208.792 Y144.667
G1 X209.557 Y145.433 E.03325
G1 X209.024 Y145.433
G1 X208.259 Y144.667 E.03325
G1 X207.725 Y144.667
G1 X208.491 Y145.433 E.03325
G1 X207.957 Y145.433
G1 X207.192 Y144.667 E.03325
G1 X206.659 Y144.667
G1 X207.424 Y145.433 E.03325
G1 X206.891 Y145.433
G1 X206.126 Y144.667 E.03325
G1 X205.592 Y144.667
G1 X206.358 Y145.433 E.03325
G1 X205.824 Y145.433
G1 X205.059 Y144.667 E.03325
G1 X204.526 Y144.667
G1 X205.291 Y145.433 E.03325
G1 X204.758 Y145.433
G1 X203.992 Y144.667 E.03325
G1 X203.459 Y144.667
G1 X204.224 Y145.433 E.03325
G1 X203.691 Y145.433
G1 X202.926 Y144.667 E.03325
G1 X202.393 Y144.667
G1 X203.158 Y145.433 E.03325
G1 X202.625 Y145.433
G1 X201.859 Y144.667 E.03325
G1 X201.326 Y144.667
G1 X202.091 Y145.433 E.03325
G1 X201.558 Y145.433
G1 X200.793 Y144.667 E.03325
G1 X200.26 Y144.667
G1 X201.025 Y145.433 E.03325
G1 X200.492 Y145.433
G1 X199.726 Y144.667 E.03325
G1 X199.193 Y144.667
M73 P97 R1
G1 X199.958 Y145.433 E.03325
G1 X199.425 Y145.433
G1 X198.66 Y144.667 E.03325
G1 X198.127 Y144.667
G1 X198.892 Y145.433 E.03325
G1 X198.359 Y145.433
G1 X197.593 Y144.667 E.03325
G1 X197.06 Y144.667
G1 X197.825 Y145.433 E.03325
G1 X197.292 Y145.433
G1 X196.527 Y144.667 E.03325
G1 X195.994 Y144.667
G1 X196.759 Y145.433 E.03325
G1 X196.226 Y145.433
G1 X195.46 Y144.667 E.03325
G1 X194.927 Y144.667
G1 X195.692 Y145.433 E.03325
G1 X195.159 Y145.433
G1 X194.394 Y144.667 E.03325
G1 X193.861 Y144.667
G1 X194.626 Y145.433 E.03325
G1 X194.093 Y145.433
G1 X193.327 Y144.667 E.03325
G1 X192.794 Y144.667
G1 X193.559 Y145.433 E.03325
G1 X193.026 Y145.433
G1 X192.261 Y144.667 E.03325
G1 X191.728 Y144.667
G1 X192.493 Y145.433 E.03325
G1 X191.96 Y145.433
G1 X191.194 Y144.667 E.03325
G1 X190.661 Y144.667
G1 X191.426 Y145.433 E.03325
G1 X190.893 Y145.433
G1 X190.128 Y144.667 E.03325
G1 X189.595 Y144.667
G1 X190.36 Y145.433 E.03325
G1 X189.827 Y145.433
G1 X189.061 Y144.667 E.03325
G1 X188.528 Y144.667
G1 X189.293 Y145.433 E.03325
G1 X188.76 Y145.433
G1 X187.995 Y144.667 E.03325
G1 X187.462 Y144.667
G1 X188.227 Y145.433 E.03325
G1 X187.694 Y145.433
G1 X186.928 Y144.667 E.03325
G1 X186.395 Y144.667
G1 X187.16 Y145.433 E.03325
G1 X186.627 Y145.433
G1 X185.862 Y144.667 E.03325
G1 X185.328 Y144.667
G1 X186.094 Y145.433 E.03325
G1 X185.56 Y145.433
G1 X184.795 Y144.667 E.03325
G1 X184.262 Y144.667
G1 X185.027 Y145.433 E.03325
G1 X184.494 Y145.433
G1 X183.729 Y144.667 E.03325
G1 X183.195 Y144.667
G1 X183.961 Y145.433 E.03325
G1 X183.427 Y145.433
G1 X182.662 Y144.667 E.03325
G1 X182.129 Y144.667
G1 X182.894 Y145.433 E.03325
G1 X182.361 Y145.433
G1 X181.596 Y144.667 E.03325
G1 X181.062 Y144.667
G1 X181.828 Y145.433 E.03325
G1 X181.294 Y145.433
G1 X180.529 Y144.667 E.03325
G1 X179.996 Y144.667
G1 X180.761 Y145.433 E.03325
G1 X180.228 Y145.433
G1 X179.463 Y144.667 E.03325
G1 X178.929 Y144.667
G1 X179.695 Y145.433 E.03325
G1 X179.161 Y145.433
G1 X178.396 Y144.667 E.03325
G1 X177.863 Y144.667
G1 X178.628 Y145.433 E.03325
G1 X178.095 Y145.433
G1 X177.33 Y144.667 E.03325
G1 X176.796 Y144.667
G1 X177.562 Y145.433 E.03325
G1 X177.028 Y145.433
G1 X176.263 Y144.667 E.03325
G1 X175.73 Y144.667
G1 X176.495 Y145.433 E.03325
G1 X175.962 Y145.433
G1 X175.197 Y144.667 E.03325
G1 X174.663 Y144.667
G1 X175.429 Y145.433 E.03325
G1 X174.895 Y145.433
G1 X174.13 Y144.667 E.03325
G1 X173.597 Y144.667
M73 P97 R0
G1 X174.362 Y145.433 E.03325
G1 X173.829 Y145.433
G1 X173.064 Y144.667 E.03325
G1 X172.53 Y144.667
G1 X173.296 Y145.433 E.03325
G1 X172.762 Y145.433
G1 X171.997 Y144.667 E.03325
G1 X171.464 Y144.667
G1 X172.229 Y145.433 E.03325
G1 X171.696 Y145.433
G1 X170.931 Y144.667 E.03325
G1 X170.397 Y144.667
G1 X171.163 Y145.433 E.03325
G1 X170.629 Y145.433
G1 X169.864 Y144.667 E.03325
G1 X169.331 Y144.667
G1 X170.096 Y145.433 E.03325
G1 X169.563 Y145.433
G1 X168.798 Y144.667 E.03325
G1 X168.264 Y144.667
G1 X169.029 Y145.433 E.03325
G1 X168.496 Y145.433
G1 X167.731 Y144.667 E.03325
G1 X167.198 Y144.667
G1 X167.963 Y145.433 E.03325
G1 X167.43 Y145.433
G1 X166.664 Y144.667 E.03325
G1 X166.131 Y144.667
G1 X166.896 Y145.433 E.03325
G1 X166.363 Y145.433
G1 X165.598 Y144.667 E.03325
G1 X165.065 Y144.667
G1 X165.83 Y145.433 E.03325
G1 X165.297 Y145.433
G1 X164.531 Y144.667 E.03325
G1 X163.998 Y144.667
G1 X164.763 Y145.433 E.03325
G1 X164.23 Y145.433
G1 X163.465 Y144.667 E.03325
G1 X162.932 Y144.667
G1 X163.697 Y145.433 E.03325
G1 X163.164 Y145.433
G1 X162.398 Y144.667 E.03325
G1 X161.865 Y144.667
G1 X162.63 Y145.433 E.03325
G1 X162.097 Y145.433
G1 X161.332 Y144.667 E.03325
G1 X160.799 Y144.667
G1 X161.564 Y145.433 E.03325
G1 X161.031 Y145.433
G1 X160.265 Y144.667 E.03325
G1 X159.732 Y144.667
G1 X160.497 Y145.433 E.03325
G1 X159.964 Y145.433
G1 X159.199 Y144.667 E.03325
G1 X158.666 Y144.667
G1 X159.431 Y145.433 E.03325
G1 X158.898 Y145.433
G1 X158.132 Y144.667 E.03325
G1 X157.599 Y144.667
G1 X158.364 Y145.433 E.03325
G1 X157.831 Y145.433
G1 X157.066 Y144.667 E.03325
G1 X156.533 Y144.667
G1 X157.298 Y145.433 E.03325
G1 X156.765 Y145.433
G1 X155.999 Y144.667 E.03325
G1 X155.466 Y144.667
G1 X156.231 Y145.433 E.03325
G1 X155.698 Y145.433
G1 X154.933 Y144.667 E.03325
G1 X154.4 Y144.667
G1 X155.165 Y145.433 E.03325
G1 X154.632 Y145.433
G1 X153.866 Y144.667 E.03325
G1 X153.333 Y144.667
G1 X154.098 Y145.433 E.03325
G1 X153.565 Y145.433
G1 X152.8 Y144.667 E.03325
G1 X152.267 Y144.667
G1 X153.032 Y145.433 E.03325
G1 X152.499 Y145.433
G1 X151.733 Y144.667 E.03325
G1 X151.2 Y144.667
G1 X151.965 Y145.433 E.03325
G1 X151.432 Y145.433
G1 X150.667 Y144.667 E.03325
G1 X150.133 Y144.667
G1 X150.899 Y145.433 E.03325
G1 X150.365 Y145.433
G1 X149.6 Y144.667 E.03325
G1 X149.067 Y144.667
G1 X149.832 Y145.433 E.03325
G1 X149.299 Y145.433
G1 X148.534 Y144.667 E.03325
G1 X148 Y144.667
G1 X148.766 Y145.433 E.03325
G1 X148.232 Y145.433
G1 X147.467 Y144.667 E.03325
G1 X146.934 Y144.667
G1 X147.699 Y145.433 E.03325
G1 X147.166 Y145.433
G1 X146.401 Y144.667 E.03325
G1 X145.867 Y144.667
G1 X146.633 Y145.433 E.03325
G1 X146.099 Y145.433
G1 X145.334 Y144.667 E.03325
G1 X144.801 Y144.667
G1 X145.566 Y145.433 E.03325
G1 X145.033 Y145.433
G1 X144.268 Y144.667 E.03325
G1 X143.734 Y144.667
G1 X144.5 Y145.433 E.03325
G1 X143.966 Y145.433
G1 X143.201 Y144.667 E.03325
G1 X142.668 Y144.667
G1 X143.433 Y145.433 E.03325
G1 X142.9 Y145.433
G1 X142.135 Y144.667 E.03325
G1 X141.601 Y144.667
G1 X142.367 Y145.433 E.03325
G1 X141.833 Y145.433
G1 X141.068 Y144.667 E.03325
G1 X140.535 Y144.667
G1 X141.3 Y145.433 E.03325
G1 X140.767 Y145.433
G1 X140.002 Y144.667 E.03325
G1 X139.468 Y144.667
G1 X140.234 Y145.433 E.03325
G1 X139.7 Y145.433
G1 X138.935 Y144.667 E.03325
G1 X138.402 Y144.667
G1 X139.167 Y145.433 E.03325
G1 X138.634 Y145.433
G1 X137.869 Y144.667 E.03325
G1 X137.335 Y144.667
G1 X138.101 Y145.433 E.03325
G1 X137.567 Y145.433
G1 X136.802 Y144.667 E.03325
G1 X136.269 Y144.667
G1 X137.034 Y145.433 E.03325
G1 X136.501 Y145.433
G1 X135.736 Y144.667 E.03325
G1 X135.202 Y144.667
G1 X135.968 Y145.433 E.03325
G1 X135.434 Y145.433
G1 X134.669 Y144.667 E.03325
G1 X134.136 Y144.667
G1 X134.901 Y145.433 E.03325
G1 X134.368 Y145.433
G1 X133.603 Y144.667 E.03325
G1 X133.069 Y144.667
G1 X133.834 Y145.433 E.03325
G1 X133.301 Y145.433
G1 X132.536 Y144.667 E.03325
G1 X132.003 Y144.667
G1 X132.768 Y145.433 E.03325
G1 X132.235 Y145.433
G1 X131.469 Y144.667 E.03325
G1 X130.936 Y144.667
G1 X131.701 Y145.433 E.03325
G1 X131.168 Y145.433
G1 X130.403 Y144.667 E.03325
G1 X129.87 Y144.667
G1 X130.635 Y145.433 E.03325
G1 X130.102 Y145.433
G1 X129.336 Y144.667 E.03325
G1 X128.803 Y144.667
G1 X129.568 Y145.433 E.03325
G1 X129.035 Y145.433
G1 X128.27 Y144.667 E.03325
G1 X127.737 Y144.667
G1 X128.502 Y145.433 E.03325
G1 X127.969 Y145.433
G1 X127.203 Y144.667 E.03325
G1 X126.67 Y144.667
G1 X127.435 Y145.433 E.03325
G1 X126.902 Y145.433
G1 X126.137 Y144.667 E.03325
G1 X125.604 Y144.667
G1 X126.369 Y145.433 E.03325
G1 X125.836 Y145.433
G1 X125.07 Y144.667 E.03325
G1 X124.537 Y144.667
G1 X125.302 Y145.433 E.03325
G1 X124.769 Y145.433
G1 X124.004 Y144.667 E.03325
G1 X123.471 Y144.667
G1 X124.236 Y145.433 E.03325
G1 X123.703 Y145.433
G1 X122.937 Y144.667 E.03325
G1 X122.404 Y144.667
G1 X123.169 Y145.433 E.03325
G1 X122.636 Y145.433
G1 X121.871 Y144.667 E.03325
G1 X121.338 Y144.667
G1 X122.103 Y145.433 E.03325
G1 X121.57 Y145.433
G1 X120.804 Y144.667 E.03325
G1 X120.271 Y144.667
G1 X121.036 Y145.433 E.03325
G1 X120.503 Y145.433
G1 X119.738 Y144.667 E.03325
G1 X119.205 Y144.667
G1 X119.97 Y145.433 E.03325
G1 X119.437 Y145.433
G1 X118.671 Y144.667 E.03325
G1 X118.138 Y144.667
G1 X118.903 Y145.433 E.03325
G1 X118.37 Y145.433
G1 X117.605 Y144.667 E.03325
G1 X117.072 Y144.667
G1 X117.837 Y145.433 E.03325
G1 X117.304 Y145.433
G1 X116.538 Y144.667 E.03325
G1 X116.005 Y144.667
G1 X116.77 Y145.433 E.03325
G1 X116.237 Y145.433
G1 X115.472 Y144.667 E.03325
G1 X114.938 Y144.667
G1 X115.704 Y145.433 E.03325
G1 X115.17 Y145.433
G1 X114.405 Y144.667 E.03325
G1 X113.872 Y144.667
G1 X114.637 Y145.433 E.03325
G1 X114.104 Y145.433
G1 X113.339 Y144.667 E.03325
G1 X112.805 Y144.667
G1 X113.571 Y145.433 E.03325
G1 X113.037 Y145.433
G1 X112.272 Y144.667 E.03325
G1 X111.739 Y144.667
G1 X112.504 Y145.433 E.03325
G1 X111.971 Y145.433
G1 X111.206 Y144.667 E.03325
G1 X110.672 Y144.667
G1 X111.438 Y145.433 E.03325
G1 X110.904 Y145.433
G1 X110.139 Y144.667 E.03325
G1 X109.606 Y144.667
G1 X110.371 Y145.433 E.03325
G1 X109.838 Y145.433
G1 X109.073 Y144.667 E.03325
G1 X108.539 Y144.667
G1 X109.305 Y145.433 E.03325
G1 X108.771 Y145.433
G1 X108.006 Y144.667 E.03325
G1 X107.473 Y144.667
G1 X108.238 Y145.433 E.03325
G1 X107.705 Y145.433
G1 X106.94 Y144.667 E.03325
G1 X106.406 Y144.667
G1 X107.172 Y145.433 E.03325
G1 X106.638 Y145.433
G1 X105.873 Y144.667 E.03325
G1 X105.34 Y144.667
G1 X106.105 Y145.433 E.03325
G1 X105.572 Y145.433
G1 X104.807 Y144.667 E.03325
G1 X104.273 Y144.667
G1 X105.039 Y145.433 E.03325
G1 X104.505 Y145.433
G1 X103.74 Y144.667 E.03325
G1 X103.207 Y144.667
G1 X103.972 Y145.433 E.03325
G1 X103.439 Y145.433
G1 X102.674 Y144.667 E.03325
G1 X102.14 Y144.667
G1 X102.906 Y145.433 E.03325
G1 X102.372 Y145.433
G1 X101.607 Y144.667 E.03325
G1 X101.074 Y144.667
G1 X101.839 Y145.433 E.03325
G1 X101.306 Y145.433
G1 X100.541 Y144.667 E.03325
G1 X100.007 Y144.667
G1 X100.773 Y145.433 E.03325
G1 X100.239 Y145.433
G1 X99.474 Y144.667 E.03325
G1 X98.941 Y144.667
G1 X99.706 Y145.433 E.03325
G1 X99.173 Y145.433
G1 X98.408 Y144.667 E.03325
G1 X97.874 Y144.667
G1 X98.64 Y145.433 E.03325
G1 X98.106 Y145.433
G1 X97.341 Y144.667 E.03325
G1 X96.808 Y144.667
G1 X97.573 Y145.433 E.03325
G1 X97.04 Y145.433
G1 X96.274 Y144.667 E.03325
G1 X95.741 Y144.667
G1 X96.506 Y145.433 E.03325
G1 X95.973 Y145.433
G1 X95.208 Y144.667 E.03325
G1 X94.675 Y144.667
G1 X95.44 Y145.433 E.03325
G1 X94.907 Y145.433
G1 X94.141 Y144.667 E.03325
G1 X93.608 Y144.667
G1 X94.373 Y145.433 E.03325
G1 X93.84 Y145.433
G1 X93.075 Y144.667 E.03325
G1 X92.542 Y144.667
G1 X93.307 Y145.433 E.03325
G1 X92.774 Y145.433
G1 X92.008 Y144.667 E.03325
G1 X91.475 Y144.667
G1 X92.24 Y145.433 E.03325
G1 X91.707 Y145.433
G1 X90.942 Y144.667 E.03325
G1 X90.409 Y144.667
G1 X91.174 Y145.433 E.03325
G1 X90.641 Y145.433
G1 X89.875 Y144.667 E.03325
G1 X89.342 Y144.667
G1 X90.107 Y145.433 E.03325
G1 X89.574 Y145.433
G1 X88.809 Y144.667 E.03325
G1 X88.276 Y144.667
G1 X89.041 Y145.433 E.03325
G1 X88.508 Y145.433
G1 X87.742 Y144.667 E.03325
G1 X87.209 Y144.667
G1 X87.974 Y145.433 E.03325
G1 X87.441 Y145.433
G1 X86.676 Y144.667 E.03325
G1 X86.143 Y144.667
G1 X86.908 Y145.433 E.03325
G1 X86.375 Y145.433
G1 X85.609 Y144.667 E.03325
G1 X85.076 Y144.667
G1 X85.841 Y145.433 E.03325
G1 X85.308 Y145.433
G1 X84.543 Y144.667 E.03325
G1 X84.01 Y144.667
G1 X84.775 Y145.433 E.03325
G1 X84.242 Y145.433
G1 X83.476 Y144.667 E.03325
G1 X82.943 Y144.667
G1 X83.708 Y145.433 E.03325
G1 X83.175 Y145.433
G1 X82.41 Y144.667 E.03325
G1 X81.877 Y144.667
G1 X82.642 Y145.433 E.03325
G1 X82.109 Y145.433
G1 X81.343 Y144.667 E.03325
G1 X80.81 Y144.667
G1 X81.575 Y145.433 E.03325
G1 X81.042 Y145.433
G1 X80.277 Y144.667 E.03325
G1 X79.743 Y144.667
G1 X80.509 Y145.433 E.03325
G1 X79.975 Y145.433
G1 X79.21 Y144.667 E.03325
G1 X78.677 Y144.667
G1 X79.442 Y145.433 E.03325
G1 X78.909 Y145.433
G1 X78.144 Y144.667 E.03325
G1 X77.61 Y144.667
G1 X78.376 Y145.433 E.03325
G1 X77.842 Y145.433
G1 X77.077 Y144.667 E.03325
G1 X76.544 Y144.667
G1 X77.309 Y145.433 E.03325
G1 X76.776 Y145.433
G1 X76.011 Y144.667 E.03325
G1 X75.477 Y144.667
G1 X76.243 Y145.433 E.03325
G1 X75.709 Y145.433
G1 X74.944 Y144.667 E.03325
G1 X74.411 Y144.667
G1 X75.176 Y145.433 E.03325
G1 X74.643 Y145.433
G1 X73.878 Y144.667 E.03325
G1 X73.344 Y144.667
G1 X74.11 Y145.433 E.03325
G1 X73.576 Y145.433
G1 X72.811 Y144.667 E.03325
G1 X72.278 Y144.667
G1 X73.043 Y145.433 E.03325
G1 X72.51 Y145.433
G1 X71.745 Y144.667 E.03325
G1 X71.211 Y144.667
G1 X71.977 Y145.433 E.03325
G1 X71.443 Y145.433
G1 X70.678 Y144.667 E.03325
G1 X70.145 Y144.667
G1 X70.91 Y145.433 E.03325
G1 X70.377 Y145.433
G1 X69.612 Y144.667 E.03325
G1 X69.078 Y144.667
G1 X69.844 Y145.433 E.03325
G1 X69.31 Y145.433
G1 X68.545 Y144.667 E.03325
G1 X68.012 Y144.667
G1 X68.777 Y145.433 E.03325
G1 X68.244 Y145.433
G1 X67.479 Y144.667 E.03325
G1 X66.945 Y144.667
G1 X67.711 Y145.433 E.03325
G1 X67.177 Y145.433
G1 X66.412 Y144.667 E.03325
G1 X65.879 Y144.667
G1 X66.644 Y145.433 E.03325
G1 X66.111 Y145.433
G1 X65.346 Y144.667 E.03325
G1 X64.812 Y144.667
G1 X65.578 Y145.433 E.03325
G1 X65.044 Y145.433
G1 X64.279 Y144.667 E.03325
G1 X63.746 Y144.667
G1 X64.511 Y145.433 E.03325
G1 X63.978 Y145.433
G1 X63.213 Y144.667 E.03325
G1 X62.679 Y144.667
G1 X63.445 Y145.433 E.03325
G1 X62.911 Y145.433
G1 X62.146 Y144.667 E.03325
G1 X61.613 Y144.667
G1 X62.378 Y145.433 E.03325
G1 X61.845 Y145.433
G1 X61.079 Y144.667 E.03325
G1 X60.546 Y144.667
G1 X61.311 Y145.433 E.03325
G1 X60.778 Y145.433
G1 X60.013 Y144.667 E.03325
G1 X59.48 Y144.667
G1 X60.245 Y145.433 E.03325
G1 X59.712 Y145.433
G1 X58.946 Y144.667 E.03325
G1 X58.413 Y144.667
G1 X59.178 Y145.433 E.03325
G1 X58.645 Y145.433
G1 X57.88 Y144.667 E.03325
G1 X57.347 Y144.667
G1 X58.112 Y145.433 E.03325
G1 X57.579 Y145.433
G1 X56.813 Y144.667 E.03325
G1 X56.28 Y144.667
G1 X57.045 Y145.433 E.03325
G1 X56.512 Y145.433
G1 X55.747 Y144.667 E.03325
G1 X55.214 Y144.667
G1 X55.979 Y145.433 E.03325
G1 X55.446 Y145.433
G1 X54.68 Y144.667 E.03325
G1 X54.147 Y144.667
G1 X54.912 Y145.433 E.03325
G1 X54.379 Y145.433
G1 X53.614 Y144.667 E.03325
G1 X53.081 Y144.667
G1 X53.846 Y145.433 E.03325
G1 X53.313 Y145.433
G1 X52.547 Y144.667 E.03325
G1 X52.014 Y144.667
G1 X52.779 Y145.433 E.03325
G1 X52.246 Y145.433
G1 X51.481 Y144.667 E.03325
G1 X50.948 Y144.667
G1 X51.713 Y145.433 E.03325
G1 X51.18 Y145.433
G1 X50.414 Y144.667 E.03325
G1 X49.881 Y144.667
G1 X50.646 Y145.433 E.03325
G1 X50.113 Y145.433
G1 X49.348 Y144.667 E.03325
G1 X48.815 Y144.667
G1 X49.58 Y145.433 E.03325
G1 X49.047 Y145.433
G1 X48.281 Y144.667 E.03325
G1 X47.748 Y144.667
G1 X48.513 Y145.433 E.03325
G1 X47.98 Y145.433
G1 X47.215 Y144.667 E.03325
G1 X46.682 Y144.667
G1 X47.447 Y145.433 E.03325
G1 X46.914 Y145.433
G1 X46.148 Y144.667 E.03325
G1 X45.615 Y144.667
G1 X46.38 Y145.433 E.03325
G1 X45.847 Y145.433
G1 X45.082 Y144.667 E.03325
G1 X44.548 Y144.667
G1 X45.314 Y145.433 E.03325
G1 X44.78 Y145.433
G1 X44.015 Y144.667 E.03325
G1 X43.482 Y144.667
G1 X44.247 Y145.433 E.03325
G1 X43.714 Y145.433
G1 X42.949 Y144.667 E.03325
G1 X42.415 Y144.667
G1 X43.181 Y145.433 E.03325
G1 X42.647 Y145.433
G1 X41.882 Y144.667 E.03325
G1 X41.349 Y144.667
G1 X42.114 Y145.433 E.03325
G1 X41.574 Y145.426
G1 X40.816 Y144.667 E.03296
G1 X40.291 Y144.676
G1 X41.01 Y145.395 E.03123
; WIPE_START
M204 S10000
G1 X40.291 Y144.676 E-.38625
G1 X40.816 Y144.667 E-.1994
G1 X41.14 Y144.992 E-.17435
; WIPE_END
G1 E-.04 F1800
G1 X48.773 Y144.99 Z7.4 F30000
G1 X215.973 Y144.941 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.550111
G1 F12421.368
G1 X216.244 Y144.887 E.01142
; LINE_WIDTH: 0.522202
G1 F13144.66
G2 X216.479 Y144.829 I-1.057 J-4.769 E.00945
; LINE_WIDTH: 0.47712
G1 F14509.471
G1 X216.69 Y144.776 E.00769
; LINE_WIDTH: 0.435697
G1 F15000
G2 X216.952 Y144.688 I-.775 J-2.74 E.00885
; LINE_WIDTH: 0.392841
G1 X217.119 Y144.628 E.00507
; LINE_WIDTH: 0.360608
G2 X217.384 Y144.519 I-2.103 J-5.472 E.00739
; LINE_WIDTH: 0.330488
G1 X217.532 Y144.449 E.00385
; LINE_WIDTH: 0.291841
G2 X217.926 Y144.239 I-3.969 J-7.912 E.00905
; LINE_WIDTH: 0.250869
G2 X218.296 Y143.994 I-1.863 J-3.218 E.00753
; LINE_WIDTH: 0.214288
G2 X218.645 Y143.723 I-3.908 J-5.393 E.00617
G1 X218.974 Y143.424 E.00621
G1 X219.402 Y142.937 E.00905
; LINE_WIDTH: 0.241745
G1 X219.771 Y142.406 E.01048
; LINE_WIDTH: 0.289572
G2 X219.993 Y141.994 I-4.583 J-2.733 E.0094
; LINE_WIDTH: 0.329213
G1 X220.069 Y141.834 E.00414
; LINE_WIDTH: 0.35979
G1 X220.172 Y141.585 E.00696
; LINE_WIDTH: 0.391281
G1 X220.238 Y141.402 E.00551
; LINE_WIDTH: 0.427729
G1 X220.298 Y141.234 E.00558
; LINE_WIDTH: 0.449009
G1 X220.321 Y141.159 E.00259
; LINE_WIDTH: 0.475182
G1 F14574.52
G2 X220.379 Y140.929 I-4.624 J-1.291 E.00837
; LINE_WIDTH: 0.519705
G1 F13213.503
G1 X220.432 Y140.718 E.00844
; LINE_WIDTH: 0.5496
G1 F12433.88
G2 X220.491 Y140.423 I-6.034 J-1.366 E.01244
; WIPE_START
G1 X220.432 Y140.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X220.571 Y133.087 Z7.4 F30000
G1 X220.945 Y112.56 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X220.226 Y111.841 E.03124
G1 X220.217 Y112.366
G1 X220.976 Y113.124 E.03296
G1 X220.983 Y113.664
G1 X220.217 Y112.899 E.03325
G1 X220.217 Y113.432
G1 X220.983 Y114.198 E.03325
G1 X220.983 Y114.731
G1 X220.217 Y113.966 E.03325
G1 X220.217 Y114.499
G1 X220.983 Y115.264 E.03325
G1 X220.983 Y115.797
G1 X220.217 Y115.032 E.03325
G1 X220.217 Y115.565
G1 X220.983 Y116.331 E.03325
G1 X220.983 Y116.864
G1 X220.217 Y116.099 E.03325
G1 X220.217 Y116.632
G1 X220.983 Y117.397 E.03325
G1 X220.983 Y117.93
G1 X220.217 Y117.165 E.03325
G1 X220.217 Y117.698
G1 X220.983 Y118.464 E.03325
G1 X220.983 Y118.997
G1 X220.217 Y118.232 E.03325
G1 X220.217 Y118.765
G1 X220.983 Y119.53 E.03325
G1 X220.983 Y120.063
G1 X220.217 Y119.298 E.03325
G1 X220.217 Y119.831
G1 X220.983 Y120.597 E.03325
G1 X220.983 Y121.13
G1 X220.217 Y120.365 E.03325
G1 X220.217 Y120.898
G1 X220.983 Y121.663 E.03325
G1 X220.983 Y122.196
G1 X220.217 Y121.431 E.03325
G1 X220.217 Y121.964
G1 X220.983 Y122.73 E.03325
G1 X220.983 Y123.263
G1 X220.217 Y122.498 E.03325
G1 X220.217 Y123.031
G1 X220.983 Y123.796 E.03325
G1 X220.983 Y124.329
G1 X220.217 Y123.564 E.03325
G1 X220.217 Y124.097
G1 X220.983 Y124.863 E.03325
G1 X220.983 Y125.396
G1 X220.217 Y124.631 E.03325
G1 X220.217 Y125.164
G1 X220.983 Y125.929 E.03325
G1 X220.983 Y126.463
G1 X220.217 Y125.697 E.03325
G1 X220.217 Y126.231
G1 X220.983 Y126.996 E.03325
G1 X220.983 Y127.529
G1 X220.217 Y126.764 E.03325
G1 X220.217 Y127.297
G1 X220.983 Y128.062 E.03325
G1 X220.983 Y128.596
G1 X220.217 Y127.83 E.03325
G1 X220.217 Y128.364
G1 X220.983 Y129.129 E.03325
M73 P98 R0
G1 X220.983 Y129.662
G1 X220.217 Y128.897 E.03325
G1 X220.217 Y129.43
G1 X220.983 Y130.195 E.03325
G1 X220.983 Y130.729
G1 X220.217 Y129.963 E.03325
G1 X220.217 Y130.497
G1 X220.983 Y131.262 E.03325
G1 X220.983 Y131.795
G1 X220.217 Y131.03 E.03325
G1 X220.217 Y131.563
G1 X220.983 Y132.328 E.03325
G1 X220.983 Y132.862
G1 X220.217 Y132.096 E.03325
G1 X220.217 Y132.63
G1 X220.983 Y133.395 E.03325
G1 X220.983 Y133.928
G1 X220.217 Y133.163 E.03325
G1 X220.217 Y133.696
G1 X220.983 Y134.461 E.03325
G1 X220.983 Y134.995
G1 X220.217 Y134.229 E.03325
G1 X220.217 Y134.763
G1 X220.983 Y135.528 E.03325
G1 X220.983 Y136.061
G1 X220.217 Y135.296 E.03325
G1 X220.217 Y135.829
G1 X220.983 Y136.594 E.03325
G1 X220.983 Y137.128
G1 X220.217 Y136.362 E.03325
G1 X220.217 Y136.896
G1 X220.983 Y137.661 E.03325
G1 X220.983 Y138.194
G1 X220.217 Y137.429 E.03325
G1 X220.217 Y137.962
G1 X220.983 Y138.727 E.03325
G1 X220.958 Y139.236
G1 X220.217 Y138.495 E.03219
G1 X220.217 Y139.029
G1 X220.904 Y139.715 E.02983
G1 X220.825 Y140.169
G1 X220.217 Y139.562 E.02639
; WIPE_START
M204 S10000
G1 X220.825 Y140.169 E-.3264
G1 X220.904 Y139.715 E-.17515
G1 X220.423 Y139.234 E-.25845
; WIPE_END
G1 E-.04 F1800
G1 X220.442 Y131.602 Z7.4 F30000
G1 X220.491 Y111.577 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.5496
G1 F12433.888
G2 X220.432 Y111.282 I-6.015 J1.056 E.01244
; LINE_WIDTH: 0.519697
G1 F13213.744
G1 X220.379 Y111.071 E.00844
; LINE_WIDTH: 0.475167
G1 F14575.009
G2 X220.321 Y110.84 I-4.707 J1.067 E.00837
; LINE_WIDTH: 0.448995
G1 F15000
G1 X220.298 Y110.766 E.00259
; LINE_WIDTH: 0.427718
G1 X220.238 Y110.598 E.00558
; LINE_WIDTH: 0.391273
G1 X220.172 Y110.415 E.00551
; LINE_WIDTH: 0.359798
G1 X220.069 Y110.166 E.00695
; LINE_WIDTH: 0.329201
G1 X219.993 Y110.006 E.00414
; LINE_WIDTH: 0.289562
G2 X219.771 Y109.594 I-4.804 J2.321 E.0094
; LINE_WIDTH: 0.24176
G1 X219.402 Y109.063 E.01048
; LINE_WIDTH: 0.214286
G1 X218.974 Y108.576 E.00905
G1 X218.645 Y108.277 E.00621
G2 X218.296 Y108.006 I-4.245 J5.107 E.00617
; LINE_WIDTH: 0.250887
G2 X217.926 Y107.761 I-2.241 J2.985 E.00753
; LINE_WIDTH: 0.291842
G2 X217.532 Y107.551 I-4.48 J7.922 E.00905
; LINE_WIDTH: 0.330492
G1 X217.384 Y107.481 E.00385
; LINE_WIDTH: 0.360619
G2 X217.119 Y107.372 I-2.344 J5.307 E.0074
; LINE_WIDTH: 0.39284
G1 X216.952 Y107.312 E.00507
; LINE_WIDTH: 0.435697
G2 X216.69 Y107.224 I-1.037 J2.651 E.00885
; LINE_WIDTH: 0.477127
G1 F14509.214
G1 X216.479 Y107.171 E.00769
; LINE_WIDTH: 0.522214
G1 F13144.342
G2 X216.244 Y107.113 I-1.307 J4.768 E.00945
; LINE_WIDTH: 0.550117
G1 F12421.217
G1 X215.973 Y107.059 E.01142
; WIPE_START
G1 X216.244 Y107.113 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X214.99 Y106.605 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X215.709 Y107.324 E.03124
G1 X215.184 Y107.333
G1 X214.426 Y106.574 E.03296
G1 X213.889 Y106.571
G1 X214.651 Y107.333 E.0331
G1 X214.118 Y107.333
G1 X213.356 Y106.571 E.0331
G1 X212.823 Y106.571
G1 X213.584 Y107.333 E.0331
G1 X213.051 Y107.333
G1 X212.289 Y106.571 E.0331
G1 X211.756 Y106.571
G1 X212.518 Y107.333 E.0331
G1 X211.985 Y107.333
G1 X211.223 Y106.571 E.0331
G1 X210.69 Y106.571
G1 X211.451 Y107.333 E.0331
G1 X210.918 Y107.333
G1 X210.156 Y106.571 E.0331
G1 X209.623 Y106.571
G1 X210.385 Y107.333 E.0331
G1 X209.852 Y107.333
G1 X209.09 Y106.571 E.0331
G1 X208.557 Y106.571
G1 X209.318 Y107.333 E.0331
G1 X208.785 Y107.333
G1 X208.023 Y106.571 E.0331
G1 X207.49 Y106.571
G1 X208.252 Y107.333 E.0331
G1 X207.719 Y107.333
G1 X206.957 Y106.571 E.0331
G1 X206.423 Y106.571
G1 X207.185 Y107.333 E.0331
G1 X206.652 Y107.333
G1 X205.89 Y106.571 E.0331
G1 X205.357 Y106.571
G1 X206.119 Y107.333 E.03311
G1 X205.586 Y107.333
G1 X204.824 Y106.571 E.03311
G1 X204.29 Y106.571
G1 X205.052 Y107.333 E.03311
G1 X204.519 Y107.333
G1 X203.757 Y106.571 E.03311
G1 X203.224 Y106.571
G1 X203.986 Y107.333 E.03311
G1 X203.453 Y107.333
G1 X202.691 Y106.571 E.03311
G1 X202.157 Y106.571
G1 X202.919 Y107.333 E.03311
G1 X202.386 Y107.333
G1 X201.624 Y106.571 E.03311
G1 X201.091 Y106.571
G1 X201.853 Y107.333 E.03311
G1 X201.319 Y107.333
G1 X200.558 Y106.571 E.03311
G1 X200.024 Y106.571
G1 X200.786 Y107.333 E.03311
G1 X200.253 Y107.333
G1 X199.491 Y106.571 E.03311
G1 X198.958 Y106.571
G1 X199.72 Y107.333 E.03311
G1 X199.186 Y107.333
G1 X198.424 Y106.571 E.03311
G1 X197.891 Y106.571
G1 X198.653 Y107.333 E.03311
G1 X198.12 Y107.333
G1 X197.358 Y106.571 E.03311
G1 X196.825 Y106.571
G1 X197.587 Y107.333 E.03311
G1 X197.053 Y107.333
G1 X196.291 Y106.571 E.03311
G1 X195.758 Y106.571
G1 X196.52 Y107.333 E.03311
G1 X195.987 Y107.333
G1 X195.225 Y106.571 E.03311
G1 X194.692 Y106.571
G1 X195.454 Y107.333 E.03311
G1 X194.92 Y107.333
G1 X194.158 Y106.571 E.03312
G1 X193.625 Y106.571
G1 X194.387 Y107.333 E.03312
G1 X193.854 Y107.333
G1 X193.092 Y106.571 E.03312
G1 X192.559 Y106.571
G1 X193.321 Y107.333 E.03312
G1 X192.787 Y107.333
G1 X192.025 Y106.571 E.03312
G1 X191.492 Y106.57
G1 X192.254 Y107.333 E.03312
G1 X191.721 Y107.333
G1 X190.959 Y106.57 E.03312
G1 X190.425 Y106.57
G1 X191.188 Y107.333 E.03312
G1 X190.654 Y107.333
G1 X189.892 Y106.57 E.03312
G1 X189.359 Y106.57
G1 X190.121 Y107.333 E.03312
G1 X189.588 Y107.333
G1 X188.826 Y106.57 E.03312
G1 X188.292 Y106.57
G1 X189.055 Y107.333 E.03312
G1 X188.521 Y107.333
G1 X187.759 Y106.57 E.03312
G1 X187.226 Y106.57
G1 X187.988 Y107.333 E.03312
G1 X187.455 Y107.333
G1 X186.693 Y106.57 E.03312
G1 X186.159 Y106.57
G1 X186.922 Y107.333 E.03312
G1 X186.388 Y107.333
G1 X185.626 Y106.57 E.03312
G1 X185.093 Y106.57
G1 X185.855 Y107.333 E.03312
G1 X185.322 Y107.333
G1 X184.559 Y106.57 E.03312
G1 X184.026 Y106.57
G1 X184.788 Y107.333 E.03312
G1 X184.255 Y107.333
G1 X183.493 Y106.57 E.03313
G1 X182.96 Y106.57
G1 X183.722 Y107.333 E.03313
G1 X183.189 Y107.333
G1 X182.426 Y106.57 E.03313
G1 X181.893 Y106.57
G1 X182.655 Y107.333 E.03313
G1 X182.122 Y107.333
G1 X181.36 Y106.57 E.03313
G1 X180.827 Y106.57
G1 X181.589 Y107.333 E.03313
G1 X181.056 Y107.333
G1 X180.293 Y106.57 E.03313
G1 X179.76 Y106.57
G1 X180.522 Y107.333 E.03313
G1 X179.989 Y107.333
G1 X179.227 Y106.57 E.03313
G1 X178.694 Y106.57
G1 X179.456 Y107.333 E.03313
G1 X178.923 Y107.333
G1 X178.16 Y106.57 E.03313
G1 X177.627 Y106.57
G1 X178.389 Y107.333 E.03313
G1 X177.856 Y107.333
G1 X177.094 Y106.57 E.03313
G1 X176.56 Y106.57
G1 X177.323 Y107.333 E.03313
G1 X176.79 Y107.333
G1 X176.027 Y106.57 E.03313
G1 X175.494 Y106.57
G1 X176.256 Y107.333 E.03313
G1 X175.723 Y107.333
G1 X174.961 Y106.57 E.03313
G1 X174.427 Y106.57
G1 X175.19 Y107.333 E.03313
G1 X174.657 Y107.333
G1 X173.894 Y106.57 E.03313
G1 X173.361 Y106.57
G1 X174.123 Y107.333 E.03313
G1 X173.59 Y107.333
G1 X172.828 Y106.57 E.03313
G1 X172.294 Y106.57
G1 X173.057 Y107.333 E.03314
G1 X172.524 Y107.333
G1 X171.761 Y106.57 E.03314
G1 X171.228 Y106.57
G1 X171.99 Y107.333 E.03314
G1 X171.457 Y107.333
G1 X170.694 Y106.57 E.03314
G1 X170.161 Y106.57
G1 X170.924 Y107.333 E.03314
G1 X170.391 Y107.333
G1 X169.628 Y106.57 E.03314
G1 X169.095 Y106.57
G1 X169.857 Y107.333 E.03314
G1 X169.324 Y107.333
G1 X168.561 Y106.57 E.03314
G1 X168.028 Y106.57
G1 X168.791 Y107.333 E.03314
G1 X168.258 Y107.333
G1 X167.495 Y106.57 E.03314
G1 X166.962 Y106.57
G1 X167.724 Y107.333 E.03314
G1 X167.191 Y107.333
G1 X166.428 Y106.57 E.03314
G1 X165.895 Y106.57
G1 X166.658 Y107.333 E.03314
G1 X166.124 Y107.333
G1 X165.362 Y106.57 E.03314
G1 X164.829 Y106.57
G1 X165.591 Y107.333 E.03314
G1 X165.058 Y107.333
G1 X164.295 Y106.57 E.03314
G1 X163.762 Y106.57
G1 X164.525 Y107.333 E.03314
G1 X163.991 Y107.333
G1 X163.229 Y106.57 E.03314
G1 X162.695 Y106.57
G1 X163.458 Y107.333 E.03314
G1 X162.925 Y107.333
G1 X162.162 Y106.57 E.03314
G1 X161.629 Y106.57
G1 X162.392 Y107.333 E.03315
G1 X161.858 Y107.333
G1 X161.096 Y106.57 E.03315
G1 X160.562 Y106.57
G1 X161.325 Y107.333 E.03315
G1 X160.792 Y107.333
G1 X160.029 Y106.57 E.03315
G1 X159.496 Y106.57
G1 X160.259 Y107.333 E.03315
G1 X159.725 Y107.333
G1 X158.963 Y106.57 E.03315
G1 X158.429 Y106.57
G1 X159.192 Y107.333 E.03315
G1 X158.659 Y107.333
G1 X157.896 Y106.57 E.03315
G1 X157.363 Y106.57
G1 X158.126 Y107.333 E.03315
G1 X157.592 Y107.333
G1 X156.83 Y106.57 E.03315
G1 X156.296 Y106.57
G1 X157.059 Y107.333 E.03315
G1 X156.526 Y107.333
G1 X155.763 Y106.57 E.03315
G1 X155.23 Y106.57
G1 X155.993 Y107.333 E.03315
G1 X155.459 Y107.333
G1 X154.696 Y106.57 E.03315
G1 X154.163 Y106.57
G1 X154.926 Y107.333 E.03315
G1 X154.393 Y107.333
G1 X153.63 Y106.57 E.03315
G1 X153.097 Y106.57
G1 X153.86 Y107.333 E.03315
G1 X153.326 Y107.333
G1 X152.563 Y106.57 E.03315
G1 X152.03 Y106.57
G1 X152.793 Y107.333 E.03315
G1 X152.26 Y107.333
G1 X151.497 Y106.57 E.03315
G1 X150.964 Y106.57
G1 X151.727 Y107.333 E.03315
G1 X151.193 Y107.333
G1 X150.43 Y106.57 E.03316
G1 X149.897 Y106.57
G1 X150.66 Y107.333 E.03316
G1 X150.127 Y107.333
G1 X149.364 Y106.57 E.03316
G1 X148.83 Y106.57
G1 X149.593 Y107.333 E.03316
G1 X149.06 Y107.333
G1 X148.297 Y106.57 E.03316
G1 X147.764 Y106.57
G1 X148.527 Y107.333 E.03316
G1 X147.994 Y107.333
G1 X147.231 Y106.57 E.03316
G1 X146.697 Y106.57
G1 X147.46 Y107.333 E.03316
G1 X146.927 Y107.333
G1 X146.164 Y106.57 E.03316
G1 X145.631 Y106.57
G1 X146.394 Y107.333 E.03316
G1 X145.861 Y107.333
G1 X145.098 Y106.57 E.03316
G1 X144.564 Y106.57
G1 X145.327 Y107.333 E.03316
G1 X144.794 Y107.333
G1 X144.031 Y106.569 E.03316
G1 X143.498 Y106.569
G1 X144.261 Y107.333 E.03316
G1 X143.728 Y107.333
G1 X142.965 Y106.569 E.03316
G1 X142.431 Y106.569
G1 X143.194 Y107.333 E.03316
G1 X142.661 Y107.333
G1 X141.898 Y106.569 E.03316
G1 X141.365 Y106.569
G1 X142.128 Y107.333 E.03316
G1 X141.595 Y107.333
G1 X140.831 Y106.569 E.03316
G1 X140.298 Y106.569
G1 X141.061 Y107.333 E.03316
G1 X140.528 Y107.333
G1 X139.765 Y106.569 E.03316
G1 X139.232 Y106.569
G1 X139.995 Y107.333 E.03317
G1 X139.462 Y107.333
G1 X138.698 Y106.569 E.03317
G1 X138.165 Y106.569
G1 X138.928 Y107.333 E.03317
G1 X138.395 Y107.333
G1 X137.632 Y106.569 E.03317
G1 X137.099 Y106.569
G1 X137.862 Y107.333 E.03317
G1 X137.329 Y107.333
G1 X136.565 Y106.569 E.03317
G1 X136.032 Y106.569
G1 X136.795 Y107.333 E.03317
G1 X136.262 Y107.333
G1 X135.499 Y106.569 E.03317
G1 X134.965 Y106.569
G1 X135.729 Y107.333 E.03317
G1 X135.196 Y107.333
G1 X134.432 Y106.569 E.03317
G1 X133.899 Y106.569
G1 X134.662 Y107.333 E.03317
G1 X134.129 Y107.333
G1 X133.366 Y106.569 E.03317
G1 X132.832 Y106.569
G1 X133.596 Y107.333 E.03317
G1 X133.063 Y107.333
G1 X132.299 Y106.569 E.03317
G1 X131.766 Y106.569
G1 X132.529 Y107.333 E.03317
G1 X131.996 Y107.333
G1 X131.233 Y106.569 E.03317
G1 X130.699 Y106.569
G1 X131.463 Y107.333 E.03317
G1 X130.929 Y107.333
G1 X130.166 Y106.569 E.03317
G1 X129.633 Y106.569
G1 X130.396 Y107.333 E.03317
G1 X129.863 Y107.333
G1 X129.1 Y106.569 E.03317
G1 X128.566 Y106.569
G1 X129.33 Y107.333 E.03317
G1 X128.796 Y107.333
G1 X128.033 Y106.569 E.03318
G1 X127.5 Y106.569
G1 X128.263 Y107.333 E.03318
G1 X127.73 Y107.333
G1 X126.966 Y106.569 E.03318
G1 X126.433 Y106.569
G1 X127.197 Y107.333 E.03318
G1 X126.663 Y107.333
G1 X125.9 Y106.569 E.03318
G1 X125.367 Y106.569
G1 X126.13 Y107.333 E.03318
G1 X125.597 Y107.333
G1 X124.833 Y106.569 E.03318
G1 X124.3 Y106.569
G1 X125.064 Y107.333 E.03318
G1 X124.53 Y107.333
G1 X123.767 Y106.569 E.03318
G1 X123.234 Y106.569
G1 X123.997 Y107.333 E.03318
G1 X123.464 Y107.333
G1 X122.7 Y106.569 E.03318
G1 X122.167 Y106.569
G1 X122.931 Y107.333 E.03318
G1 X122.397 Y107.333
G1 X121.634 Y106.569 E.03318
G1 X121.101 Y106.569
G1 X121.864 Y107.333 E.03318
G1 X121.331 Y107.333
G1 X120.567 Y106.569 E.03318
G1 X120.034 Y106.569
G1 X120.798 Y107.333 E.03318
G1 X120.264 Y107.333
G1 X119.501 Y106.569 E.03318
G1 X118.967 Y106.569
G1 X119.731 Y107.333 E.03318
G1 X119.198 Y107.333
G1 X118.434 Y106.569 E.03318
G1 X117.901 Y106.569
G1 X118.665 Y107.333 E.03318
G1 X118.131 Y107.333
G1 X117.368 Y106.569 E.03319
G1 X116.834 Y106.569
G1 X117.598 Y107.333 E.03319
G1 X117.065 Y107.333
G1 X116.301 Y106.569 E.03319
G1 X115.768 Y106.569
G1 X116.532 Y107.333 E.03319
G1 X115.998 Y107.333
G1 X115.235 Y106.569 E.03319
G1 X114.701 Y106.569
G1 X115.465 Y107.333 E.03319
G1 X114.932 Y107.333
G1 X114.168 Y106.569 E.03319
G1 X113.635 Y106.569
G1 X114.398 Y107.333 E.03319
G1 X113.865 Y107.333
G1 X113.101 Y106.569 E.03319
G1 X112.568 Y106.569
G1 X113.332 Y107.333 E.03319
G1 X112.799 Y107.333
G1 X112.035 Y106.569 E.03319
G1 X111.502 Y106.569
G1 X112.265 Y107.333 E.03319
G1 X111.732 Y107.333
G1 X110.968 Y106.569 E.03319
G1 X110.435 Y106.569
G1 X111.199 Y107.333 E.03319
G1 X110.666 Y107.333
G1 X109.902 Y106.569 E.03319
G1 X109.369 Y106.569
G1 X110.132 Y107.333 E.03319
G1 X109.599 Y107.333
G1 X108.835 Y106.569 E.03319
G1 X108.302 Y106.569
G1 X109.066 Y107.333 E.03319
G1 X108.533 Y107.333
G1 X107.769 Y106.569 E.03319
G1 X107.236 Y106.569
G1 X107.999 Y107.333 E.03319
G1 X107.466 Y107.333
G1 X106.702 Y106.569 E.03319
G1 X106.169 Y106.569
G1 X106.933 Y107.333 E.0332
G1 X106.4 Y107.333
G1 X105.636 Y106.569 E.0332
G1 X105.102 Y106.569
G1 X105.866 Y107.333 E.0332
G1 X105.333 Y107.333
G1 X104.569 Y106.569 E.0332
G1 X104.036 Y106.569
G1 X104.8 Y107.333 E.0332
G1 X104.267 Y107.333
G1 X103.503 Y106.569 E.0332
G1 X102.969 Y106.569
G1 X103.733 Y107.333 E.0332
G1 X103.2 Y107.333
G1 X102.436 Y106.569 E.0332
G1 X101.903 Y106.569
G1 X102.667 Y107.333 E.0332
G1 X102.134 Y107.333
G1 X101.37 Y106.569 E.0332
G1 X100.836 Y106.569
G1 X101.6 Y107.333 E.0332
G1 X101.067 Y107.333
G1 X100.303 Y106.569 E.0332
G1 X99.77 Y106.569
G1 X100.534 Y107.333 E.0332
G1 X100.001 Y107.333
G1 X99.236 Y106.569 E.0332
G1 X98.703 Y106.569
G1 X99.467 Y107.333 E.0332
G1 X98.934 Y107.333
G1 X98.17 Y106.569 E.0332
G1 X97.637 Y106.569
G1 X98.401 Y107.333 E.0332
G1 X97.868 Y107.333
G1 X97.103 Y106.569 E.0332
G1 X96.57 Y106.569
G1 X97.334 Y107.333 E.0332
G1 X96.801 Y107.333
G1 X96.037 Y106.568 E.0332
G1 X95.504 Y106.568
G1 X96.268 Y107.333 E.03321
G1 X95.734 Y107.333
G1 X94.97 Y106.568 E.03321
G1 X94.437 Y106.568
G1 X95.201 Y107.333 E.03321
G1 X94.668 Y107.333
G1 X93.904 Y106.568 E.03321
G1 X93.371 Y106.568
G1 X94.135 Y107.333 E.03321
G1 X93.601 Y107.333
G1 X92.837 Y106.568 E.03321
G1 X92.304 Y106.568
G1 X93.068 Y107.333 E.03321
G1 X92.535 Y107.333
G1 X91.771 Y106.568 E.03321
G1 X91.237 Y106.568
G1 X92.002 Y107.333 E.03321
G1 X91.468 Y107.333
G1 X90.704 Y106.568 E.03321
G1 X90.171 Y106.568
G1 X90.935 Y107.333 E.03321
G1 X90.402 Y107.333
G1 X89.638 Y106.568 E.03321
G1 X89.104 Y106.568
G1 X89.869 Y107.333 E.03321
G1 X89.335 Y107.333
G1 X88.571 Y106.568 E.03321
G1 X88.038 Y106.568
G1 X88.802 Y107.333 E.03321
G1 X88.269 Y107.333
G1 X87.505 Y106.568 E.03321
G1 X86.971 Y106.568
G1 X87.736 Y107.333 E.03321
G1 X87.202 Y107.333
G1 X86.438 Y106.568 E.03321
G1 X85.905 Y106.568
G1 X86.669 Y107.333 E.03321
G1 X86.136 Y107.333
G1 X85.372 Y106.568 E.03321
G1 X84.838 Y106.568
G1 X85.603 Y107.333 E.03321
G1 X85.069 Y107.333
G1 X84.305 Y106.568 E.03322
G1 X83.772 Y106.568
G1 X84.536 Y107.333 E.03322
G1 X84.003 Y107.333
G1 X83.238 Y106.568 E.03322
G1 X82.705 Y106.568
G1 X83.47 Y107.333 E.03322
G1 X82.936 Y107.333
G1 X82.172 Y106.568 E.03322
G1 X81.639 Y106.568
G1 X82.403 Y107.333 E.03322
G1 X81.87 Y107.333
G1 X81.105 Y106.568 E.03322
G1 X80.572 Y106.568
G1 X81.337 Y107.333 E.03322
G1 X80.803 Y107.333
G1 X80.039 Y106.568 E.03322
G1 X79.506 Y106.568
G1 X80.27 Y107.333 E.03322
G1 X79.737 Y107.333
G1 X78.972 Y106.568 E.03322
G1 X78.439 Y106.568
G1 X79.204 Y107.333 E.03322
G1 X78.67 Y107.333
G1 X77.906 Y106.568 E.03322
G1 X77.372 Y106.568
G1 X78.137 Y107.333 E.03322
G1 X77.604 Y107.333
G1 X76.839 Y106.568 E.03322
G1 X76.306 Y106.568
G1 X77.07 Y107.333 E.03322
G1 X76.537 Y107.333
G1 X75.773 Y106.568 E.03322
G1 X75.239 Y106.568
G1 X76.004 Y107.333 E.03322
G1 X75.471 Y107.333
G1 X74.706 Y106.568 E.03322
G1 X74.173 Y106.568
G1 X74.937 Y107.333 E.03322
G1 X74.404 Y107.333
G1 X73.64 Y106.568 E.03323
G1 X73.106 Y106.568
G1 X73.871 Y107.333 E.03323
G1 X73.338 Y107.333
G1 X72.573 Y106.568 E.03323
G1 X72.04 Y106.568
G1 X72.804 Y107.333 E.03323
G1 X72.271 Y107.333
G1 X71.507 Y106.568 E.03323
G1 X70.973 Y106.568
G1 X71.738 Y107.333 E.03323
G1 X71.205 Y107.333
G1 X70.44 Y106.568 E.03323
G1 X69.907 Y106.568
G1 X70.671 Y107.333 E.03323
G1 X70.138 Y107.333
G1 X69.373 Y106.568 E.03323
G1 X68.84 Y106.568
G1 X69.605 Y107.333 E.03323
G1 X69.072 Y107.333
G1 X68.307 Y106.568 E.03323
G1 X67.774 Y106.568
G1 X68.538 Y107.333 E.03323
G1 X68.005 Y107.333
G1 X67.24 Y106.568 E.03323
G1 X66.707 Y106.568
G1 X67.472 Y107.333 E.03323
G1 X66.939 Y107.333
G1 X66.174 Y106.568 E.03323
G1 X65.641 Y106.568
G1 X66.405 Y107.333 E.03323
G1 X65.872 Y107.333
G1 X65.107 Y106.568 E.03323
G1 X64.574 Y106.568
G1 X65.339 Y107.333 E.03323
G1 X64.806 Y107.333
G1 X64.041 Y106.568 E.03323
G1 X63.507 Y106.568
G1 X64.272 Y107.333 E.03323
G1 X63.739 Y107.333
G1 X62.974 Y106.568 E.03323
G1 X62.441 Y106.568
G1 X63.206 Y107.333 E.03324
G1 X62.673 Y107.333
G1 X61.908 Y106.568 E.03324
G1 X61.374 Y106.568
G1 X62.139 Y107.333 E.03324
G1 X61.606 Y107.333
G1 X60.841 Y106.568 E.03324
G1 X60.308 Y106.568
G1 X61.073 Y107.333 E.03324
G1 X60.539 Y107.333
G1 X59.775 Y106.568 E.03324
G1 X59.241 Y106.568
G1 X60.006 Y107.333 E.03324
G1 X59.473 Y107.333
G1 X58.708 Y106.568 E.03324
G1 X58.175 Y106.568
G1 X58.94 Y107.333 E.03324
G1 X58.406 Y107.333
G1 X57.642 Y106.568 E.03324
G1 X57.108 Y106.568
G1 X57.873 Y107.333 E.03324
G1 X57.34 Y107.333
G1 X56.575 Y106.568 E.03324
G1 X56.042 Y106.568
G1 X56.807 Y107.333 E.03324
G1 X56.273 Y107.333
G1 X55.508 Y106.568 E.03324
G1 X54.975 Y106.568
G1 X55.74 Y107.333 E.03324
G1 X55.207 Y107.333
G1 X54.442 Y106.568 E.03324
G1 X53.909 Y106.568
G1 X54.674 Y107.333 E.03324
G1 X54.14 Y107.333
G1 X53.375 Y106.568 E.03324
G1 X52.842 Y106.568
G1 X53.607 Y107.333 E.03324
G1 X53.074 Y107.333
G1 X52.309 Y106.568 E.03324
G1 X51.776 Y106.568
G1 X52.541 Y107.333 E.03324
G1 X52.007 Y107.333
G1 X51.242 Y106.568 E.03325
G1 X50.709 Y106.568
G1 X51.474 Y107.333 E.03325
G1 X50.941 Y107.333
G1 X50.176 Y106.568 E.03325
G1 X49.643 Y106.568
G1 X50.408 Y107.333 E.03325
G1 X49.874 Y107.333
G1 X49.109 Y106.568 E.03325
G1 X48.576 Y106.568
G1 X49.341 Y107.333 E.03325
M73 P99 R0
G1 X48.808 Y107.333
G1 X48.043 Y106.567 E.03325
G1 X47.509 Y106.567
G1 X48.275 Y107.333 E.03325
G1 X47.741 Y107.333
G1 X46.976 Y106.567 E.03325
G1 X46.443 Y106.567
G1 X47.208 Y107.333 E.03325
G1 X46.675 Y107.333
G1 X45.91 Y106.567 E.03325
G1 X45.376 Y106.567
G1 X46.142 Y107.333 E.03325
G1 X45.608 Y107.333
G1 X44.843 Y106.567 E.03325
G1 X44.31 Y106.567
G1 X45.075 Y107.333 E.03325
G1 X44.542 Y107.333
G1 X43.777 Y106.567 E.03325
G1 X43.243 Y106.567
G1 X44.009 Y107.333 E.03325
G1 X43.475 Y107.333
G1 X42.71 Y106.567 E.03325
G1 X42.177 Y106.567
G1 X42.942 Y107.333 E.03325
G1 X42.409 Y107.333
G1 X41.647 Y106.57 E.03312
G1 X41.138 Y106.595
G1 X41.875 Y107.333 E.03203
G1 X41.342 Y107.333
G1 X40.666 Y106.656 E.02939
G1 X40.217 Y106.741
G1 X40.809 Y107.333 E.0257
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S10000
G1 X40.217 Y106.741 E-.31789
G1 X40.666 Y106.656 E-.17343
G1 X41.166 Y107.156 E-.26868
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J0 P1  F30000
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z7.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z107 F600
    G1 Z105

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END


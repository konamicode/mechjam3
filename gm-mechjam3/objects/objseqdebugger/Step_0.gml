

if layer_sequence_is_finished(_s) {
	//layer_sequence_is_paused(_s);
	var _pos = layer_sequence_get_headpos(_s);
	layer_sequence_headpos(_s, 0);

	
}

if keyboard_check_pressed(vk_tab) && !layer_sequence_is_finished(_s) {
	var _pos = layer_sequence_get_headpos(_s);
	layer_sequence_play(_s);	
}
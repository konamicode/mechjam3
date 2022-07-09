input_default_key(ord("A"), "left");
input_default_key(ord("D"), "right");
input_default_key(ord("W"), "up");
input_default_key(ord("S"), "down");
input_default_mouse_button(mb_left, "action");
input_default_mouse_button(mb_right, "aim");

input_default_key(vk_escape, "exit");
input_default_key(vk_tab, "restart");

input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);

input_default_gamepad_button(gp_padl,  "left");
input_default_gamepad_button(gp_padr,  "right");
input_default_gamepad_button(gp_padu,  "up");
input_default_gamepad_button(gp_padd,  "down");
input_default_gamepad_button(gp_shoulderr, "action");
input_default_gamepad_button(gp_shoulderlb, "aim");

input_default_gamepad_axis(gp_axisrv, true, "aim_up");
input_default_gamepad_axis(gp_axisrv, false, "aim_down");
input_default_gamepad_axis(gp_axisrh, true, "aim_left");
input_default_gamepad_axis(gp_axisrh, false, "aim_right");

input_default_gamepad_axis(gp_axislv, true, "up");
input_default_gamepad_axis(gp_axislv, false, "down");
input_default_gamepad_axis(gp_axislh, true, "left");
input_default_gamepad_axis(gp_axislh, false, "right");

input_default_gamepad_button(gp_select, "exit");

input_player_source_set(INPUT_SOURCE.GAMEPAD);
input_player_gamepad_set(0);
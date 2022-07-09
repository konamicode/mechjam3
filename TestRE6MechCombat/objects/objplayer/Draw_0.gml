

if aiming && (input_held_time("aim") >= quickshotTime) {
		var _aimDir = aimDir;
		var aimOffset = clamp((45 - input_held_time("aim")), 0, 30);
		draw_set_alpha(0.5);
		draw_line(x, y, x + lengthdir_x(600, _aimDir + aimOffset), y + lengthdir_y(600, _aimDir + aimOffset));
		draw_line(x, y, x + lengthdir_x(600, _aimDir - aimOffset), y + lengthdir_y(600, _aimDir - aimOffset));
		draw_set_alpha(1);
}

draw_self();
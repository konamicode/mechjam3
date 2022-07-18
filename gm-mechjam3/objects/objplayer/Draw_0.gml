if aiming {
		var _aimDir = aimDir;
		var aimOffset = clamp((45 - input_held_time("aim")), 0, 30);
		//draw_set_alpha(0.5);
		//draw_line(x, y, x + lengthdir_x(600, _aimDir + aimOffset), y + lengthdir_y(600, _aimDir + aimOffset));
		//draw_line(x, y, x + lengthdir_x(600, _aimDir - aimOffset), y + lengthdir_y(600, _aimDir - aimOffset));
		draw_set_alpha(1);
		
}


DrawWeapon();

draw_self();
draw_set_color(c_white);

if (global.debug) {
	draw_text(x, y - sprite_yoffset - 10, string(action) + ":" + string(alarm_get(1)));
}


if (head) {
	var _coneWidth = 20;
	var _startColor = c_yellow, _endColor = c_green;
	var _len = 48;
	var _endAlpha = 0.1
	if aiming {
		var _aimDir = aimDir;
		//var aimOffset = clamp((45 - input_held_time("aim")), 5, 20);
		//draw_set_alpha(0.5);
		//draw_line(x, y, x + lengthdir_x(600, _aimDir + aimOffset), y + lengthdir_y(600, _aimDir + aimOffset));
		//draw_line(x, y, x + lengthdir_x(600, _aimDir - aimOffset), y + lengthdir_y(600, _aimDir - aimOffset));
		_len = screenWidth;
		_coneWidth = 0.08;
		_startColor = c_red;
		_endColor  = c_red;
		_endAlpha = 1;
	}
	

	var coneStartAX = head.x + lengthdir_x(8, aimDir + _coneWidth);;
	var coneStartAY = head.y + lengthdir_y(8, aimDir + _coneWidth);;
	var coneStartBX = head.x + lengthdir_x(8, aimDir - _coneWidth);;
	var coneStartBY = head.y + lengthdir_y(8, aimDir - _coneWidth);;
	var coneEndAX = head.x + lengthdir_x(_len, aimDir + _coneWidth);
	var coneEndAY = head.y + lengthdir_y(_len, aimDir +	_coneWidth);
	var coneEndBX = head.x + lengthdir_x(_len, aimDir - _coneWidth);
	var coneEndBY = head.y + lengthdir_y(_len, aimDir -	_coneWidth);

	
	draw_primitive_begin(pr_trianglelist);
	draw_vertex_colour(coneStartAX, coneStartAY, _startColor, 1);
	draw_vertex_colour(coneEndAX, coneEndAY, _endColor, _endAlpha);
	draw_vertex_colour(coneEndBX, coneEndBY, _endColor, _endAlpha);
	draw_vertex_colour(coneEndBX, coneEndBY, _endColor, _endAlpha);
	draw_vertex_colour(coneStartBX, coneStartBY, _startColor, 1);
	draw_vertex_colour(coneStartAX, coneStartAY, _startColor, 1);
	draw_primitive_end();
}


for ( var i = 0; i < ds_list_size(components); i++) {
	var comp = components[| i];
	with (comp)
		event_perform(ev_draw, 0);	
}





for ( var i = 0; i < height; i++) {
	var draw_y = (sprite_height * i) - ((sprite_height/4) * i);
	for (var j = 0; j < width; j++) {
		var x_offset;
		x_offset = (sprite_width / 2) * (i mod 2);	
		
		var drawColor;
		if ( currentPos.x == j ) && ( currentPos.y == i )
		{
			draw_set_color(c_white);
			drawColor = c_green;
		}
		else {
			drawColor = c_white;
			draw_set_color(c_black);
		}
		draw_sprite_ext(sprite_index, 0, x + (sprite_width * j) + x_offset, y + draw_y, 1, 1, 0, drawColor, image_alpha);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text( x + (sprite_width * j) + x_offset, y + draw_y, string(i) + "," + string(j));

	}
}


switch(attackType ) {
	case collision.line:
		DrawBeam();
		
	break;
	default: {
		draw_self();
		
		if global.debug
			draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_lime, c_lime, c_lime, c_lime, true);
	}
	break;
	
}


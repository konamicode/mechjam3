enum collision {
	line, 
	box,
	image
}

lineWidth = sprite_width;

function DoDamage(inst, dmg) {
	var _dmg = dmg;
	with(inst)
	{
		inst.hp -= _dmg;
		inst.hitFlash = true;
		inst.alarm[0] = 10;
	}
	
}

function BeamCollision(x, y, length, dir, obj ) {
	//show_debug_message(length);
	var collider = collision_line(x, y, x + lengthdir_x(length, dir), y + lengthdir_y(length, dir), obj, true, true);
	if (collider = creator.id) {
		collider = noone;
	}
	//show_debug_message(collider);
	return collider;
}

function ImageCollision(x, y, obj) {
	var collider  = instance_place(x, y, obj);
	return collider;
}

function DrawBeam() {
	if image_index > 0
		draw_sprite_ext(sprite_index, image_index - 1, x, y, (lineWidth )/sprite_width, 1, image_angle, image_blend, image_alpha);

	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index - 1, x, y, (lineWidth )/sprite_width, 1, image_angle, image_blend, image_alpha);
	
	gpu_set_blendmode(bm_normal);	
	
	draw_line_color(x, y, x + lengthdir_x(lineWidth, image_angle), y + lengthdir_y(lineWidth, image_angle), c_lime, c_lime);
}
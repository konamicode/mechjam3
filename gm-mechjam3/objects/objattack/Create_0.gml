enum collision {
	line, 
	box,
	image
}

lineWidth = sprite_width;

function ApplyDamage(inst) {
	var _dmg = dmg;
	with(inst)
	{
		inst.hp -= _dmg;
		inst.hitFlash = true;
		inst.alarm[0] = 10;
	}
	
}

function VerifyCollider(_collider) {
	if instance_exists(_collider) && instance_exists(creator) {
		if (_collider != creator.id) {
			//friendly fire check
			if object_is_ancestor(_collider, objMech) 
			{
				if (_collider.isPlayer != creator.isPlayer) 
					return true;
				else
					return false;
			}
			return true;	
		}
		else return false;
	}
	else return false;
}

function BeamCollision(x, y, length, dir, obj ) {
	//show_debug_message(length);
	var _collider = collision_line(x, y, x + lengthdir_x(length, dir), y + lengthdir_y(length, dir), obj, true, true);
	if !VerifyCollider(_collider) {
		_collider = noone;
	}
	//show_debug_message(collider);
	return _collider;
}

function BoxCollision(x, y, _left, _top, _right, _bottom, obj) {
	var _collider = collision_rectangle(x - _left, y - _top, x + _right, y + _bottom, obj, true, true);
	if !VerifyCollider(_collider) {
		_collider = noone;	
	}
	return _collider;

}

function ImageCollision(x, y, obj) {
	if place_meeting(x, y, obj) {
		var _collider  = instance_place(x, y, obj);
		if !VerifyCollider(_collider) {
			_collider = noone;
		}
		return _collider;
	} else return noone;
}

function DrawBeam() {
	if image_index > 0
		draw_sprite_ext(sprite_index, image_index - 1, x, y, (lineWidth )/sprite_width, 1, image_angle, image_blend, image_alpha);

	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index - 1, x, y, (lineWidth )/sprite_width, 1, image_angle, image_blend, image_alpha);
	
	gpu_set_blendmode(bm_normal);	
	
	if global.debug
		draw_line_color(x, y, x + lengthdir_x(lineWidth, image_angle), y + lengthdir_y(lineWidth, image_angle), c_lime, c_lime);
}

function CollisionEvent(_collider) {
	//show_debug_message("Collide!");
	ApplyDamage(_collider, dmg);
}
/// @description Insert description here
// You can write your code in this editor


var _left = input_check("left");
var _right = input_check("right");
var _up = input_check("up");
var _down = input_check("down");

var _hor = _right - _left;
var _ver = _down - _up;


var _hor = _right - _left;
var _ver = _down - _up;
var _len = point_distance(0, 0, _hor, _ver);
if (_len > 0) {
    x += MOVESPEED * _hor / _len;
    y += MOVESPEED * _ver / _len;
}

if input_check_pressed("aim") {
	aiming = true;
	sprite_index = sprPlayer_idle_beamrifle;
}
if aiming && input_check_released("aim") {
	aiming = false;
	show_debug_message("released!")
}

if aiming && (input_held_time("aim") >= quickshotTime) {
	var _aimDir = GetAimDirection();
	if !is_undefined(_aimDir) {
		aimDir = _aimDir;
		lastDir = aimDir; 
	} else
		aimDir = lastDir;
	
}

if input_check_pressed("action")
{
	if aiming {
		if (input_held_time("aim") < quickshotTime)  {
			show_debug_message("quick shot!");
			aiming = false;
			aimCounter = 0;
			energy -= 25;
			canRecharge = false;
			alarm[0] = 20;
			if instance_exists(objEnemy)
			{
				var _nearestEnemy = instance_nearest(x, y, objEnemy);
				aimDir = point_direction(x, y, _nearestEnemy.x, _nearestEnemy.y);
			}
			sprite_index = sprPlayer_Attack_beamrifle;
			image_index = 0;
		}
		else
			show_debug_message("shoot!");
			energy -= 25;
			canRecharge = false;
			alarm[0] = 20;
			sprite_index = sprPlayer_Attack_beamrifle;
			image_index = 0;			

		}
	else {
		show_debug_message("melee!");
		sprite_index = spr_MeleeAttack;
		image_index = 0;
	}
}

if canRecharge
	energy += energyRechargeRate;

energy = clamp(energy, 0, maxEnergy);
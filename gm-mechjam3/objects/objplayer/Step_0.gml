event_inherited();

if (actorState == state.dead) 
{
	objCombatManager.EndCombat(false);
	
} else {
	
	var _left = input_check("moveLeft");
	var _right = input_check("moveRight");
	var _up = input_check("moveUp");
	var _down = input_check("moveDown");

	var _hor = _right - _left;
	var _ver = _down - _up;
	
	var _hor = _right - _left;
	var _ver = _down - _up;
	var _len = point_distance(0, 0, _hor, _ver);
	if (_len > 0) {
		if((_hor > 0 and x < room_width) or (_hor < 0 and x > 0))
		{
			x += moveSpeed * _hor / _len;
		}
		if((_ver > 0 and y < room_height) or (_ver < 0 and y > 0))
		{
			y += moveSpeed * _ver / _len;
		}
	}
	
	if input_check_pressed("aim") {
		aiming = true;
		weapon = weapons[| GetWeaponByName("beamRifle",weapons)];
		weaponName = weapon.label;
		ChangeAnimation(GetAnimationName());
		
	}
	if aiming && input_check_released("aim") {
		aiming = false;
		show_debug_message("released!")
	}
	
	//if aiming {
	//	var _aimDir = GetAimDirection();
	//	if !is_undefined(_aimDir) {
	//		aimDir = _aimDir;
	//		lastDir = aimDir; 
	//	} else
	//		aimDir = lastDir;
	//} else 
	//	aimDir = point_direction(0, 0, image_xscale, 0);	
	
	var _aimDir = GetAimDirection();
	if !is_undefined(_aimDir) {
		aimDir = _aimDir;
		lastDir = aimDir; 
	} else
		aimDir = lastDir;
		
	if (aimDir > 90) && ( aimDir < 270) {
		image_xscale = -1;	
	} else
		image_xscale = 1;
	
	
	if (input_check("shoot") && weaponName != "beamRifle") {
		weapon = weapons[| GetWeaponByName("beamRifle",weapons)];
		weaponName = weapon.label;	
		ChangeAnimation(GetAnimationName());
	}
	
	if input_check("shoot") && canAttack  {
		if (ammoCounter > 0) {
			action = "attack";
			alarm[1] = weapon.burstRate * room_speed;
			canAttack = false;
			ammoCounter -= 1;

			DoAttack();
		}
		
		if( ammoCounter == 0) {
			canAttack = false;
			alarm[1] = (weapon.fireRate - weapon.burstRate) * room_speed;
			ammoCounter = weapon.clipSize;
			DeductStamina(weapon.cost);
		}
		
	}
	
	if input_check_pressed("action") {
		action = "attack";
		var idx = GetWeaponByName("beamSaber", weapons)
		if (idx > 0) {
			weapon = weapons[| idx];
			weaponName = weapon.label;
			ChangeAnimation(GetAnimationName());
		}
	}
	
	if input_check("special") && canAttack {
		action = "attack";		
		if (ds_list_size(subweapons) > 0) {
			weapon = subweapons[| subweaponIdx];
			weaponName = weapon.label;		
			subweaponAmmo = weapon.clipSize;
			fireSubwpn = true;
		}
	}	
}

if (fireSubwpn) {
	if (subweaponAmmo > 0) && canAttack {		
		action = "attack";
		alarm[1] = weapon.burstRate * room_speed;
		subweaponAmmo -= 1;
		show_debug_message("boom!");
		DoAttack();
		canAttack = false;
	}
	else if ( subweaponAmmo = 0) {	
		canAttack = false;
		alarm[1] = (weapon.fireRate - weapon.burstRate) * room_speed;
		fireSubwpn = false;
		DeductStamina(weapon.cost);
	}
}


if input_check_pressed("subLeft") {
	if ds_list_size(subweapons) > 0 {
		if subweaponIdx > 0
			subweaponIdx -= 1;
		else
			subweaponIdx = ds_list_size(subweapons) - 1 ;		
	}
}

if input_check_pressed("subRight") {
	if ds_list_size(subweapons) > 0 {
		if subweaponIdx < ( ds_list_size(subweapons) -1)
			subweaponIdx += 1;
		else
			subweaponIdx = 0;
	}
}
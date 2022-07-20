// Inherit the parent event
event_inherited();
animationHitboxData = undefined;
hasPilot = true;
name = noone;



////frame = instance_create_layer(x, y, "Instances", objComponent, { sprite_index : frame, creator: id } );

components = ds_list_create();

//ds_list_add(components, frame);

action = "idle";
ammoCounter = 0;


weapPosX = 0;
weapPosY = 0;

//if (isPlayer) {
//	faction = "Player";
//	//weaponName = "beamrifle";
//} 
//else {
//	if body == "drone"
//		faction = "Drone";
//	else
//		faction = "Enemy";
//}
if (ds_list_size(weapons) > 0) {
	weapon = weapons[| 0];
	weaponName = weapon.label;
	if body == "Drone"
		fallbackWeaponName = "beamGun";
	else fallbackWeaponName =  "beamSaber";
} else {
	weaponName = "melee";
	fallbackWeaponName = weaponName;
}

function GetAnimationName() {

	if (weapon.animSet == "none") 
		return body + "_" + action + "_" + fallbackWeaponName ;
	else
	return body + "_" + action + "_" + weaponName;
}

ammoCounter = weapon.clipSize;

animString = GetAnimationName();

updateHitboxFromSequence = false;

head = -1;

function GetHeadComponent() {
	for ( var i = 0; i < ds_list_size(components); i++) {
		var comp = components[| i];
		if ( comp.label == "head" ) {
			return comp;
		}
	}
}

head = GetHeadComponent();




function ChangeHitbox(_newSequence) {
	animationHitboxData = ds_map_create();
	animationHitboxData = GetSequenceHitboxData(_newSequence);
	if (animationHitboxData != undefined)
		updateHitboxFromSequence = true;
}

function ChangeAnimation(animString, resetIndex = true) {
	if (weapon.animSet == "none") 
		animString = body + "_" + action + "_" + fallbackWeaponName ;
	
	var newSprite = asset_get_index("spr" + animString);
	if newSprite == -1 {
		animString = body + "_" + action + "_" + fallbackWeaponName ;
		newSprite = asset_get_index("spr" + animString);
	}
	var newSeq = asset_get_index("sq" + animString);
	if (newSeq != -1 )
		ChangeHitbox(newSeq);
	if (newSprite != -1 ) {
		sprite_index = newSprite;
		if (resetIndex)
		image_index = 0;
	}
	

}

ChangeAnimation(GetAnimationName());

function CheckAddFallback(map) {
	if !ds_map_exists(map, "fallback") {
		array = array_create(6, undefined);
		ds_map_add(map, "fallback", array);
	}
}

function DrawWeapon() {
	var animTag;
	if (weapon.animSet == "none") 
		animTag = "weapon_" + action + "_" + string_lower(fallbackWeaponName );
		
	else
		animTag = "weapon_"  + action + "_" + string_lower(weaponName);

	var animFrame;
	
	if animationHitboxData == undefined
		return;

	if (ds_map_exists(animationHitboxData, animTag)) {
	//let's draw us a weapon	
		var framePosX = 0, framePosY = 0, frameScaleX = 10, frameScaleY = 10, frameRot = 0;
		var map = animationHitboxData[? animTag];
		
		var seqSpeed = animationHitboxData[? "seqFps"];
		var spriteSpeed = sprite_get_speed(sprite_index);
		var sprMultiplier = seqSpeed / spriteSpeed;
		//show_debug_message(sprMultiplier);
		var frameIndex = (floor(image_index) * sprMultiplier);
		
		animFrame = frameIndex;		
		//animFrame = GetHitboxAnimFrame(animationHitboxData, sprite_index, image_index);
		var frameData = map[? animFrame];
		
		if (frameData != undefined) {
			//var frameData = map[? 0];
			if (frameData[1] != undefined) {
				framePosX = frameData[1]; 
				CheckAddFallback(map);
				map[? "fallback"][@ 1] = framePosX;
			} else framePosX = map[? "fallback"][@ 1];
			if (frameData[2] != undefined){
				framePosY = frameData[2];
				CheckAddFallback(map);
				map[? "fallback"][@ 2] = framePosY;
			} else framePosY = map[? "fallback"][@ 2];
			if (frameData[3] != undefined) {
				frameScaleX = frameData[3];
				CheckAddFallback(map);
				map[? "fallback"][@ 3] = frameScaleX;	
			} else frameScaleX = map[? "fallback"][@ 3];
			if (frameData[4] != undefined) {
				frameScaleY = frameData[4];	
				CheckAddFallback(map);
				map[? "fallback"][@ 4] = frameScaleY;
			} else frameScaleY = map[? "fallback"][@ 4];
			if (frameData[5] != undefined)	{	
				frameRot = frameData[5];
				CheckAddFallback(map);
				if (sign(image_xscale) == -1) {
					frameRot = 180 - frameData[5];
				}
				map[? "fallback"][@ 5] = frameRot;
			} else { 
				frameRot = map[? "fallback"][@ 5];
			}						
		} else
		{
			if ds_map_exists(map, "fallback") {
				framePosX = map[? "fallback"][ 1];
				framePosY = map[? "fallback"][ 2];
				frameScaleX = map[? "fallback"][ 3];
				frameScaleY = map[? "fallback"][ 4];
				frameRot = map[? "fallback"][ 5];
			}
		} 	
		
		var weaponSprite = asset_get_index("sprWeap_" + action + "_" + weaponName);
		weapPosX = framePosX;
		weapPosY = framePosY;
		if (weaponSprite != -1 ) {
			var _aimDir = aimDir;
			if (sign(image_xscale) == -1) {
				_aimDir = 180 + aimDir;
			}
			draw_sprite_ext(weaponSprite, image_index, x + (sign(image_xscale) * framePosX), y + framePosY, image_xscale, image_yscale, action = "attack" ? _aimDir : image_angle , image_blend, image_alpha);			
		}
	}	
	
	else {
		weapPosX = 0;
		weapPosY = 0;
	}	

}




function FireWeapon(_x, _y, _object ) {
	var _dmg = CalculateDamage();
	if is_string(_object)
	{
		var _string = _object;
		_object = asset_get_index(_string);
		if (_object < -1 )
			_object = noone;
	}
	if _object != noone
		instance_create_layer(_x, _y, "Attacks", _object, {creator:id, image_angle: aimDir, aimed: aiming, dmg: _dmg});
		
	
}

if (!ds_map_exists(global.functionMap, FireWeapon))
	global.functionMap[? "FireWeapon"] = method(undefined, FireWeapon);
	

	
	
function GetTargetDirection(target) {
	var aimDir = 0;
	if instance_exists(target) {
		aimDir = point_direction(x, y, target.x, target.y);
	}
	return aimDir;
}

function CorrectFlippedDirection(_aimDir){
	if (sign(image_xscale) == -1) {
		_aimDir = 180 + _aimDir;
	}
	return _aimDir;
}

function SelectWeapon() {
	var _index = irandom(ds_list_size(weapons)-1);
	weapon = weapons[| _index];
	
}

function ColliderOn(_x, _y) {
	
	//Get Collider info from hitbox data in sequence
	attackHitboxData = noone;
	var _object = weapon.attack;
	var _posX = 0, _posY = 10, _left = 10, _top = 10, _right = 10, _bottom = 10;
	var _weapon = string_lower(weapon.label);
	if ds_map_exists(animationHitboxData, _weapon)
		attackHitboxData = animationHitboxData[? _weapon];
	
	if (attackHitboxData != noone) {
		show_debug_message(attackHitboxData);
		var _frameIdx = ds_map_find_first(attackHitboxData);
		var _attack = attackHitboxData[? _frameIdx];
		_posX = _attack[1] * (image_xscale);
		_posY = _attack[2];
		_left = _attack[3];
		_right = _attack[3];
		_top = _attack[4];
		_bottom = _attack[4];
		
	}

	
	var _dmg = CalculateDamage();
	if is_string(_object)
	{
		var _string = _object;
		_object = asset_get_index(_string);
		if (_object < -1 )
			_object = noone;
	}
	if _object != noone
	{
		meleeCollider = instance_create_layer(_x + _posX, _y + _posY, "Attacks", _object, {creator:id, dmg: _dmg, left: _left, top: _top, right: _right, bottom: _bottom});	
	}
	
}

function ColliderOff() {
	if (meleeCollider != noone)
	{
		instance_destroy(meleeCollider);
		meleeCollider = noone;
	}
}

if (!ds_map_exists(global.functionMap, ColliderOn))
	global.functionMap[? "ColliderOn"] = method(undefined, ColliderOn);

if (!ds_map_exists(global.functionMap, ColliderOff))
	global.functionMap[? "ColliderOff"] = method(undefined, ColliderOff);

function CalculateDamage() {
	var _finalDamage = weapon.baseDamage;
	
	if(weapon.type == weaponType.melee)
	{
		_finalDamage *= meleePower;
	}
	else
	{
		_finalDamage *= rangedPower;
	}
	
	return floor(_finalDamage);
}

function DeductStamina(_cost) {
	stamina -= _cost;
	stamina = max(stamina, 0, stamina);
	
}

function ChangeWeapon() {
	ammoCounter = 0;	
}


// Inherit the parent event
event_inherited();
animationHitboxData = undefined;
hasPilot = true;
name = noone;



////frame = instance_create_layer(x, y, "Instances", objComponent, { sprite_index : frame, creator: id } );

components = ds_list_create();

//ds_list_add(components, frame);

action = "idle";



weapPosX = x;
weapPosY = y;

if (isPlayer) {
	frame = "Player";
	weaponName = "beamrifle";
} else {
	if (ds_list_size(weapons) > 0) {
		weapon = weapons[| 0];
		weaponName = weapon.label;
	} else
		weaponName = "melee";
}


animString = frame + "_" + action + "_" + weaponName;	

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
	var newSprite = asset_get_index("spr" + animString);
	var newSeq = asset_get_index("sq" + animString);
	if (newSeq != -1 )
		ChangeHitbox(newSeq);
	if (newSprite != -1 ) {
		sprite_index = newSprite;
		if (resetIndex)
		image_index = 0;
	}
}

ChangeAnimation(animString);

function CheckAddFallback(map) {
	if !ds_map_exists(map, "fallback") {
		array = array_create(6, undefined);
		ds_map_add(map, "fallback", array);
	}
}

function DrawWeapon() {
	var animTag = "weapon_" + action + "_" + weaponName;

	var animFrame;
	if (ds_map_exists(animationHitboxData, animTag)) {
	//let's draw us a weapon	
		
		var framePosX = 0, framePosY = 0, frameScaleX = 10, frameScaleY = 10, frameRot = 0;
		//var oldFramePosX = 0, oldFramePosY = 0, oldFrameScaleX = 10, oldFrameScaleY = 10, oldFrameRot = 0;
		var map = animationHitboxData[? animTag];
		var seqSpeed = animationHitboxData[? "seqFps"];
		var spriteSpeed = sprite_get_speed(sprite_index);
		var sprMultiplier = seqSpeed / spriteSpeed;
		//show_debug_message(sprMultiplier);
		var frameIndex = floor(image_index * sprMultiplier);
		animFrame = frameIndex;
		//if (isPlayer)
		//	show_debug_message(string(image_index) + ": " + string(frameIndex));
		var frameData = map[? frameIndex];
		

		if ds_map_exists(map, frameIndex) {
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
		weapPosX = x;
		weapPosY = y;
	}
}

function GetAnimationName() {
	
	return frame + "_" + action + "_" + weaponName;
}


function FireWeapon(_x, _y, _object ) {
	
	instance_create_layer(_x, _y, "Instances", _object, {creator:id, image_angle: aimDir});
		
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


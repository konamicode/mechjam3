// Inherit the parent event
event_inherited();


if (frame != noone) {
	sprite_index = frame;
}

////frame = instance_create_layer(x, y, "Instances", objComponent, { sprite_index : frame, creator: id } );

components = ds_list_create();

//ds_list_add(components, frame);

action = "idle";
weapon = "placeholder";
faction = "Enemy";

if (isPlayer) {
	faction = "Player";
	weapon = "beamrifle";
}
animString = faction + "_" + action + "_" + weapon;	

updateHitboxFromSequence = false;



function ChangeHitbox(_newSequence) {
	animationHitboxData = ds_map_create();
	animationHitboxData = GetSequenceHitboxData(_newSequence);
	if (animationHitboxData != undefined)
		updateHitboxFromSequence = true;
}

function ChangeAnimation(animString, resetIndex = true) {
	var newSprite = asset_get_index("spr" + animString);
	var newSeq = asset_get_index("sq" + animString);
	ChangeHitbox(newSeq);
	sprite_index = newSprite;
	if (resetIndex)
		image_index = 0;
}

ChangeAnimation(animString);

function CheckAddFallback(map) {
	if !ds_map_exists(map, "fallback") {
		array = array_create(6, undefined);
		ds_map_add(map, "fallback", array);
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum enmWeaponType {
	bullet,
	beam,
	melee,
	rocket,
	missile
	
}

function RefillEnergy() {
	energy = maxEnergy;
}


function RefillHP() {
	hp = maxHp;
}

function Stun(actor, stunType) {
	if (actor.actorState != state.stun)
	{
		actor.actorState = state.stun;
		actor.alarm[2] = stunType;
		actor.statusEffectAnim = instance_create_layer(actor.x, actor.y, "FX", objStatusEffect, { sprite_index: sprStatus_stun, parentObj : actor});
	}
}



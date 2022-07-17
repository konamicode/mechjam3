// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Mech(_frame = "Enemy" ) constructor {

	frame = _frame;
	weapons = ds_list_create();
	weakpoints = ds_list_create();
	defenses = ds_list_create();
	
	function Cleanup() {
		ds_list_destroy(weapons);
		ds_list_destroy(weakpoints);
		ds_list_destroy(defenses);		
	}
	
	function AddComponent(type, label, creator) {
		var comp = instance_create_layer(x, y, "Instances", objComponent, {creator: creator, type : type, label: label});
		if label == "head"
			creator.head = comp;
		//switch(type) {
		//	case componentType.weakpoint :	
				
		//	break;
		//	case componentType.weapon: 
		//	break;
		//	case componentType.defenses: 
		//	break;
		//}
		return comp;
	}
	
	function AddWeapon(weapon) {
		ds_list_add(weapons, weapon);
	}
	
	function CopyWeapons(weaponList)
	{
		ds_list_copy(weapons, weaponList);
	}
}


function CreateMechObject(mechStruct, _x, _y, obj = objMech, _layer="Instances") {
	var inst = instance_create_layer(	_x, _y, _layer, obj, mechStruct);
	return inst;
}


function AddEnemy(_x, _y, _frame, enemyType, _weapons = [] ) {
	var enemy = new Mech(_frame);
	if (array_length(_weapons) > 0) {
		for (var i = 0; i < array_length(_weapons); i++)
		{
			enemy.AddWeapon(_weapons[i]);
		}
	}
	var inst = CreateMechObject(enemy, _x, _y, enemyType);
	var _comp = enemy.AddComponent(componentType.weakpoint, "head", inst);
	ds_list_add(inst.components, _comp);
	return inst;
}

function CreatePlayer(_x, _y, playerData) {
	var player = new Mech();
	player.maxHp = playerData.maxHp;
	player.hp = player.maxHp;
	player.maxStamina = playerData.maxStamina;
	player.stamina = player.maxStamina;
	player.moveSpeed = playerData.moveSpeed;
	player.meleePower = playerData.meleeAttackPower;
	player.rangedPower = playerData.rngAttackPower;
	
	var inst = CreateMechObject(player, _x, _y, objPlayer );
	var _comp = player.AddComponent(componentType.weakpoint, "head", inst);
	ds_list_add(inst.components, _comp);

}

function SpawnRivalFromData(_x, _y, rivalData)
{
	var rival = new Mech();
	rival.maxHp = rivalData.maxHp;
	rival.hp = rival.maxHp;
	rival.maxStamina = rivalData.maxStamina;
	rival.stamina = rival.maxStamina;
	rival.moveSpeed = rivalData.moveSpeed;
	rival.meleePower = rivalData.meleePower;
	rival.rangedPower = rivalData.rangedPower;
	rival.name = rivalData.name;
	rival.personality = rivalData.personality;
	
	//TODO: Plug in the other instances in rivalData
	rival.weapons = rivalData.weapons;
	var inst = CreateMechObject(rival, _x, _y, objMech);
	var _comp = rival.AddComponent(componentType.weakpoint, "head", inst);
	ds_list_add(inst.components, _comp);

	return inst;
}

function GenerateRivalData(mech, initialResult)
{
	rivalData = {
		
		maxHp : mech.maxHp,
		maxStamina : mech.maxStamina,
		meleePower : mech.meleePower,
		rangedPower : mech.rangedPower,
		moveSpeed : mech.moveSpeed,
		
		frame : mech.frame,
		weapons : ds_list_create(),
		weakpoints : ds_list_create(),
		defenses : ds_list_create(),
	
		battleRecord : ds_list_create(),
		personality : irandom(enmPersonality.length),
	
		name : GenerateRivalName()
	}
	
	LevelRival(rivalData);
	
	ds_list_copy(rivalData.weapons, mech.weapons);
	ds_list_copy(rivalData.weakpoints, mech.weakpoints);
	ds_list_copy(rivalData.defenses, mech.defenses);
	
	ds_list_add(rivalData.battleRecord, initialResult);	//true = player won, false = rival won
	
	return rivalData;
}

function LevelRival(rivalData)
{
	/*Player Upgrades as reference:
	HP: 10%
	Stamina: 10%
	Melee Damage: 10%
	Ranged Damage: 10%
	Speed: 5%
	*/
	
	switch(rivalData.personality)
	{
		case enmPersonality.arrogant:
		{
			rivalData.maxHp *= 1.05;
			rivalData.maxStamina *= 1.05;
			rivalData.meleePower *= 1.1;
			rivalData.rangedPower *= 1.05;
			rivalData.moveSpeed *= 1.025;
			break;
		}
		case enmPersonality.fighter:
		{
			rivalData.maxHp *= 1.05;
			rivalData.maxStamina *= 1.05;
			rivalData.meleePower *= 1.05;
			rivalData.rangedPower *= 1.05;
			rivalData.moveSpeed *= 1.05;
			break;
		}
		case enmPersonality.honorable:
		{
			rivalData.maxHp *= 1.1;
			rivalData.maxStamina *= 1.05;
			rivalData.meleePower *= 1.05;
			rivalData.rangedPower *= 1.05;
			rivalData.moveSpeed *= 1.025;
			break;
		}
		case enmPersonality.loyal:
		{
			rivalData.maxHp *= 1.05;
			rivalData.maxStamina *= 1.1;
			rivalData.meleePower *= 1.05;
			rivalData.rangedPower *= 1.05;
			rivalData.moveSpeed *= 1.025;
			break;
		}
	}
}

function GenerateRivalName()
{
	specialNames = [
		"Branch Forsythe",
		"Quattro Formaggi"
	]
	firstNames = [
		"Steve",
		"Fey",
		"James",

	];
	lastNames = [
		"Rynders",
		"Harkness",
		"Youngman"
	];
	var randomName = "";
	var nameExists = true;
	while(nameExists) {
		var _s = specialNames[irandom(array_length(specialNames) - 1)];
		var _combined = firstNames[irandom(2)]+" "+lastNames[irandom(2)];
		randomName = choose( _s, _combined );
		nameExists = ds_map_exists(rivalMap, randomName);
	}
	return randomName;
}
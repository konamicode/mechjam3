// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Component(_type, _label, _creator, _onDestroy=noone, _destroyParams=[]) constructor {
	type = _type;
	label = _label;
	creator = _creator;
	onDestroy = _onDestroy;
	destroyParams = _destroyParams;
}

function Mech(_body = "Mech" ) constructor {

	body = _body;
	weapons = ds_list_create();
	weakpoints = ds_list_create();
	defenses = ds_list_create();
	subweapons = ds_list_create();
	
	function Cleanup() {
		ds_list_destroy(weapons);
		ds_list_destroy(weakpoints);
		ds_list_destroy(defenses);		
	}
	
	function AddComponent(compStruct) {
		var comp = instance_create_layer(x, y, "Instances", objComponent, compStruct);
		if comp.label == "head"
			creator.head = comp;
		//switch(comp.type) {
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
		ds_list_add(weapons, objCombatManager.weaponMap[? weapon]);
	}
	
	function AddSubWeapon(weapon) {
		ds_list_add(subweapons, objCombatManager.weaponMap[? weapon]);
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

function AddEnemyFromCatalog(_x, _y, mechStruct){
	var enemy = new Mech();

	enemy.maxHp = mechStruct.maxHP;
	enemy.hp = mechStruct.maxHP;
	enemy.maxStamina = mechStruct.maxStamina;
	enemy.stamina = mechStruct.maxStamina;
	enemy.moveSpeed = mechStruct.moveSpeed;
	enemy.AddWeapon(mechStruct.weapon);
	enemy.body = mechStruct.body;
	var inst;
	if (enemy.body == "Mech") {
		inst = CreateMechObject(enemy, _x, _y, objMech);
		var _component = new Component(componentType.weakpoint, "head", inst, Stun, stunType.heavy); 
		var _comp = enemy.AddComponent(_component);
		ds_list_add(inst.components, _comp);
	} else 
	{
		inst = CreateMechObject(enemy, _x, _y, objDrone);
	}
				

	return inst;

}

function AddEnemyFromData(_x, _y, _frame = "Mech", enemyType = "objMech", _weapons = [] ) {
	//this function should ideally become redundant as we move entirely out of hardcoded/non-Data enemies
	var enemy = new Mech(_frame);
	if (array_length(_weapons) > 0) {
		for (var i = 0; i < array_length(_weapons); i++)
		{
			enemy.AddWeapon(_weapons[i]);
		}
	}
	var inst = CreateMechObject(enemy, _x, _y, enemyType);
	var _component = new Component(componentType.weakpoint, "head", inst, Stun, stunType.heavy); 
	var _comp = enemy.AddComponent(_component);
	ds_list_add(inst.components, _comp);
	return inst;
}

function CreatePlayer(_x, _y, playerData) {
	var player = new Mech("Player");
	player.maxHp = playerData.maxHp;
	player.hp = playerData.maxHp;
	player.maxStamina = playerData.maxStamina;
	player.stamina = playerData.maxStamina;
	player.moveSpeed = playerData.moveSpeed;
	player.meleePower = playerData.meleeAttackPower;
	player.rangedPower = playerData.rngAttackPower;
	//player.subweapons = playerData.subWeapons;
	player.AddWeapon("beamRifle");
	player.AddWeapon("beamSaber");
	player.AddSubWeapon("vulcans");
	player.AddSubWeapon("bazooka");
	//player.AddSubWeapon("beamCannon");
	//for (var i = 0; i < array_length(player.subWeapons); i++ ) {
			
	//}
	var inst = CreateMechObject(player, _x, _y, objPlayer );
	var _component = new Component(componentType.weakpoint, "head", inst, Stun, stunType.heavy); 
	var _comp = inst.AddComponent(_component);
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
	rival.body = rivalData.body;
	
	//TODO: Plug in the other instances in rivalData
	//rival.weapons = rivalData.weapons;
	if (ds_list_size(rivalData.weapons) > 0) {
		for (var i = 0; i < ds_list_size(rivalData.weapons); i++)
		{
			rival.AddWeapon(rivalData.weapons[| i].label);
		}
	} else
	{
		show_debug_message("Why is there no fucking weapon");
	}
	var inst = CreateMechObject(rival, _x, _y, objMech);
	var _component = new Component(componentType.weakpoint, "head", inst, Stun, stunType.heavy); 	
	var _comp = rival.AddComponent(_component);
	ds_list_add(inst.components, _comp);

	return inst;
}

function GenerateRivalData(mech, initialResult)
{
	show_debug_message(mech);
		show_debug_message(mech.hasPilot);
		show_debug_message(mech.body);
		
	rivalData = {
		
		maxHp : mech.maxHp,
		maxStamina : mech.maxStamina,
		meleePower : mech.meleePower,
		rangedPower : mech.rangedPower,
		moveSpeed : mech.moveSpeed,
		
		body : mech.body,
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
		"Quattro Formaggi",
		"Forst Cool",
		"Ham'an Corn",
		"Milliardo Windcraft",
		"Noa Dark",
		"Kamal Majirif",
		"Gally Forward",
		"Ahim Allard",
		"Carlos Andromeda"
	]
	firstNames = [
		"Steve",
		"Fey",
		"James",
		"Ishmael",
		"Yaz",
		"Matte",
		"Smith",
		"Bolt",
		"Aidan", 
		"Orville",
		"Vince",
		"Joe"

	];
	lastNames = [
		"Rynders",
		"Harkness",
		"Youngman",
		"Fodder",
		"Calmington",
		"Melville",
		"Tomino",
		"Yatate",
		"Bidan",
		"Ikari",
		"Torrington",
		"O'Neill"
	];
	var randomName = "";
	var nameExists = true;
	while(nameExists) {
		var _s = specialNames[irandom(array_length(specialNames) - 1)];
		var _combined = firstNames[irandom(array_length(firstNames) - 1)]+" "+lastNames[irandom(array_length(lastNames) - 1)];
		randomName = choose( _s, _combined );
		nameExists = ds_map_exists(objManager.gameData.rivals, randomName);
	}
	return randomName;
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Mech(_frame = noone ) constructor {

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
}


function CreateMechObject(mechStruct, _x, _y, obj = objMech, _layer="Instances") {
	var inst = instance_create_layer(	_x, _y, _layer, obj, mechStruct);
	return inst;
}


function AddEnemy(_x, _y) {
	var enemy = new Mech();
	var inst = CreateMechObject(enemy, _x, _y);
	var _comp = enemy.AddComponent(componentType.weakpoint, "head", inst);
	ds_list_add(inst.components, _comp);
	return inst;
}

function CreatePlayer(_x, _y, playerData) {
	var player = new Mech();
	player.maxHp = playerData.maxHP;
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
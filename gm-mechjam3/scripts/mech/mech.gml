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
}


function CreateMechObject(mechStruct, _x, _y, _layer="Instances") {
	var inst = instance_create_layer(	_x, _y, _layer, objMech, mechStruct);
	return inst;
}


function AddEnemy(_x, _y) {
	var enemy = new Mech(sprPlaceholderEnemyFrame);
	var inst = CreateMechObject(enemy, _x, _y);
	return inst;
}


function EndCombat(result) {
	GoToMapRoom();
}

function StartCombat() {
	GoToCombatRoom();	
}
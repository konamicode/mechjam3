// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function PlayerData() constructor {
	subWeapons = [];
	
	meleeAttackPower = 10;
	rngAttackPower = 10;
	maxHp = 100;
	maxStamina = 50;
	moveSpeed = 6.0;
	
	buffLevel = 0;

	
	function AddSubWeapon(subWeaponData) {
		subWeapons[array_length(subWeapons)] = subWeaponData;
	}
	
	function UpgradePlayer(stat)
	{
		switch(stat)
		{
			case enmBuffTypes.HP:
			{
				maxHp = floor(maxHp * 1.1);
				break;
			}
			case enmBuffTypes.Speed:
			{
				moveSpeed = moveSpeed * 1.05;
				break;
			}
			case enmBuffTypes.Stamina:
			{
				maxStamina = floor(maxStamina * 1.1);
				break;
			}
			case enmBuffTypes.MeleePower:
			{
				meleeAttackPower = floor(meleeAttackPower * 1.1);
				break;
			}
			case enmBuffTypes.RangedPower:
			{
				rngAttackPower = floor(rngAttackPower * 1.1);
				break;
			}
		}
		buffLevel = buffLevel + 1;
	}
	
}


function EnemyData() constructor {
	name = "";
	level = 1;
	meleeWeaponLvl = 1;
	rngWeaponLvl = 1;
	
	function UpgradeEnemy()
	{
		level = level+1;
		
		/*Player Upgrades as reference:
		HP: 10%
		Speed: 5%
		Stamina: 10%
		Melee Damage: 10%
		Ranged Damage: 10%
		*/
	}
}

function GameData() constructor {
	mapData = [];
	player = new PlayerData();
	rivals = ds_map_create();
	rivalData = [];
	mapX = 0;
	mapY = 0;
	
	function Clear() {
		mapData = [];
		ds_map_clear(rivals);
	}
	
	function CleanUp()
	{
		ds_map_destroy(rivals);	
	}
	
	function Save() {

		var _key = ds_map_find_first(rivals);
		var rebuildStruct = {};
		repeat(ds_map_size(rivals))
		{
			var _struct = rivals[? _key];
	
			var array = variable_struct_get_names(_struct);
			for (var i = 0; i < array_length(array); i++) {
				var _name = array[i];
				var _data = variable_struct_get(_struct, array[i]);
				switch(_name) {
					case "weapons":
					case "defenses":
					case "battleRecord":
					case "weakpoints":
						if ds_exists(_data, ds_type_list) {
							//make an array
							var _array = [];
							for (var j = 0; j < ds_list_size(_data); j++) {
								array_push(_array, _data[| j]);
							}
							variable_struct_set(rebuildStruct, _name, _array);
						} 
					break;
					default:
						variable_struct_set(rebuildStruct, _name, _data);
					break;
				}
			}

			array_push(rivalData, rebuildStruct);
			_key = ds_map_find_next(rivals, _key);
		}
		
		var _jsonData = json_stringify(self);
		var saveBuffer = buffer_create(1, buffer_grow, 1);
		buffer_write(saveBuffer, buffer_string, _jsonData)
		buffer_save(saveBuffer, "testSaveFile.sav");
		buffer_delete(saveBuffer);		
	}
	
	function Load() {
		var buffLoad = buffer_load("testSaveFile.sav");
		var _json = buffer_read(buffLoad,buffer_string);
		buffer_delete(buffLoad);
		var _struct = json_parse(_json);
		if variable_struct_exists(_struct, "mapData")
			mapData = variable_struct_get(_struct, "mapData");
		
		if variable_struct_exists(_struct, "mapX")
			mapX = variable_struct_get(_struct, "mapX");
		
		if variable_struct_exists(_struct, "mapY")
			mapY = variable_struct_get(_struct, "mapY");		
		
		if variable_struct_exists(_struct, "player") {
			var _player = variable_struct_get(_struct, "player");
			var _arr = variable_struct_get_names(_player);
			for (var i = 0; i < array_length(_arr); i++) {
				var _name = _arr[i];
				_val = variable_struct_get(_player, _name);
				if variable_struct_exists(player, _name)
					variable_struct_set(player, _name, _val);
			}
		}
			
			
		if variable_struct_exists(_struct, "rivalData")
			rivalData = variable_struct_get(_struct, "rivalData");
			
		for (var i = 0; i < array_length(rivalData); i++) 
		{
			var _rival = rivalData[i];
			var _battleRecord = variable_struct_get(_rival, "battleRecord");
			var _br_list = ds_list_create();
			for ( var i = 0; i < array_length(_battleRecord); i++ ) 
			{
				_br_list[| 0] = _battleRecord[i];
			}			
			variable_struct_set(_rival, "battleRecord", _br_list);
			
			var _weapons = variable_struct_get(_rival, "weapons");
			var _weap_list = ds_list_create();
			for ( var i = 0; i < array_length(_weapons); i++ ) 
			{
				_weap_list[| 0] = _weapons[i];
			}				
			variable_struct_set(_rival, "weapons", _weap_list);
			
			var _defenses = variable_struct_get(_rival, "defenses");
			var _def_list = ds_list_create();
			for ( var i = 0; i < array_length(_defenses); i++ ) 
			{
				_def_list[| 0] = _defenses[i];
			}	
			variable_struct_set(_rival, "defenses", _def_list);			
			
			var _weakpoints = variable_struct_get(_rival, "weakpoints");
			var _weap_list = ds_list_create();
			for ( var i = 0; i < array_length(_weapons); i++ ) 
			{
				_weap_list[| 0] = _weapons[i];
			}	
			variable_struct_set(_rival, "weakpoints", _weap_list);
			
			rivals[? _rival.name] = _rival;			
		}
			
		objCombatManager.UpdateStrongestRival();
	}
}


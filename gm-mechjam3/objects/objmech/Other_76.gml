var _elementID = event_data[? "element_id"];
if (layer_instance_get_instance(_elementID) != id)
	exit;

commands = ds_list_create();

var _string = event_data[? "message"];

commands = SplitAnimationMessage(_string);

for (var i = 0; i < ds_list_size(commands); i++)
{
	var _message = commands[| i];
	var _command = global.functionMap[? _message[0]];
	var _params = _message[1];
	if (_params != "") {
		var _x = _params[0];
		var _y = _params[1];
		var _dir = aimDir;
		//if (image_xscale == -1)
		//{
		//	_dir = 180 + aimDir;
		//}
		var _len = _x;
		_x = lengthdir_x( _len, _dir);
		_y = lengthdir_y( _len, _dir);
		_command(x + _x + weapPosX, y + _y + weapPosY, weapon.attack);
	}
	else
		_command(x, y);

}

if (commands != undefined)
	ds_list_destroy(commands);
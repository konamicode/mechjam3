// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function SplitAnimationMessage(_string) {
	var _commandList = ds_list_create();
	var _commands = string_parse(_string, "|");
	if (array_length(_commands) > 0 ) {
		for ( var i = 0; i < array_length(_commands); i++) {
			var _command;
			var _params = "";
			var _data = string_parse(_commands[i], ":");
			if (_data[0] != "") {
				_command = _data[0];	
			} else {
				//do something safely
			}
			if (array_length(_data) - 1) > 0 {
				_params = string_parse(_data[1], "_");
			}
			_commandList[| i] = [_command, _params];
		
		}		
	}
	
	if ( ds_list_size(_commandList) > 0 )
		return _commandList;
	else {
		ds_list_destroy(_commandList);
		return undefined; }
}
if (!instance_exists(creator))
{
	exit;
}

if type == componentType.weakpoint && (onDestroy != noone) {
	onDestroy(creator, destroyParams);	
	var _xOff = x_offsetStart;
	var _yOff = y_offsetStart;
	var _label = label;
	with (creator) { 
		emitters[array_length(emitters)] = new EmitStruct(_xOff, _yOff, _label, global.pe_sparks);
	}
	
}
if (!instance_exists(creator))
{
	exit;
}

if type == componentType.weakpoint && (onDestroy != noone) {
	onDestroy(creator, destroyParams);	
}
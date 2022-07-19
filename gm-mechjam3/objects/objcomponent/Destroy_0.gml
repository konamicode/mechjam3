if (!instance_exists(creator))
{
	exit;
}

if type == componentType.weakpoint && (destroy != noone) {
	onDestroy(creator, destroyParam);	
}
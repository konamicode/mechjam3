if instance_exists(objMapManager) {
	global.mapManager = instance_find(objMapManager, 0);
}
else
	global.mapManager = instance_create_layer(0, 0, "Instances", objMapManager);
	
global.mapManager.GenerateMap();
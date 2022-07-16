var _collisionList = ds_list_create();
var _count = collision_circle_list(x, y, sprite_xoffset, objActor, true, true, _collisionList, false);
for (var i = 0; i < _count; i++)
{
	var _inst = _collisionList[| i];
	_inst.hp -= (dmg/(image_number * sprite_get_speed(sprite_index)));

}


ds_list_destroy(_collisionList);
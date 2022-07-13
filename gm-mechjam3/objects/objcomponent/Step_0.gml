if (hp <= 0)
{
	var inst = id;
	with(creator)
	{
		var _index = ds_list_find_index(components, inst);
		ds_list_delete(components, _index);
	
	}
	instance_destroy();
}
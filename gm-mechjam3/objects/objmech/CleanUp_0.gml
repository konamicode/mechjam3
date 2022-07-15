if !is_undefined(animationHitboxData)
	ds_map_destroy(animationHitboxData);

for ( var i = 0; i < ds_list_size(components); i++)
{
	with ( components[| i] )
	{
		instance_destroy(id, false);
	}
}
ds_list_destroy(components);
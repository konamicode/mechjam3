if !is_undefined(animationHitboxData)
	ds_map_destroy(animationHitboxData);

for ( var i = 0; i < ds_list_size(components); i++)
{
	with ( components[| i] )
	{
		instance_destroy(id, false);
	}
}


if instance_exists(statusEffectAnim) && statusEffectAnim != noone
{
	instance_destroy(statusEffectAnim);
	statusEffectAnim = noone;
}
Cleanup();

ds_list_destroy(weapons);

instance_create_layer(x, y, "FX", objExplosion, {dmg: 0});
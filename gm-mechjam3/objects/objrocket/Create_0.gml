// Inherit the parent event
event_inherited();



function CollisionEvent(_collider) {
	instance_create_layer(x, y, "Instances", objExplosion, {moveSpeed: 0, creator:id, dmg: other.dmg});
	instance_destroy();
}
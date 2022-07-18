// Inherit the parent event
event_inherited();


x += lengthdir_x(moveSpeed, image_angle);
y += lengthdir_y(moveSpeed, image_angle);


function CollisionEvent(_collider) {
	ApplyDamage(_collider);
	instance_destroy();
}
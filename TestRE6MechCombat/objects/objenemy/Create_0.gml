// Inherit the parent event
event_inherited();

head = noone;
head = instance_create_layer(0, -sprite_yoffset, "Instances", objWeakpoint);
head.creator = id;
head.destroy = Stun;
head.destroyParam = stunType.heavy;

shield = noone;

shield = instance_create_layer( 0, 0, "Instances", objShield, { creator: id });

alarm[1] = 180;

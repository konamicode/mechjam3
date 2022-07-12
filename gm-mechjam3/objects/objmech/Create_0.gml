// Inherit the parent event
event_inherited();


if (frame != noone) {
	sprite_index = frame;
}

////frame = instance_create_layer(x, y, "Instances", objComponent, { sprite_index : frame, creator: id } );

components = ds_list_create();

//ds_list_add(components, frame);


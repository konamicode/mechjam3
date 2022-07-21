// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EmitStruct(_xOff, _yOff, _label, _emitter) constructor {
	xOffset = _xOff;
	yOffset= _yOff;
	label = _label;
	emitter = _emitter;
}

function ParticleBurst(_x, _y, _particle, _emitSize, _num) {
	x = _x;
	y = _y;

    part_emitter_region(global.partSystem, global.explode, _x - _emitSize, _x + _emitSize, _y - _emitSize, _y + _emitSize, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(global.partSystem, global.explode, _particle, _num);

		
}

function SetupParticleSparks() {
//sparks
global.pt_sparks = part_type_create();
part_type_shape(global.pt_sparks, pt_shape_pixel);
part_type_sprite(global.pt_sparks, sprFX_elecsparks, 1, 0, 0);
part_type_size(global.pt_sparks, 1, 1, 0, 0);
part_type_scale(global.pt_sparks, 1, 1);
part_type_orientation(global.pt_sparks, 0, 360, 0, 0, 0);
part_type_color3(global.pt_sparks, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_sparks, 1, 1, 1);
part_type_blend(global.pt_sparks, 0);
part_type_life(global.pt_sparks, 0.50, 2);
part_type_speed(global.pt_sparks, 0, 0, 0, 0);
part_type_direction(global.pt_sparks, 0, 360, 0, 0);
part_type_gravity(global.pt_sparks, 0, 0);	

global.pe_sparks = part_emitter_create(global.partSystem);
}
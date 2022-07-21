// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ParticleBurst(_x, _y, _particle, _emitSize, _num) {
	x = _x;
	y = _y;

    part_emitter_region(global.partSystem, global.explode, _x - _emitSize, _x + _emitSize, _y - _emitSize, _y + _emitSize, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(global.partSystem, global.explode, _particle, _num);

		
}
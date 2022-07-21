var _x = mouse_x;
var _y = mouse_y;
//simple for testing particles
if ( room == rmParticleTester ) {
	if mouse_check_button_pressed(mb_left)
	{
	    ParticleBurst(_x, _y, global.partBGBeam, 50, 10);
	//    part_particles_create(global.partSystem, _x, _y, partLineBurst, 10);
	//    scrParticlePlayExplosion(mouse_x, mouse_y, 30 + irandom(30));
	}
}

part_emitter_stream(global.partSystemBG, global.emitBGBlasts, global.partBGBeam, 1);
part_emitter_stream(global.partSystemBG, global.emitBGExplosions, global.partBGExplosion, 1);
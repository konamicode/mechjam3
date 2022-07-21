

global.partBGBeam = part_type_create();
part_type_sprite(global.partBGBeam, sprFX_bg_beam, true, true, 0);
part_type_scale(global.partBGBeam, 2.5, 1);
part_type_alpha1(global.partBGBeam, 0.8);
part_type_size(global.partBGBeam, 1, 1.5, -0.1, 0.1);
//part_type_speed(global.partBGBeam, 0.2, 8, 0, 0);
part_type_orientation(global.partBGBeam, 0, 0, 0, 0, true);
part_type_direction(global.partBGBeam, 0, 359, 0, 0);
part_type_life(global.partBGBeam, 7, 45); 


global.partBGExplosion = part_type_create();
part_type_sprite(global.partBGExplosion, sprBGExplosion, true, true, 0);
part_type_scale(global.partBGExplosion, 0.2, 0.2);
part_type_size(global.partBGExplosion, 1, 1.5, -0.02, 0.02);
//part_type_speed(global.partBGBeam, 0.2, 8, 0, 0);
part_type_orientation(global.partBGExplosion, 0, 0, 0, 0, true);
part_type_direction(global.partBGExplosion, 0, 359, 0, 0);
part_type_life(global.partBGExplosion, 15, 55); 

global.partSystemBG = part_system_create();
global.partSystem = part_system_create();
//part_system_draw_order( global.partSystem, 0 ); 
part_system_depth(global.partSystemBG, 400);
////part_system_depth(global.partSystem, 50);
////global.explode = part_emitter_create(global.partSystem);
////part_system_depth(global.partSystem, 50);
//partSystemOver = part_system_create();
//part_system_depth(partSystemOver, -50);

global.emitBGExplosions = part_emitter_create(global.partSystemBG);
global.emitBGBlasts = part_emitter_create(global.partSystemBG);

SetupParticleSparks();


part_emitter_region(global.partSystemBG , global.emitBGExplosions, 0, room_width, 0, room_height , ps_shape_rectangle, ps_distr_gaussian);
part_emitter_region(global.partSystemBG , global.emitBGBlasts, 0, room_width, 0, room_height , ps_shape_rectangle, ps_distr_gaussian);
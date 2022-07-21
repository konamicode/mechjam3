part_type_destroy(global.partBGBeam);
part_type_destroy(global.partBGExplosion);

part_emitter_destroy(global.emitBGExplosions, global.screen);
part_emitter_destroy(global.emitBGBlasts, global.screen);

part_system_destroy(global.partSystemBG);
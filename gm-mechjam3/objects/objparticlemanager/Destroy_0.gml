part_type_destroy(global.partBGBeam);
part_type_destroy(global.partBGExplosion);
part_type_destroy(global.partBGBeam);
part_type_destroy(global.pt_sparks);

part_emitter_destroy(global.partSystemBG, global.emitBGExplosions);
part_emitter_destroy(global.partSystemBG, global.emitBGBlasts);


part_system_destroy(global.partSystemBG);
part_system_destroy(global.partSystem);
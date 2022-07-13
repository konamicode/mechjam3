
for ( var i = 0; i < ds_list_size(components); i++) {
	var comp = components[| i];
	if (updateHitboxFromSequence) {
		var framePosX = 0, framePosY = 0, frameScaleX = 10, frameScaleY = 10, frameRot = 0;
		//var oldFramePosX = 0, oldFramePosY = 0, oldFrameScaleX = 10, oldFrameScaleY = 10, oldFrameRot = 0;
		var map = animationHitboxData[? comp.label];
		var seqSpeed = animationHitboxData[? "seqFps"];
		var spriteSpeed = sprite_get_speed(sprite_index);
		var sprMultiplier = seqSpeed / spriteSpeed;
		//show_debug_message(sprMultiplier);
		var frameIndex = floor(image_index * sprMultiplier);
		//if (isPlayer)
		//	show_debug_message(string(image_index) + ": " + string(frameIndex));
		var frameData = map[? frameIndex];
		

		if ds_map_exists(map, frameIndex) {
			if (frameData != undefined) {
				//var frameData = map[? 0];
				if (frameData[1] != undefined) {
					framePosX = frameData[1]; 
					CheckAddFallback(map);
					map[? "fallback"][@ 1] = framePosX;
				} else framePosX = map[? "fallback"][@ 1];
				if (frameData[2] != undefined){
					framePosY = frameData[2];
					CheckAddFallback(map);
					map[? "fallback"][@ 2] = framePosY;
				} else framePosY = map[? "fallback"][@ 2];
				if (frameData[3] != undefined) {
					frameScaleX = frameData[3];
					CheckAddFallback(map);
					map[? "fallback"][@ 3] = frameScaleX;	
				} else frameScaleX = map[? "fallback"][@ 3];
				if (frameData[4] != undefined) {
					frameScaleY = frameData[4];	
					CheckAddFallback(map);
					map[? "fallback"][@ 4] = frameScaleY;
				} else frameScaleY = map[? "fallback"][@ 4];
				if (frameData[5] != undefined)	{	
					frameRot = frameData[5];
					CheckAddFallback(map);
					if (sign(image_xscale) == -1) {
						frameRot = 180 - frameData[5];
					}
					map[? "fallback"][@ 5] = frameRot;
				} else { 
					frameRot = map[? "fallback"][@ 5];
				}
			}	
			
			comp.UpdatePos(framePosX, framePosY);
			comp.UpdateScale(frameScaleX, frameScaleY);
			comp.UpdateRot(frameRot);			
		} else
		{
			if ds_map_exists(map, "fallback") {
				framePosX = map[? "fallback"][ 1];
				framePosY = map[? "fallback"][ 2];
				frameScaleX = map[? "fallback"][ 3];
				frameScaleY = map[? "fallback"][ 4];
				frameRot = map[? "fallback"][ 5];
			
				comp.UpdatePos(framePosX, framePosY);
				comp.UpdateScale(frameScaleX, frameScaleY);
				comp.UpdateRot(frameRot);
			}
		}
		//comp.UpdatePos(framePosX, framePosY);
		//comp.UpdateScale(frameScaleX, frameScaleY);
		//comp.UpdateRot(frameRot);
	} else {
		comp.UpdatePos();
	}
	
}
	


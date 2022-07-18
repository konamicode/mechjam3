// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function HitBoxKeyframe(frame, x, y, xScale, yScale, rotation) constructor {
	frame = frame;
	x = x;
	y = y;
	xScale = xScale;
	yScale = yScale;
	rotation = rotation;
}



//hitboxKeys = new HitBoxKeyframe(key_frame, key_x, key_y, key_xscale, key_yscale, key_rotation);
//ds_map_add(key_frame, hitboxKeys);


function StripKeyframeData(hitboxKeys) {
	var frames = [];
	var frameMap = ds_map_create();

	for (var j = 0; j < array_length(hitboxKeys); j++) {
		
		var keyframeArray = hitboxKeys[j];
		for ( var k = 0; k < array_length(keyframeArray); k++) {
			var keyframeStruct = keyframeArray[k]; 
			var frameNumber = variable_struct_get(keyframeStruct, "frame");
			if (frameMap[? frameNumber] == undefined)
			{
				var keys = array_create(6, undefined);
				ds_map_add(frameMap, frameNumber, keys);
			}
			var channels = variable_struct_get(keyframeStruct, "channels");

			switch(j) {
				case 0: //position, x and y
					frameMap[? frameNumber][@ 0] = frameNumber;
					frameMap[? frameNumber][@ 1] = variable_struct_get(channels[0], "value");
					frameMap[? frameNumber][@ 2] = variable_struct_get(channels[1], "value");
				break;
				case 1: //scale
					frameMap[? frameNumber][@ 0] = frameNumber;
					frameMap[? frameNumber][@ 3] = variable_struct_get(channels[0], "value");
					frameMap[? frameNumber][@ 4] = variable_struct_get(channels[1], "value");				
				break;
				case 2: //rotation
					frameMap[? frameNumber][@ 0] = frameNumber;
					var _rot = variable_struct_get(channels[0], "value");
					frameMap[? frameNumber][@ 5] = (_rot != undefined) ? _rot : undefined;
				break;				
			}
		}
	}
	//show_debug_message(frameMap);
	return frameMap
	//[ xPos, yPos, xScale, yScale, rotation]
}



function GetSequenceHitboxData(sequence) { 
	var seqStruct = sequence_get(sequence);

	var trackArray = seqStruct.tracks;
	
	var animationHitboxData = ds_map_create();
	var seqSpeed = variable_struct_get(seqStruct, "playbackSpeed");
	if seqSpeed == undefined
		seqSpeed = 60;
	animationHitboxData[? "seqFps"] = seqSpeed;
		
	for ( var i = 0; i < array_length(trackArray); i++)
	{
		var struct;
		struct = trackArray[i];
		var trackName = variable_struct_get(struct, "name");
		var nameParts = string_parse(trackName, "_");
		var prefix = nameParts[0];
		var ident = nameParts[1];

		switch(prefix) {
			case "wp":
				//show_debug_message(" Found a weakpoint named " + ident);
				var wpHitboxData = ds_map_create();
				var wpTracks = variable_struct_get(struct, "tracks");
				var wpKeys = array_create(3);
				for (var j = 0; j < array_length(wpTracks); j++) {
					var wpTrackStruct = wpTracks[j];
					var name = variable_struct_get(wpTrackStruct, "name");

					switch(name) {
						case "scale":
	//						scaleTrack = [];
							var scaleKeys = [];
							//scaleTrack = variable_struct_get(wpTrackStruct, "tracks");
							scaleKeys = variable_struct_get(wpTrackStruct, "keyframes");							
							wpKeys[1] = scaleKeys;
						break;
						case "position":
							//posTrack = [];
							var posKeys = [];					
							//posTrack = variable_struct_get(wpTrackStruct, "tracks");
							posKeys = variable_struct_get(wpTrackStruct, "keyframes");
							wpKeys[0] = posKeys;
						break;
						case "rotation":
							//rotTrack = [];
							var rotKeys = [];					
							//rotTrack = variable_struct_get(wpTrackStruct, "tracks");
							rotKeys = variable_struct_get(wpTrackStruct, "keyframes");		
							wpKeys[2] = rotKeys;
						break;
					}
				}
				wpHitboxData = StripKeyframeData(wpKeys);
				animationHitboxData[? ident] = wpHitboxData;
			break;
			case "attack":
				var attackAnimData = ds_map_create();
				var attackTracks = variable_struct_get(struct, "tracks");
				var attackKeys = array_create(3);
				for (var j = 0; j < array_length(attackTracks); j++) {
					var attackTrackStruct = attackTracks[j];
					var name = variable_struct_get(attackTrackStruct, "name");
					switch(name) {
						case "scale":
	//						scaleTrack = [];
							var scaleKeys = [];
							//scaleTrack = variable_struct_get(wpTrackStruct, "tracks");
							scaleKeys = variable_struct_get(attackTrackStruct, "keyframes");							
							attackKeys[1] = scaleKeys;
						break;
						case "position":
							//posTrack = [];
							var posKeys = [];					
							//posTrack = variable_struct_get(wpTrackStruct, "tracks");
							posKeys = variable_struct_get(attackTrackStruct, "keyframes");
							attackKeys[0] = posKeys;
						break;
						case "rotation":
							//rotTrack = [];
							var rotKeys = [];					
							//rotTrack = variable_struct_get(wpTrackStruct, "tracks");
							rotKeys = variable_struct_get(attackTrackStruct, "keyframes");		
							attackKeys[2] = rotKeys;
						break;
					}
				}
				attackHitboxData = StripKeyframeData(attackKeys);
				animationHitboxData[? ident] = attackHitboxData;
			break;				
			case "weapon": 
				var weaponAnimData = ds_map_create();
				var weaponTracks = variable_struct_get(struct, "tracks");
				var weapKeys = array_create(3);
				for (var j = 0; j < array_length(weaponTracks); j++) {
					var weapTrackStruct = weaponTracks[j];
					var name = variable_struct_get(weapTrackStruct, "name");
					switch(name) {
						case "scale":
	//						scaleTrack = [];
							var scaleKeys = [];
							//scaleTrack = variable_struct_get(wpTrackStruct, "tracks");
							scaleKeys = variable_struct_get(weapTrackStruct, "keyframes");							
							weapKeys[1] = scaleKeys;
						break;
						case "position":
							//posTrack = [];
							var posKeys = [];					
							//posTrack = variable_struct_get(wpTrackStruct, "tracks");
							posKeys = variable_struct_get(weapTrackStruct, "keyframes");
							weapKeys[0] = posKeys;
						break;
						case "rotation":
							//rotTrack = [];
							var rotKeys = [];					
							//rotTrack = variable_struct_get(wpTrackStruct, "tracks");
							rotKeys = variable_struct_get(weapTrackStruct, "keyframes");		
							weapKeys[2] = rotKeys;
						break;
					}
				}				
				weaponAnimData = StripKeyframeData(weapKeys);
				animationHitboxData[? trackName] = weaponAnimData;
			break;
			default:
			break;
		}
	}
	
	if ds_map_size(animationHitboxData) > 0
		return animationHitboxData;
	else {
		ds_map_destroy(animationHitboxData);
		return undefined; }
}


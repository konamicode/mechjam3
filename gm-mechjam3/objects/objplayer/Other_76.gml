var _string = event_data[? "message"];
switch(_string)
{
	case "colliderOn":
		meleeCollider = instance_create_layer(x, y, "Instances", objMeleeSwipe);
		//meleeCollider.image_angle = aimDir;
	break;
	case "colliderOff":
		if (meleeCollider != noone)
		{
			instance_destroy(meleeCollider);
			meleeCollider = noone;
		}
	break;
	case "canFire":
		canFire = true;
	break;
	default:
		var coords = [];
		coords = string_parse(_string, "_", false);

			//if ( target != noone){
			//	_aimDir = point_direction(x, y, target.x, target.y);
		
			//}
			
			//turning this off for now
			var _offx = coords[0] - sprite_xoffset;
			var _offy = sprite_yoffset - coords[1];
	
			show_debug_message(_offx);
			show_debug_message(string(y - abs(_offy)));
			
			//var _shot = instance_create_layer(x - _offx, y - _offy, "Instances", objShot);
			instance_create_layer(x + _offx, y - abs(_offy), "Instances", objAttack, { attackType : collision.line, sprite_index: sprFX_beamBlast, image_angle : aimDir, creator : id}) ;

			//fx.shotParent = _shot;
			//_shot.moveDir = _aimDir;
	break;
}
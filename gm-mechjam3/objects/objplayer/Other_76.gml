var _elementID = event_data[? "element_id"];
if (layer_instance_get_instance(_elementID) != id)
	exit;

var _string = event_data[? "message"];
switch(_string)
{
	case "colliderOn":
		//meleeCollider = instance_create_layer(x, y, "Instances", objMeleeSwipe);
		//meleeCollider.image_angle = aimDir;
	break;
	case "colliderOff":
		//if (meleeCollider != noone)
		//{
		//	instance_destroy(meleeCollider);
		//	meleeCollider = noone;
		//}
	break;
	case "canFire":
		canFire = true;
	break;
	default:
		var coords = [];
		coords = string_parse(_string, "_", false);

			var _offx = coords[0];
			var _offy = coords[1];
	
			var _x = lengthdir_x(_offx, aimDir);
			var _y = lengthdir_y(_offx, aimDir);
			show_debug_message(string(aimDir) + ": x: " + string(_offx) + ", " + string(_x) + " |y : " + string(_offy) + ", " + string(_y));
			var _dmg = CalculateDamage();
			instance_create_layer(x + weapPosX + _x , y + weapPosY + _y , "Instances", objAttack, { aimed: aiming, attackType : collision.line, sprite_index: sprFX_beamBlast, image_angle : aimDir, creator : id, dmg: _dmg}) ;

			//fx.shotParent = _shot;
			//_shot.moveDir = _aimDir;
	break;
}
// Inherit the parent event
event_inherited();


aimDir = GetTargetDirection(objPlayer);
//image_angle = CorrectFlippedDirection(aimDir);


if (action == "attack")
{
	aimDir = GetTargetDirection(objPlayer);
	image_angle = CorrectFlippedDirection(aimDir);
}



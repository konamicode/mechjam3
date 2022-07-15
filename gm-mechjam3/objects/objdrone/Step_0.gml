// Inherit the parent event
event_inherited();

if (action == "attack")
{
	aimDir = GetTargetDirection(objPlayer);
	image_angle = CorrectFlippedDirection(aimDir);
}



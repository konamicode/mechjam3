//Fire

action = "attack";
ChangeAnimation(GetAnimationName());
aimDir = GetTargetDirection(objPlayer);
image_angle = CorrectFlippedDirection(aimDir);
alarm[1] = fireRate * room_speed;
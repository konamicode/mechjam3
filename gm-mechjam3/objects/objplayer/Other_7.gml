
if (sprite_index == sprPlayer_attack_beamrifle)
{
	action = "idle";
	ChangeAnimation(GetAnimationName());
	canFire = true;
}

if (sprite_index == sprPlayer_attack_melee)
	ChangeAnimation(frame + "_idle_beamrifle");
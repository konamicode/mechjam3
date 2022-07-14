
if (sprite_index == sprPlayer_attack_beamrifle)
{
	action = "idle";
	ChangeAnimation(GetAnimationName());
	canFire = true;
}

if (sprite_index == sprPlayer_attack_melee)
	ChangeAnimation(faction + "_idle_beamrifle");
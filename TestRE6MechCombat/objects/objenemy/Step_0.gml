if ( hp <= 0 )
{
	actorState = states.dead;
	instance_destroy();
}
else {

	if (actorState = states.hitstun)
	{
		if instance_exists(shield)
			shield.active = false;

	}
}
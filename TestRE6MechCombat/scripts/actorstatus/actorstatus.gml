

function Stun(actor, type) {
	if (actor.actorState != states.hitstun)
	{
		actor.actorState = states.hitstun;
		actor.alarm[0] = type;
	}
}


function Explode(position, size) {
	
}
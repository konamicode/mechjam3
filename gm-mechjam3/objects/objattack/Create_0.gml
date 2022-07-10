enum collision {
	line, 
	box,
	image
}

collisionType = collision.image;

function DoDamage(inst, dmg) {
	var _dmg = dmg;
	with(inst)
	{
		inst.hp -= _dmg;
	}
	
}

if (actorState == states.hitstun)
{
	image_blend = c_red;
}
else
image_blend = c_white;


draw_self();

if instance_exists(shield) {
	with(shield)
	{
		event_perform(ev_draw, 0);	
		
	}
}	
	
if instance_exists(head) {
	with(head)
	{
		event_perform(ev_draw, 0);	
		
	}
}


draw_healthbar(x - sprite_width/2, y + sprite_height + 2, x + sprite_width/2, y + sprite_height + 10, (hp/maxHP * 100), c_black, c_red, c_green, 0, false, true);
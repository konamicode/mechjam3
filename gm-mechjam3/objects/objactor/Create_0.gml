
enum state {
	idle,
	stun, 
	stagger,
	dodge,
	attack,
	counter,
	dead
	
}

actorState = state.idle;

maxHp = 100;
hp = maxHp;


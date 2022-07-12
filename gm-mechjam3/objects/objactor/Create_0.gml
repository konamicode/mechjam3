
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

aimDir = 0;
lastDir = aimDir;

aim_x = 0;
aim_y = 0;

moveSpeed = 6.0;


hitFlash = false;



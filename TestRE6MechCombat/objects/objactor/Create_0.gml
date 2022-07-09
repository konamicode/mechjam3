/// @description Insert description here
// You can write your code in this editor


enum states {
	idle,
	dodge,
	hitstun,
	stagger,
	dead,
	attack,
	counter
}

enum stunType {
	light = 60, 
	heavy = 300 
}

actorState = states.idle;

function RefillEnergy() {
	energy = maxEnergy;
}


function RefillHP() {
	hp = maxHP;
}


RefillEnergy();
RefillHP();


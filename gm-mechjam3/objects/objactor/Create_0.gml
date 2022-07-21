
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

maxStamina = 50;
stamina = maxStamina;

meleePower = 10;
rangedPower = 10;

aimDir = 0;
lastDir = aimDir;

aim_x = 0;
aim_y = 0;

moveSpeed = 6.0;

canAttack = true;
hitFlash = false;

meleeCollider = noone;

function DistanceToTarget(_target) {
	if instance_exists(_target)
		return point_distance(x, y, _target.x, _target.y);
	else 
		return undefined;
}

function MoveWithinRange(_range, _target, _dir) {
	var _hor = sign(_target.x - x);
	var _ver = sign(_target.y - y);
	var _len = point_distance(0, 0, _hor, _ver);
	
	if (_len > _range) {
	    x += lengthdir_x(_len, _dir);
	    y += lengthdir_y(_len, _dir);
	}
}




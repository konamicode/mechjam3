///Define the enums used in the project

enum stunType {
	light = 60, 
	heavy = 180 
}


enum enmBuffTypes {
	HP,
	Stamina,
	Speed,
	MeleePower,
	RangedPower,
	Length
}

enum enmMissionStatus {
	none,
	incomplete,
	succeed
}


enum componentType {
	weakpoint,
	weapon,
	defenses
}

enum enmPersonality {
	arrogant = 0,
	honorable,
	loyal,
	fighter,
	cheeky,
	eeyore,
	length
}

enum enmContext {
	rivalSpawnedPlayerVictory,
	rivalSpawnedPlayerDefeat,
	rivalSpawned,	
	rivalArrives,
	playerBeatsRival,
	rivalBeatsPlayer,
	startFinalBattle,
	playerWinsFinalBattle,
	playerLosesFinalBattle
}

enum enmPrequisites {
	none = 0,
	minWinStreak,
	maxWinStreak,
	minLossStreak,
	maxLossStreak,
	hasBeatenPlayer,
}

enum weaponType {
	melee, 
	ranged
}
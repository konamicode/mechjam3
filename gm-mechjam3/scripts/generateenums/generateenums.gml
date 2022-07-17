///Define the enums used in the project


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
	length
}

enum enmContext {
	rivalSpawned = 0,
	rivalSpawnedPlayerVictory,
	rivalSpawnedPlayerDefeat,
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

enum weaponTypes {
	ranged,
	melee
}
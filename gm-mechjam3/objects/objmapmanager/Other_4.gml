if (room = rmMap) {
	
	if (global.missionStatus == enmMissionStatus.incomplete) {
		PlayerFailure()	;
	} else if (global.missionStatus == enmMissionStatus.succeed) {
		PlayerVictory();
	}
	

}
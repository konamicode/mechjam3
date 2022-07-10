




function GoToMapRoom() {
	room_goto(rmMap);	
}

function GoToCombatRoom() {
	room_goto(rmCombat);
}

startMenu = new Menu();
startMenu.AddItem("Start", DoNothing);

//comment these out when we launch, debug only
startMenu.AddItem("Go To Map", DoNothing);
startMenu.AddItem("Go To Combat", DoNothing);
//

startMenu.AddItem("Options", DoNothing);
startMenu.AddItem("Quit", game_end);
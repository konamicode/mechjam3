




function GoToMapRoom() {
	room_goto(rmMap);	
}

function GoToCombatRoom() {
	room_goto(rmCombat);
}

function GoToStartRoom() {
	room_goto(rmMenu);
	
}

startMenu = new Menu();
startMenu.AddItem("Start", DoNothing);
//startMenu.AddItem("New Game, 
//startMenu.AddItem("Continue, 
startMenu.AddItem("Options", DoNothing);
startMenu.AddItem("Quit", game_end);


//comment these out when we launch, debug only
roomMenu = new Menu( menuType.text, expandType.horizontal);
roomMenu.AddItem("Go To Map", GoToMapRoom);
roomMenu.AddItem("Go To Combat", GoToCombatRoom);
roomMenu.AddItem("Go to Start", GoToStartRoom);
roomMenu.SetSpacing(128);
roomMenu.SetMargin(0);
//


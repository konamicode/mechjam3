

Init();


function GoToMapRoom() {
	room_goto(rmMap);	
}

function GoToHowToPlay() {
	room_goto(rmHowToPlay);	
}

function GoToCombatRoom() {
	room_goto(rmCombat);
}

function GoToStartRoom() {
	room_goto(rmMenu);
	
}

function RollCredits() {
	room_goto(rmCredits);
}

gameData = new GameData();
dialogData = new DialogHelper();

startMenu = new Menu();
startMenu.AddItem("Start", GoToMapRoom);
//startMenu.AddItem("New Game, 
//startMenu.AddItem("Continue, 
startMenu.AddItem("Options", DoNothing);
startMenu.AddItem("How to Play", GoToHowToPlay);
startMenu.AddItem("Credits", RollCredits);

startMenu.AddItem("Quit", game_end);



//global.functionMap = ds_map_create();



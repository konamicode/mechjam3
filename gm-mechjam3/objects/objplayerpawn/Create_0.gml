/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


facingDirection = 0;  //write code to randomly pick a direction maybe?

directions = [0, 60, 120, 180, 240, 300];
dirIdx = 0;

function UpdateLastLocation()
{
	objMapManager.playerLastX = mapX;
	objMapManager.playerLastY = mapY;
}
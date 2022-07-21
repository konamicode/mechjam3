/// @description Insert description here
// You can write your code in this editor
if(room == rmCredits)
{
	isActive = true;
}
else
{
	isActive = false;
}

if(isActive == true)
{
	if(input_check_released("cancel"))
	{
		isActive = false;
		page = 0;
		room_goto(rmMenu);
	}
}
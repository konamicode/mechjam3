/// @description Insert description here
// You can write your code in this editor
if(room == rmHowToPlay)
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
	else if(input_check_released("left"))
	{
		if(page == 0)
		{
			page = pageCount;
		}
		else
		{
			page = page-1;
		}
	}
	else if(input_check_released("right"))
	{
		if(page == pageCount)
		{
			page = 0;
		}
		else
		{
			page = page+1;
		}
	}
}


// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function between(val, val1, val2, inc=false){

	if (inc) {
		if val >= val1 && val <= val2
			return true
		else
		return false
	}
	else {
		if val > val1 && val < val2
			return true
		else
		return false
	}
}



function approach(start, ending, difference) {

	var result;

	if (start < ending){
	    result = min(start + difference, ending); 
	}else{
	    result = max(start - difference, ending);
	}

	return result;	 
	 
}

function string_parse(str, token, ignore = true){
	var list, tlen, temp;
	list = [];
	tlen = string_length( token);
	while (string_length(str) != 0) {
	temp = string_pos(token, str);
	if (temp) {
		if (temp != 1 || !ignore) array_push(list, string_copy(str, 1, temp-1));
		str = string_copy(str, temp+tlen, string_length(str));
			} else {
				array_push(list, str);
				str = "";
				}
		}
	return list;
}


function SetAlarm(_alarmIndex, value) {
	if (alarm[_alarmIndex] < 0 )
		alarm[_alarmIndex] = value;
	
}

function Vector2(_x, _y) constructor
{
    x = _x;
    y = _y;
}

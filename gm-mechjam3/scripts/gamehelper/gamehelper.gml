// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Init(){
	randomize();
	global.debug = false;
	draw_set_font(fntCharybdis);
}

global.functionMap = ds_map_create();
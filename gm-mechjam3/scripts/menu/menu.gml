// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro gray1 make_color_rgb(230,230,230)
#macro gray2 make_color_rgb(153,153,153)
#macro gray3 make_color_rgb(77,77,77)
#macro gray4 make_color_rgb(51,51,51)


enum menuType {
	text,
	image
}

enum expandType {
		vertical,
		horizontal
}

function Menu(type = menuType.text, _expand = expandType.vertical) constructor
{
	items = ds_list_create();
	currentItem = 0;
	expand = _expand;
	menuBG = noone;
	menuFont = -1;
	menuSpacing = 12;
	bgHeight = 0;
	bgWidth = 0;
	bgMargin = 6;
	hAlign = fa_left;
	vAlign = fa_middle;
	
	static AddItem = function(text, callback, image_bg = -4) {
		var itemArray;
		itemArray[0] = text;
		itemArray[1]  = callback;
		itemArray[2] = image_bg;
		var _sprite_width = 0;
		var _sprite_height = 0;
		var _sprite = sprite_get_name(image_bg);
		if (sprite_exists(image_bg)) {
			_sprite_width = sprite_get_width(image_bg);		
			_sprite_height = sprite_get_height(image_bg);
		}
		ds_list_add(items, itemArray);
		if ( expand == expandType.vertical ) {
			show_debug_message(bgHeight);
			bgWidth = max(bgWidth, string_width(string_upper(text)), _sprite_width);
			bgHeight += max(string_height(string_upper(text)), _sprite_height) ;
			show_debug_message(bgHeight);
		}
		else
		if (expand == expandType.horizontal) {
			bgWidth += max(string_width(string_upper(text)), _sprite_width) + bgMargin;
			bgHeight = max(bgHeight, string_height(string_upper(itemArray[0])), _sprite_height);
		}	
		
	}
	
	static Destroy = function() {
		ds_list_destroy(items);
	}
	static MenuDown = function(){
		//PlaySound(sfxMenuTick, 1, false);
		if ((currentItem + 1) < ds_list_size(items))
			currentItem += 1;
		else
			currentItem = 0;
	}

	static MenuUp = function() {
		//PlaySound(sfxMenuTick, 1, false);
		if (currentItem == 0)
			currentItem = ds_list_size(items) - 1;
		else
			currentItem -= 1;
	}
	
	function SetMenuBG(_menuBG) {;
		if _menuBG != noone && ( sprite_exists(_menuBG) ){
			show_debug_message("got this far");	
			menuBG = _menuBG;	
		}
	}
	
	static SetFont = function(_font) 
	{
		menuFont = _font;
	}

	function SetSpacing(_spacing)
	{
		menuSpacing = _spacing;	
	}
	
	function SetMargin(_margin)
	{
		bgMargin = _margin;
	}
	
	function SetHAlign(_align) {
		hAlign = _align;
	}
	
	function SetVA(_align)
	{
		vAlign = _align;
	}

	
	static GetText = function(index)
	{
		var text = items[| index]
		return text[0];
	}
	
	static GetSprite = function(index)
	{
		var sprite = items[| index];		
		return sprite[2];
	}
	
	static RunCallback = function(index)
	{
		var _func = items[| index][1];
		_func();
	}
	
	function DrawMenu(_x, _y) {
		if ( sprite_exists(menuBG) ) {
			var _xscale = (bgMargin + bgWidth + bgMargin) / sprite_get_width(menuBG);
			var _yscale = (bgMargin + bgHeight + bgMargin) / sprite_get_height(menuBG);
			draw_sprite_ext(menuBG, 0, _x, _y, _xscale, _yscale, 0, c_white, 1);
		}
		for ( var i = 0; i < ds_list_size(items); i++)
		{
			var txt = GetText(i);
			var highlight = (currentItem == i) ? gray1 : gray2;
			var shadow = gray4;			

			var bg = GetSprite(i);

			//If we have a background sprite, center the text based on it's position.
			if sprite_exists(bg)
			{
				var _height = sprite_get_height(bg);
				var _width = sprite_get_width(bg);
				var _alpha = 1; //currentItem = i ? 1 : .25;
				var textX = _x + bgMargin + (i * menuSpacing * (expand)) + (_width / 2);
				var textY = _y + bgMargin + ( i * menuSpacing * (1 -expand));
								
				draw_sprite_ext(bg, (currentItem == i) ? 0 : 1, _x + bgMargin + (i * menuSpacing * expand), _y + bgMargin + ( i * menuSpacing * (1- expand)), 1, 1, 0, -1, _alpha);
				draw_set_halign(fa_center);
			}
			else
			{
				draw_set_halign(hAlign);
				draw_set_valign(vAlign);
				textX = _x + bgMargin + (i * menuSpacing * (expand));
				textY = _y + bgMargin + ( i * menuSpacing * (1 - expand));
			}

			var _oldFont = draw_get_font();
			if ( menuFont != -1)
			{
				draw_set_font(menuFont);	
			}
			
			draw_text_color(textX + 1, textY + 1, txt,
						shadow, shadow, shadow, shadow, 1);
			draw_text_color(textX, textY, txt,
						highlight, highlight, highlight, highlight, 1);
						
			//reset draw font
			draw_set_font(_oldFont);
			draw_set_halign(fa_left);	
			draw_set_valign(fa_middle);
		}
	}
}

function DoNothing()
{
	show_message("Does nothing!")
	return 0;
}
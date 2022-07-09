

var _down = keyboard_check_pressed(vk_up);
var _up = keyboard_check_pressed(vk_down);
var _right = keyboard_check_pressed(vk_right);
var _left = keyboard_check_pressed(vk_left);

currentPos.x = clamp(currentPos.x + (_right - _left), 0, width - 1);
currentPos.y += (_up - _down);
currentPos.y = clamp(currentPos.y, 0, height - 1);
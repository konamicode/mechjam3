#macro screenWidth 1280
#macro screenHeight 720

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)


window_scale = 1;

function SetupGameWindow(_window_scale) {
	view_width = screenWidth;
	view_height = screenHeight;

	window_set_size(view_width * _window_scale, view_height * _window_scale);
	alarm[0] = 1;
	//resize gui in the alarm after window has changed
	surface_resize(application_surface, view_width * _window_scale, view_height * _window_scale);	
}


SetupGameWindow(window_scale);
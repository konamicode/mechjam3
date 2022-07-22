x_offsetStart = creator.x - xstart;
y_offsetStart = creator.y - ystart;

function UpdatePos(x_offset = x_offsetStart, y_offset = y_offsetStart ) {
	x = creator.x + x_offset;
	y = creator.y + y_offset;
}

function UpdateRot(_angle) {
	//image_angle = _angle;	
}

function UpdateScale(_xscale, _yscale) {
	image_xscale = sign(creator.image_xscale);
	//image_yscale = _yscale;
}

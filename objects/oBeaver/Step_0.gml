/// @description rotate to movement

image_angle = direction;
if image_angle > 90 && image_angle < 270 {
	image_yscale = -1;
}
else {
	image_yscale = 1;
}

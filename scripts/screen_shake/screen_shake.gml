///@func screen_shake(duration,[intensity])
///@desc Kick off some screen shake with the camera
///@arg duration
///@arg [intensity]

with(obj_camera) {
	shake_ = true;
	alarm[1] = argument[0];
	shake_intensity_ = (argument_count > 1) ? argument[1] : 6;
}

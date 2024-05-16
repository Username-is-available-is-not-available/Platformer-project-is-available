/// @desc Core Player Logic

//  Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calc Movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grav;

if(place_meeting(x, y+1, obj_invis_wall)) & (key_jump)
{
	vsp = -jumpsp
}


//Horizantal Collision
if (place_meeting(x + hsp, y, obj_invis_wall))
{
	while (!place_meeting(x + sign(hsp), y, obj_invis_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x, y + vsp, obj_invis_wall))
{
	while (!place_meeting(x, y + sign(vsp), obj_invis_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0
}
y = y + vsp;
/// @desc Core Player Logic

//  Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calc Movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grav;

//Left Wall Jump
if (place_meeting(x-1, y, obj_invis_wall) & !place_meeting(x, y+1, obj_invis_wall) & !key_right)
	vsp = -jumpsp; 

//Right Wall Jump
if (place_meeting(x+1, y, obj_invis_wall) & !place_meeting(x, y+1, obj_invis_wall) & !key_left)
	vsp = -jumpsp; 

// Check Airjump	
if (airjump > 0)
{
	if (key_jump)
	{
		vsp = -airjsp;
		airjump -= 1;

		audio_play_sound (snd_jump, 1, false)

	}
}
if(place_meeting(x, y+1, obj_invis_wall)) & (key_jump)
{
	airjump = 2;
	vsp = -jumpsp;	
}

//Horizantal Collision
if (place_meeting(x + hsp, y, obj_invis_wall))
{
	while (!place_meeting(x + sign(hsp), y, obj_invis_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x, y + vsp, obj_invis_wall))
{
	while (!place_meeting(x, y + sign(vsp), obj_invis_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;



//Animation
if (! place_meeting( x, y + 1, obj_invis_wall))
{
	sprite_index = spr_slime_jump;
	image_speed = 0;
	if(vsp < 0) image_index = 0; 
	else image_index = 1;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_slime;
	}
	else
	{
		sprite_index = spr_slimewalk;
	}
}

if (hsp != 0) image_xscale = sign(hsp);



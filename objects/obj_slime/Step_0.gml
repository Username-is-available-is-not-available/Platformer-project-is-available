/// @desc Core Player Logic

//  Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calc Movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grav;

//Horizantal Collision
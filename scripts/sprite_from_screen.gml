///sprite_from_screen(x, y, w, h, removeback, smooth, xorig, yorig);
/*
Replacement for sprite_create_from_screen();
The background is not captured in the sprite, regardless of what
is given for removeback.
*/
var xx = argument0, yy = argument1, w = argument2, h = argument3,
    removeback = argument4, smooth = argument5,
    xorig = argument6, yorig = argument7;
var spr = sprite_create_from_surface(application_surface, xx, yy, w, h, removeback, smooth, xorig, yorig);
return spr;
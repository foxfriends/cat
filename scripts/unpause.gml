///unpause()
/*
Unpauses the game by activating all instances and deleting
the sPause sprite.
*/
if(sprite_exists(Controller.sPause)) {
    sprite_delete(Controller.sPause);
}
instance_activate_all();
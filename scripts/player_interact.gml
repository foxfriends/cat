///player_interact();
if(!StoryController.cutscene && Player.hdist == 0 && Player.vdist == 0) {
    if(input_check_pressed(ACTION)) {
        var xx = 0, yy = 0;
        switch(facing) {
            case UP:
                yy = -TILESIZE;
                break;
            case DOWN:
                yy = TILESIZE;
                break;
            case LEFT:
                xx = -TILESIZE;
                break;
            case RIGHT:
                xx = TILESIZE;
                break;
        }
        if(place_meeting(x + xx, y + yy, _examine)) {
            with(instance_place(x + xx, y + yy, _examine)) {
                dialog_from_array(0, array_height_2d(message) - 1);
            }
        }
        if(place_meeting(x + xx, y + yy, _item)) {
            with(instance_place(x + xx, y + yy, _item)) {
                if(item != "") {
                    inv_add(item, 1);
                    instance_destroy();
                }
            }
        }
        if(place_meeting(x + xx, y + yy, _char)) {
            with(instance_place(x + xx, y + yy, _char)) {
                switch(other.facing) {
                    case LEFT:
                        facing = RIGHT;
                        break;
                    case RIGHT:
                        facing = LEFT;
                        break;
                    case UP:
                        facing = DOWN;
                        break;
                    case DOWN:
                        facing = UP;
                        break;
                }
                dialog_from_array(0, array_height_2d(message) - 1);
            }
        }
        //Special case
        if(room == rWater) {
            if(Player.x == 480 && Player.y == 480 && Player.facing == DOWN) {
                with(Spirit2) {
                    facing = UP;
                    dialog_from_array(0, array_height_2d(message) - 1);
                }
            }
        }
        if(place_meeting(x + xx, y + yy, Crate)) {
            with(instance_place(x + xx, y + yy, Crate)) {
                if(!place_meeting(x + xx, y + yy, Boundary)) {
                    hdist = xx;
                    vdist = yy;
                    if(Controller.sound) {
                        audio_play_sound(aSlide, 0, false);
                    }
                }
            }
        }
        input_clear(ACTION);
    }
}

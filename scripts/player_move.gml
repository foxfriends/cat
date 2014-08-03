///player_move();
if(!StoryController.cutscene) {
    if(hdist == 0 && vdist == 0) {
        for(var i = 0; i < 4; i++) {
            var k = ds_list_find_value(Controller.keyOrder, i);
            if(input_check(k)) {
                switch(k) {
                    case UP:
                        vdist = -TILESIZE;
                        break;
                    case DOWN:
                        vdist = TILESIZE;
                        break;
                    case LEFT:
                        hdist = -TILESIZE;
                        break;
                    case RIGHT:
                        hdist = TILESIZE;
                        break;
                }
                if(facing != k && input_check_pressed(k)) {
                    hdist = 0;
                    vdist = 0;
                }
                facing = k;
            }
            if(hdist != 0 || vdist != 0) {
                var inst = instance_place(x + hdist, y + vdist, Door);
                if(place_meeting(x + hdist, y + vdist, Boundary)) {
                    hdist = 0;
                    vdist = 0;
                } else if(inst != noone) {
                    hdist *= 2;
                    vdist *= 2;
                    goto_door(inst.rm, inst.door);
                }
                break;
            }
        }
    }
}
///goto_door(room, door)
if(argument_count < 2) {
    argument[1] = noone;
    if(argument_count < 1) {
        argument[0] = room;
    }
}
with(instance_create(0, 0, TransitionController)) {
    rm = argument[0];
    door = argument[1];
}
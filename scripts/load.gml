///load(file)
if(file_exists(working_directory + "/save" + string(argument[0]))) {
    ini_open(working_directory + "/game");
    Controller.playTime = ini_read_real(string(argument[0]), 't', 0);
    ini_close();
    var file = file_text_open_read(working_directory + "/save" + string(argument[0]));
    //Get information from file
    var data = file_text_read_string(file);
    data = decrypt(data);
    dialog_var("PLAYERNAME", string_copy(data, 0, string_pos("~", data) - 1));
    data = string_copy(data, string_pos("~", data) + 1, string_length(data));
    StoryController.state[0] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.progress[0] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.state[1] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.state[2] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.state[3] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.state[4] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.state[5] = real(string_copy(data, 0, string_pos(" ", data) - 1));
    data = string_copy(data, string_pos(" ", data) + 1, string_length(data));
    StoryController.state[6] = real(string_copy(data, 0, string_length(data)));
    file_text_readln(file);
    ds_grid_read(InventoryController.inv, file_text_read_string(file));
    instance_create(224, 96, Player);
    room_goto(rHome);
}
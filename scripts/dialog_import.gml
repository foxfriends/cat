///dialog_import([name[, obj]]);
/*
argument0: name         -> The name to import dialog for (String)
argument1: obj          -> The object to give the messages to (Instance id or object index)
Imports the messages, speakers, and sprites from the dialog
file. If no name or object is given, it defaults to the name
of the current object. The dialog file should be written
following these rules:
[Name of Object]
m# = Message body is writtenCOLb hereCOLw! (Or the options for a question)
p# = Speaker name or question
sa# = First sprite
sb# = Second sprite
t = m, i, or q (for message, input, or question)
Where # is the id of the message, as it will be called using dialog_from_array
Between each option in the list, you must write OPTION. Do not put spaces if
don't want them to appear in the selector. See the included dialog file for 
examples.
Only the m field must be filled. Others will default to an empty string, noone,
or to a regular message.
*/
var name, obj;
if(argument_count >= 1) {
    name = argument[0];
    if(argument_count == 2) {
        obj = argument[1];
    } else {
        obj = self;
    }
} else {
    name = object_get_name(object_index);
    obj = self;
}
with(obj) {
    if(inikey != name) {
        ini_open("dialog.ini");
        inikey = name;
        messageCount = 0;
        message = "";
        while(ini_key_exists(name, "m" + string(messageCount))) {   //A message always has an m value!
            //Get message values out
            message[messageCount, 0] = ini_read_string(name, "m" + string(messageCount), "");
            message[messageCount, 1] = ini_read_string(name, "p" + string(messageCount), "");
            message[messageCount, 2] = ini_read_string(name, "sa" + string(messageCount), "noone");
            message[messageCount, 3] = ini_read_string(name, "sb" + string(messageCount), "noone");
            message[messageCount, 4] = ini_read_string(name, "a" + string(messageCount), "noone");
            //Turn sprite names into numbers or into noone
            if(message[messageCount, 2] != "noone") {
                message[messageCount, 2] = asset_get_index(message[messageCount, 2]);
            } else {
                message[messageCount, 2] = noone;
            }
            if(message[messageCount, 3] != "noone") {
                message[messageCount, 3] = asset_get_index(message[messageCount, 3]);
            } else {
                message[messageCount, 3] = noone;
            }
            if(message[messageCount, 4] != "noone") {
                message[messageCount, 4] = asset_get_index(message[messageCount, 4]);
            } else {
                message[messageCount, 4] = noone;
            }
            //Message type (m, q, i - msg, question, input)
            message[messageCount, 5] = ini_read_string(name, "t" + string(messageCount), "m");
            //Replace the constants with the symbols
            message[messageCount, 0] = string_replace_all(message[messageCount, 0], "COL", COL);
            message[messageCount, 0] = string_replace_all(message[messageCount, 0], "SIZE", SIZE);
            message[messageCount, 0] = string_replace_all(message[messageCount, 0], "WAIT", WAIT);
            message[messageCount, 0] = string_replace_all(message[messageCount, 0], "VAR", VAR);
            //Options are in the speaker's usual spot, so change it there
            message[messageCount, 1] = string_replace_all(message[messageCount, 1], "OPTION", OPTION); 
            message[messageCount, 1] = string_replace_all(message[messageCount, 1], "VAR", VAR);
            //Increment messageCount 
            messageCount++;
        }
        ini_close();
    }
}

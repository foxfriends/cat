///dialog_from_array(start[, end]);
/*
argument0: first    -> The first message to write (Real)
argument1: last     -> The last message to write (Real)
Outputs dialog from the message array of an object, as created
by the dialog_import() script. The number of the message is the same
as the one in the file (the number from m#)
End is inclusive. Leave it out to output only the first message.
*/
var first = argument[0], last = argument[0], i;
if(argument_count == 2) {
    last = argument[1];
}
for(i = first; i < last + 1; i++) {
    if(message[i, 5] == "m") {
        dialog_msg(message[i, 0], message[i, 1], message[i, 2], message[i, 3], message[i, 4]);
    } else if(message[i, 5] == "q") {
        dialog_question(message[i, 0], message[i, 1]);
    } else if(message[i, 5] == "i") {
        dialog_input(message[i, 0], message[i, 1]);
    }
}

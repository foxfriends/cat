///dialog_msg(msg[, speaker[, sprite1[, sprite2[, sound]]]])
/*
Required argument:
argument0: msg  -> The msg to write (string)
Optional arguments, must be in order but they don't all have to be there:
argument1: speaker  -> The speaker's name (string)
argument2: sprite1  -> The sprite to display on the left (sprite index)
argument3: sprite2  -> The sprite to display on the right (sprite index)
Add a new msg to the queue. Optionally also specifies
a speaker's name and sprites to show. If the dialog string
is longer than the msg box size, it will automatically
insert line breaks, or even split the msg into two parts.
Tips:
- The 'COL', 'SIZE', and 'WAIT" characters can NOT be seen in the dialog.
    However, 'SPR' and 'SPKR' characters can.
- Use the 'COL' and 'SIZE' constants, rather than hard coding 
    the symbol, even though its annoying and takes longer.
    This will make it easier if you decide you want to use
    one of the symbols in the actual dialog to change them
    all at once.
    E.G:
    "My favourite fruit is" + COL + "y banana" + COL + "k.";
    Rather than:
    "My favourite fruit is%y banana%k.";
- The 'WAIT' constant is multiplied by 3 automatically. Add more 'WAIT's
    to make the time even longer
- When resizing your text, string_wrap does NOT account for the changed size.
    If you make your text bigger, it is good to do the lines manually.
- The constants don't work in the speaker's name
- Use the noone keyword to not draw a sprite
- Use "" as speaker if you want (a) sprite(s) but no name
- The speaker doesn't have to be just names. You can use things like
    "Tip" or "Bob (quietly)" as well. Just don't include the 'SPKR' character.
- Using the OPTION character will prevent string wrapping, so don't use it
*/
var msg = argument[0], msgstr = "";
//Save this for actions at the end
if(msg != "") {
    DialogController.lastMessage = msg;
}
if(argument_count >= 2) { //Speaker
    if(argument_count >= 3) { //Left sprite
        msgstr += string(argument[2]) + SPR;
        if(argument_count >= 4) { //Right sprite
            msgstr += string(argument[3]) + SPR;
            if(argument_count >= 5) {
                msgstr += string(argument[4]) + SOUND;
            } else {
                msgstr += string(noone) + SOUND;
            }
        } else {
            msgstr += string(noone) + SPR; //Add noone if there is no argument
            msgstr += string(noone) + SOUND; //And for sound
        }
    } else {
        //Both are noone if there is no argument
        msgstr += string_repeat(string(noone) + SPR, 2);
        //And sound
        msgstr += string(noone) + SOUND;
    }
    if(argument[1] != "") { //Add speaker after the sprites and sound
        msgstr += argument[1];
    }
}
msgstr += SPKR; //Add SPKR, even if there is no speaker
if(!string_count(OPTION, msg)) { //Don't wrap the string if it's a list of options
    msg = string_wrap(msg, DIAWIDTH - (2 * DIAPADH));
}
if(msg != "") {
    while(msg != "") {
        var substr = "";
        //Split the msg into multiple boxes if it's too tall.
        while(string_count("#", substr) < floor((DIAHEIGHT - DIASPKRH - DIAPADV) / string_height("A"))) {
            if(string_count("#", msg)) {
                //Move the line to the substr from the original
                substr += string_copy(msg, 1, string_pos("#", msg));
                msg = string_copy(msg, string_pos("#", msg) + 1, string_length(msg));
            } else {
                //No more lines in the msg, so add the whole thing
                substr += msg;
                msg = "";
                break; //Force the loop to end
            }
        }
        //Lengthen the pauses to be 3 `s long
        substr = string_replace_all(substr, WAIT, '```');
        ds_queue_enqueue(DialogController.dialog, msgstr + substr); //Add the part of the msg to the queue
        //String in queue looks like: 12@28@Name:Message
    }
} else {
    //Must provide handling for blank messages in case of no default value for dialog_input();
    ds_queue_enqueue(DialogController.dialog, msgstr);
}

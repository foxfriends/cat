///dialog_next();
/*
Skip to the end of the current message, or go to the next one.
If it is waiting for input, it will ask to confirm first.
*/
if(dialog_count()) {
    if(DialogController.diaPos < DialogController.msgLen) {
        //Skip to the end of the message
        DialogController.diaPos = DialogController.msgLen;
    } else {
        //Remove the message
        dialog_remove();
        //Return to the start of the message
        diaPos = 0;
        if(!dialog_count()) {
            //Clear the sprites if on the last message
            DialogController.sprite[0, 0] = noone;
            DialogController.sprite[0, 1] = 0;
            DialogController.sprite[0, 2] = 0;
            DialogController.sprite[1, 0] = noone;
            DialogController.sprite[1, 1] = 0;
            DialogController.sprite[1, 2] = 0;
            //Clear the options
            DialogController.optionCount = 0;
        }
        //Set keyboard_string if looking for input
        keyboard_string = inputValue;
        //A sound for next message can be placed here if you want
        if(Controller.sound) {
            var blip = audio_play_sound(aNextMessage, 0, false);
            audio_sound_gain(blip, 0.4, 0);
        }
    }
}

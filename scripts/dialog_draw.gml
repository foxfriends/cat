///dialog_draw();
/*
Draws the dialog box, the speaker, the sprites, and the message
that are at the front of the queue. 
The text appears letter by letter, and the sprites slide in from
the sides. Text speed, and sliding speed can be changed. Also the
sliding action can be changed to fade in or slide from bottom with
a small modification.
It is recommended that you customize the position, size, colour,
etc. of the dialog to suit your game. Parts that can be changed
are indicated with  ---------------------------------------
---- Local variables ----
str: dialogStr  -> The string from the queue at first. Becomes the parsed out message
real: newSpr    -> The index of the sprite being removed from the dialogStr
str: speaker    -> The speaker removed from the dialogStr
colour: colDefault  -> The default colour used for drawing text
real: i         -> Iterator
real: curChar   -> The letter in the string to be drawn
real: curPos    -> The position of the above letter
real: curX      -> The x position of the letter
real: curY      -> The y position of the letter
bool: colChange -> Whether or not to change the colour
bool: sizeChange-> Whether or not to change the size
real: boxX      -> The x position of the left side of the box
real: boxY      -> The y position of the top of box
real: lineHeight-> The height of a line using the normal font
real: optionsToDraw -> The number of options to draw when askeing a question
real: minOption -> The index of the first option to draw
real: maxOption -> The index of the last option to draw
*/
//Variables used in all cases
var dialogStr = dialog_get(), newSpr, sound, speaker, colDefault, i;
//Default text drawing colour   ---------------------------
colDefault = c_white;
//Regular text drawing
var curChar = '', curPos = 1, curX = 0, curY = 0,
    colChange = false, sizeChange = false, boxX, boxy,
    lineHeight;
//Questions
var optionsToDraw, minOption, maxOption;
//Box position in the window ------------------------------
//Remember this is the Draw GUI event! Don't use view_*
boxX = 0;
boxY = window_get_height() - DIAHEIGHT;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//Text font -----------------------------------------------
draw_set_font(fDialog);
lineHeight = string_height("A");
/* Draw the two sprites first, so they are behind the box.
The way this code is currently written, the origin must be
at the bottom-right, opposed to the usual top-left. Also,
the sprite should be facing to the right, as the second
image has -1 for xscale. If you don't want the sprites at all,
delete this -> */
//Change all dialog variables into their values before anything else.
dialogStr = dialog_parse_vars(dialogStr);
//Cut out the sprites, speaker, and message from the dialogStr
if(string_count("@", dialogStr)) {
    for(i = 0; i < 2; i++) {
        newSpr = real(string_copy(dialogStr, 1, string_pos(SPR, dialogStr) - 1));
        //sprite[i] is the sprite index, now as a real number
        if(newSpr != sprite[i, 0]) {
            sprite[i + 2, 0] = sprite[i, 0]; //Store information about the old sprite so it can be drawn leaving
            sprite[i + 2, 1] = sprite[i, 1];
            sprite[i + 2, 2] = sprite[i, 2];
            sprite[i, 0] = newSpr;  //Sprite index
            sprite[i, 1] = 0;       //Subimage
            sprite[i, 2] = 0;       //x-distance
        }
        //Remove the number and 'SPR' character from the dialogStr
        dialogStr = string_copy(dialogStr, string_pos(SPR, dialogStr) + 1, string_length(dialogStr));
    }
}
//The speed the sprite slides in at  ----------------------
var slideSpd = 30;
//The speed the sprites animations run at   ---------------
image_speed = 1;
//Draw the sprite at the left side of the screen
if(sprite[0, 0] != noone) {
    //Have the sprite slide into place (fully on screen) quickly.
    sprite[0, 2] = min(sprite[0, 2] + slideSpd, sprite_get_width(sprite[0, 0]));
    //Replace that with this for it to appear suddenly:
    //sprite[i, 2] = sprite_get_width(sprite[i, 0]);
    //Also feel free to experiment with different effects such as
    //fading in, or sliding in from the bottom
    //Reposition as you see fit ---------------------------
    draw_sprite_ext(sprite[0, 0], sprite[0, 1], sprite[0, 2], window_get_height(), 1, 1, 0, c_white, 1);
    //Add to the image index, but don't go over the image_number
    sprite[0, 1] = floor(sprite[0, 1] + image_speed) % sprite_get_number(sprite[0, 0]);
}
//Leaving sprite on the left
if(sprite[2, 0] != noone) {
    sprite[2, 2] -= slideSpd;
    if(sprite[2, 2] > 0) {
        //Move the other way
        draw_sprite_ext(sprite[2, 0], sprite[2, 1], sprite[2, 2], window_get_height(), 1, 1, 0, c_white, 1);
        sprite[2, 1] = floor(sprite[2, 1] + image_speed) % sprite_get_number(sprite[2, 0]);
    } else {
        //Remove information about it once its off screen
        sprite[2, 0] = noone;
        sprite[2, 1] = 0;
        sprite[2, 2] = 0;
    }
}
//Right side sprites. Just a mirror of the above with sprite 1 and 3 replacing 0 and 2
//Remember to change both if you want them to look the same.
if(sprite[1, 0] != noone) {
    sprite[1, 2] = min(sprite[1, 2] + slideSpd, sprite_get_width(sprite[1, 0]));
    draw_sprite_ext(sprite[1, 0], sprite[1, 1], window_get_width() - sprite[1, 2], window_get_height(), -1, 1, 0, c_white, 1);
    sprite[1, 1] = floor(sprite[1, 1] + image_speed) % sprite_get_number(sprite[1, 0]);
}
//Leaving sprite on the right
if(sprite[3, 0] != noone) {
    sprite[3, 2] -= slideSpd;
    if(sprite[3, 2] > 0) {
        //Move the other way
        draw_sprite_ext(sprite[3, 0], sprite[3, 1], window_get_width() - sprite[3, 2], window_get_height(), -1, 1, 0, c_white, 1);
        sprite[3, 1] = floor(sprite[3, 1] + image_speed) % sprite_get_number(sprite[3, 0]);
    } else {
        //Remove information about it once its off screen
        sprite[3, 0] = noone;
        sprite[3, 1] = 0;
        sprite[3, 2] = 0;
    }
}
/*********************************************************/
//Colour and alpha of the box   ---------------------------
//Remove both if using a sprite, as they won't do anything
draw_set_color(c_black);
draw_set_alpha(0.8);
//Draw the box itself. You may use a sprite if you want ---
draw_rectangle(boxX, boxY, boxX + DIAWIDTH, boxY + DIAHEIGHT, false);
//Separator between speaker and the message ---------------
draw_line(boxX, boxY + DIASPKRH, boxX + DIAWIDTH, boxY + DIASPKRH);
//Replace the above with this for a sprite:
//draw_sprite(###, 0, boxX, boxY);
draw_set_alpha(1); //Reset alpha to opaque
//Default text drawing colour   ---------------------------
draw_set_color(colDefault);
//Get the sound and speaker and remove them as well as the 'SOUND' and 'SPKR' characters from the dialogStr
sound = real(string_copy(dialogStr, 1, string_pos(SOUND, dialogStr) - 1));
dialogStr = string_copy(dialogStr, string_pos(SOUND, dialogStr) + 1, string_length(dialogStr));
speaker = string_copy(dialogStr, 1, string_pos(SPKR, dialogStr) - 1);
dialogStr = string_copy(dialogStr, string_pos(SPKR, dialogStr) + 1, string_length(dialogStr));
/* If you don't want the have the player confirm their option choice,
make the necessary changes to the DialogController's End step event
and delete this -> */
if(optionCount != 0 && dialog_count() == 1) {
    if(diaPos != 0) {
        speaker = "Press <Enter> again to confirm your choice.";
    }
}
/*********************************************************/
/* If you don't want the have the player confirm their text input,
make the necessary changes to the DialogController's End step event
and delete this -> */
if(is_string(inputValue) && dialog_count() == 1) {
    if(diaPos != 0) {
        speaker = "Press <Enter> again to confirm your choice.";
    }
}
/*********************************************************/
//Play the sound
if(diaPos == 0) {
    if(Controller.sound) {
        if(sound != noone) {
            audio_play_sound(sound, 0, false);
        }
    }
}
//Draw the speaker's name at the correct position
draw_text(boxX + DIAPADH, boxY + DIAPADV, speaker); 
//If there are no options (no question) and input is a number (no input)
//Or if its not the last message, do the regular dialog
if((!optionCount && !is_string(inputValue)) || dialog_count() != 1) {
    //Start drawing the text, one letter at a time
    draw_set_valign(fa_bottom); //Set valign so that the sizes line up correctly.
    for(i = 0; i < diaPos; i++) {
        //Get the character
        curChar = string_char_at(dialogStr, curPos);
        //Switch to colour or size mode if its 'COL' or 'SIZE'
        if(curChar == COL) {
            colChange = true;
            i--; //Extend the limit to prevent a tiny pause
        } else if(curChar == SIZE) {
            sizeChange = true;
            i--;
        } else {
            //Change colour or size
            if(colChange) {
                switch(curChar) {
                    case 'n':   //Name
                        draw_set_color(make_color_rgb(0, 255, 255));
                        break;
                    case 's':   //Spirits
                        draw_set_color(c_green);
                        break;
                    case 'i':   //Item
                        draw_set_color(make_color_rgb(200, 150, 200));
                        break;
                    /* Add more colours -------------------
                    case 'SYMBOL':
                        draw_set_color(COLOUR);
                        break;
                    If you make a lot of colours, remember that
                    capital letters and non-letter characters work too
                    */
                    case "d":
                    default:    //Default
                        draw_set_color(c_white);
                        break;
                }
                i--;
                colChange = false; //Clear colChange
            } else if(sizeChange) {
                switch(curChar) {
                    /* I recommend making different sized fonts,
                    rather than just resizing the one. It will 
                    look smoother and be less difficult for GM.
                    It does end up taking a little bit more 
                    memory though... */
                    case 's':
                        draw_set_font(fDialogSmall);
                        break;
                    /*Add more sizes    -------------------
                    case 'SYMBOL':
                        draw_set_font(FONT);
                        break;
                    Just incase you didn't think of it, this isn't
                    restricted to only changing size. You can 
                    also change the font to something completely
                    different. */
                    case 'm': case 'd':  // Medium/Default
                    default:    //Default for typos again
                        draw_set_font(fDialog);
                        break;
                }
                i--;
                sizeChange = false; //Clear sizeChange
            } else {
                if(curChar != "#") {
                    if(curChar != WAIT) {
                        //Draw the character
                        draw_text(boxX + DIAPADH + curX, boxY + DIAPADV + DIASPKRH + curY + lineHeight, curChar);
                        //Move position forward
                        curX += string_width(curChar);
                    }
                } else {
                    //New line, add to curY position and reset curX
                    curY += string_height("A");
                    curX = 0;
                }
            }
        }
        curPos++; //Move on to next character
    }
    draw_set_valign(fa_top); //Return to normal valign
    //Show one more character next time. Don't go past the last character though
    //Save the length in an instance variable so messages can be closed/skip to end
    msgLen = string_length(dialogStr);
    diaPos = min(diaPos + DIASPD * Controller.DIASPDmult, msgLen);
    //Textbox sound if you want. Remove it if you want ----
    if(Controller.sound) {
        if(diaPos != msgLen && curChar != WAIT) {
            var blip = audio_play_sound(aDialog, 0, false);
            audio_sound_gain(blip, 0.1, 0);
        }
    }
    /*  It is possible to add in functionality for voice acting
        here too. It would require a sound file for each line you want
        voice acted. The sound would then be written into and parsed out
        of the string in a similar way as the sprites. 
        The above 'if' would need to be modified to play the sound only once: */
    /*if(sound != noone) {
        if(diaPos == 0 && !audio_is_playing(sound)) {
            audio_stop_all();
            audio_play_sound(sound, 0, false);
        }
    } /**/
} else if(optionCount && dialog_count() == 1) {
    //Get the number of available lines
    optionsToDraw = floor((DIAHEIGHT - DIASPKRH - DIAPADV) / string_height("A"));
    //Find the first and last option to draw
    minOption = max(currentOption - floor(optionsToDraw / 2), 0);
    maxOption = min(minOption + optionsToDraw - 1, optionCount - 1);
    //Draw the options with the selected one a different colour
    var option;
    for(i = 0; i < optionCount; i++) {
        option[i] = string_copy(dialogStr, 1, string_pos('|', dialogStr) - 1);
        dialogStr = string_copy(dialogStr, string_pos('|', dialogStr) + 1, string_length(dialogStr));
    }
    for(i = minOption; i <= maxOption; i++) {
        if(i == currentOption) {
            //Selected option background colour -----------
            //Draw a faint rectangle behind the selected option
            draw_set_color(c_ltgray);
            draw_set_alpha(0.2);
            draw_rectangle(boxX, boxY + DIASPKRH + DIAPADV + (i - minOption) * string_height("A"), boxX + DIAWIDTH, boxY + DIASPKRH + DIAPADV + (i - minOption + 1) * string_height("A"), false);
            //Return to regular colour for the text
            draw_set_color(colDefault);
            draw_set_alpha(1);
        }
        //Draw the text at the right position
        draw_text(boxX + DIAPADH, boxY + DIASPKRH + DIAPADV + (i - minOption) * string_height("A"), option[i]);
        if(minOption != 0) {
            //Draw upward triangle to show there are more options above
            //Change if you want    -----------------------
            draw_triangle(  boxX + DIAWIDTH - 16, boxY + DIASPKRH + DIAPADV,
                            boxX + DIAWIDTH - 16 - string_height("A") / 2, boxY + DIASPKRH + DIAPADV + string_height("A"),
                            boxX + DIAWIDTH - 16 + string_height("A") / 2, boxY + DIASPKRH + DIAPADV + string_height("A"), false);
        } if(maxOption != optionCount - 1) {
            //Draw downward triangle to show there are more options below
            //Change if you want    -----------------------
            draw_triangle(  boxX + DIAWIDTH - 16, boxY + DIASPKRH + DIAPADV + ((optionsToDraw) * string_height("A")),
                            boxX + DIAWIDTH - 16 - string_height("A") / 2, boxY + DIASPKRH + DIAPADV + ((optionsToDraw - 1) * string_height("A")),
                            boxX + DIAWIDTH - 16 + string_height("A") / 2, boxY + DIASPKRH + DIAPADV + ((optionsToDraw - 1) * string_height("A")), false);
        }
    }
} else if(is_string(inputValue) && dialog_count() == 1) {
    inputFrame = (inputFrame + 1) % room_speed;
    draw_text(boxX + DIAPADH, boxY + DIASPKRH + DIAPADV, inputValue + string_repeat("|", inputFrame < 15));
}
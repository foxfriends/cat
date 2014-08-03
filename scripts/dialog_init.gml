///dialog_init();
/*
Initialize dialog system.
    ds_queue: dialog    -> To hold the message strings
    real: diaPos        -> The current position in the string (for drawing)
    array: sprite[]     -> Holds various information about the sprites being drawn
                    0: sprite index
                    1: image index
                    2: x distance
    msgLen              -> The length of the current message
    optionCount         -> The number of options when asking a question
    currentOption       -> The selected option when asking a question
    questionAsked       -> The question that was asked
    inputValue          -> The current value of the input (0 if not looking for input)
    inputFrame          -> Whether or not to show the | in input
    lastMessage         -> The most recently spoken message
    vars                -> Map of all dialog variables
    The following constants are set up in the constants menu. (Ctrl + Shift + N)
    Make sure you add them to your game as well.
    Change the characters to whatever you like.
    str: SPKR   -> Character to split message and speaker (Default ':')
    str: SPR    -> Character to split message and sprites (Default '@')
    str: COL    -> Character to change text colour when drawing (Default '%')
    str: SIZE   -> Character to change text size when drawing (Default '^')
    str: VAR    -> Character to denote a variable that should be replaced for the output (Default '*')
    str: WAIT   -> Character that doesn't display anything to create a brief pause.
                        (Default '`' - the one below ~, not to be confused with ')
    Change these to the size you want.
    real: DIAWIDTH  -> Width of the dialog box (Default 640)
    real: DIAHEIGHT -> Height of the dialog box (Default 128)
    real: DIASPKRH  -> Height of the speaker box (Default 32)
    real: DIAPADH   -> The space between the sides of the box and the words when drawing (Default 5)
    real: DIAPADV   -> The space between the top of the box and the first line when drawing (Default 5)
    Change this for different speed. It works with decimals too, but its smoothest with whole numbers
    real: DIASPD    -> Letters to reveal per frame (Default 1)
*/
dialog = ds_queue_create();
diaPos = 0;
var i;
for(i = 0; i < 4; i++) {
    sprite[i, 0] = noone;
    sprite[i, 1] = 0;
    sprite[i, 2] = 0;
}
msgLen = 0;
optionCount = 0;
currentOption = -1;
questionAsked = "";
inputValue = 0;
inputFrame = 0;
lastMessage = "";
vars = ds_map_create();
dialog_var("PLAYERNAME", "");
dialog_var("TREESFIXED", "0");
dialog_var("KEYCOUNT", "4");
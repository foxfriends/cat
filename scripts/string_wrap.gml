///string_wrap(str, width);
/*
argument0: str      -> The string to wrap (String)
argument1: width    -> The maximum width of a line (Real)
Wraps the string so that it fits into width by adding newline
characters (#).
Returns the string with inserted line breaks.
*/
draw_set_font(fDialog); //Set the font to the one used in the dialog box
var str = argument0, width = argument1,
    curPos = 1, goodPos = 1, lineStart = 1,
    substr = "";
//Keep going until the string is the right width
while(string_width(str) > width && curPos <= string_length(str)) {
    //Check for a space
    if(string_char_at(str, curPos) == " " || curPos == string_length(str)) {
        //Check if its too long.
        substr = string_copy(str, lineStart, curPos - lineStart);
        if(string_width(substr) > width) {
            //Remove space
            str = string_delete(str, goodPos, 1);
            //Add newline
            str = string_insert("#", str, goodPos);
            //Change linestart
            lineStart = goodPos + 1;
        } else {
            //String is good to here
            goodPos = curPos;
        }
    }
    //Next character
    curPos++;
}
return str;
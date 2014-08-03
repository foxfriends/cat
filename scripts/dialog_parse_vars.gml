///dialog_parse_vars(dialogStr)
/*
argument0: dialogStr        -> The string to parse (String)
Parses all variables from a dialog string, replacing them 
with their values. Returns the modified string.
*/
var dialogStr = argument[0];
while(string_count(VAR, dialogStr)) { //Keep going until all are found
    var pos = string_pos(VAR, dialogStr);
    dialogStr = string_delete(dialogStr, pos, 1); //Remove the var symbol
    var varname = "", xx = pos;
    //Only letters, numbers and _ allowed in the variable names
    while(string_char_at(dialogStr, xx) == string_lettersdigits(string_char_at(dialogStr, xx)) || string_char_at(dialogStr, xx) == "_") {
        varname += string_char_at(dialogStr, xx++);
    }
    dialogStr = string_delete(dialogStr, pos, string_length(varname)); //Remove the variable name
    dialogStr = string_insert(dialog_var(varname), dialogStr, pos); //Insert the value
}
return dialogStr;
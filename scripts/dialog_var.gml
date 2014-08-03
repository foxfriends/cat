///dialog_var(name[, value]);
/*
argument0: name      -> The variable to access or change (String)
argument1: value    -> The value to set it to (Anything)
/*
Access one of the dialog variables. If a second argument is included
the value is updated. A good place to update all of the variables at once
is the DialogController's end step event. This allows the variables to be
updated from user input before being drawn to the screen.
Returns an error message if the variable doesn't exist, otherwise returns
the value. The value is always returned as a string, even if it was set
as a number.
*/
//Check if the value is already in the map
if(ds_map_exists(DialogController.vars, argument[0])) {
    if(argument_count == 2) {
        //Update if the value is given
        ds_map_replace(DialogController.vars, argument[0], argument[1]);
    }
    //Return value
    return string(ds_map_find_value(DialogController.vars, argument[0]));
} else {
    if(argument_count == 2) {
        //Add it if the value is given and return successfully
        ds_map_add(DialogController.vars, argument[0], argument[1]);
        return string(ds_map_find_value(DialogController.vars, argument[0]));
    }
    //Return an error message that will be easy to spot in your string
    return "[Variable <" + argument[0] + "> not found]";
}
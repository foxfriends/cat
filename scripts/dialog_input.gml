///dialog_input(question, default);
/*
argument0: question     -> The question to ask (String)
argument1: default      -> The default value of the field (String)
Asks the player a question, similar to dialog_question(),
but instead of options gives a box for typing a string into.
*/
DialogController.questionAsked = argument0;
DialogController.inputValue = argument1;
dialog_msg(DialogController.inputValue, DialogController.questionAsked);
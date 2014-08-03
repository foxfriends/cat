///dialog_question(question, option1, option2[, option3, ..., option15]);
/*
argument0: question         -> The question to ask (String)
argument1-15: option1-15    -> The options to give. There should be at least 2 (Strings)
Tells the DialogController to ask for input on the last message.
The question is drawn where the speaker goes, and the options are
placed in the message area. Each option should only be 1 line long,
and not contain any colour / size changes. If the number of options
extends past the bottom of the box, they will scroll, hiding the 
ones that go out of range. When the player presses enter, it will
ask for confirmation before moving on.
The most recent 2 sprites will stay on the screen.
*/
DialogController.questionAsked = argument[0];
var answers = "", i;
for(i = 1; i < argument_count; i++) { //Add an option for each argument
    answers += argument[i] + OPTION;
}
DialogController.optionCount = string_count(OPTION, answers);
DialogController.currentOption = 0;
dialog_msg(answers, DialogController.questionAsked);
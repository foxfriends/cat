///format_time(time);
var seconds = floor(argument[0] / room_speed);
var minutes = floor(seconds / 60);
var hours   = floor(minutes / 60);

seconds %= 60;
minutes %= 60;

return string(hours) + ":" + string_repeat("0", minutes < 10) + string(minutes) + ":" + string_repeat("0", seconds < 10) + string(seconds);

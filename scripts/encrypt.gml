///encrypt(str);
var str = argument[0];
var v = ord(string_char_at(str, 1));
for(var i = 1; i <= string_length(str); i++) {
    str = string_insert(chr(ord(string_char_at(str, i)) * (v + i - 1)), string_delete(str, i, 1), i);
}
return str;
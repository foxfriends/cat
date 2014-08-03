///update_item(index, field, replacement)
/*
argument0 -> The index of the item in the item database to update (Real: between 0 and the width of the item database OR String: the item name)
argument1 -> The field that you want to change (Real: ItemName (0), ItemDesc (1), ItemBuy (2), ItemSell(3) or ItemMax(4))
argument2 -> The new value for the field (String for ItemName or ItemDesc, Real for ItemBuy, ItemSell and ItemMax)
Changes the value of the specified item's field to the replacement
value. Returns true on success, and false if the type of the value
does not work with the field, or it just fails.
*/
var index, field, replacement;
index       = argument0;
field       = argument1;
replacement = argument2;
if(is_string(index)) {
    index = ds_grid_value_x(itemDB, 0, ITEMNAME, ds_grid_width(itemDB) - 1, ITEMNAME, index);
}
if(field >= 0 && field <= 1 && is_string(replacement)) {
    ds_grid_set(itemDB, index, field, replacement);
    return true;
} else if(field > 1 && field < 5 && is_real(replacement)) {
    ds_grid_set(itemDB, index, field, replacement);
    return true;
} else return false;

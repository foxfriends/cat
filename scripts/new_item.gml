///new_item(name, description, qty, sprite)
/*
argument0 -> The name of the item               (string)
argument1 -> A description of the item          (string)
argument4 -> The maximum quantity of the item   (real: -1 for unlimited)
argument5 -> A sprite of the object             (real: sprite index)
Adds a new item to the item database. Returns true if all values are correct,
false otherwise. If the database is too small, it will make it bigger
*/
var name, description, qty, sprite, index;
name = argument0;
description = argument1;
qty = argument2;
sprite = argument3;
//If there are empty spaces left in the item database...
if(ds_grid_value_exists(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, "")) {
    //... the index is the first empty space
    index = ds_grid_value_x(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, "");
} else {
    //... set the index to the width and make it bigger
    index = ds_grid_width(InventoryController.itemDB);
    ds_grid_resize(InventoryController.itemDB, index + 1, 4);
}
//check to make sure all the given values are correct
if(is_string(name) && is_string(description) && is_real(qty) && sprite_exists(sprite)) {
    //If they are, then insert them into the database
    ds_grid_set(InventoryController.itemDB, index, ITEMNAME, name);
    ds_grid_set(InventoryController.itemDB, index, ITEMDESC, description);
    ds_grid_set(InventoryController.itemDB, index, ITEMMAX, qty);
    ds_grid_set(InventoryController.itemDB, index, ITEMSPRITE, sprite);
    return true;
} else return false;

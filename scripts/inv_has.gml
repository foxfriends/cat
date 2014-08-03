/* Script: inv_has(item);
argument0: item     -> The item to look for

Returns the slot of the item in the inventory, or -1 if its
not there.
*/
var item = argument0;
if(is_string(item)) {
    //Get the index if the item given is a string
    item = ds_grid_value_x(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, item);
}
if(ds_grid_value_exists(InventoryController.inv, 0, ITEMINDEX, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, item)) {
    return ds_grid_value_x(InventoryController.inv, 0, ITEMINDEX, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, item);
} else {
    return -1;
}

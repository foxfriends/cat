///itemdb_read(index, value)
/*
argument0 -> The item index (Real: between 0 and the width of the item database OR String: the item name)
argument1 -> The value to read from the database (Real: ItemName (0), ItemDesc (1), ItemBuy (2), ItemSell(3) or ItemMax(4))
This script returns the requested value about the given item from the item database
*/
index = argument0;
if(is_string(index)) {
    index = ds_grid_value_x(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, index);
}
return ds_grid_get(InventoryController.itemDB, index, argument1);
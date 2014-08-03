///inv_read(slot, value);
/*
argument0 -> The slot in the inventory to read from (Real: Between 0 and the the width of the inventory
argument1 -> The value to read from the inventory (Real: ItemIndex (0) or ItemQty (1))
Returns the value from the slot in the inventory. This script is useful as
invdb_read(inv_read(item, ItemIndex),ItemName);
to get the information about items from the database.
This script returns the requested value from the inventory grid
*/
return ds_grid_get(InventoryController.inv, argument0, argument1);

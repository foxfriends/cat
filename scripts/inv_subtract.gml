///inv_subtract(slot, amt);
/*
argument0 -> The slot to use from (real: 0 to last slot in inventory)
argument1 -> The amount to subtract (real: positive integer)
Removes the given amount from the quantity of the slot. Returns true on
success. Returns false if there is no item in the slot or the slot doesn't exist
*/
var slot, amt;
slot = argument0;
amt = argument1;
//Check if the slot exists
if(slot < ds_grid_width(InventoryController.inv) && slot > -1) {
    //Check if there is an item in the slot
    if(inv_read(slot, ITEMQTY)) {
        //Remove the amount from the quantity 
        ds_grid_add(InventoryController.inv, slot, ITEMQTY, -amt);
        if(!inv_read(slot, ITEMQTY)) {
            //Remove the index from the inventory if there are none left
            ds_grid_set(InventoryController.inv, slot, ITEMINDEX, -1);
            //Shift all items in the other slots down one (remove this if you don't want that to happen)
            var i;
            for(i = slot; i < ds_grid_width(InventoryController.inv); i += 1) {
                ds_grid_set(InventoryController.inv, i, ITEMINDEX, inv_read(i + 1, ITEMINDEX));
                ds_grid_set(InventoryController.inv, i, ITEMQTY, inv_read(i + 1, ITEMQTY));
            }
            ds_grid_set(InventoryController.inv, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, -1);
            ds_grid_set(InventoryController.inv, ds_grid_width(InventoryController.inv) - 1, ITEMQTY, 0);
        }
        return true;
    } else return false;    //If there is no item in the slot
} else return false;        //If slot doesn't exist

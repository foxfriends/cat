///inv_empty();
ds_grid_set_region(InventoryController.inv, 0, ITEMINDEX, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, -1);       
ds_grid_set_region(InventoryController.inv, 0, ITEMQTY, ds_grid_width(InventoryController.inv) - 1, ITEMQTY, 0);
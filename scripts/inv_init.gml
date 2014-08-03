///inv_init();
/*
Creates the item database, containing all of the items, their buy/sell values,
a description, and the maximum quantity.
Also creates the inventory, storing the item index and the owned quantity.
*/
//Make the grids global so that they can be used again later. Also declare the variable for the shop grid
InventoryController.itemDB = ds_grid_create(1, 4);  //Create the database
ds_grid_set_region(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, "");
//Add new items to the item database
new_item(   "Stick",
            "A long thin piece of wood",
            1,
            sStick);
new_item(   "Key 1",
            "A key labelled 1",
            1,
            sKey);
new_item(   "Key 2",
            "A key labelled 2",
            1,
            sKey);
new_item(   "Key 3",
            "A key labelled 3",
            1,
            sKey);
new_item(   "Key 4",
            "A key labelled 4",
            1,
            sKey);
new_item(   "Net",
            "A net made from a stick and some spiderweb",
            1,
            sNet);
new_item(   "Fish",
            "A tasty looking fish. It smells very strongly",
            1,
            sFish);
new_item(   "Ladder",
            "A long, collapsible, lightweight ladder",
            1,
            sLadder);
new_item(   "Stuffed Cat",
            "Soft and cuddly. Reminds you of your childhood",
            1,
            sDoll);
new_item(   "Flower",
            "A nice pink flower. With a face",
            1,
            sFlower);
//Add more for more items... Don't forget to raise the width of the grid if you go over
var invWidth, invHeight;
invWidth = 10;      //Maximum number of slots in the the inventory
invHeight = 2;      //Number of values for each item
InventoryController.inv = ds_grid_create(invWidth, invHeight);    //Create the inventory
//Set the inventory to be empty
ds_grid_set_region(InventoryController.inv, 0, ITEMINDEX, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, -1);       
ds_grid_set_region(InventoryController.inv, 0, ITEMQTY, ds_grid_width(InventoryController.inv) - 1, ITEMQTY, 0);

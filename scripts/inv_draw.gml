///inv_draw();
draw_set_color(c_black);
draw_set_font(fMenu);
var yy = 0;
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text(window_get_width() / 2, window_get_height() / 2 - background_get_height(bMenu) / 2 + 40, "Items");
draw_set_halign(fa_left);
for(var i = 0; i < ds_grid_width(InventoryController.inv); i++) {
    if(inv_read(i, ITEMINDEX) != -1) {
        var str = string_wrap(itemdb_read(inv_read(i, ITEMINDEX), ITEMNAME) + ": " + itemdb_read(inv_read(i, ITEMINDEX), ITEMDESC), background_get_width(bMenu) - 80);
        yy += max(string_height(str), 32);
        draw_text(  window_get_width() / 2 - background_get_width(bMenu) / 2 + 64, 
                    window_get_height() / 2 - background_get_height(bMenu) / 2 + 48 + yy,
                    str);
        draw_sprite(itemdb_read(inv_read(i, ITEMINDEX), ITEMSPRITE), 0, 
                    window_get_width() / 2 - background_get_width(bMenu) / 2 + 16, 
                    window_get_height() / 2 - background_get_height(bMenu) / 2 + 16 + yy);
    }
}
draw_set_valign(fa_top);

///input_check(input);
switch(argument[0]) {
    //Some keys always work
    case UP:
        keyboard_clear(vk_up);
        break;
    case DOWN:
        keyboard_clear(vk_down);
        break;
    case LEFT:
        keyboard_clear(vk_left);
        break;
    case RIGHT:
        keyboard_clear(vk_right);
        break;
    case ACTION:
        keyboard_clear(vk_enter);
        keyboard_clear(vk_space);
        break;
    case MENU:
        keyboard_clear(vk_escape);
        break;
}
var keys;
switch(Controller.controls) {
    case "WASD QE":
        keys[CANCEL] = ord("E");
        keys[MENU] = ord("Q");
        keys[ACTION] = vk_space;
        keys[RIGHT] = ord("D");
        keys[LEFT] = ord("A");
        keys[DOWN] = ord("S");;
        keys[UP] = ord("W");
        break;
    case "ZQSD AE":
        keys[CANCEL] = ord("E");
        keys[MENU] = ord("A");
        keys[ACTION] = vk_space;
        keys[RIGHT] = ord("D");
        keys[LEFT] = ord("Q");
        keys[DOWN] = ord("S");;
        keys[UP] = ord("Z");
        break;
    case "^<v>WXC":
        keys[CANCEL] = ord("C");
        keys[MENU] = ord("X");
        keys[ACTION] = ord("W");
        keys[RIGHT] = vk_right;
        keys[LEFT] = vk_left;
        keys[DOWN] = vk_down;
        keys[UP] = vk_up;
        break;
    case "^<v>ZXC":
    default:
        keys[CANCEL] = ord("C");
        keys[MENU] = ord("X");
        keys[ACTION] = ord("Z");
        keys[RIGHT] = vk_right;
        keys[LEFT] = vk_left;
        keys[DOWN] = vk_down;
        keys[UP] = vk_up;
        break;
}
keyboard_clear(keys[argument[0]]);

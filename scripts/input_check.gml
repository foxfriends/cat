///input_check(input);
switch(argument[0]) {
    //Some keys always work
    case UP:
        if(keyboard_check(vk_up)) {
            return true;
        }
        break;
    case DOWN:
        if(keyboard_check(vk_down)) {
            return true;
        }
        break;
    case LEFT:
        if(keyboard_check(vk_left)) {
            return true;
        }
        break;
    case RIGHT:
        if(keyboard_check(vk_right)) {
            return true;
        }
        break;
    case ACTION:
        if(keyboard_check(vk_enter) || keyboard_check(vk_space)) {
            return true;
        }
        break;
    case MENU:
        if(keyboard_check(vk_escape)) {
            return true;
        }
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
return keyboard_check(keys[argument[0]]);

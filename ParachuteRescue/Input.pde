// This class handles inputs (key presses).

// Click q, w, e, r to activate/deactive the pads
// You can also use 1, 2, 3, 4
void keyPressed() {
    switch(key) {
    case '1':
        activatePad(0);
        break;
    case '2':
        activatePad(1);
        break;
    case '3':
        activatePad(2);
        break;
    case '4':
        activatePad(3);
        break;
    }
    switch(key) {
    case 'q':
        activatePad(0);
        break;
    case 'w':
        activatePad(1);
        break;
    case 'e':
        activatePad(2);
        break;
    case 'r':
        activatePad(3);
        break;
    }
    if (!gameIsActive) {
        if (key == ' ') {
            resetgame();
        }
    }
}

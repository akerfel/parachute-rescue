void drawEverything() {
    println("start drawEverthing()");
    clear();
    background(135, 206, 235);
    drawGuys();
    drawPads();
    drawHP();
    drawScore();
}

void drawHP() {
    textAlign(CENTER);
    textSize(20);
    fill(0, 0, 0);
    text("HP: " + hp, width - 100, 40);
}

void drawScore() {
    textAlign(CENTER);
    textSize(20);
    fill(0, 0, 0);
    text("Score: " + score, width - 100, 80);
}

void drawGuys() {
    for (int i = 0; i < maxGuys; i++) {
        Guy guy = guys[i];
        if (guy.active) {
            if (guy.isAlly) {
                fill(0, 200, 0);
            } else {
                fill(200, 0, 0);
            }
            rect(guy.x, guy.y, guyWidth, guyHeight);
        }
    }
}

void drawPads() {
    for (int i = 0; i < 4; i++) {
        if (pads[i].active) {
            drawPad(i, true);
        } else {
            drawPad(i, false);
        }
    }
}

void drawPad(int padIndex, boolean fillWithColor) {
    if (fillWithColor) {
        fill(139, 69, 19);
    } else {
        noFill();
    }
    rect(pads[padIndex].x, pads[padIndex].y, padWidth, padHeight);
    fill(139, 69, 19);
}

void drawGameOverScreen() {
    textSize(40);
    textAlign(CENTER);
    text("Game over. Press Space Bar to restart.", width / 2, height / 2);
}

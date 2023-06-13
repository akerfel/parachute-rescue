void createPads() {
    pads[0] = new Pad(0, width/4);
    pads[1] = new Pad(width/4, width/2);
    pads[2] = new Pad(width/2, width * 3 / 4);
    pads[3] = new Pad(width * 3 / 4, width);
}

void updateGuys() {
    updateGuysPos();
    checkGuysPadCollision();
}

void updateGuysPos() {
    for (int i = 0; i < 20; i++) {
        Guy guy = guys[i];
        if (guy.active) {
            guy.y += guy.vy;
            guy.x += guy.vx;
            // Invert x speed if outside screen
            if (guy.x < 0) {
                guy.x += 1;
                guy.vx *= -1;
            }
            if (guy.x + guyWidth > width) {
                guy.x -= 1;
                guy.vx *= -1;
            }
        }
    }
    println("done update");
}

void checkGuysPadCollision() {
    for (int i = 0; i < maxGuys; i++) {
        Guy guy = guys[i];
        if (guy.active && guy.y + guyHeight > padStartY) {
            if (guyCollidesWithSomePad(guy)) {
                if (!guy.isAlly) {  //enemy collides with pad --> take dmg
                    hp--;
                }
            } else {
                if (guy.isAlly) {  //ally does not collide with pad --> take dmg
                    hp--;
                }
            }
            score++;
            guy.active = false;
        }
    }
}

boolean guyCollidesWithSomePad(Guy guy) {
    for (int i = 0; i < 4; i++) {
        if (guyCollidesWithThisPad(guy, i)) {
            println("collide with pad " + i);
            return true;
        }
    }
    return false;
}

// i is padIndex (in array, between 0-3)
boolean guyCollidesWithThisPad(Guy guy, int i) {
    if (pads[i].active) {
        return guy.x >= pads[i].x && guy.x <= pads[i].xe;
    }
    return false;
}

void resetgame() {
    clearGuys();
    gameIsActive = true;
    hp = 3;
    score = 0;
}

void clearGuys() {
    for (int i = 0; i < maxGuys; i++) {
        guys[i].active = false;
    }
}

void activatePad(int padIndex) {
    if (pads[padIndex].active) {
        pads[padIndex].active = false;
    } else {
        pads[padIndex].active = true;
    }
}

void createGuysAfterIntervall() {
    int passedTime = millis() - savedTime;
    if (passedTime > spawnGuyAfterTime) {
        createGuy(true);
        savedTime = millis();
    }
}

// Atm using createGuysAfterIntervall instead.
void randomlyCreateGuys() {
    if (random(0, 100) < 2) {
        createGuy(true);
    }
}

void createGuy(boolean shouldBeActive) {
    boolean isAlly = true;
    if (random(0, 100) < 50) {
        isAlly = false;
    }
    Guy guy = new Guy(int(random(20, width - 20)), - guyHeight, isAlly, shouldBeActive);
    if (difficulty == 2) {
        guy.vx = random(-guyMaxVx, guyMaxVx);
    }
    addGuyToArray(guy);
}

void addGuyToArray(Guy guy) {
    lastAddedGuy++;
    if (lastAddedGuy >= maxGuys) {
        lastAddedGuy = 0;
    }
    guys[lastAddedGuy] = guy;
}

void createUnactiveGuys() {
    for (int i = 0; i < maxGuys; i++) {
        createGuy(false);
    }
}

/*
// Test mode setups
 // Spawns one guy above each pad. Two allies, two enemies
 void testSetupCreateAlliesAndEnemies() {
 guys.add(new Guy(pads[0].x + padWidth / 2, 50, true));
 guys.add(new Guy(pads[1].x + padWidth / 2, -50, true));
 guys.add(new Guy(pads[2].x + padWidth / 2, -150, false));
 guys.add(new Guy(pads[3].x + padWidth / 2, -250, false));
 }
 
 // Spawns one guy above each pad. Four allies
 void testSetupCreateOnlyAllies() {
 guys.add(new Guy(pads[0].x + padWidth / 2, 50, true));
 guys.add(new Guy(pads[1].x + padWidth / 2, -50, true));
 guys.add(new Guy(pads[2].x + padWidth / 2, -150, true));
 guys.add(new Guy(pads[3].x + padWidth / 2, -250, true));
 }
 
 // Spawns one guy above each pad. Four enemies
 void testSetupCreateOnlyEnemies() {
 guys.add(new Guy(pads[0].x + padWidth / 2, 50, false));
 guys.add(new Guy(pads[1].x + padWidth / 2, -50, false));
 guys.add(new Guy(pads[2].x + padWidth / 2, -150, false));
 guys.add(new Guy(pads[3].x + padWidth / 2, -250, false));
 }
 */

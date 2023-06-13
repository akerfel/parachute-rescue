// In this file, all global variables and declared and initialized,
// and the draw() method is defined, which is called 60 times per second.

// Cheat and test options
boolean cantLose = false;
boolean testMode = false;
boolean testModeBothAlliesAndEnemies = true;
boolean testModeOnlyAllies = false;
boolean testModeOnlyEnemies = false;

// Balacing settings
int difficulty = 2;                  // choose 1 or 2. Atm 2 will make guys move sideways while falling.
int spawnGuyAfterTime = 1000;        // ms
float guyMaxVx = 1.0;                // max horizontal speed for guys (for harder difficulties)
float guyVy = 1;                     // vertical speed for guys
int hp = 3;

// Other
int maxGuys;
Guy[] guys;
Pad[] pads = new Pad[4];
boolean gameIsActive = true;
int padHeight = 8;
int padWidth;            // init in setup()
int padStartY;           // init in setup()
int guyHeight = 15;
int guyWidth = 15;
int score = 0;
int savedTime;           // init in setup()

// For keeping track of what guy last was added. Index in guys array.
// This is to make it more similar to an arraylist.
// We can only have maxGuys guys, and if one replaces another, we want to replace
// the one that was added the longest time ago (lastAddedGuy + 1). So this should increment
// each time a guy is added, and be set to 0 when it reaches maxGuys (20 atm).
int lastAddedGuy = 0;

void setup() {
    size(800, 400);
    maxGuys = 20;
    guys =  new Guy[maxGuys];
    padStartY = height - padHeight;    // init here beacuse height must be initiated before.
    padWidth = width / 4;
    savedTime = millis();
    createPads();
    createUnactiveGuys();
}

void draw() {
    if (gameIsActive) {
        println("p2");
        updateGuys();
        println("p3");
        if (!testMode) {
            createGuysAfterIntervall();
        }
        drawEverything();
    }
    if (hp <= 0 && !cantLose) {
        gameIsActive = false;
        drawGameOverScreen();
    }
}

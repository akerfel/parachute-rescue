public class Guy {
    float x;
    float y;
    float vx = 0;
    float vy = guyVy;
    boolean isAlly;      // true for ally, false for enemy
    boolean active;

    public Guy(int x, int y, boolean isAlly, boolean active) {
        this.x = x;
        this.y = y;
        this.isAlly = isAlly;
        this.active = active;
    }
}

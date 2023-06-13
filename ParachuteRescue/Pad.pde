public class Pad {
    boolean active = false;

    int x;   // x start
    int xe;  // x end
    int y;

    public Pad(int x, int xe) {
        this.x = x;
        this.xe = xe;
        y = padStartY;
    }
}

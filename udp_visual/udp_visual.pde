// import the library
import oscP5.*;

// create the OSC receive
OscP5 oscP5;

// background image
PImage bg;
PImage texture;

// declare TrackAmp objects
TrackAmp example;

void setup() {
    // canvas setup
    size(400, 400, P2D);
    
    // different smoothing can affect latency with Ableton
    smooth(2);
    
    // initialize TrackAmp object
    // track number monitored from the available options in the Ableton plugin
    int trackNumber = 1;
    // default multiplied scaling from the amplitude sent from Ableton
    float scaleFactor = 5;
    // smooth factor creates smoother motion of objects during amplitude changes, adjust
    // according to your visual needs
    float smoothFactor = 0.5;
    example = new TrackAmp(trackNumber, scaleFactor, smoothFactor);
    
    // initialize an instance listening to port 12000, if you wish to use a different port you
    // will need to adjust the udp_send Max for Live patch
    oscP5 = new OscP5(this,12000);
}

void draw() {
    background(0);
    
    // example for using the value returned by amp() in the TrackAmp object each draw instance
    rect(100, 100, 50 + (example.amp() * 10), 50 + (example.amp() * 10));
    
}

// the oscP5 instance will call this function anytime it receives a 
// message
void oscEvent(OscMessage theOscMessage) {
    float value = theOscMessage.get(0).floatValue();
    example.checkAndSet(theOscMessage, value);
}

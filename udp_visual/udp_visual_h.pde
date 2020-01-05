class TrackAmp {
  /*
  A TrackAmp object maintains the current amplitude value of 
  a given track in an Ableton Live piece, which is being
  monitored by OSC
  */
  
  String currentTrack;
  float currentAmp;
  float scaledAmp;
  float scaleFactor;
  float smoothFactor;
  float sum;
   
  // constructor for TrackAmp
  TrackAmp(int trackIn, float scaleFactorIn, float smoothFactorIn) {
    currentTrack = "track" + trackIn;
    scaleFactor = scaleFactorIn;
    smoothFactor = smoothFactorIn;
    sum = 0;
  }
  
  // gets current amp
  float amp() {
    return scaledAmp;
  }
  
  void checkAndSet(OscMessage theOscMessage, float val) {
    String endpoint = "/" + currentTrack;
    if (theOscMessage.checkAddrPattern(endpoint)) {
        if (val > 0.03) {
            setAmp(val);
        } else {
            setAmp(0.01);
        }
    }
  }
  
  // sets amp value
  void setAmp(float newAmp) {
    currentAmp = newAmp;
    sum += (currentAmp - sum) * smoothFactor;
    scaledAmp = sum * scaleFactor;
  }
}

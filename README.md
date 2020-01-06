# Ableton/Processing Reactive Visuals
Concept for linking Ableton and Processing to create visuals for an Ableton project. Track amplitudes are monitored in a Max for Live patch and received in Processing using [UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol).

## Max for Live Patch

The [Max for Live](https://www.ableton.com/en/live/max-for-live/) patch **udp_send** can be added to any Ableton track for sending track amplitude over UDP to a port on your localhost. The patch is currently set to port 12000, however this can be edited to fit your needs. The patch does not have any effect on the audio of the track. Setting the track number through the dropdown can allow you to have multiple tracks in the same project sending to multiple endpoints of your port. Each track will be sent to the endpoint of its name, for example choosing "track1" from the dropdown will populate data at endpoint **/track1**. See the example Processing file structure for how to use this data visually.

Plugin in Ableton:

<img src="https://i.ibb.co/g48NFsX/Screen-Shot-2020-01-03-at-3-36-12-PM.png" alt="alt text" width="300">

Full plugin:

<img src="https://i.ibb.co/XksmwMN/Screen-Shot-2020-01-03-at-3-35-00-PM.png" alt="alt text" width="500">

## Processing Example
The [Processing](https://processing.org/) folder in this project serves as an example for how to use the data sent from the **udp_send** patch in Processing. Implementing `TrackAmp` objects and linking them to tracks in an Ableton project can allow for any use for amplitude values, visual or not. The project makes use of the **oscP5** library, which can be installed within the Processing IDE under *Sketch > Import Library > Add Library*.

## Special Thanks
Special thanks for the wonderful work of Corey Walo in his Medium article on Max and Processing found [here](https://medium.com/bytes-of-bits/max-facts-using-osc-to-route-max-into-processing-7635b1dba154).

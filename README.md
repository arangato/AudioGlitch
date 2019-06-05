# AudioGlitch

Demonstration of audio glitch in AVFoundation.

Repro steps:
1) Create AVCompostion with two tracks chained one after another. The tracks are identical, i.e. the same range of a single asset.
2) Play the composition.

There are clearly heard glitches during the playback of the first track.

Note: sometimes it happens on the second playback and not the first.

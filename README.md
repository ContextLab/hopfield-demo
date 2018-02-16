# Overview

Demo Hopfield network code.

# Running the demo

After cloning this repository and adding it to your MATLAB path, run the demo by typing (in the MATLAB command window):

`hopfield_simulation(D, N)` (where `D` is the number of neurons in the hopfield network and `N` is the number of memories to encode).

This will create `N` random memories (of `D` features each) and a random `D`-dimensional cue.

When you press any key, those memories will be encoded into the network (modifying the weight matrix) and the plot will be updated.

When you press any key a second time, the network will simulate "retrieval" by using aynchronous updates, starting from the cued memory state.  The simulation will stop when the network converges.

#!/bin/bash

autossh -M 0 -f -N -D 0.0.0.0:8527 -L3389:152.2.133.180:3389 -R43022:localhost:22 gb

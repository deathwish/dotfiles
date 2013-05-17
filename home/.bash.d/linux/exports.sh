#!/bin/bash

#some things mono related don't work without this
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
export PATH="${PATH}:/var/lib/gems/1.8/bin:/usr/games"
export SDL_AUDIODRIVER='alsa'

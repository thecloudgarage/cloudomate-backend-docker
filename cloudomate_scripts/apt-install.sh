#!/bin/bash

# -- jojo --
# description: echo text on the command line
# param: packagename - packagename
# -- jojo --

apt-get install $PACKAGENAME -y
echo "$PACKAGENAME INSTALLED"
exit 0

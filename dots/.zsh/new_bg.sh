#!/bin/bash

mkdir -p ~/.wallpapers
pushd ~/.wallpapers
rm ~/.wallpapers/*.png
wget -O /home/cody/.wallpapers/background.png https://source.unsplash.com/2880x1800/?nature
mogrify -format png /home/cody/.wallpapers/background.png
feh --bg-scale ~/.wallpapers/background.png
popd

# Modellib

Library of common devices for common devices


## Common names

x-Body, body for device, can be used to build x
x-Hole, object that can be substracted to perfectly fit x

x-Dummy, can be put instead of x for integrating with other devices
x-Storage, casing for device x be stored into
x-Storage-y, casing for device x be stored into of count y
x-Charger, device to charge battery of type x or for device x
x-Charger-y, device to charge battery of type x or for device x by y elements same time

x-Cap, cap for device x, small protector of fragile part


# prefixes can destenguish multiple simmilar part

Top,Bottom,Front,Rear,Left,Right - by placement
Horizontal,Vertical - by orientation
Light,Hardened - by hardness
PLA, ABS, TPU - by material

Examples

* GoPro Session 5_Storage-5-LightFlex
* Olympus BLS-5_Cap-Top

# library
* walls - make walled structure of object provided as children
* squa(x,y) - place 4 copies of object in corners of square x by y with center in current pivot
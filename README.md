# parachute-rescue
This simple game was initially created in Java/Processing, and then converted to C (not present in this repository), to be played on an arduino with four switches. 

In this game, the player needs to rescue parachuters with landing pads.

## Sketch of Arduino gameplay

![sketch](https://github.com/akerfel/parachute-rescue/assets/45148959/0594493d-5668-455a-a582-e701d955f66a)

## Arduino Video

Below is a video which shows how the pads were activated/deactivated on the arduino. The arduino model is [chipKIT Basic IO Shield](https://digilent.com/reference/chipkit_shield_basic_io_shield/refmanual).

https://github.com/akerfel/parachute-rescue/assets/45148959/310ee0c9-4d96-4093-bfb8-8e46a3267ce3

## Instructions
- Use the switches to activate/deactivate landing pads
- You receive one point for each parachuter who reaches the ground.
- You lose one HP for each a **good guy** not saved.
- You lose one HP for each a **bad guy** saved.

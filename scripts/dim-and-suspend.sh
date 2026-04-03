#!/bin/bash

dim_screen_timer=100
lock_timer=200
suspend_timer=300


swayidle -w \
    timeout "$dim_screen_timer" 'sh -c "brightnessctl -s && brightnessctl set 10%"' \
        resume 'brightnessctl -r' \
    timeout "$lock_timer" 'wlopm --off eDP-1 && swaylock -f ' \
        resume 'wlopm --on eDP-1' \
    timeout "$suspend_timer" 'systemctl suspend' \
            
    before-sleep 'swaylock -f'

    #    Source: MAN page. This  will  lock  your  screen after 300 seconds of inactivity, then turn off your displays after another 300 seconds, and turn your screens back on when resumed. It will also lock your
    #    screen before your computer goes to sleep.

    #    To make sure swayidle waits for swaylock to lock the screen before it releases the inhibition lock, the -w options is used in swayidle, and -f in swaylock.
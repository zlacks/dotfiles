#!/bin/sh

BLANK='#00000000'
WHITE='#f8f8f2'
TWILIGHT='#5F4A8B'
LILIAC='#AE81FF'
RED='#c12e49'

i3lock                          \
--nofork                        \
--insidever-color=$BLANK        \
--ringver-color=$LILIAC         \
                                \
--insidewrong-color=$BLANK      \
--ringwrong-color=$RED          \
                                \
--inside-color=$BLANK           \
--ring-color=$WHITE             \
--line-uses-ring                \
--separator-color=$WHITE        \
                                \
--verif-color=$WHITE            \
--wrong-color=$RED              \
--time-color=$WHITE             \
--date-color=$WHITE             \
--layout-color=$WHITE           \
--keyhl-color=$LILIAC           \
--bshl-color=$TWILIGHT          \
                                \
--verif-text="hmmm..."          \
--wrong-text="nope."            \
                                \
--screen 1                      \
--blur 5                        \
--clock                         \
--indicator                     \
--ring-width 8                  \
--time-str="%H:%M:%S"           \
--date-str="%A, %Y-%m-%d"       \

#!/bin/bash
#Finds the roulette dealer who was working at the casino at 11PM
grep '11' 031* |
awk '{print $1,$2,$5,$6}' |
grep -i pm >> Dealers_working_during_losses


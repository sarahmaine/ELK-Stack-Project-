#!/bin/bash
#Finds the roulette dealer who was working at the casino at 2PM
grep '02' 031* |
awk '{print $1,$2,$5,$6}' |
grep -i pm >> Dealers_working_during_losses


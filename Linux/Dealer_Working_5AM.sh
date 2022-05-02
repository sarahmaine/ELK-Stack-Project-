#!/bin/bash
#Finds the roulette dealer who was working at the casino at 5AM
grep '05' 031* |
awk '{print $1,$2,$5,$6}' |
grep -i am >> Dealers_working_during_losses


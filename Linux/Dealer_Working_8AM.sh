#!/bin/bash
#Finds the roulete dealer who was working at the casino at 8AM
grep '08' 031* |
awk '{print $1,$2,$5,$6}' |
grep -i am >> Dealers_working_during_losses


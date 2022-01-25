#!/bin/bash
# author : @anir0y
# learning during class how to block active IP connection
# testing ? ; run nmap IP -p 8080 and you shall see your IP getting blocked by this script!
echo "HoneyPot Running"

while [ 1 ]
do
        IP=`nc -lvl 8080 2>&1> /dev/null | grep from | awk -F '[] []' '{print $3;}'`
        echo $P
        iptables -A INPUT -p tcp -s $IP -j DROP
        echo $IP has been blocked
        echo "====Summery===="
        sudo iptables -L  | head -n 5
        sleep 10 
        echo "Resetting Rules"
        iptables -F
done

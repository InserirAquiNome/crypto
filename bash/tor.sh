#!/bin/bash
#
#  You can add this to your cron with
#  
#  $ crontab -e
#
#  And add this two lines
# 
#    # Run tor.sh  every 45 minutes
#    */45 * * * * export DISPLAY=:0.0 && /home/YOUR_USERNAME/tor.sh
# 
#

PROG_NAME=$(basename $0)

TOR_IP=$(torsocks elinks -dump checkip.dyndns.org)
TOR_STATUS=$(torsocks wget -qO- https://check.torproject.org/ | grep -i congratulations)
TOR_CONNECTIONS=$(netstat -punta | grep 9050 | wc -l)

if [[ -z "$TOR_IP" ]]; then
  printf "\nError getting Tor IP address"
fi

if [[ -z "$TOR_STATUS" ]]; then
  printf "\nError with Tor status!"
fi

  printf "\nYour Tor IP is:\n$TOR_IP\n$TOR_STATUS\nNumber of Tor connections: $TOR_CONNECTIONS\n"
  
  notify-send "$PROG_NAME" "$(echo -e "\nYour Tor IP is:\n$TOR_IP\n$TOR_STATUS\nNumber of Tor connections: $TOR_CONNECTIONS\n")"

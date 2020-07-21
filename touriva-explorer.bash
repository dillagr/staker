#!/usr/bin/env bash

###
### INSTRUCTIONS:
### * save this file to $HOME/.local/bin
### * run with cron (crontab -e), add this line:
###       0,30 * * * * $HOME/.local/bin/touriva-explorer.bash
###
### NOTES/COMMENTS:
### 11-28-2018 -- initially written to solve issues with AEGEUS (AEG)
### 07-21-2020 -- adapted to work with touriva (TOUR)
###

### PATH CORRECTION
export PATH=/usr/local/bin:$PATH

### HINT: tour-cli is in /usr/local/bin
###       telegram-send is in /usr/local/bin

COINCLI=$(which tour-cli)
EXPLORER="https://explorer.touriva.info"
SYSSVC="tour-masternode.service"

### DEFINE EXPLORER API CALLS
EXPHEIGHT=$( curl -s "${EXPLORER}/api/getblockcount" | grep -o '[0-9]\+' )

### EXPHEIGHT SHOULD BE NUMERIC!
if ! [[ ${EXPHEIGHT} =~ ^[0-9]+$ ]] ; then
  exit 255
fi

EXPHASHC=$( curl -s "${EXPLORER}/api/getblockhash?index=${EXPHEIGHT}" | grep -o '[a-z0-9]\+' )
EXPHASH=$( sed -e 's/^"//' -e 's/"$//' <<< $EXPHASHC )

LOCHASH=$( $COINCLI getblockhash $EXPHEIGHT )

if [ "X${LOCHASH}" == "X" ] ; then
  telegram-send -g "[TOUR] ALERT! Unable to obtain local hash @$(hostname)."
  #sudo systemctl restart ${SYSSVC}

elif [ "X${EXPHASH}" == "X" ] ; then
  telegram-send -g "[TOUR] ALERT! Unable to obtain explorer hash @$(hostname)."

elif [ "$EXPHASH" != "$LOCHASH" ] ; then
  telegram-send -g "[TOUR] ALERT! $(hostname) is on the wrong chain!"
  #sudo systemctl restart ${SYSSVC}

fi

#!/usr/bin/env bash

### PATH CORRECTION
export PATH=/usr/local/bin:$PATH

### HINT: aegeus-cli is in /usr/local/bin
###       telegram-send is in /usr/local/bin

COINCLI=$(which aegeus-cli)

EXPLORER="https://chainz.cryptoid.info/aeg/api.dws"
EXPHEIGHT=$(curl -s "${EXPLORER}?q=getblockcount")

### EXPHEIGHT SHOULD BE NUMERIC!
if ! [[ ${EXPHEIGHT} =~ ^[0-9]+$ ]] ; then
  exit 255
fi

EXPHASHC=$(curl -s "${EXPLORER}?q=getblockhash&height=${EXPHEIGHT}")
EXPHASH=$(sed -e 's/^"//' -e 's/"$//' <<< $EXPHASHC )

LOCHASH=$($COINCLI getblockhash $EXPHEIGHT)

if [ "X${LOCHASH}" == "X" ] ; then
  telegram-send "[AEG] ALERT! Unable to obtain local hash."
  sudo systemctl restart aegeus-wallet.service
  
elif [ "X${EXPHASH}" == "X" ] ; then
  telegram-send "[AEG] ALERT! Unable to obtain explorer hash."

elif [ "$EXPHASH" != "$LOCHASH" ] ; then
  telegram-send "[AEG] ALERT! You are on the wrong chain!"
  sudo systemctl restart aegeus-wallet.service

fi

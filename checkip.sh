#!/bin/sh
# Script for checking external IP and sending Pushbullet notification if changed
# Store your Pushbullet token in token.txt

PUBLICIP=$(curl -s "ipinfo.io/ip")
OLDPUBLICIP=$(cat oldip.txt)
APIKEY=$(cat token.txt)
TITLE="IP checker"
BODY="IP has changed to $PUBLICIP while old was $OLDPUBLICIP"

if [ "$PUBLICIP" != "" ]
then
echo "$PUBLICIP" > oldip.txt
if [ "$OLDPUBLICIP" != "$PUBLICIP" ]
then
curl -u $APIKEY: https://api.pushbullet.com/v2/pushes -d type=note -d title="$TITLE" -d body="$BODY"
fi
fi




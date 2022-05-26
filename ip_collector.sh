#!/bin/bash

if [ -f $RECON/$1/ip.txt ];then
	rm $RECON/$1/ip.txt
fi
touch $RECON/$1/ip.txt
echo "[+] Fetching IPs from assets..."
for i in $(cat $RECON/$1/final.txt); do nslookup $i | grep "Address" | cut -d " " -f2 | cut -d "s" -f4 >> $RECON/$1/ip;done
cat $RECON/$1/ip | cut -d ":" -f19 | anew $RECON/$1/ip.txt
rm $RECON/$1/ip
echo "[+] IPs Fetched"

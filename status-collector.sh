#!/bin/bash

echo "[+] Status Collector is runnin'..."
for i in $(cat $RECON/$1/https);do curl -I $i -s | grep "HTTP" | cut -d " " -f 2 > tmp.txt; for j in $(cat tmp.txt);do echo $j" : "$i >> $RECON/$1/status-https; done; done
for i in $(cat $RECON/$1/http);do curl -I $i -s | grep "HTTP" | cut -d " " -f 2 > tmp.txt; for j in $(cat tmp.txt);do echo $j" : "$i >> $RECON/$1/status-http; done; done
echo "[+] Boss! I have collected status of probed sites for you <3"

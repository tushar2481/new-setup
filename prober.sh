#!/bin/bash

cat $RECON/$1/final.txt | httpx -sc -title -ip -t 80 -vhost -nc -o $RECON/$1/httpx-out
cat $RECON/$1/final.txt | httprobe | anew $RECON/$1/httprobe-out
cat $RECON/$1/httpx-out | cut -d ' ' -f1 | anew $RECON/$1/httpx

echo '[+] Header Collecting...'
mkdir $RECON/$1/headers
cat $RECON/$1/httpx | fff -d 1 -S -o $RECON/$1/headers
find $RECON/$1/headers -name *.body | anew  $RECON/$1/headers/bodies.txt
find $RECON/$1/headers -name *.headers | anew  $RECON/$1/headers/headers.txt
paste $RECON/$1/headers/headers.txt $RECON/$1/headers/bodies.txt | anew $RECON/$1/headers/final.txt
cat $RECON/$1/final.txt | filter-resolved | anew $RECON/$1/filtered
echo '[+] Headers Collected'

cat $RECON/$1/httprobe-out | grep 'https://' | anew $RECON/$1/https
cat $RECON/$1/httprobe-out | grep 'http://' | anew $RECON/$1/http
rm $RECON/$1/httprobe-out
rm $RECON/$1/httpx
clear
echo '[+] Probing Process Done'

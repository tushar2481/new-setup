#!/bin/bash

if [ ! -d $RECON/$1/subdomains ];
then
	mkdir $RECON/$1/subdomains;
fi
echo "[+] Subdomains finding..."
for i in $(cat $RECON/$1/wildcards); do sublist3r -d $i -o $RECON/$1/subdomains/$i-sl; clear;done
for i in $(cat $RECON/$1/wildcards); do subfinder -d $i -o $RECON/$1/subdomains/$i-sf; clear;done
for i in $(cat $RECON/$1/wildcards); do assetfinder $i -subs-only | anew $RECON/$1/subdomains/$i-af; clear;done
for i in $(cat $RECON/$1/wildcards); do python3 /root/tools/mycollection/crtparse.py -c $1 -d $i; clear;done
echo "[+] Subdomains Found"
echo "[+] Collecting Assets..."
for i in $(cat $RECON/$1/wildcards); do cat $RECON/$1/subdomains/* | sort -u | anew $RECON/$1/tmp.txt;done
for i in $(cat $RECON/$1/wildcards); do cat $RECON/$1/tmp.txt | grep $i >> $RECON/$1/assets;done
if [ -f $RECON/$1/in-scope ];then
	cat $RECON/$1/in-scope >> $RECON/$1/assets;
fi
cp $RECON/$1/assets $RECON/$1/final.txt 
rm $RECON/$1/tmp.txt $RECON/$1/assets
echo "[+] Assets Collected"

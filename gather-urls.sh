#!/bin/bash

echo '[+] URLs Gathering...'
if [ ! -d $RECON/$1/waybackurls ];then
	mkdir $RECON/$1/waybackurls
fi
for i in $(cat $RECON/$1/final.txt); do echo $i | waybackurls | anew $RECON/$1/waybackurls/$i-wayback;done 
for i in $(cat $RECON/$1/final.txt); do gospider -s $i -t 10 -c 10 --js --robots -a -o $RECON/$1/waybackurls/$i-gospidy; done
for i in $(cat $RECON/$1/final.txt); do paste $RECON/$1/waybackurls/$i-wayback $RECON/$1/waybackurls/$i-gospidy | anew $RECON/$1/waybackurls/$i-urls; done
for i in $(cat $RECON/$1/final.txt); do sort $RECON/$1/waybackurls/$i-urls | uniq -u > $RECON/$1/waybackurls/urls-$i;done
for i in $(cat $RECON/$1/final.txt); do rm $RECON/$1/waybackurls/$i-urls $RECON/$1/waybackurls/$i-wayback $RECON/$1/waybackurls/$i-gospidy;done
for i in $(cat $RECON/$1/final.txt); do cat $RECON/$1/waybackurls/urls-$i | anew $RECON/$1/waybackurls/$i; rm $RECON/$1/waybackurls/urls-$i;done
echo '[+] URLs Gathered'

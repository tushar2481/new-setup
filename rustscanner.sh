#!/bin/bash

echo '[+] Rustscan is scanning for open ports'
for i in $(cat $RECON/$1/assets);do rustscan -a $i --ulimit 5000 -g >> portscan;done
cat portscan | sort -u > $RECON/$1/rust_out
rm portscan
echo '[+] Rustscan Done'

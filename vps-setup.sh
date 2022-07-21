#!/bin/bash

echo '[+] Welcome to VPS setup'

sudo apt update
sudo apt install git -y
sudo apt install golang -y
cp /root/.bashrc /root/.bashrc.bak
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> ~/.bashrc
mkdir $HOME/recon $HOME/tools
echo "export RECON=$HOME/recon" >> ~/.bashrc
echo "export TOOLS=$HOME/tools" >> ~/.bashrc
sudo apt install -y jq
sudo apt install -y nmap
sudo apt install -y ffuf
sudo apt install -y nikto wapiti libpcap-dev python3-pip
sudo apt install -y libcurl4-openssl-dev libssl-dev
sudo apt --purge remove python3-pycurl
sudo pip3 install pycurl wfuzz

# Golang tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo mv ~/go/bin/subfinder /usr/bin/subfinder
go install github.com/tomnomnom/assetfinder@latest
sudo mv ~/go/bin/assetfinder /usr/bin/assetfinder
go install github.com/lc/gau/v2/cmd/gau@latest
sudo mv ~/go/bin/gau /usr/bin/gau
go install github.com/tomnomnom/httprobe@latest
sudo mv ~/go/bin/httprobe /usr/bin/httprobe
go install github.com/tomnomnom/waybackurls@latest
sudo mv ~/go/bin/waybackurls /usr/bin/waybackurls
go install github.com/jaeles-project/gospider@latest
sudo mv ~/go/bin/gospider /usr/bin/gospider
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
sudo mv	~/go/bin/naabu /usr/bin/naabu
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo mv	~/go/bin/nuclei /usr/bin/nuclei
go install github.com/lc/subjs@latest
sudo mv	~/go/bin/subjs /usr/bin/subjs
go install github.com/tomnomnom/anew@latest
sudo mv ~/go/bin/anew /usr/bin/anew
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo mv ~/go/bin/httpx /usr/bin/httpx
go install -v github.com/tomnomnom/gf@latest
sudo mv ~/go/bin/gf /usr/bin/gf
go install -v github.com/lukasikic/subzy@latest
sudo mv ~/go/bin/subzy /usr/bin/subzy

# Github Cloneable tools
cd $TOOLS
git clone https://github.com/projectdiscovery/nuclei-templates.git
git clone https://github.com/OWASP/Amass.git
git clone https://github.com/lobuhi/byp4xx.git
git clone https://github.com/EnableSecurity/wafw00f.git

echo '[+] Tools are installed! Thank you ;)'

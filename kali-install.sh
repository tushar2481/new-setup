#!/bin/bash



sudo apt update
sudo echo "deb http://http.kali.org/kali kali-last-snapshot main contrib non-free" | sudo tee /etc/apt/sources.list
cp ~/.zshrc ~/.zshrc.bak
sudo apt install -y golang
echo "export GOPATH=$HOME/go" >> ~/.zshrc
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> ~/.zshrc
mkdir $HOME/recon
echo "export RECON=$HOME/recon"  >> ~/.zshrc
sudo apt install -y git
sudo apt install -y jq
sudo apt install -y whois
sudo apt install -y dnsrecon
sudo apt install -y subfinder
sudo apt install -y sublist3r
sudo apt install -y ffuf
sudo apt install -y gobuster
sudo apt install -y nikto
sudo apt install -y whatweb
sudo apt install -y eyewitness
sudo apt install -y arjun
sudo apt install -y feroxbuster
sudo apt install -y cargo
sudo apt install -y libpcap-dev
sudo apt install -y python3-pip
sudo apt install -y libcurl4-openssl-dev libssl-dev
sudo apt --purge remove python3-pycurl
sudo apt install -y lolcat
sudo pip3 install pycurl wfuzz

#Go
go install github.com/tomnomnom/assetfinder@latest
sudo mv ~/go/bin/assetfinder /usr/bin/assetfinder
go install -v github.com/hakluke/haktrails@latest 
sudo mv ~/go/bin/haktrails /usr/bin/haktrails
go install github.com/hakluke/hakrawler@latest
sudo mv ~/go/bin/hakrawler /usr/bin/hakrawler
go install github.com/lc/gau/v2/cmd/gau@latest
sudo mv ~/go/bin/gau /usr/bin/gau
sudo apt install dnsenum
go install github.com/tomnomnom/httprobe@latest
sudo mv ~/go/bin/httprobe /usr/bin/httprobe
go install github.com/tomnomnom/waybackurls@latest
sudo mv ~/go/bin/waybackurls /usr/bin/waybackurls
go install github.com/dwisiswant0/cf-check@latest
sudo mv ~/go/bin/cf-check /usr/bin/cf-check
go install github.com/yghonem14/cngo@latest
sudo mv ~/go/bin/cngo /usr/bin/cngo
go install github.com/KathanP19/Gxss@latest
sudo mv ~/go/bin/Gxss /usr/bin/Gxss
go install github.com/m4dm0e/dirdar@latest
sudo mv ~/go/bin/dirdar /usr/bin/dirdar
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
sudo mv ~/go/bin/dnsx /usr/bin/dnsx
go install github.com/tomnomnom/fff@latest
sudo mv ~/go/bin/fff /usr/bin/fff
go install github.com/jaeles-project/gospider@latest
sudo mv ~/go/bin/gospider /usr/bin/gospider
go install github.com/gwen001/github-endpoints@latest
sudo mv	~/go/bin/github-endpoints /usr/bin/github-endpoints
go install github.com/sensepost/gowitness@latest
sudo mv	~/go/bin/gowitness /usr/bin/gowitness
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
sudo mv	~/go/bin/naabu /usr/bin/naabu
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo mv	~/go/bin/nuclei /usr/bin/nuclei
go install github.com/d3mondev/puredns/v2@latest
sudo mv	~/go/bin/puredns /usr/bin/puredns
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
sudo mv	~/go/bin/shuffledns /usr/bin/shuffledns
go install github.com/lc/subjs@latest
sudo mv	~/go/bin/subjs /usr/bin/subjs
go install github.com/gwen001/github-subdomains
sudo mv	~/go/bin/github-subdomains /usr/bin/github-subdomains
go install github.com/tomnomnom/anew@latest
sudo mv ~/go/bin/anew /usr/bin/anew
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo mv ~/go/bin/httpx /usr/bin/httpx
go install github.com/tomnomnom/gf@latest
sudo mv ~/go/bin/gf /usr/bin/gf
go install -v github.com/LukaSikic/subzy@latest
sudo mv ~/go/bin/subzy /usr/bin/subzy

#folder
mkdir $HOME/tools
echo "export TOOLS=$HOME/tools" >> ~/.zshrc
cd $TOOLS
git clone https://github.com/rbsec/dnscan.git /root/tools/dnscan
git clone https://github.com/s0md3v/Corsy.git /root/tools/Corsy
git clone https://github.com/nahamsec/lazys3.git /root/tools/lazys3
git clone https://github.com/codingo/DNSCewl.git /root/tools/DNSCewl
git clone https://github.com/alone-breecher/bug_hunting.git /root/tools/bug_hunting
git clone https://github.com/projectdiscovery/nuclei-templates.git /root/nuclei-templates
git clone https://www.github.com/devanshbatham/ParamSpider /root/tools/ParamSpider
git clone https://github.com/devanshbatham/OpenRedireX /root/tools/OpenRedireX
# python3 openredirex.py -u “https://www.geeksforgeeks.org/computer-science-projects/?ref=FUZZ” -p payloads.txt –keyword FUZZ
git clone https://github.com/ProjectAnte/dnsgen /root/tools/dnsgen
git clone https://github.com/findomain/findomain.git /root/tools/findomain
git clone https://github.com/OWASP/Amass.git /root/tools/Amass
git clone https://github.com/nsonaniya2010/SubDomainizer.git /root/tools/SubDomainizer
git clone https://github.com/r00tkie/grep-pattern.git /root/tools/grep-pattern
git clone https://github.com/maurosoria/dirsearch.git /root/tools/dirsearch
git clone https://github.com/tillson/git-hound.git /root/tools/git-hound
git clone https://github.com/lobuhi/byp4xx.git /root/tools/byp4xx
git clone https://github.com/EnableSecurity/wafw00f.git /root/tools/wafw00f
git clone https://github.com/m0rtem/CloudFail.git /root/tools/CloudFail
git clone https://github.com/jaypatel131/Reconjet.git /root/tools/Reconjet
git clone https://github.com/1ndianl33t/Gf-Patterns /root/tools/Gf-Patterns
mkdir ~/.gf
mv ~/tools/Gf-Patterns/*.json ~/.gf/
git clone https://github.com/tomnomnom/gf.git /root/tools/gf
mv ~/tools/gf/examples/*.json ~/.gf
rm -r ~/tools/Gf-Patterns ~/tools/gf
#open ~/.config/haktools/haktrails-config.yml
echo "please go for documentation of haktrails because u have to add api key for this"

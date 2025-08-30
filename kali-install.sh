#!/bin/bash

echo "Starting Enhanced Bug Bounty Tools Installation..."

# Update system
apt update && apt upgrade -y

# Install essential packages
apt install -y curl wget git python3 python3-pip golang-go nodejs npm build-essential ruby-dev

# Create tools directory
mkdir -p ~/tools ~/wordlists
cd ~/tools

# Install Go tools from ProjectDiscovery
echo "Installing ProjectDiscovery tools..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/katana/cmd/katana@latest
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install -v github.com/projectdiscovery/proxify/cmd/proxify@latest
go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest

# Install other popular Go tools
echo "Installing other Go tools..."
go install -v github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/tomnomnom/httprobe@latest
go install -v github.com/tomnomnom/unfurl@latest
go install -v github.com/tomnomnom/gf@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/tomnomnom/meg@latest
go install -v github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/hakluke/hakrawler@latest
go install -v github.com/ffuf/ffuf@latest
go install -v github.com/OJ/gobuster/v3@latest
go install -v github.com/epi052/feroxbuster@latest
go install -v github.com/jaeles-project/gospider@latest
go install -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
go install -v github.com/hahwul/dalfox/v2@latest
go install -v github.com/projectdiscovery/alterx/cmd/alterx@latest
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install -v github.com/projectdiscovery/cloudlist/cmd/cloudlist@latest

# Install Python tools
echo "Installing Python tools..."
pip3 install dirsearch sqlmap arjun paramspider linkfinder uro pycryptodome requests beautifulsoup4

# Install Node.js tools
echo "Installing Node.js tools..."
npm install -g linkfinder js-beautify retire

# Install Ruby tools
echo "Installing Ruby tools..."
gem install wpscan

# Install additional system tools
echo "Installing additional tools..."
apt install -y nmap masscan amass dirb nikto whatweb wfuzz hydra john hashcat aircrack-ng jq

# Clone useful repositories
echo "Cloning useful repositories..."
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/tomnomnom/gf.git && mkdir -p ~/.gf && cp gf/examples/*.json ~/.gf/

# Download famous wordlists
echo "Downloading famous wordlists..."
cd ~/wordlists

# Assetnote wordlists
wget https://wordlists-cdn.assetnote.io/data/manual/2m-subdomains.txt
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt

# Jhaddix all.txt
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

# OneListForAll
git clone https://github.com/six2dez/OneListForAll.git

# Seclists backup (if main clone fails)
if [ ! -d "../tools/SecLists" ]; then
    git clone https://github.com/danielmiessler/SecLists.git ../tools/SecLists
fi

# Download additional useful wordlists
wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt
wget https://raw.githubusercontent.com/danielmiessler/RobotsDisallowed/master/top1000.txt

cd ~/tools

# Install LinkFinder (Python version)
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder && pip3 install -r requirements.txt && cd ..

# Install additional useful tools
git clone https://github.com/maurosoria/dirsearch.git
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r && pip3 install -r requirements.txt && cd ..

# Update nuclei templates
~/go/bin/nuclei -update-templates

# Add Go bin to PATH if not already there
if ! grep -q "export PATH=\$PATH:~/go/bin" ~/.bashrc; then
    echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
fi

# Create useful aliases
cat >> ~/.bashrc << 'EOF'

# Bug Bounty Aliases
alias ll='ls -la'
alias recon='subfinder -d $1 | httpx -silent | tee subdomains.txt'
alias fuzz='ffuf -w ~/wordlists/best-dns-wordlist.txt -u https://$1/FUZZ'
alias nucleiscan='nuclei -l subdomains.txt -t ~/nuclei-templates/'
EOF

echo "Installation completed! Please run 'source ~/.bashrc' to update PATH."
echo ""
echo "=== INSTALLED TOOLS ==="
echo "Go Tools:"
echo "- ProjectDiscovery: subfinder, httpx, nuclei, naabu, katana, chaos, dnsx, notify, interactsh-client, proxify, uncover, alterx, shuffledns, cloudlist"
echo "- TomNomNom: waybackurls, assetfinder, httprobe, unfurl, gf, anew, meg"
echo "- Others: gau, hakrawler, ffuf, gobuster, feroxbuster, gospider, crlfuzz, dalfox"
echo ""
echo "Python Tools:"
echo "- dirsearch, sqlmap, arjun, paramspider, linkfinder, uro"
echo "- LinkFinder (repo), Sublist3r"
echo ""
echo "Node.js Tools:"
echo "- linkfinder, js-beautify, retire"
echo ""
echo "Ruby Tools:"
echo "- wpscan"
echo ""
echo "System Tools:"
echo "- nmap, masscan, amass, dirb, nikto, whatweb, wfuzz, hydra, john, hashcat"
echo ""
echo "Wordlists:"
echo "- SecLists, PayloadsAllTheThings, OneListForAll"
echo "- Assetnote 2m-subdomains.txt, best-dns-wordlist.txt"
echo "- Jhaddix all.txt, fuzz.txt, robots top1000.txt"
echo ""
echo "Locations:"
echo "- Go tools: ~/go/bin/"
echo "- Python tools: System-wide"
echo "- Repositories: ~/tools/"
echo "- Wordlists: ~/wordlists/"

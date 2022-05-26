# New-setup for new kali linux setup for Bug Bounty

I have Created this repository which will be updated as to quickly make new Kali OS ready for Bug Bounty Hunting for VM, docker, WSL, cloud VMs, etc.

## How to Setup?

1 . git clone https://github.com/tushar2481/new-setup.git

2 . go to new-setup and run install.sh without sudo permission (will ask for password whenever needed to install tools)

3 . move burp files to Desktop and create burp sortcut as mentioned in readthis.md file from Drive tusharmotka24

4 . change .bash_profile with given .bash_profile file and source it

5 . configure some tools like amass with API key's of shodan, virustotal, etc.

6 . Setup Extentions in Burp & Download jython file from Drive tusharmotka24

#### Note : With new tools this repository will be up-to-date.
------------------------------------------------------------------------------------------------------------

Some New Files added for Basic Recon...
usage : setup target named folder in $RECON directory having file **wildcards**, __in-scope__ file
1 => ./subdomain-finder.sh target
2 => ./prober.sh target
3 => ./ip_collector.sh target
      Do Nmap scan manually (Bandwidth consuming...)
4 => ./gather-urls.sh target
5 => ./rustscanner.sh target
6 => ./status-collector.sh target

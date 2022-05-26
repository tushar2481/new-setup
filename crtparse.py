#!/bin/python3

import requests
import os
import argparse

ap = argparse.ArgumentParser()
ap.add_argument("-d","--domainname", required=True, help="Enter Doamin Name")
ap.add_argument("-c","--companyname", required=True, help="Enter Company Name")
args = vars(ap.parse_args())
domainname=str(args["domainname"])
companyname=str(args["companyname"])
cmd = 'touch /root/recon/'+companyname+'/subdomains/'+domainname+'-crt'
os.system(cmd)
r = requests.request('GET', 'https://crt.sh/?q='+str(domainname)+'&output=json')
data = r.json()
n = len(data)
fileoutput = '/root/recon/'+companyname+'/subdomains/'+domainname+'-crt'
cmd = 'touch '+fileoutput
os.system(cmd)
f1 = open(fileoutput,'w+')
for i in range(0,n):
    dataout = data[i]
    datajsonname = dataout['name_value']
    f1.write(str(datajsonname))
    f1.write('\n')

f1.close()

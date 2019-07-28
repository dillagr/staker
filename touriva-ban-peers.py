#!/usr/bin/env python3

# import modules
import json
import csv, re
import os, subprocess
import time

## ---> EDIT THE tour-cli PATH HERE! <---
COINCLI = '''/usr/local/bin/tour-cli'''

def ban_node(ipaddr):
  
  ## PRE-FORMAT
  ipcidr = ipaddr + '/32'
  
  ## CHANGE 90, if applicable
  DAY = 86400
  ban_time = int(time.time()) + 90*DAY  # ban for 90days

  ## EXECUTE!
  subprocess.run([COINCLI,'setban',ipcidr,'add',str(ban_time)])
  #print('Banned node:', ipaddr)


## COLLECT DATA
## --> tour-cli getpeerinfo
cliin = subprocess.run([COINCLI,'getpeerinfo'], stdout=subprocess.PIPE)
clout = cliin.stdout.decode('utf-8')

## PRE-FORMAT
clout1 = re.sub(r'^{','[', clout)
clout2 = re.sub(r'}\n}','}\n]', clout1)

js = json.loads(clout2)

for out in js:

  ## check version
  if out['subver'] != '/TOUR:1.1.0/':
    ban_node(out['addr'].split(':')[0])


##
## if you find this script useful, 
## buy me coffee with TOUR: TYDs22GP7xNvAEY3Zr5gAQeuRQoFbUQNgB
##

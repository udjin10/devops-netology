#!/usr/bin/env python3

from socket import gethostbyname as sghbn
from time import sleep as sleep
import json
import yaml


dns_ip = {'drive.google.com': '255.255.255.257',
          'mail.google.com': '255.255.255.258',
          'google.com': '255.255.255.259'
          }
i = 0   # Счетчик
while True:
    for svc in dns_ip.keys():
        old_ip = dns_ip.get(svc)
        ip = sghbn(svc)
        if ip == old_ip:
            print(svc + ' ' + ip + ' ip адрес не изменился.')
        else:
            print('[ERROR] ' + svc + ' IP mismatch: ' + old_ip + ' ' + ip)
            dns_ip.update({svc : ip})
            print(dns_ip)
            with open("dns_ip.json", "w") as fp_json:
                json.dump(dns_ip, fp_json, indent=4)
            with open("dns_ip.yaml", "w") as fp_yaml:
                yaml.dump(dns_ip, fp_yaml, explicit_start=True, explicit_end=True)
    i += 1
    if i == 20:
        break
    sleep(60)

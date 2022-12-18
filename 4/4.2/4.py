#!/usr/bin/env python3

from socket import gethostbyname as sgethostbyname
from time import sleep as sleep

dns_ip = {'drive.google.com':'255.255.255.257',
          'mail.google.com':'255.255.255.258',
          'google.com':'255.255.255.259'
          }
i = 0   # Счетчик
while True:
    for svc in dns_ip.keys():
        old_ip = dns_ip.get(svc)
        ip = sgethostbyname(svc)
        if ip == old_ip:
            print(svc + ' ' + ip + ' ip адрес не изменился.')
        else:
            print('[ERROR] ' + svc + ' IP mismatch: ' + old_ip + ' ' + ip)
    i += 1
    if i == 20:
        break
    sleep(60)
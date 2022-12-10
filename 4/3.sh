#!/usr/bin/env bash
hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
for host in "${hosts[@]}"
do
  for i in {1..5}
  do
      nc -vnzw1 $host 80
      echo $? $(date)  $host | tee -a test.log
  done
done

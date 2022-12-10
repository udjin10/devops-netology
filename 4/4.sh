#!/usr/bin/env bash
hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
for host in "${hosts[@]}"
do
  for i in {1..5}
  do
      nc -vnzw1 $host 80
      if (($? != 0))
      then
        echo  $? $(date) $host | tee -a error.log
        break 2
      else
        echo  $? $(date) $host | tee -a test.log
      fi
  done
done

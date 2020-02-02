#/bin/bash
IPS=("$@")
for ip in "${IPS[@]}"
do
  nc -w 1 -z -v $ip 80 2>&1 | grep succeeded
  nc -w 1 -z -v $ip 443 2>&1 | grep succeeded
done

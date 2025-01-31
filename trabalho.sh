#!/bin/bash

egrep -o '[01]*' bruxarias.txt > 1a.txt

egrep -o '1[01]{,7}' bruxarias.txt > 1b.txt

egrep -x '1[01]{7}' bruxarias.txt > 1c.txt

egrep -o '\b(0|[1-9][0-9]*)\b' bruxarias.txt > 1d.txt

egrep -o '[ue]tt' bruxarias.txt > 1e.txt

egrep -o '([A-Z]|[a-z])[a-zA-Z]{2,}' bruxarias.txt > 1f.txt

egrep -wo '[A-Za-z][A-Za-z0-9_]*' bruxarias.txt > 1g.txt

egrep -wo '((25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])\.){3}(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])' bruxarias.txt > 1h.txt

find /etc -type d 2> /dev/null > 2a.txt

find /etc -maxdepth 1 -type d > 2b.txt

find /etc -type f -size +1k 2> /dev/null > 2c.txt

find $HOME -type f -atime -1 2> /dev/null > 2d.txt

awk -F ':' '{print $1}' /etc/passwd > 3a.txt

awk -F ':' 'NR > 10 && NR < 20 {print $1}' /etc/passwd > 3b.txt

sed "s/^$(whoami):/exercicio:/" /etc/passwd > 4a.txt

sed "/^$(whoami):/d" /etc/passwd > 4b.txt

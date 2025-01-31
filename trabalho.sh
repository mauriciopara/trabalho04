#!/bin/bash

#questao1
egrep -o '[01]*' bruxarias.txt > 1a.txt
#questao2
egrep -o '1[01]{,7}' bruxarias.txt > 1b.txt
#questao3
egrep -x '1[01]{7}' bruxarias.txt > 1c.txt
#questao4
egrep -o '\b(0|[1-9][0-9]*)\b' bruxarias.txt > 1d.txt
#questao5
egrep -o '[ue]tt' bruxarias.txt > 1e.txt
#questao6
egrep -o '([A-Z]|[a-z])[a-zA-Z]{2,}' bruxarias.txt > 1f.txt
#questao7
egrep -wo '[A-Za-z][A-Za-z0-9_]*' bruxarias.txt > 1g.txt
#questao8
egrep -wo '((25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])\.){3}(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])' bruxarias.txt > 1h.txt
#questao9
find /etc -type d 2> /dev/null > 2a.txt
#questao10
find /etc -maxdepth 1 -type d > 2b.txt
#questao11
find /etc -type f -size +1k 2> /dev/null > 2c.txt
#questao12
find $HOME -type f -atime -1 2> /dev/null > 2d.txt
#questao13
awk -F ':' '{print $1}' /etc/passwd > 3a.txt
#questao14
awk -F ':' 'NR > 10 && NR < 20 {print $1}' /etc/passwd > 3b.txt
#questao15
sed "s/^$(whoami):/exercicio:/" /etc/passwd > 4a.txt
#questao16
sed "/^$(whoami):/d" /etc/passwd > 4b.txt

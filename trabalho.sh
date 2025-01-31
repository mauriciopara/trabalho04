#!/bin/bash

# Extrai todas as sequências de 0s e 1s do arquivo bruxarias.txt e salva em 1a.txt
egrep -o '[01]*' bruxarias.txt > 1a.txt

# Captura números binários que começam com 1 e têm até 7 bits depois, salvando em 1b.txt
egrep -o '1[01]{,7}' bruxarias.txt > 1b.txt

# Encontra linhas que contêm exatamente 8 bits binários que começam com 1 e salva em 1c.txt
egrep -x '1[01]{7}' bruxarias.txt > 1c.txt

# Localiza números inteiros válidos (sem zeros à esquerda, exceto 0 isolado) e salva em 1d.txt
egrep -o '\b(0|[1-9][0-9]*)\b' bruxarias.txt > 1d.txt

# Procura por palavras contendo "utt" ou "ett" e salva em 1e.txt
egrep -o '[ue]tt' bruxarias.txt > 1e.txt

# Encontra palavras com pelo menos três caracteres, podendo começar com maiúscula ou minúscula, e salva em 1f.txt
egrep -o '([A-Z]|[a-z])[a-zA-Z]{2,}' bruxarias.txt > 1f.txt

# Identifica identificadores de variáveis no estilo C (letras, números e _), garantindo que não comecem com números, e salva em 1g.txt
egrep -wo '[A-Za-z][A-Za-z0-9_]*' bruxarias.txt > 1g.txt

# Localiza endereços IPv4 válidos no formato xxx.xxx.xxx.xxx e salva em 1h.txt
egrep -wo '((25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])\.){3}(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])' bruxarias.txt > 1h.txt

# Lista todos os diretórios dentro de /etc, ignorando erros, e salva em 2a.txt
find /etc -type d 2> /dev/null > 2a.txt

# Lista apenas os diretórios diretamente dentro de /etc (sem recursão) e salva em 2b.txt
find /etc -maxdepth 1 -type d > 2b.txt

# Lista arquivos dentro de /etc que possuem tamanho maior que 1 KB, ignorando erros, e salva em 2c.txt
find /etc -type f -size +1k 2> /dev/null > 2c.txt

# Lista arquivos no diretório do usuário que foram acessados nas últimas 24 horas e salva em 2d.txt
find $HOME -type f -atime -1 2> /dev/null > 2d.txt

# Extrai os nomes de usuários do arquivo /etc/passwd e salva em 3a.txt
awk -F ':' '{print $1}' /etc/passwd > 3a.txt

# Lista os nomes de usuários entre as linhas 11 e 19 do arquivo /etc/passwd e salva em 3b.txt
awk -F ':' 'NR > 10 && NR < 20 {print $1}' /etc/passwd > 3b.txt

# Substitui o nome do usuário atual pelo nome "exercicio" no arquivo /etc/passwd e salva em 4a.txt
sed "s/^$(whoami):/exercicio:/" /etc/passwd > 4a.txt

# Remove a linha do usuário atual do arquivo /etc/passwd e salva em 4b.txt
sed "/^$(whoami):/d" /etc/passwd > 4b.txt


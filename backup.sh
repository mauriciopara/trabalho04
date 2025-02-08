#!/bin/bash
 
echo -e 'Iniciando Script...\n'
 
if [[ $EUID -ne 0 ]]; then

	echo 'Este script tem que ser executado pelo usuário root.'

	exit 1

fi
 
if [[ $# -ne 2 ]]; then

	echo -e "Por favor, o script deve ser executado com 2 parametros:\n\n\t$0 <pasta_origem> <pasta_destino>\n"

	exit 1

fi
 
ORIGEM="$1"

DESTINO="$2"
 
if [[ ! -d "$ORIGEM" ]]; then

	echo -e "A pasta '$ORIGEM' não existe\n"

	exit 1

fi
 
mkdir -p "$DESTINO"
 
rm -rf "$DESTINO/backup.3"

mv "$DESTINO/backup.2" "$DESTINO/backup.3" 2> /dev/null

mv "$DESTINO/backup.1" "$DESTINO/backup.2" 2> /dev/null
 
mkdir -p "$DESTINO/backup.1"

rsync -a --delete "$ORIGEM/" "$DESTINO/backup.1/"
 
if [[ $? -ne 0 ]]; then

	echo "Erro: O backup de erro"

	exit 1

fi
 
CRON_JOB="0 4 * * * /bin/bash $(realpath $0) $(realpath $ORIGEM) $(realpath $DESTINO)"
 
(crontab -l 2> /dev/null | grep -F "$CRON_JOB") || (crontab -l 2> /dev/null; echo "$CRON_JOB") | crontab -
 
echo -e "Backup realizado e agendado para execução sempre as 4h."
 

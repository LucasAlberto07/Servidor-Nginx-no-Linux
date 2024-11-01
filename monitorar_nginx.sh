#!/bin/bash
# Configuração
SERVICO="nginx"
DATA=$(date '+%Y-%m-%d %H:%M:%S')
LOG_DIR="/var/log/status_nginx"
ONLINE_FILE="${LOG_DIR}/online.log"
OFFLINE_FILE="${LOG_DIR}/offline.log"

# Cria o diretório de logs se não existir
mkdir -p "$LOG_DIR"

# Verifica se o serviço está ativo
if systemctl is-active --quiet $SERVICO; then
       	echo "$DATA - $SERVICO - ONLINE"
       	echo "$DATA - $SERVICO - ONLINE" >> "$ONLINE_FILE"
else
       	echo "$DATA - $SERVICO - OFFLINE - O nginx não está rodando"
       	echo "$DATA - $SERVICO - OFFLINE - O nginx não está rodando" >> "$OFFLINE_FILE"
fi




















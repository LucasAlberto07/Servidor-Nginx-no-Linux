Documentação de Instalação do Linux e do Servidor Nginx
1. Introdução

Esta documentação descreve o processo de instalação do sistema operacional Linux, a configuração do servidor Nginx e um script de monitoramento para verificar se o servidor está online ou offline a cada 5 minutos.
2. Pré-requisitos

    Acesso ao terminal do servidor Linux.
    Permissões de superusuário (root).
    Conexão à Internet.

3. Instalação do Linux

Se você ainda não tem o Linux instalado, você pode escolher uma distribuição popular como Ubuntu ou CentOS. Para fins de exemplo, utilizaremos o Ubuntu.
3.1. Instalando o Ubuntu

    Baixe a imagem ISO do Ubuntu no site oficial.
    Crie um pendrive bootável usando ferramentas como Rufus ou Etcher.
    Inicie o computador a partir do pendrive e siga as instruções na tela para instalar o Ubuntu.

4. Instalação do Nginx

Após a instalação do Linux, siga os passos abaixo para instalar o servidor Nginx.
4.1. Atualizando o sistema
```bash
sudo apt update
sudo apt upgrade -y
```
4.2. Instalando o Nginx

```bash
sudo apt install nginx -y
```
4.3. Iniciando e habilitando o Nginx

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```
4.4. Verificando o status do Nginx

```bash
sudo systemctl status nginx
```
Acesse http://seu_ip em um navegador para confirmar que o Nginx está funcionando.

!/bin/bash
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


5.2. Tornando o script executável

```bash
chmod +x monitor_nginx.sh
```
5.3. Executando o script em segundo plano

```bash
nohup ./monitor_nginx.sh &
```
6. Versionamento com Git

Para versionar o projeto e subir para o GitHub, siga os passos abaixo.
6.1. Inicializando um repositório Git

```bash
git init
```
6.2. Adicionando arquivos

```bash
git add monitor_nginx.sh
```
6.3. Realizando o commit

```bash
git commit -m "Adicionando script de monitoramento do Nginx"
```
```bash
git push origin master
```

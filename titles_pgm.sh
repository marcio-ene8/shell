#!/bin/bash
# sed -i -e 's/\r$//' scriptname.sh
# cotarBitcoin.sh - Verifica a última cotação do Bitcoin
#
# Site:       https://
# Autor:      Marcio Basilio
# Manutenção: Marcio Basilio
#
# ------------------------------------------------------------------------ #
#  Projeto ETL web
#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 12/04/2024, Marcio Basilio:
#       - extração dados web
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------- VARIÁVEIS ------------------------------ #
ARQUIVO_TITULOS="titulos_st3.txt"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES --------------------------------- #
# [ ! -x "$(which lynx)" ] && sudo apt install lynx -y #validar linx instalado;
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES -------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ------------------------------- #

# lynx -source http://lxer.com | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' > titulos.txt
curl http://lxer.com --output titulos.txt
grep blurb titulos.txt > titulos_st2.txt
sed 's/<div.*line">//;s/<\/span.*//' titulos_st2.txt > titulos_st3.txt

while read -r titulos_st3
do	
	echo -e "${VERMELHO}Titulo: ${VERDE}$titulos_st3" 
done < "$ARQUIVO_TITULOS"
rm titulos.txt titulos_st2.txt titulos_st3.txt
#--------------------------------------------------------------------------#
# etapas do filtro:
#1. grep blurb lxer.txt;
#2. grep blurb lxer.txt > titulos.txt;
#3. tail -n 1 titulos.txt;	
#4. tail -n 1 titulos.txt | sed 's/<div.*line">//' | sed 's/<\/span.*//' or tail -n 1 titulos.txt | sed 's/<div.*line">//;s/<\/span.*//'
#5. cat titulos.txt | sed 's/<div.*line">//;s/<\/span.*//' > title.txt;
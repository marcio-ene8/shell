#!/bin/bash
# sed -i -e 's/\r$//' scriptname.sh
# forecast_preview_df.sh - Retorna a temperatura atual de Brasilia na tela
#
# Site: https://
# Autor: Marcio Basilio
# Manutenção: Marcio Basilio
#
# ------------------------------------------------------------------------ #
# Projeto ETL clima-web/Brasilia
#
# ------------------------------------------------------------------------ #
# Histórico:
#
# v1.0.3 12/04/2024, Marcio Basilio:
# - extração dados clima-web
# ------------------------------------------------------------------------ #
# ------------------------------- VARIÁVEIS ------------------------------ #
VERSAO="v1.0.4"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES --------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES -------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ------------------------------- #
curl wttr.in/Brasilia --output clima_df.txt
grep °C clima_df.txt > forecast_df.txt
#obs_temp=$(cat forecast_df.txt | head -1 | cut -d "." -f2 | cut -d "C" -f1 | sed 's/°.*//' | xargs)
#obs_temp=$(cat forecast_df.txt | head -1 | cut -d "." -f2 | xargs)
#obs_temp=$(head -1 forecast_df.txt | sed 's/.*+//;s/(.*C//')
obs_temp=$(cat forecast_df.txt | sed 's/_.*-.//' | head -1 | xargs)
echo "temperatura atual: $obs_temp"
rm forecast_df.txt clima_df.txt
echo $VERSAO
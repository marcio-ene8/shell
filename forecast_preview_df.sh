#!/bin/bash
# sed -i -e 's/\r$//' scriptname.sh
# forecast_preview_df.sh - Retorna a temperatura atual de Brasilia
#
# Site:       https://
# Autor:      Marcio Basilio
# Manutenção: Marcio Basilio
#
# ------------------------------------------------------------------------ #
# Projeto ETL clima-web/Brasilia
#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 12/04/2024, Marcio Basilio:
#       - extração dados clima-web
# ------------------------------------------------------------------------ #
# ------------------------------- VARIÁVEIS ------------------------------ #
VERSAO="v1.0.2"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES --------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES -------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ------------------------------- #
curl wttr.in/Brasilia --output clima_df.txt
grep °C clima_df.txt > forecast_df.txt
obs_temp=$(head -1 forecast_df.txt | sed 's/.*+//;s/(.*C//')
echo "temperatura atual: $obs_temp °C"
rm forecast_df.txt clima_df.txt
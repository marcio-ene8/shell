#!/bin/bash

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_CONFIGURACAO="configuracao.cf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Não temos acesso de leitura" && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
DefParametros () {
	local parametro="$(echo $1 | cut -d = -f1)"
	local valor="$(echo $1 | cut -d = -f2)"
	
	case "$parametro" in
		USAR_CORES)			USAR_CORES="$valor"			;;
		USAR_MAIUSCULAS) 	USAR_MAIUSCULAS="$valor"	;;
	esac
}
# ------------------------------- EXECUÇÃO ----------------------------------------- #
while read -r line
do
	[ "$(echo $line | cut -c1)" = "#" ] && continue
	[ ! "$line" ] && continue
	DefParametros "$line"
done < "$ARQUIVO_DE_CONFIGURACAO"

[ $USAR_MAIUSCULAS -eq 1 ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z])"
[ $USAR_CORES -eq 1 ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo "$MENSAGEM"
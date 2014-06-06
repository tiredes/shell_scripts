#!/bin/bash
#Script para recuperar acesso a arquivo .zip com senha utilizando o 7z por meio de dicionário
#Crie um arquivo contendo as possiveis senhas com o nome "senha"
#Nomeie o arquivo a ser recuperado para arq.zip
#Instale o 7z => apt-get install p7zip
#Dê permissão de leitura e escrita => chmod 755 openzip.sh

which 77z >& /dev/null
vr=$?

if [ $vr == 0 ]; then
echo "[OK] Utilitário 7z instalado"
else
echo "[erro] Utilitário 7z não está instalado"
echo "[erro] Instale o pacote p7zip"

fi


np=$(wc senha | cut -c1-6)
c=1
while [ $c -le $np ]
do
        ps=$(head -n $c senha | tail -n 1) 
	#echo "Tentativa $ps"
	#unzip -P $ps arq.zip >& /dev/null	
	7z e arq.zip -p$ps -y >& /dev/null
  
	if [ $? -eq 0 ]; then
	echo "Senha Localizada!"
	sd=$ps	
	fi

((c++))

done

echo "Senha do arquivo: $sd"
sleep 1
echo "Extraindo arquivo..."
7z e arq.zip -p$sd -y >& /dev/null

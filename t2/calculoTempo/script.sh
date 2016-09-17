#!/bin/bash

qtdRodadas=40

# Exclui dados antigos
rm semParelismo.txt 
rm comParelismo.txt
rm comParelismoSemCriacao.txt

# Execucao sem paralelismo
i=1
tempoTotal=0
echo "Execucao Sem paralelismo"
while test $i -le $qtdRodadas 
do
	echo "Execucao numero: " $i
	./kfsFunctions
	tempo=`cat temp.txt | awk '{print $1}'`
	tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
	echo $tempo >> semParelismo.txt
	i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  semParelismo.txt

# Execucao com paralelismo
i=1
tempoTotal=0
echo "Execucao com paralelismo"
while test $i -le $qtdRodadas 
do
	echo "Execucao numero: " $i
	./kfsFunctionsParalelizado
	tempo=`cat temp.txt | awk '{print $1}'`
	tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
	echo $tempo >> comParelismo.txt
	i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  comParelismo.txt

# Execucao com paralelismo (Exceto na criacao das matrizes)
i=1
tempoTotal=0
echo "Execucao com paralelismo (Exceto na criacao das matrizes)"
while test $i -le $qtdRodadas 
do
	echo "Execucao numero: " $i
	./kfsFunctionsSemCriacao
	tempo=`cat temp.txt | awk '{print $1}'`
	tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
	echo $tempo >> comParelismoSemCriacao.txt
	i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  comParelismoSemCriacao.txt


## Cricao matrizes md
echo "# Matrizes comparando tempo médio com e sem paralelismo" > README.md
echo "Comparação dos resultados executando com três tipos de execuções:" >> README.md
echo " - Sem paralelismo: execução sequencial;" >> README.md
echo " - Com paralelismo (Completo): execução com paralelismo openMP;" >> README.md
echo " - Com paralelismo: execução com paralelismo, porém, a parte de criação das matrizes de entrada não é paralelizada." >> README.md
echo " " >> README.md

echo "| Sem Paralelismo | Com Paralelismo (Completo) | Com Paralismo" >> README.md
echo "|---|---|---|" >> README.md

#sParalelismo=`cat semParalelismo.txt | wc -l`
#cParalelismoCompleto=`cat comParelismo.txt | wc -l`
#cParalelismo=`cat semParalelismoSemCriacao.txt | wc -l`

i=1
controle=`expr $qtdRodadas + 1`
# Variavel controle pois, tambem eh salvo a media no mesmo arquivo
while test $i -le $controle
do
	sP=`cat semParelismo.txt | head -$i | tail -n1`
	cPc=`cat comParelismo.txt | head -$i | tail -n1`
	cP=`cat comParelismoSemCriacao.txt | head -$i | tail -n1`

	echo "|" $sP " |" $cPc " |" $cP " |" >> README.md
	i=`expr $i + 1`
done

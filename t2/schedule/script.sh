#!/bin/bash

qtdRodadas=20

# Exclui arquivos
rm semScheduler.txt
rm Static.txt
rm Dynamic.txt
rm Guided.txt

# Execucao sem setar scheduler
i=1
tempoTotal=0
echo "Execucao Sem Scheduler"
while test $i -le $qtdRodadas 
do
	echo "Execucao numero: " $i
	./kfsFunctions
	tempo=`cat temp.txt | awk '{print $1}'`
	tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
	echo $tempo >> semScheduler.txt
	i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  semScheduler.txt

# Execucao com Static
i=1
tempoTotal=0
echo "Execucao com Static"
while test $i -le $qtdRodadas 
do
	echo "Execucao numero: " $i
	./kfsFunctionsStatic
	tempo=`cat temp.txt | awk '{print $1}'`
	tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
	echo $tempo >> Static.txt
	i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  Static.txt

# Execucao com Dynamic
i=1
tempoTotal=0
echo "Execucao com Dynamic"
while test $i -le $qtdRodadas 
do
	echo "Execucao numero: " $i
	./kfsFunctionsDynamic
	tempo=`cat temp.txt | awk '{print $1}'`
	tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
	echo $tempo >> Dynamic.txt
	i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  Dynamic.txt

# Execucao com Guided
i=1
tempoTotal=0
echo "Execucao com Guided"
while test $i -le $qtdRodadas 
do
        echo "Execucao numero: " $i
        ./kfsFunctionsGuided
        tempo=`cat temp.txt | awk '{print $1}'`
        tempoTotal=$(echo $tempo $tempoTotal | awk '{print $1 + $2}')
        echo $tempo >> Guided.txt
        i=`expr $i + 1`
done
tempoMedio=$(echo $tempoTotal $qtdRodadas | awk '{print $1 / $2}')
echo "Tempo medio: " $tempoMedio >>  Guided.txt


## Cricao matrizes md
echo "# Matrizes comparando tempo médio com diferentes tipos de escalonadores" > README.md
echo "Comparação com diferentes tipos de configurações no escalonador:" >> README.md
echo " - Sem setar o escalonador;" >> README.md
echo " - Escalonador STATIC: Divide em tamanhos iguais, caso utilizar chunksize o escalonador divide as iterações em partes iguais ou quase iguais;" >> README.md
echo " - Escalonador DYNAMIC: também é possível dividir utilizando chunksize, e é atribuido para as threads uma politica first-come-first-served;" >> README.md
echo " - Escalonador GUIDED: Similar ao Dynamic, porém os pedaços do código são grandes e tornam-se pequenos exponencialmente;" >> README.md
echo " " >> README.md

echo "| Sem Setar | STATIC | DYNAMIC | GUIDED" >> README.md
echo "|---|---|---|---|" >> README.md

#sParalelismo=`cat semParalelismo.txt | wc -l`
#cParalelismoCompleto=`cat comParelismo.txt | wc -l`
#cParalelismo=`cat semParalelismoSemCriacao.txt | wc -l`

i=1
controle=`expr $qtdRodadas + 1`
# Variavel controle pois, tambem eh salvo a media no mesmo arquivo
while test $i -le $controle
do
	sem=`cat semScheduler.txt | head -$i | tail -n1`
	static=`cat Static.txt | head -$i | tail -n1`
	dynamic=`cat Dynamic.txt | head -$i | tail -n1`
	guided=`cat Guided.txt | head -$i | tail -n1`

	echo "|" $sem " |" $static " |" $dynamic " |" $guided " | " >> README.md
	i=`expr $i + 1`
done

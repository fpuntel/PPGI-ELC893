# Matrizes comparando tempo médio com diferentes tipos de escalonadores
Comparação com diferentes tipos de configurações no escalonador:
 - Sem setar o escalonador;
 - Escalonador STATIC: Divide em tamanhos iguais, caso utilizar chunksize o escalonador divide as iterações em partes iguais ou quase iguais;
 - Escalonador DYNAMIC: também é possível dividir utilizando chunksize, e é atribuido para as threads uma politica first-come-first-served;
 - Escalonador GUIDED: Similar ao Dynamic, porém os pedaços do código são grandes e tornam-se pequenos exponencialmente;
 
| Sem Setar | STATIC | DYNAMIC | GUIDED
|---|---|---|---|
| 18.0319996  | 17.4680004  | 17.4839993  | 17.5799999  | 
| 18.0680008  | 17.4799995  | 18.5559998  | 17.5559998  | 
| 18.0359993  | 17.6119995  | 18.4839993  | 17.4880009  | 
| 17.9799995  | 17.5799999  | 18.6119995  | 17.4759998  | 
| 17.7119999  | 17.6240005  | 18.8920002  | 17.6679993  | 
| 18.6040001  | 17.5559998  | 18.4799995  | 17.6119995  | 
| 18.5879993  | 17.5760002  | 18.8519993  | 17.5440006  | 
| 17.5160007  | 18.1959991  | 18.8759995  | 17.5559998  | 
| 17.9960003  | 17.6520004  | 17.5079994  | 17.5879993  | 
| 17.9799995  | 17.5919991  | 17.4599991  | 17.7159996  | 
| 17.9080009  | 17.5520000  | 17.8360004  | 17.5639992  | 
| 17.9039993  | 18.9640007  | 17.8719997  | 18.6520004  | 
| 17.8999996  | 18.8959999  | 17.7399998  | 18.6000004  | 
| 17.9239998  | 18.4720001  | 17.7479992  | 18.5240002  | 
| 17.9400005  | 18.5720005  | 18.2199993  | 18.4239998  | 
| 17.8959999  | 18.5520000  | 17.9279995  | 17.4599991  | 
| 18.1280003  | 18.4480000  | 17.8759995  | 18.5760002  | 
| 18.0680008  | 18.4960003  | 17.7959995  | 17.7239990  | 
| 17.7040005  | 18.4799995  | 18.0000000  | 18.6159992  | 
| 17.5079994  | 18.4960003  | 17.8519993  | 18.4319992  | 
| Tempo medio: 17.9696  | Tempo medio: 18.0632  | Tempo medio: 18.1036  | Tempo medio: 17.9178  | 

## Analise escalonadores no Intel Vtune

O Intel Vtune foi utilizado para análise do uso da CPU e a carga de trabalho de cada thread.

Número de CPUs utilizada:

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/schedule/imagens/CPUDynamic.png)
<p align="center">Figura 1.  Uso CPU com Dynamic</p>

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/schedule/imagens/CPUGuided.png)
<p align="center">Figura 2.  Uso CPU com Guided</p>

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/schedule/imagens/CPUStatic.png)
<p align="center">Figura 3.  Uso CPU com Static</p>

Carga de trabalho de cada thread:

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/schedule/imagens/PlatformDynamic.png)
<p align="center">Figura 4.  Carga de trabalho de cada thread com Dynamic</p>

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/schedule/imagens/PlatformGuided.png)
<p align="center">Figura 5.  Carga de trabalho de cada thread com Guided</p>

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/schedule/imagens/PlatformStatic.png)
<p align="center">Figura 6.  Carga de trabalho de cada thread com Static</p>

*Projeto para rodar no Intel Vtune: Schedule.tar.gz

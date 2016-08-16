# Programa de Pós-Graduação em Informática 
### ELC893 - PROGRAMAÇÃO DE ALTO DESEMPENHO
### Fernando Emilio Puntel

Para realização do presente trabalho, foram disponiblizados alguns exemplos de códigos utilizando opemMP (do inglês, *Open Multi-Processing*) para executação e avaliação de desempenho em um cluster. OpenMP é uma API (do inglês, *Application Programming Interface*), onde é possível programar multi-processo com memória e processamento compartilhado (CHANDRA, 2001). 

### Programa Escolhido
Como estudo de caso, foi escolhido o código de *quicksort* do link OmpSCR (OMPSCR, 2016). *Quicksort* é um dos métodos mais eficazes para ordenamento de dados, e utiliza o método de divisão e conquista , neste caso a estratégia consiste em organizar as chaves de modo que as menores precedam as chaves maiores.

*Quicksort* é um algortmo, cujo, possuí tempo de execução *O(n²)* no pior caso, sobre uma sequência de *n* números. Apesar de possuir um tempo mutio ruim para o pior caso, o *quicksort* acaba se destacando, pois seu tempo médio de ordenação é muito próximo ao seu melhor tempo (OTT, 2015)

### Desempenho
Para análise de desempenho, o código escolhido foi executado em um nó de um cluster do Centro Regional Sul do Instituto Nacional de Pesquisas Espaciais. A configuração foi do nó de processamento é a seguinte:

- 2 processadores com 4 núcleos cada do modelo AMD Opteron(tm) Processor 254;
- 72 GB de memória RAM;

A análise foi realizada de uma forma que seria possível avaliar o *quicksort* utilizado 1, 2 e 4 threads para resolver o problema, com 9437184 elementos em um vetor para ordenação, estes valores são gerados de forma aleatória. 

Em cada execução, eram ordenados 10 vetores com entradas diferentes, afim de ter uma melhor resultado, este procedimento de ordenação foi repetido 15 vezes em cada um dos casos (1, 2 e 4 threas), ao final é feito a média dos tempos.

A tabela abaixo ilustra os tempos de todas as 15 execuções em cada um dos casos.

1 Thread  | 2 Threads | 4 Threads
------------- | ------------- | -------------
70.424613  | 58.855151  |58.906885
70.786347  | 58.912920  |59.092519
70.512527  | 58.707550  |58.951531
70.466268  | 59.060843  |58.901190
70.607085  | 58.691983  |58.978225
70.784031  | 58.944744  |58.733321
70.475557  | 58.746033  |58.826793
70.619482  | 59.028434  |58.849688
70.626094  | 58.93407   |58.852115
70.790501  | 58.916890  |59.245290
70.588980  | 58.738648  |58.802226
70.579084  | 58.916195  |58.976941
70.651364  | 59.117317  |58.925588
70.546161  | 58.842551  |59.006204  
70.757126  | 58.842958  |58.941914

A tabela abaixo, ilustra a média dos tempos das execuções e o cálculo de *speedup*. O calculo de *speedup* é realizado da seguinte forma: tempo da execução sem melhorias (Neste caso com 1 thread) / tempo da execução com melhoria. 

Legenda| 1 Thread  | 2 Threads | 4 Threads
-------------| ------------- | ------------- | -------------
Tempo | 70.612348  | 58.883752  | 58.39933
Speedup | 1  | 1.19918  | 1.20912
A análise completa dos resultados e do código utilizado será feito na próxima seção.

### Análise
Com os resultados obtidos é visto que o experimento com 2 threads teve uma melhora de apenas 16,6% e com 4 threads a melhor foi de aproximadamente 17,3%, isso significa que mesmo que colocarmos o número de 2 para 4 threas, o resultado não será expressivo. 

Uma das possíveis razões para o código *quicksort* não obter um melhor desempenho utilizando uma quantidade maior de threads, deve-se ao fato de como o método de ordenação é implementado, sendo que, em trabalhos como Al-Dabbagh e Barnouti (2016) obtiveram resultados positivos de *speedup* avaliando o mesmo método de ordenação. 

Outra das possíveis causas destes resultados, é controle do balanceamento de carga do *openMP*. Também é preciso observar o controle de granularidade, Silva (2011) apresenta experimentos utilizando um novo controle de granularidade para o *quicksort*, onde relata que em diversos casos, sem o controle de granularidade, fica evitente que o *speedup* é elevado. 

Devido a busca pelo pivô central de cada grupo de dados e união dos resultados de cada thread serem feita pelo código principal, e somente a ordenação de um grupo de dados thread, o ganho realmente não será expressivo.

###  Referências

AL-DABBAGH, Sinan Sameer Mahmood; BARNOUTI, Nawaf Hazim. Parallel Quicksort Algorithm using OpenMP. International Journal Of Computer Science And Mobile Computing, India, v. 5, n. 6, p.372-382, jun. 2016

CHANDRA, Rohit. Parallel programming in OpenMP. Morgan Kaufmann, 2001.

OMPSCR. OmpSCR: OpenMP Source Code Repository. Disponível em: <https://sourceforge.net/projects/ompscr/>. Acesso em: 12 ago. 2016.

OTT, Laurent. QuickRanking: Fast Algorithm For Sorting And Ranking Data. 2015.

SILVA, Márcio de Oliveira da. Controle de granularidade de tarefas em OpenMP. 2011. 66 f. TCC (Graduação) - Curso de Ciências da Computação, Universidade Federal do Rio Grande do Sul, Porto Alegre, 2011. Disponível em: <http://www.lume.ufrgs.br/handle/10183/36925>. Acesso em: 14 ago. 2016.



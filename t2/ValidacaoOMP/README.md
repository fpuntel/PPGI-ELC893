# Avaliação do OpenMP

Foram realizado dois experimentos, o primeiro uma execução sequencial e após os resultados obtidos, foi realizada uma nova execução paralelizada com openMP. A intenção é avaliar, se em algum momento a paralelização openMP iria influênciar nas matrizes finais. Para ter certeza que todas as entradas de dados fossem iguais, a construção das matrizes uGl, vGl e qGl não foram paralelizadas e foram utilizado a mesma semente para a geração randômica de dados, em ambos os experimentos foram utilizados matrizes 100x100.

As matrizes resultantes (uGl e vGl) foram salvas em arqivos de texto e após isso, carregadas e plotadas em gráficos no octave. Abaixo ilustrado as matrizes uGl e vGl em execução sequencial. 

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/uGlSem.png)
<p align="center">Figura 1. Matriz uGl sem paralelizacao</p>
<br>
![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/vGlSem.png)
<p align="center">Figura 2. Matriz vGl sem paralelizacao</p>
Agora ilustrado abaixo, as matrizes utilizado openMP

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/uGlCom.png)
<p align="center">Figura 3. Matriz uGl com paralelizacao</p>
<br>
![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/vglCom.png)
<p align="center">Figura 4. Matriz vGl com paralelizacao</p>

Com os resultados obtidos, visualmente é possível observar que a paralelização está funcioanndo perfeitamente e não está comprometendo o resultado final.

# Atualização dos resultados obtidos

Para comprovação dos resultados obtidos, foi aplicado a técnica l^2 norm, que é conhecida como mínimos quadrados. Basicamente, é minimizar a soma dos quadrados das diferenças.

Resultados obtidos:

norm(uGl - uGlParalelizado): 7.3100e-07

norm(vGl - vGlParalelizado): 9.3200e-07


## Explicação dos arquivos
 	- kfsFunctions.f90: código sem paralelização
 	- kfsFunctions_v2.f90: código com paralelização
 	- plotarGraficos.m: arquivo para plotar gráficos no octave
 	- uGl.txt: matriz final uGl sem paralelismo
 	- uGlParalelizado.txt: matriz final uGl com paralelismo
 	- vGl.txt: matriz final vGl sem paralelismo
 	- vGlParalelizado.txt: matriz final vGl com paralelismo
 	- Arquivos .png: imagens resultantes
 	- Arquivos .txt: valores finais da matrizes
  
# Compilação dos arquivos

gfortran -fopenmp -o kfsFunctions kfsFunctions.f90

gfortran -fopenmp -o kfsFunctions_v2 kfsFunctions_v2.f90

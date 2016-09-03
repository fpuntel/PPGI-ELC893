# Avaliação do OpenMP
Foram realizado dois experimentos, primeiro foi realizado uma execução sequencial e após os resultados obtidos, foi realizada uma nova execução paralelizada com openMP. Para ter certeza que todas as entradas de dados fossem iguais, a construção das matrizes uGl, vGl e qGl não foram paralelizadas e foram utilizado a mesma semente para a geração randômica de dados, em ambos os experimentos foram utilizados matrizes 100x100.

As matrizes resultantes (uGl e vGl) foram salvas em arqivos de texto e após iso, carregadas e plotadas em gráficos no octave (arquivo plotarGraficos.m). Abaixo ilustrado as matrizes uGl e vGl em execução sequencial. 

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/uGlSem.png)
<p align="center">Matriz uGl sem paralelizacao</p>
<br>
![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/vGlSem.png)
<p align="center">Matriz vGl sem paralelizacao</p>
Agora ilustrado abaixo, as matrizes utilizado openMP

![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/uGlCom.png)
<p align="center">Matriz uGl com paralelizacao</p>
<br>
![Alt Text](https://github.com/fpuntel/PPGI-ELC893/blob/master/t2/ValidacaoOMP/vglCom.png)
<p align="center">Matriz vGl com paralelizacao</p>

Com os resultados obtidos, é possível observar que a paralelização está funcioanndo perfeitamente e não está comprometendo o resultado final.

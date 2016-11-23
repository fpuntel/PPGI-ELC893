# Experimento com inversão de matriz

Primeiramente foram desenvolidos dois códigos para inversão de matriz, no octave, onde é criada a matriz, salva em um arquivo de texto e por último feito a inversão, e o outro código em Fortran, utilizando a biblioteca LAPACK, onde carrega a matriz e realiza a inversão. A matriz utilizada é uma matriz 1000x1000, com valores randômicos entre -1 e 1. Também foi desenvolvido um código na linguagem C, porém, não obteve resultados satisfatórios nos experimentos iniciais.
																																																
Foram realizados dois experimentos, vale ressaltar, que em cada nova rodada é gerado uma nova matriz para ser invertida. 

## Primeiro experimento

### Elementos da diagonal principal

O primeiro experimento é calculado a matriz identidade e o erro quadrático médio dos elementos na diagonal principal e os elementos fora da diagonal principal. Este experimento foi realizado 10 vezes, para tenha mais confiabilidade no resultado.

| RODADA | OCTAVE | FORTRAN |
|---|---|---|---|
| 1  | 7.6469e-17 | 2.1752e-03  | 
| 2  | 7.8027e-17 | 2.5329e-03  | 
| 3  | 7.5698e-17 | 2.7428e-03  |
| 4  | 7.9746e-17 | 2.7406e-03  |
| 5  | 7.9167e-17 | 2.1284e-03  |
| 6  | 7.9554e-17 | 2.0124e-03  |
| 7  | 7.9068e-17 | 2.3414e-03  |
| 8  | 7.7526e-17 | 1.5908e-03  |
| 9  | 7.7860e-17 | 3.5026e-03  |
| 10  | 7.7416e-17 | 2.1620e-03  |

### Elementos fora da diagonal principal

| RODADA | OCTAVE | FORTRAN |
|---|---|---|---|
| 1  | 4.8600e-19  | 8.4483e-06  | 
| 2  | 4.7681e-19  | 1.4882e-05  | 
| 3  | 4.6823e-19  | 1.9067e-05  | 
| 4  | 4.9543e-19  | 1.4869e-05  | 
| 5  | 4.8439e-19  | 9.3365e-06  |
| 6  | 4.8189e-19  | 9.4835e-06  |
| 7  | 4.9762e-19  | 1.1465e-03  |
| 8  | 4.5190e-19  | 6.8815e-06  |
| 9  | 4.7545e-19  | 2.0693e-03  |
| 10  | 5.0475e-19 | 9.3594e-06  |

## Segundo experimento

Neste experimento, foi obtido o resultado de 6 pontos de amostra na matriz resultante, este experimento foi realizado 5 vezes.

### Amostra de dados
| POSIÇÃO MATRIZ (RODADA) | OCTAVE | FORTRAN |
|---|---|---|---|
| 5x5 (1)  | 48.171  | 47.730  | 
| 50x50 (1)  | 33.778  | 33.250  | 
| 89x89 (1)  | 46.360  | 46.440  | 
| 240x240 (1)  | 34.674  | 34.450  | 
| 501x501 (1) | 48.171  | 37.680  | 
| 880x880 (1)  | 35.461  | 35.502  | 

| POSIÇÃO MATRIZ (RODADA) | OCTAVE | FORTRAN |
|---|---|---|---|
| 5x5 (2)  | 47.972  | 45.750  | 
| 50x50 (2)  | 35.451  | 35.266  | 
| 89x89 (2)  | 32.129  | 32.732 | 
| 240x240 (2)  | 38.205  | 37.245  | 
| 501x501 (2) | 47.972  | 39.179 | 
| 880x880 (2)  | 32.940  | 33.229  | 

| POSIÇÃO MATRIZ (RODADA) | OCTAVE | FORTRAN |
|---|---|---|---|
| 5x5 (3)  | 32.675 | 32.900  | 
| 50x50 (3)  | 44.571  | 39.106  | 
| 89x89 (3)  | 31.622  | 31.614 | 
| 240x240 (3)  | 40.566  | 40.309  | 
| 501x501 (3) | 32.675  | 38.095 | 
| 880x880 (3)  | 40.417  | 39.893  | 

| POSIÇÃO MATRIZ (RODADA) | OCTAVE | FORTRAN |
|---|---|---|---|
| 5x5 (4)  | 37.678 | 37.597  | 
| 50x50 (4)  | 27.282  | 27.226  | 
| 89x89 (4)  | 41.498  | 39.270 | 
| 240x240 (4)  | 42.604  | 42.524  | 
| 501x501 (4) | 37.678  | 41.084 | 
| 880x880 (4)  | 33.491  | 34.960  | 

| POSIÇÃO MATRIZ (RODADA) | OCTAVE | FORTRAN |
|---|---|---|---|
| 5x5 (5)  | 36.723 | 36.724  | 
| 50x50 (5)  | 31.606  | 31.503  | 
| 89x89 (5)  | 37.435  | 37.200 | 
| 240x240 (5)  | 38.509  | 38.638  | 
| 501x501 (5) | 36.723  | 41.486 | 
| 880x880 (5)  | 29.492  | 29.312  | 

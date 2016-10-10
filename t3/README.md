# Estudo de bibliotecas matemáticas 

#### Softwares disponíveis (Fazer tabela comparativa):
 - LAPACK (Linear Algebra PACKage) -  http://www.netlib.org/lapack/
 - PLASMA (Parallel Linear Algebra Software for Multicore Architectures) - https://bitbucket.org/icl/plasma
 - ATLAS (Automatically Tuned Linear Algebra Software) - http://math-atlas.sourceforge.net/
 - ScaLAPACK (Scalable Linear Algebra PACKage) - http://www.netlib.org/scalapack/
 - BLAS (Basic Linear Algebra Subprograms) - http://www.netlib.org/blas/

### Explicação
LAPACK: escrito em Fortran 90 e fornece rotinas para resolver sistemas de simulações com equações lineares, minimos quadradso de equações lineares, etc. O principal objetivo do projeto LAPACK é fazer as bibliotecas EISPACK e LINPACK executarem de forma eficientemente com vetores de memória compartilhada e com processadores paralelos. LINPACK e EISPACK são inificiêntes porque o padrão de acesso à memória despreza a hierarquia de memória nas máquinas. As rotinas LAPACK são escritas de froma que é possível realizar o cálculo chamando Basic Linear Algebra Subprograms (BLAS).

PLASMA: Biblioteca para Fortran e C, projetado para ser eficiênte em cores homogêneas. Utiliza escalonamento simples mas ainda eficiênte para framework de aplicações com algebra. Plasma é uma reimplmenetação do Lapack e Scalapack para arquiteturas multicore. Plasma exporta paralelismo em nível de forma de thread. 

ScaLAPACK: é uma biblioteca de alta performace usada em rotinas de algebra linear para máquinas com memória distribuida uitlizada por programação paralela.
 
### Material para referência 
Material para ler e realizar consultas.

##### Artigos
 - Parallel Out-of-Corte Matrix Inversion - http://lara.inist.fr/bitstream/handle/2332/784/RR2002-04.pdf?sequence=1
	- Implementado utilizando biblioteca ScaLAPACK. 
	- Apresentação: http://datasys.cs.iit.edu/events/MTAGS11/s04.pdf
 - High Performance Matrix Inversion Based on LU Factorization for Multicore Architectures- http://www.netlib.org/utk/people/JackDongarra/PAPERS/High-Performance-Matrix-Inversion-Based-on-LU-Factorization.pdf
	- Implementado utilizando biblioteca LAPACK. 
 - High Performance Matrix Inversion on a Multi-core Platform with Several GPUs - http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=5738989
	- Implmentado utilizando bibliote LAPACK, mas utiliza GPU.
 - Numerical Linear Algebra on Emerging Architectures: the PLASMA and MAGMA Projects : http://icl.cs.utk.edu/news_pub/submissions/plasma-scidac09.pdf
	- Comparação Magma e Plasma.

##### Apresentações
 - High Performance Matrix Inversion on a Multi-core Platform with Several GPUs - http://www.hpca.uji.es/ficheros/remon/pdp11.pdf
	- Implementado utilizando LAPACK.
 - Getting started with ATLAS, BLAS and LAPACK - http://www.lindonslog.com/programming/atlas-blas-lapack-linear-algebra-libraries/
	- Exemplo de implementação em C.
 - BLAS, LAPACK  BLACS, PBLAS, ScaLAPACK  RECSY, SCASY  PLASMA, MAGMA: https://www8.cs.umu.se/kurser/5DV050/VT13/hpc.pdf

##### Fóruns
 - http://stackoverflow.com/questions/10025866/parallel-linear-algebra-for-multicore-system
 - http://stackoverflow.com/questions/11230067/large-matrix-inversion
 - Example: http://stackoverflow.com/questions/28057585/blas-atlas-lapack-shared-library-minimal-example

#### Implementações
 - Plasma:
	- http://icl.cs.utk.edu/plasma/docs/example__dgeqrf_8c.html
	- https://github.com/irfu/whamp/blob/master/src/typin.f90

##### Observações
 - Compiladores 90 aceitam códigos baseados em compiladores mais antigos (FORTRAN N77 e FORTRAN 77).
 

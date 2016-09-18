# Codigo ira plotar dados resultantes do codigo fortran
# com e sem paralelizacao
# Autor: Fernando Emilio Puntel

# Plot sem paralelizacao
 load uGl.txt;
 who;            
 uGl;

# Plot com paralelizacao
 load uGlParalelizado.txt;
 who;            
 uGlParalelizado;
 
 
 figure(1)
  clf ()
 plot(uGl, '+')
  plot(uGlParalelizado, '*')
title('uGl sem e com paralelizacao | Matriz 100 x 100')
  
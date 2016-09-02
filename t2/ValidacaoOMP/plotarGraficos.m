# Codigo ira plotar dados resultantes do codigo fortran
# com e sem paralelizacao
# Autor: Fernando Emilio Puntel

# Plot sem paralelizacao

 load uGl.txt;
 who;            
 uGl;
 figure(1)
 clf ()
 plot(uGl)
title('uGl sem paralelizacao | Matriz 100 x 100')
  
 hold off
load vGl.txt;
who;            
vGl;
 figure(2)
plot(vGl)
title('vGl sem paralelizacao | Matriz 100 x 100')

# Plot com paralelizacao
hold off
 load uGlParalelizado.txt;
 who;            
 uGlParalelizado;
 figure(3)
 plot(uGlParalelizado)
 title('uGl com paralelizacao | Matriz 100 x 100')
  
load vGlParalelizado.txt;
who;            
vGlParalelizado;
 figure(4)
plot(vGlParalelizado)
 title('vGl com paralelizacao | Matriz 100 x 100')

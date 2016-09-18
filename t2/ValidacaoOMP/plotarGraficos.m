# Codigo ira plotar dados resultantes do codigo fortran
# com e sem paralelizacao
# Autor: Fernando Emilio Puntel

# Plot sem paralelizacao

 load uGl.txt;
 who;            
 uGl;
  
load vGl.txt;
who;            
vGl;

# Com paralelizacao
 load uGlParalelizado.txt;
 who;            
 uGlParalelizado;

# Calculo norm  
load vGlParalelizado.txt;
who;            
vGlParalelizado;

"uGl"
 norm(uGl-uGlParalelizado)

 "vGl"
  norm(vGl-vGlParalelizado)
  
# Plots
#figure(1)
#clf ()
#plot(uGl)
#title('uGl sem paralelizacao | Matriz 100 x 100')

#figure(2)
#plot(vGl)
#title('vGl sem paralelizacao | Matriz 100 x 100')

 #figure(3)
 #plot(uGlParalelizado)
 #title('uGl com paralelizacao | Matriz 100 x 100')
 
#figure(4)
#plot(vGlParalelizado)
#title('vGl com paralelizacao | Matriz 100 x 100')
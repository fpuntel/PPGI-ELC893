# Funcoes do codigo:
# - plotar dados resultantes do codigo fortran com e sem paralelismo;
# - calculo distancia euclidiana entre os vetores resultantes;
# Autor: Fernando Emilio Puntel
# PPGI - Programa de pos graduacao e Informatica UFSM
# Professora Andrea Charao

# Carregar matrizes sem paralelismo
 load uGl.txt;
 who;            
 uGl;
  
load vGl.txt;
who;            
vGl;

# Carregar matrizes com paralelismo
 load uGlParalelizado.txt;
 who;            
 uGlParalelizado;
 
load vGlParalelizado.txt;
who;            
vGlParalelizado;

# Norm 
disp("uGl - Norm l^2")
 norm(uGl-uGlParalelizado)

disp("vGl - Norm l^2")
norm(vGl-vGlParalelizado)

# Norm manual (Distância Euclidiana)
tamanho=159200;
ind=1;
soma=0;
  
# uGl 
for ind =1:tamanho
   sub = uGl(ind) -uGlParalelizado(ind);
   pot = sub * sub;
   soma = soma + pot;
endfor
  
 normUgl = sqrt(soma)
  
# vGl 
soma = 0;
for ind =1:tamanho
   sub = vGl(ind) - vGlParalelizado(ind);
   pot = sub * sub;
   soma = soma + pot;
endfor
normVgl = sqrt(soma)


# Plots dos graficos
figure(1)
clf ()
plot(uGl)
title('uGl sem paralelizacao | Matriz 100 x 100')

figure(2)
plot(vGl)
title('vGl sem paralelizacao | Matriz 100 x 100')

figure(3)
plot(uGlParalelizado)
title('uGl com paralelizacao | Matriz 100 x 100')
 
figure(4)
plot(vGlParalelizado)
title('vGl com paralelizacao | Matriz 100 x 100')
# Inicio
clock
clear -all

# Variaveis principais
n = 100
p = 100 #ceil((n*n)/100)
randomSupim = 0.5
randomObs = 0.5
raio = 3
totalExperimentos = 100

blue = 1  # Somente para conferencia do OI, 1 - Roda o Blue

# Matriz Verdade
x=linspace(0,2*pi,n);
y=linspace(0,2*pi,n);
for ind = 1:n
  for ind2 = 1:n
    xt(ind, ind2) = sin(x(ind))*sin(y(ind2)); 
  endfor
endfor

# Construcao Matriz Verdade (xt)
indLinear = 1;
for ind = 1:n
  for ind2 = 1:n
    xt_linear(indLinear) = xt(ind, ind2);
    indLinear = indLinear + 1;
  endfor
endfor

# Construcao Matriz Background (xb)
indLinear = 1;
for ind = 1:n
  for ind2 = 1:n
    xb(ind, ind2) = normrnd (xt(ind,ind2), randomSupim);
    xb_linear(indLinear) = xb(ind, ind2);
    indLinear = indLinear + 1;
  endfor
endfor
xb_linear = xb_linear';

# Localização dos Vetores de observacao, observacao_x e observacao_y
for indObs = 1:p
  obsX(indObs) = rand(1) * n;
  if(obsX(indObs) < 1)
    obsX(indObs) = obsX(indObs) + 1;
  endif
  obsY(indObs) = rand(1) * n;
  if(obsY(indObs) < 1)
    obsY(indObs) = obsY(indObs) + 1;
  endif
endfor

## Carrega Matrizes

# Matriz H
indColuna = 1; # Pois a matriz H deve ser pX(n*n)

for indObs = 1:p
  Sum(indObs) = 0;
endfor

for indObs = 1:p
#disp('xxxxxx')
  for indX = 1:n
  #disp('x')
    for indY = 1:n
      distancia = ((obsX(indObs) - indX) ^ 2) + ((obsY(indObs) - indY) ^ 2);
      distancia = sqrt(distancia);
      #distancia
      if distancia == 0
        H(indObs, indColuna) = 1e300;      
      else
        H(indObs, indColuna) = (1/distancia)^10;
      endif  
      Sum(indObs) = Sum(indObs) + H(indObs, indColuna);
      indColuna = indColuna + 1;
      
    endfor 
  endfor
  indColuna = 1;
endfor

for indObs = 1:p
  soma = 0;
  for ind = 1:n*n
    H(indObs, ind) = H(indObs, ind) / Sum(indObs);
  endfor
endfor

disp("Tamanho matriz H");
size(H)


# Matriz B
for indErros = 1:totalExperimentos
  
  for ind = 1:n*n
    temp_xb_linear(ind) =  normrnd (xt_linear(ind), randomSupim);
  endfor
  
  for ind = 1:n*n
    diferencaEB(ind, indErros) = temp_xb_linear(ind) - xt_linear(ind);
  endfor
endfor

for ind = 1:n*n # Matriz media
  aux = 0;
  for indErros = 1:totalExperimentos
    aux = aux + diferencaEB(ind, indErros); # Neste caso varia o indice das linhas, pois é feito a media de todos os itens
  endfor
  mediaErros(ind) = aux/totalExperimentos;
endfor
mediaErros = mediaErros';

clear B;
B = 0;
for indErros = 1:totalExperimentos # Construcao Matriz B
  vetor = diferencaEB(:, indErros);
  aux = (vetor - mediaErros) * ((vetor - mediaErros)');
  B = B + aux;
endfor
B = B / totalExperimentos;

disp("\Tamanho matriz B")
size(B)

# Construcao Matriz R

# Definiçao dos valores de observaçao
truth_nas_Obs = H * xt_linear';
for indObs = 1:p
  obsValue(indObs) = normrnd (truth_nas_Obs(indObs), randomObs);
endfor
  
  
for indErros = 1:totalExperimentos
  
  for indObs = 1:p
    temp_obs_linear(indObs) = normrnd (truth_nas_Obs(indObs), randomObs);
  endfor
 
  for indObs = 1:p
    diferencaER(indObs, indErros) = temp_obs_linear(indObs) - truth_nas_Obs(indObs);
  endfor  
endfor

clear mediaErros;
mediaErros = 0;
for indObs = 1:p # Media
  aux = 0;
  for indErros = 1:totalExperimentos
    aux = aux + diferencaER(indObs, indErros); # Soma todas as colunas
  endfor
  mediaErros(indObs) = aux/totalExperimentos; 
endfor
mediaErros = mediaErros';

clear R;
R = 0;
for indErros = 1:totalExperimentos
  vetor = diferencaER(:, indErros);
  aux = (vetor - mediaErros) * ((vetor - mediaErros)');
  R = R + aux;
endfor
R = R/totalExperimentos;

disp("\Tamanho matriz R")
size(R)

# Calculos Finais 
HBH_T = H * B * (H');
BH_T = B * (H');
Hxb = H * xb_linear;

# Blue
if blue == 1
  disp('Inicio Blue')
  clock
  clear xa
  clear xa_linear
  clear K
  K = 0;
  xa = 0;
  xa_linear = 0;
  
  K = HBH_T + R;
  
  disp('TAMANHO K:')
  size(K)

  fid = fopen('/octave/PPGI/matriz1.txt','wt')
  fprintf(fid,'%f\n',K)
  fclose(fid)
endif

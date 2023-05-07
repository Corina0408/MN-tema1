function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  % TODO: initialize_weights implementation
  
  % intoarce matrice elemente aleatoare din intervalul (-e; e), unde e = sqrt(6)/sqrt(Lprev + Lnext)
  
  matrix = zeros(L_next, L_prev + 1);
  
  e_2 = sqrt(6)/sqrt(L_prev + L_next);
  e_1 = -e_2;
  
  %in rand-ul asta avea L_prev si L_next;
  % matrix = rand(() * (e_2 - e_1 - 2*eps) + (e_1 + eps));
  
  %matrix = e_1 + (e_2 - e_1)*rand();
  
  matrix(1:end, 1: end) = rand()*2 *e_2 + e_1 ;
  
endfunction

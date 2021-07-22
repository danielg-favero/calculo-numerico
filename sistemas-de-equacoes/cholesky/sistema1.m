clcclear% Algoritmo de cholesky% Matriz A simétrica dos coeficientesA=[9 6 -3 3; 6 20 2 22; -3 2 6 2; 3 22 2 28];b=[12; 64; 4; 82];n = length(b);% Escrever a matriz A como produto de duas matrizes G e G'% Obtendo a matriz Gfor k = 1: n  sum = A(k, k);    % Valores da giagonal principal  for j = 1: k -1    sum = sum - G(k, j) * G(k, j);  endfor      G(k, k) = sqrt(sum);    % Valores restantes da matriz  for i = k + 1: n    sum = A(i, k);        for j = 1: k - 1      sum = sum - G(i, j) * G(k, j);    endfor        G(i, k) = sum / G(k, k);
  endfor    
endfordisp("Matriz triangular G obtida")disp(G)disp("\n\n")disp("Matriz G transposta")disp(G')disp("\n\n")% Agora temos o sistema GG'x = b% Podemos obter dois sistemas Gy = b e em seguida G'x = y% Resolvendo Gy = bfor i = 1: n  sum = 0;    for j = 1: i - 1    sum = sum + G(i, j) * y(j);  endfor    y(i) = (b(i) - sum) / G(i, i);endfor% Resolvendo G'x = yfor i = n: -1: 1   sum = 0;    for j = i + 1: n    sum = sum + G'(i, j) * x(j);  endfor    x(i) = (y(i) - sum) / G'(i, i);endfordisp("Solução da matriz")disp(x)disp("\n\n")
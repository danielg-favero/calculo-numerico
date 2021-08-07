clear
clc

% INTEGRAÇÃO PELO MÉTODO DOS TRAPÉZIOS

% Função ao qual queremos encontrar a area abaixo
f = @(x) 1 / sqrt(x);

% Intervalo de integração
a = 2;
b = 14;

% Quantidade de trapézios 
m = 25;

% Altura de cada trapézio
h = (b - a) / m;

% Iniciar o valor da integral
Itr = 0;

% Algoritmo de integração pelo método dos trapézios
x(1) = a;
for i = 1: m
    x(i + 1) = a + i * h;
    Itr += f(x(i)) + f(x(i + 1));
endfor

Itr = (h / 2) * Itr;

% ESTIMANDO O ERRO OBTIDO
% precisamos encontrar o valor máximo da segunda derivada da função no intervalo de integração
% no caso d2f = 3 / 4x^(5/2), onde seu valor máximo é d2f(a) = 3 / 4(2)^(5/2)

d2f = @(x) 3 / (4 * x^(5 / 2));

M2 = abs(d2f(a));

Etr = abs(((b - a) * M2 * h^2) / 12);
printf("Area aproximada abaixo do gráfico da função: %d\n", Itr)
printf("Erro estimado <= %d\n", Etr)

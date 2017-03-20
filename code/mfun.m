function [ f, g ] = mfun( x )
%MFUN Função de exemplo para problema de otimização
%   Função polinomial utilizada como exemplo para otimização com fminunc.
%   A função deve receber um vetor x com duas componentes: x(1) e x(2).
%   O vetor gradiente calculado em 'x' também é devolvido pela função.

f = 3*(x(1)^2) - (x(2)^2) + 2; % f é a função no ponto (x(1), x(2))

g = [6*x(1) -2*x(2)]; % g é o vetor gradiente grad(f) em (x(1), x(2))

end

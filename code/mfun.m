function [ f, g ] = mfun( x )
%MFUN Fun��o de exemplo para problema de otimiza��o
%   Fun��o polinomial utilizada como exemplo para otimiza��o com fminunc.
%   A fun��o deve receber um vetor x com duas componentes: x(1) e x(2).
%   O vetor gradiente calculado em 'x' tamb�m � devolvido pela fun��o.

f = 3*(x(1)^2) - (x(2)^2) + 2; % f � a fun��o no ponto (x(1), x(2))

g = [6*x(1) -2*x(2)]; % g � o vetor gradiente grad(f) em (x(1), x(2))

end

function [ h ] = hyp( theta, X )
%HYP Fun��o hip�tese h 
%   Dado o par�metro theta e o vetor de dados X, a fun��o devolve a
%   classifica��o (0 ou 1) de cada um dos dados.

h = sigmoid(theta*X);

end


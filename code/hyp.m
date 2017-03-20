function [ h ] = hyp( theta, X )
%HYP Função hipótese h 
%   Dado o parâmetro theta e o vetor de dados X, a função devolve a
%   classificação (0 ou 1) de cada um dos dados.

h = sigmoid(theta*X);

end


function h = h_theta( theta, x )
%H_THETA Função hipótese, em regressão logística
%   Calcula a função hipótese h(theta, x), utilizada em problemas de
%   regressão logística.

h = sigmoid(theta'*x');

end


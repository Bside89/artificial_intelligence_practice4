function h = h_theta( theta, x )
%H_THETA Fun��o hip�tese, em regress�o log�stica
%   Calcula a fun��o hip�tese h(theta, x), utilizada em problemas de
%   regress�o log�stica.

h = sigmoid(theta'*x');

end


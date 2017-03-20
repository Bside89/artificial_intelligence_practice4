clear; clc;

x0 = [1 1]; % Variáveis

options = optimset('GradObj', 'on', 'MaxIter', 400); % Opções para o gradiente

% Cálculo de otimização em @mfun p/ x0 utilizando as opções para gradiente
% em options.
res = fminunc(@mfun, x0, options);

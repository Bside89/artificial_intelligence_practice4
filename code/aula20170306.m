clear; clc;

x0 = [1 1]; % Vari�veis

options = optimset('GradObj', 'on', 'MaxIter', 400); % Op��es para o gradiente

% C�lculo de otimiza��o em @mfun p/ x0 utilizando as op��es para gradiente
% em options.
res = fminunc(@mfun, x0, options);

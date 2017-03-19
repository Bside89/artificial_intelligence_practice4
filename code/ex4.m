%% Inteligencia Artficial - Exerc�cio 4: Regress�o Log�stica e regulariza��o
%
%  Instru��es
%  ------------
%  Nesta atividade, voc� ir� implementar o algoritmo de regress�o log�stica
%  para um conjunto de dados que n�o � linearmente separ�vel.
%  Voc� deve alterar os seguintes arquivos:
%   
%     sigmoid.m
%     costFunction.m
%     predict.m
%     costFunctionReg.m
%     
%
%%  E N�O deve alterar o c�digo deste arquivo.
%
% Este exerc�cio foi baseado no curso de aprendizado de m�quina de
% Stanford.


%% Initializa��o
clear ; close all; clc

%% Carregando dados
%  Os dados est�o organizados em uma matrix. As duas primeiras colunas 
% deste matriz cont�m os valores de entrada (X) e 
% a terceira e �ltima coluna cont�m a classe (y).

data = load('ex4data.txt');
X = data(:, [1, 2]); % entrada
y = data(:, 3); % classe

plotData(X, y);

hold on;

% Acertando as legendas da figura
xlabel('Teste 1')
ylabel('Teste 2')

% 
legend('y = 1', 'y = 0')
hold off;


%% =========== Parte 1: Regress�o Log�stica e Regulariza��o ============
%  Nesta atividade, voc� ir� implementar o algoritmo de regress�o log�stica
%  para um conjunto de dados que n�o � linearmente separ�vel. 
%
%  Tal como vimos em aula, nestes casos � necess�rio considerar uma 'combina��o
%  polinomial' de caracter�sticas. 

% A fun��o 'mapFeatures' cria esta combina��o para um polin�nimo de grau 6
X = mapFeature(X(:,1), X(:,2));

% Ao fim deste processo o vetor X ter� a seguinte configura��o:
%
% X = [1 x1 x2 x1^2 x1x2 x2^2 x1^3 .... x1x2^5 x2^6]

% Valores iniciais dos par�metros
initial_theta = zeros(size(X, 2), 1);

% par�metro de regulariza��o
lambda = 0;

% Implemente a fun��o de custo e teste o algoritmo. 
% A fun��o de custo deve devolver o custo e o vetor gradiente da funcao de custo.
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

fprintf('Custo para o valor inicial theta (zeros): %f\n', cost);

fprintf('\n Aperte enter para continuar.\n');
pause;

%% ============= Parte 2: Analisando o efeito da regulariza��o =============
%  
% Nesta parte da atividade, voc� avaliar� o efeito da regulariza��o na precis�o 
% do aprendizado. 
%
% Para tanto, teste o programa com diferentes lambda (por exemplo, 0, 1, 10 
% e 100) e avalie como a superf�cie de decis�o e a precis�o do classificador
% mudam em cada caso.
%

% Valores iniciais dos par�metros
initial_theta = zeros(size(X, 2), 1);

% Mude o valor de lambda para ver o efeito da regulariza��o
lambda = 1;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% mostrando a fronteira de decis�o
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Definindo as legendas
xlabel('Teste 1')
ylabel('Teste 2')

legend('y = 1', 'y = 0', 'Front. decis�o')
hold off;

% Calculando a precis�o do treinamento
p = predict(theta, X);

fprintf('Precis�o: %f\n', mean(double(p == y)) * 100);

pause

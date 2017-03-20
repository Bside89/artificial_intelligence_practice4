%% Inteligencia Artficial - Exercício 4: Regressão Logística e regularização
%
%  Instruções
%  ------------
%  Nesta atividade, você irá implementar o algoritmo de regressão logística
%  para um conjunto de dados que não é linearmente separável.
%  Você alterar os seguintes arquivos:
%   
%     sigmoid.m
%     costFunction.m
%     predict.m
%     costFunctionReg.m
%     
%
%%  E NÃO deve alterar o código deste arquivo.
%
% Este exercício foi baseado no curso de aprendizado de máquina de
% Stanford.


%% Initialização
clear ; close all; clc

%% Carregando dados
%  Os dados estão organizados em uma matrix. As duas primeiras colunas 
% deste matriz contém os valores de entrada (X) e 
% a terceira e última coluna contém a classe (y).

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


%% =========== Parte 1: Regressão Logística e Regularização ============
%  Nesta atividade, você irá implementar o algoritmo de regressão logística
%  para um conjunto de dados que não é linearmente separável. 
%
%  Tal como vimos em aula, nestes casos é necessário considerar uma 'combinação
%  polinomial' de características. 

% A função 'mapFeatures' cria esta combinação para um polinônimo de grau 6
X = mapFeature(X(:,1), X(:,2));

% Ao fim deste processo o vetor X terá a seguinte configuração:
%
% X = [1 x1 x2 x1^2 x1x2 x2^2 x1^3 .... x1x2^5 x2^6]

% Valores iniciais dos parâmetros
initial_theta = zeros(size(X, 2), 1);

% parâmetro de regularização
lambda = 0;

% Implemente a função de custo e teste o algoritmo. 
% A função de custo deve devolver o custo e o vetor gradiente da funcao de custo.
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

fprintf('Custo para o valor inicial theta (zeros): %f\n', cost);

fprintf('\n Aperte enter para continuar.\n');
pause;

%% ============= Parte 2: Analisando o efeito da regularização =============
%  
% Nesta parte da atividade, você avaliará o efeito da regularição na precisão 
% do aprendizado. 
%
% Para tanto, teste o programa com diferentes lambda (por exemplo, 0, 1, 10 
% e 100) e avalie como a superfície de decisão e a precisão do classificador
% mudam em cada caso.
%

% Valores iniciais dos parâmetros
initial_theta = zeros(size(X, 2), 1);

% Mude o valor de lambda para ver o efeito da regularização
lambda = 1;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% mostrando a fronteira de decisão
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Definindo as legendas
xlabel('Teste 1')
ylabel('Teste 2')

legend('y = 1', 'y = 0', 'Front. decisão')
hold off;

% Calculando a precisão do treinamento
p = predict(theta, X);

fprintf('Precisão: %f\n', mean(double(p == y)) * 100);

pause

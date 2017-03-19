function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


%Find indice of negative and positive examples
ip = find(y == 1);
in = find(y == 0);

% Plot Examples
plot(X(ip, 1), X(ip, 2), 'r+','LineWidth', 2, ...
	'MarkerSize', 7);
plot(X(in, 1), X(in, 2), 'ko', 'MarkerFaceColor', 'k', ...
	'MarkerSize', 7);



% =========================================================================



hold off;

end

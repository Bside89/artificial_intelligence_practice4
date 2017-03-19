function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
%J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

s1 = (-y'.*log(h_theta(theta, X))) - (1 - y').*(log(1 - h_theta(theta, X)));
s2 = theta.^2;
J = (1/m)*sum(s1) + (1/(2*m))*sum(s2);

for i=1:size(theta),
    s3 = (X.^i).*(h_theta(X) - y);
    grad = (1/m)*sum(s3) + lambda*(1/m)*sum(theta);
end

% =============================================================

end

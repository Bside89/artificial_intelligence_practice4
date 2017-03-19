function [ f, g ] = mfun( x )
%MFUN Summary of this function goes here
%   Detailed explanation goes here

f = 3*(x(1)^2) - (x(2)^2) + 2;

g = [6*x(1) -2*x(2)];

end


function [l, co, re] = Rahou_Assignment3_Exercise1(data, initialLambda)
% MOUMNA RAHOU, MATHEMATICS DEPARTMENT, VU UNIVERSITY 
%
% The function fits data with l = lambda, co = constants, re = residue, is
% a function of the form f(x) = c1*exp(lambda1*x) + c2*exp(lambda2*x)
% + ... + cn*exp(lambdan*x). 

% The constants c_1… c_n are found for a for fixed ? by the least squares 
% method and by minimizing the corresponding residue using the 
% Matlab-function fminsearch we have found ?1, ..., ?n. The input of this 
% function are two variables. The first variable one is a 
% (m x 2)-matrix which contains the data. The data has to be fit. The second 
% variable is a vector of initial guesses for ?1, ..., ?n. The size of this 
% vector also determines how many values for exponents this function will 
% determine. The output of this function is a vector ? which contains 
% ?1, ..., ?n of the fit function. The optional outputs are the belonging 
% constants and its residue.  

% With the “trial and error method” we determined for the three given data 
% sets how many exponents are hidden. We tried a number of exponents and 
% each time we added another exponent to see if the residue decreases 
% significantly. When a constant had the value zero then there is a large 
% probability that the term was unimportant.

c = @(l) pinv(exp(data(:, 1)*l))*data(:, 2);
r = @(l) sum((exp(data(:, 1)*l)*feval(c, l) - data(:, 2)).^2);

l = fminsearch(r, initialLambda);
co = c(l);
re = r(l);
fx = @(x) exp(x*l)*co;

refinedInterval = linspace(min(data(:, 1)), max(data(:, 1)), 1000)';
plot(data(:, 1), data(:, 2), '.b', refinedInterval, fx(refinedInterval), 'r', 'LineWidth', 3);
title('The Exponential Fit For Dataset 1');
xlabel('x');
ylabel('y');
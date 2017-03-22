function [x] = Oosterhuis_assignment1_exercise3_2(lambda_min,lambda_max, N)
%T.J. Oosterhuis
%Function takes lambda_min, lambda_max and N. Function makes vector lambda
% of length N with lambda(1) = lambda_min, lambda(N) = lambda_max, stephs
% between lambdas are equal. 
% For every lambda of this vector of lambdas a xvector is created with the
% first element of xvector the value of x_100 of the logistic map with this
% vector (calculated by calling function Oosterhuis_assignment1_exercise3_2
% with lambda and x=0.5)
% every following element of xvector is x_(n+1).
% The points of these x vector are plotted for the specific lambda.
% For the following lambda in for statement, the points are plotted in the
% same plot (using 'hold on').
% function output is plot of x_n against lambdas.
length_x=100;
lambda = linspace(lambda_min,lambda_max,N);
xvector=zeros(length_x,1);
%xvector(1)=0.1;
for i=1:N,
    xvector(1)=Oosterhuis_assignment1_exercise3_1(0.5,lambda(i));
    xvector;
    for n = 1:length_x - 1, 
    xvector(n+1) = lambda(i)*xvector(n)*(1 - xvector(n)); 
    end,
    vectorlambda = lambda(i)*ones(length_x,1);
    plot(vectorlambda, xvector, '.','markersize', 2);
    hold on;
    %xvector;
end,
title('Bifurcation diagram of the logistic map'); 
xlabel('lambda');  ylabel('x_n'); 
set(gca, 'xlim', [0, 4.0]); 
hold off;
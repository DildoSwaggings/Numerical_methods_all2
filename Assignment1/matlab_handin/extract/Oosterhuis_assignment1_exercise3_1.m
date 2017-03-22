function [x] = Oosterhuis_assignment1_exercise3_1(x,lambda)
%T.J. Oosterhuis
%function takes x (between zero and one) and value of lambda (between zero
%and four). Function output is x_100 for the logistic map function
%x_(n+1)=lambda x_n (1-x_n).
for i=1:100,
    x = lambda * x * (1-x);
end,
end
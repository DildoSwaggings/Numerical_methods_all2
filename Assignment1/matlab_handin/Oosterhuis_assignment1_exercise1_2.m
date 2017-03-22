function vectory=Oosterhuis_assignment1_exercise1_2(x)
% T.J.Oosterhuis
% function takes vector x of length n with real numbers and returns an
% vector of length of y, where every i^th element of y is the output of the 
% taylor function 'vectory=Oosterhuis_assigment1_exercise1_1' with input 
% the i^th element of x.
% My code:
for i=1:1:length(x)
vectory(i) = Oosterhuis_assignment1_exercise1_1(x(i))
end
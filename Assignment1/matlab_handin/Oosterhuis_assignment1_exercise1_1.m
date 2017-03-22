function y=Oosterhuis_assignment1_exercise1_1(x)
% T.J.Oosterhuis
% function takes single real number and returns an approximation of the sin
% of that number using the Taylor series of the sine around zero.
% Note that the iteration takes steph of n=2, because sin(0)=0, -sin(0)=0,
% respectivily the (4+4k)^th derivate and the (2+4k)^th derivate of sin. The
% (-1)^((n0-1)/2) is because of the cos(0)=1, and the -cos(0)=-1,
% respectiviely the (1+4k^)th and (3+4k)^th derivate of sin.
% My code:
y=0;
for n=1:2:101
y = y +((-1)^((n-1)/2)*((x^n)/factorial(n)))
y;
end

return
function y = Oosterhuis_assignment1_exercise2_2(x)
%T.J.Oosterhuis
%takes vector x with length length(x) with every element of the form
%'m,b,a,x0,v0'. Output is vector y with length(x) with every i^th element
%being the solution r1, r2, c1, c2 for the differential equation of the i^th
%element of vector x. Output is also length(x) number of plots.
for i=1:length(x)
    Oosterhuis_assignment1_exercise2_1(m,b,a,x0,v0)
end
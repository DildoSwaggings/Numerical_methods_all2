function [r1,r2,oplossing_C1,oplossing_C2] = Oosterhuis_assignment1_exercise2_1(m,b,a,x0,v0)
% T.J.Oosterhuis
% takes second order differential equation of the form mx'' + bx' + ax =0,
% x(0)=v0, x'(0)=v0 and returns plot of differential equation as well as
% the solution for r1,r1,C1 and C2. 
% Functions seperates three cases: D<0,D=0,D>0
%
% My code:
%abc formule
D = b^2-4*a*m 
r1 = (-b + sqrt(D))/(2*m)
r2 = (-b - sqrt(D))/(2*m)
%for D<0
if D < 0
    real_part = real(r1);
    complex_part = imag(r1);
    oplossing_C1 = x0
    oplossing_C2 = (v0 + (x0*oplossing_C1))/complex_part
    t=linspace(0,20,400);
    oplossing_met_C_ingevuld = oplossing_C1 .* exp(real_part .*t) .* cos(complex_part .* t) + oplossing_C2 .* exp(real_part .*t) .*sin(complex_part .*t);
    %
    %plotting:
    plot(t,oplossing_met_C_ingevuld, 'magenta')
    title('The solution of the second order differential equation')
    xlabel('t')
    ylabel('x(t)')
%
%for D > 0 
elseif D > 0,
    %solve c1, c2:
    A=[1 1;r1 r2];
    oplossing_C1_C2 = inv(A)*[x0;v0];
    oplossing_C1 = oplossing_C1_C2(1)
    oplossing_C2 = oplossing_C1_C2(2)
    %determine range t:
    if b==0 %periodic solution, choose t=4pi
        t=linspace(0,12.56,400)
    end
    if b~=0 %no periodic solution
        t=linspace(0,3,400);
    end
    oplossing_met_C_ingevuld = oplossing_C1 * exp(r1 * t) + oplossing_C2 * exp(r2*t);
    %plotting:
    plot(t,oplossing_met_C_ingevuld, 'black')
    title('The solution of the second order differential equation')
    xlabel('t')
    ylabel('x(t)')
%for D=0
elseif D == 0
    oplossing_C1 = x0
    oplossing_C2 = v0 - (r1 * oplossing_C1)
    t=linspace(0,20,100);
    oplossing_met_C_ingevuld = oplossing_C1 * exp(r1 * t) + oplossing_C2 * t.* exp(r2*t);
    plot(t,oplossing_met_C_ingevuld,'red')
    title('The solution of the second order differential equation')
    xlabel('t')
    ylabel('x(t)')
end
end

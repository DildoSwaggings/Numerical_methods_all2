function y = solvedifferential(m,b,a,x0,v0)
% r = sym('r')
% syms t
% x = exp(r*t)
% x_afg1=r*exp(r*t)
% x_afg2=r^2 * exp(r*t)
%vergelijking = m * x_afg2 + b * x_afg1 + a * x
%m*r^2 + b*r + a = 0
%abc formule
r1 = (-b + sqrt(b^2-4*a*m))/(2*m)
r2 = (-b - sqrt(b^2-4*a*m))/(2*m)
if r1~=r2
%oplossing = C1 * exp(r1 * t) + C2 * exp(r2*t)
%determine C1, C2
%C1 * exp(r1 * 0) + C2 * exp(r2 * 0) = x_0
%C1*r1 + C2* r2 = v_0
A=[1 1;r1 r2]
oplossing_C1_C2 = inv(A)*[x0;v0]
oplossing_C1 = oplossing_C1_C2(1)
oplossing_C2 = oplossing_C1_C2(2)
t=linspace(0,12.56,100);
oplossing_met_C_ingevuld = oplossing_C1 * exp(r1 * t) + oplossing_C2 * exp(r2*t);
plot(t,oplossing_met_C_ingevuld)
end
if r1==r2
    oplossing_C1 = x0
    oplossing_C2 = v0 - (r1 * oplossing_C1)
    t=linspace(0,12.56,100);
    oplossing_met_C_ingevuld = oplossing_C1 * exp(r1 * t) + oplossing_C2 * t.* exp(r2*t);
    plot(t,oplossing_met_C_ingevuld)
    title('De sinus en een benadering van de sinus met de Taylorreeks')
    xlabel('x')
    ylabel('y')
end


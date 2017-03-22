% T.J.Oosterhuis
% Code for making plots using a vector t and the output of
% Oosterhuis_assigment1_exercise1_2(t), with input t.
% My code:
%
%plot taylor en sinus, n=11, t in [0,7]
t=[0:0.1:7]
figure
plot(t,sin(t),'black',t,Oosterhuis_assignment1_exercise1_2(t),'magenta')
title('De sinus en een benadering van de sinus met de Taylorreeks')
xlabel('x')
ylabel('y')
legend('sin(x)','Taylorreeks')
%plot taylor en sinus, n= 101, t in [0,40]
t=[0:0.1:40]
figure
plot(t,sin(t),'black',t,Oosterhuis_assignment1_exercise1_2(t),'magenta')
title('De sinus en een benadering van de sinus met de Taylorreeks')
xlabel('x')
ylabel('y')
legend('sin(x)','Taylorreeks')
%legend('show')
%end figure 
%
%plot taylor min sinus, n=101 t in [0,40]
figure
t=[0:0.1:40]
plot(t,Oosterhuis_assignment1_exercise1_2(t)-sin(t),'red')
title('De afwijking van de Taylorreeks van de sinus ten opzichte van de sinus')
xlabel('x')
ylabel('y')
legend('Taylorreeks min sin(x)')
%end figure 

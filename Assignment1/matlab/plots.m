%plot taylor en sinus, t in [0,40]
t=[0:0.1:7]
figure
plot(t,sin(t),'black',t,vectortaylor(t),'magenta')
title('De sinus en een benadering van de sinus met de Taylorreeks')
xlabel('x')
ylabel('y')
legend('sin(x)','Taylorreeks')
%legend('show')
%end figure 
%
%plot taylor min sinus, t in [0,40]
figure
t=[0:0.1:40]
plot(t,vectortaylor(t)-sin(t),'red')
title('De afwijking van de Taylorreeks van de sinus ten opzichte van de sinus')
xlabel('x')
ylabel('y')
legend('Taylorreeks min sin(x)')
%end figure 
%
%plot taylor en sinus, n 11, t in [0,10]
t=[0:0.1:30]
figure
plot(t,sin(t),'black',t,vectortaylor(t),'magenta')
title('De sinus en een benadering van de sinus met de Taylorreeks')
xlabel('x')
ylabel('y')
legend('sin(x)','Taylorreeks')

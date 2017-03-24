function [] = internet_exercise2()
%figure('position',get(0,'screensize'))
%axes('position',[0 0 1 1])
[x,y] = ginput;
%removing double cliks:

%add first point at the end to make closed curve
x(length(x)+1)=x(1)
y(length(y)+1)=y(1)

%take cumultative sum
t = cumsum(sqrt([0,diff(x')].^2 + [0,diff(y')].^2));
  
ti = linspace(t(1),t(end),500);
 
xi = interp1(t,x',ti,'cubic');
yi = interp1(t,y',ti,'cubic');
 
plot(x,y,'b.',xi,yi,'r-') 

%%TA: CENTER OF MASS BY YSING GREEN: f2=x f1 = 0 (chosen), use trapz() for
%%lineintergral
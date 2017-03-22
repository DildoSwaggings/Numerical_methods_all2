function [x] = logisticmapvector(lambda_min,lambda_max, N)
length_x=100;
lambda = linspace(lambda_min,lambda_max,N);
xvector=zeros(length_x,1);
%xvector(1)=0.1;
for i=1:N,
    xvector(1)=logisticmapx(0.5,lambda(i));
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

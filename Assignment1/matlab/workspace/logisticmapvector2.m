function [x] = logisticmapvector(lambda_min,lambda_max, N)
Nplot=10;
Npre=200;
lambda = linspace(lambda_min,lambda_max,N);
xvector=zeros(Nplot,1);
xvector(1)=0.1;
for i=1:N,
    for n = 1:Npre, 
    xvector(1) = lambda(i)*xvector(1)*(1 - xvector(1)); 
    end,
    xvector
    for n = 1:Nplot-1, 
    xvector(n+1) = lambda(i)*xvector(n)*(1 - xvector(n)); 
    end,
    vectorlambda = lambda(i)*ones(Nplot,1);
    plot(xvector,vectorlambda,'.','markersize', 2);
    hold on;
    %xvector;
end,
title('Bifurcation diagram of the logistic map'); 
xlabel('r');  ylabel('x_n'); 
set(gca, 'xlim', [0, 4.0]); 
hold off;


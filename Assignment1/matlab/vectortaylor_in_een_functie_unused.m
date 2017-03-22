function vectory=taylor(x)
y=0;
for i=1:1:length(x)
    for n=1:2:205
    y = y +((-1)^((n-1)/2)*((x(i)^n)/factorial(n)))
vectory(i) = y;
end
end
vectory
return
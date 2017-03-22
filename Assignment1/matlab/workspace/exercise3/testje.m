function y=testje(x)
y=0;
for n=1:2:11
y = y +((-1)^((n-1)/2)*((x^n)/factorial(n)))
y
end

return
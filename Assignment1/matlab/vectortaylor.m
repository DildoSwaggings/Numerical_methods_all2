function vectory=vectortaylor(x)
for i=1:1:length(x)
vectory(i) = taylor(x(i))
end
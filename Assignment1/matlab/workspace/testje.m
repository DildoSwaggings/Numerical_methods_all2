%test
function [x] = testje(x,r)
for i=1:1000
    x = r * x * (1-x)
end
end

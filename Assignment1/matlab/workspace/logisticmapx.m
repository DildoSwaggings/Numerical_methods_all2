function [x] = logisticmapx(x,lambda)
for i=1:100,
    x = lambda * x * (1-x);
end,
end


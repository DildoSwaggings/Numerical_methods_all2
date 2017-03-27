function u = function_u(t)
u = zeros(length(t),1)
for i=1:length(t)
    if t(i) < 1 && t(i) >= 0
        u(i) = 1 - t(i)
    else
        u(i) = 0
    end
end
end

function v = function_v(t)
v = zeros(length(t),1)
for i=1:length(t)
    if t(i) >= 0
        v(i) = exp(-t(i))
    else
        u(i) = 0
    end
end
end

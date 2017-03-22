function y = solvedifferential_for_vector(m,b,a,x0,v0)
for i=1:length(x0)
    solvedifferential(m,b,a,x0(i),v0(i))
end
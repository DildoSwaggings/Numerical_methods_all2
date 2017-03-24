function[y]=dft(vector)
%copied from maija
    n=length(vector)

    if (n ==1) 
        y=vector; 
    else 
        w=ones(1,(n/2))
        for j=1:n
            w(j) = exp(-2*pi*1i/j);
        end
        y  = [dft(vector(1:2:n))+ w.^(0:(n/2-1))*dft(vector(2:2:n));dft(vector(1:2:n))-w.^(0:(n/2-1))*dft(vector(2:2:n))]
    end 
y
%dft(vector(1:n))
end 
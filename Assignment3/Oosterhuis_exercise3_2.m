function [ y ] = Oosterhuis_exercise3_2( normal_or_inverse,vector_x )
%Oosterhuis_exercise3_1() calculates the discrete Fourier transform of
%a vector or its inverse Fourier transform. Input is a vector of length
%2^n and a variable which indicates whether the normal or inverse
%transform needs to be calculated
%output is vector of same size as input vector

if normal_or_inverse == 0
N = length(vector_x)
%omega = exp((-2*pi*1i)/N)
%recursion:
if N==1
    %b = -1i*(2 * pi * k * (n-1))/N
    y = vector_x
    %i = i + 1
else
    %N = length(vector_x)
    vector_x_even = vector_x(2:2:N)
    vector_x_odd = vector_x(1:2:N)
    N = N / 2
    y_even = Oosterhuis_exercise3_2(normal_or_inverse,vector_x_even)
    y_odd = Oosterhuis_exercise3_2(normal_or_inverse,vector_x_odd)
    omega = exp(-2 * pi * 1i / N) .^ (0:N-1)' 
    %z = d .* y_bottom;
    %y = [ y_top + z , y_top - z ];
    y = [ y_odd + omega .* y_even; y_odd - omega .* y_even ]
    %omega = exp((-2*pi*1i)/N)
    %omega_vector = omega * ones(N,1)
    %y = [Oosterhuis_exercise3_2(normal_or_inverse,vector_x_even) + omega_vector * Oosterhuis_exercise3_2(normal_or_inverse,vector_x_odd);Oosterhuis_exercise3_2(normal_or_inverse,vector_x_even) - omega_vector * Oosterhuis_exercise3_2(normal_or_inverse,vector_x_odd)]  
end
%
%LET's try the inverse fourier transform:
elseif normal_or_inverse == 1
    N=length(vector_x)
    if N==1
        y = vector_x
    else
        vector_x_even = vector_x(2:2:N)
        vector_x_odd = vector_x(1:2:N)
        N = N / 2
        y_even = Oosterhuis_exercise3_2(normal_or_inverse,vector_x_even)
        y_odd = Oosterhuis_exercise3_2(normal_or_inverse,vector_x_odd)
        omega = exp(2 * pi * 1i / N) .^ (0:N-1)' 
        %z = d .* y_bottom;
        %y = [ y_top + z , y_top - z ];
        y = [ y_odd + omega .* y_even; y_odd - omega .* y_even ]
        %omega = exp((-2*pi*1i)/N)
    end
end
end


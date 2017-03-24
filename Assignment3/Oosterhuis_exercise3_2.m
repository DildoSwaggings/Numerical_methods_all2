function [ vector_length_is_equal_to_vector_x ] = Oosterhuis_exercise3_2( normal_or_inverse,vector_x )
%Oosterhuis_exercise3_1() calculates the discrete Fourier transform of
%a vector or its inverse Fourier transform. Input is a vector of length
%2^n and a variable which indicates whether the normal or inverse
%transform needs to be calculated
%output is vector of same size as input vector
N = length(vector_x)
%recurtion:
if N==1
    %b = -1i*(2 * pi * k * (n-1))/N
    y = vector_x
else
    N = length(vector_x)
    vector_x_even = vector_x(2:2:N)
    vector_x_odd = vector_x(1:2:N)
    Oosterhuis_exercise3_2(normal_or_inverse,vector_x_even)
    Oosterhuis_exercise3_2(normal_or_inverse,vector_x_odd)
end


end


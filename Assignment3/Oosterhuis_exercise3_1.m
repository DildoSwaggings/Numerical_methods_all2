function [ output_args ] = Oosterhuis_exercise3_1(normal_or_inverse,vector_x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%using the internet: https://www.youtube.com/watch?v=mkGsMWi_j4Q
%test function: 

%Oosterhuis_exercise3_1() calculates the discrete Fourier transform of
%a vector or its inverse Fourier transform. Input is a vector of length
%2^n and a variable which indicates whether the normal or inverse
%transform needs to be calculated
N = length(vector_x)
%determine period => HOW??? ASK TA,, is it necesary?
%L = period
sum=0
x=zeros(N,1);
x_in_sum=zeros(N,1);
amplitudes = zeros(N,1);
thetas = zeros(N,1);

for k=1:N
    %b = 1i*(2 * pi * k * n)/N
    %x(k)=0
    for n=1:N
        b = -1i*(2 * pi * k * (n-1))/N
        x_in_sum(n) = vector_x(k) * exp(b)
    end
    x(k) = sum(x_in_sum)
amplitudes(k) = sqrt((real(x(k)))^2+imag(x(k))^2)
thetas(k) = tan((imag(x(k)))/(real(x(k))))
end

end


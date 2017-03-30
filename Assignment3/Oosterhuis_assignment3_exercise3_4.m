function [ y ] = Oosterhuis_assignment3_exercise3_4(vector_fft)
%plots frequencies
%
%define variables
N = length(vector_fft)
%make vector with magnitudes of complex numbers in vector_fft
magnitudes = zeros(N)
for j=1:N
    magnitudes(j) = (real(vector_fft(j))^2 + imag(vector_fft(j))^2)^(0.5)
end
%make frequencies one sided
nyquist_limit = N/2
magnitudes_one_sided = magnitudes(1:nyquist_limit) .*2
%devide by number of samples
magnitudes_final = magnitudes_one_sided ./ N
%plotting
frequencies = linspace(1,nyquist_limit,nyquist_limit)
plot(frequencies,magnitudes_final)

    


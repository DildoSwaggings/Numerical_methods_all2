function output = Rahou_Assignment3_Exercise3(inputvec, inverse)
% MOUMNA RAHOU, MATHEMATICS DEPARTMENT, VU UNIVERSITY  
%
% This function uses the divide-and-conquer approach to calculate either the 
% normal of the inverse Fourier transform of a vector. With this approach 
% the function generates two vectors at each iteration (?log?_2 (N) of 
% such iterations). The vectors have both a length of 1/2 N. The first 
% vector contains only the odd elements and the second vector contains only 
% the even elements. First we place the coefficients on the generated 
% vectors and then the vectors will be Fourier transformed. This approach is 
% implemented recursively. We only needed O(nlog(n)) operations to compute 
% this Fourier which is beter then O(n2) operations.
% 
% The input is a vector and a variable. The inputvector contains the values 
% of which the normal or inverse Fourier transform has to be calculated 
% from. The inputvariable is a 0-1 variable that says whether the inverse 
% should be calculated or not. The function assumes that the inputvector has 
% length 2^N where N ?0 and is a discrete number. If N does not meet this 
% conditions then the function will not work since we split the vector in 
% odd and even elements each iteration). The output is the mentioned normal 
% or inverse Fourier transform.

if inverse
    inputvec = conj(inputvec);
end

N = length(inputvec);

if N == 1
    output = inputvec;
else
    y1 = Rahou_Assignment3_Exercise3(inputvec(1:2:end), 0);
    y2 = Rahou_Assignment3_Exercise3(inputvec(2:2:end), 0);
    
    z = exp(-(2*pi*1i/N)*(0:(N/2 - 1))).*y2;
    output = [y1 + z, y1 - z];
end

if inverse
    output = conj(output/length(inputvec));
end

end
%deleted inefficienties assignment 3
%
%exercise 1
%calculate the residue
%residue = norm(A*c-b)
residue_initial_lambda = 0
for i=1:length(x)
    %compute exp(lambda_j*x_i) * C_j
    f_of_x_i = 0
    for j=1:length(vector_c)
        f_of_x_i = f_of_x_i + A(i,j) * vector_c(j) 
    end
    residue_x_i = (vector_y(i) - f_of_x_i)^2
    residue_initial_lambda = residue_initial_lambda + residue_x_i
end
%
%A enzo moest blijkbaar afhankelijk zijn van lambda als functie, dus
%onderstaande komt te vervallen:
%creating mx2 matrix, OF IS DIT USER INPUT??
for i=1:length(vector_initial_guesses)
    matrix(i) = [1;exp(vector_initial_guesses(i)*x)]
end
%
%solve C's (after asking teacher):
%define matrix with x_i on i^th row, lambda_j on j_th column
A = zeros(length(vector_x),length(vector_lambda))
for row = 1:length(vector_x)
    for column = 1:length(vector_lambda)
        A(row,column) = exp(vector_lambda(column)*vector_x(row))
    end
end
%solve vector_c
vector_c = A \ vector_y
%calculate the residue
vector_residue = A * vector_c - vector_y
residue = sum(vector_residue.^2)
%now use found C to minimalize residue over lambda
func = @(x) exp(lambda  
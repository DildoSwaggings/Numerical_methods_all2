function x = Oosterhuis_assignment2_exercise3(vector_complex_numbers,vector_discretization,iteration_steps)
%uitleg
%
%giving default value to non given optional user input:
if exist('iteration_steps')
else iteration_steps = 10
end
%
% taking complex numbers that define corners of rectangle in complex plane
% from user input
complex_number_1 = vector_complex_numbers(1)
complex_number_2 = vector_complex_numbers(2)
% taking max and min for top, bottom, left and right of rectangle in
% complex plane
complex_high = max(imag(complex_number_1),imag(complex_number_2))
complex_low = min(imag(complex_number_1),imag(complex_number_2))
real_high = max(real(complex_number_1),real(complex_number_2))
real_low = min(real(complex_number_1),real(complex_number_2))
% defining function and roots of function
func = @(z) z^3 - 1
dfunc = @(z) 3*z^2
root1 = 1
%root2 = (cos(2*pi/3)+1i*sin(2*pi/3))
%root3 = (cos(4*pi/3)+1i*sin(4*pi/3))
root2 = -0.5000 + 0.8660i
root3 = -0.5000 - 0.8660i
%
% defining values for function input required for using
% newton_vector_output(...)
%x0=2
tol = 0.00001
tol_root = 0.01
nmax = iteration_steps
%newton1 = newton_vector_output(func,dfunc,x0,tol,nmax)
%
%define plotlim for y
%vectory = linspace(min(func(complex_number_1),func(complex_number_2)),max(func(complex_number_1),func(complex_number_2)),length(newton1))
%
%Define plotlim in real direction
length_of_real_axis = abs(real(complex_number_1) - real(complex_number_2))
length_of_complex_axis = abs(imag(complex_number_1) - imag(complex_number_2))
%Define the number of steps in real and complex direction based on user
%input
discretization_real = vector_discretization(1)
discretization_complex = vector_discretization(2)
%Define colormap
colormap([1 0 0; 1 1 1; 1 1 0])
%make matrix with dimension of these number of steps
m = ones(discretization_real,discretization_complex)
%begin with y in left upper corner of complex plane
y = real_low + i*complex_high
%looping over the elements of the matrix m, starting with loop over columns
for j=1:discretization_real+1
        %looping over rows
       for k=1:discretization_complex+1
        %compute zero of y using newton_vector_output and taking the last
        %element:
        %newton_vector = newton_vector_output(func,dfunc,y,0.00001,20)
        %zero = newton_vector(length(newton_vector))
        %
        %compute zero using newton_blackboard(..):
        zero = newton_blackboard(func,dfunc,y,tol,nmax)
        %
        %since if statements are not working, try this:
        m(k,j) = zero;
        b(k,j) = y;
        %give color to y based on to which root y converges
        if abs(real(zero - root1)) <= 0.1 && abs(imag(zero - root1)) <=  0.1%<=  0.1i %- tol_root*(1+1i) && zero <= root1 + tol_root*(1+1i),
            m(k,j) = 1;
        elseif abs(real(zero - root2)) <= 0.1 && abs(imag(zero - root2)) <=  0.1 %- tol_root*(1+1i) && zero <= root2 + tol_root*(1+1i),
            m(k,j) = 2;
        elseif abs(real(zero - root3)) <= 0.1 && abs(imag(zero - root3)) <=  0.1%- tol_root*(1+1i) && zero <= root3 + tol_root*(1+1i),
            m(k,j) = 3;
        else 
            m(k,j) = 0;
        end
        %move y one discretization step to below, parralel to complex axis
        y = y - 1i*(length_of_complex_axis/discretization_complex)
        %newton
    end
    %moving y one discretization step to the right on real axisnewt
    y = real(y) + (length_of_real_axis/discretization_real)+ 1i*complex_high
end
    
%plotting the results
image([real_low complex_high],[complex_low complex_high],m),
axis xy 
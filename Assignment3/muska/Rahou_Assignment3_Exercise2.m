function Rahou_Assignment3_Exercise2
% MOUMNA RAHOU, MATHEMATICS DEPARTMENT, VU UNIVERSITY 
%
%This function has no input or output variables. It opens a rectangle on 
%the screen, and requests the user to place a hand in the rectangle and to 
%outline the hand by clicking. The clicks may not form a straight line 
%since a straight line has no area and at least three unique clicks are 
%required.  After outlining the hand, the points are interpolated using 
%splines such that the shape of a hand is produced and the center of mass 
%of the hand is calculated.  The center of mass is calculated by 
%Green's theorem. 
%
%In this figure the outlining of the hand by clicking  is marked with the 
%red stars. The interpolated curve is displayed with a blue line. The area 
%within the curve is green and the center of mass is marked with a X. 

figure('position', get(0, 'Screensize'), 'Name', 'Input figure');
text(0.05, 0.5, {'Step 1: Put your hand on this screen.',  ...
    'Step 2: Outline your hand with mouseclicks',  ...
    'Step 3: Press enter when finished clicking. '});
clicks = ginput;

if(length(clicks) < 3)
     error('Error: At least 3 (subsequently unique) clicks are required!');
end

numuniqueclicks = 1;
coordinates = [clicks(1, :); zeros(length(clicks) - 1, 2)];

for j = 2 : length(clicks)
    if (clicks(j, 1) ~= clicks(j - 1, 1) || clicks(j, 2) ~= clicks(j - 1, 2))
        numuniqueclicks = numuniqueclicks + 1;
        coordinates(numuniqueclicks, :) = clicks(j, :);
    end
end

coordinates = coordinates(1:numuniqueclicks, :);
coordinates(length(coordinates) + 1, :) = coordinates(1, :);

delta = [[0; diff(coordinates(:, 1))], [0; diff(coordinates(:, 2))]];
dist = cumsum(sqrt(delta(:, 1).^2 + delta(:, 2).^2));

distpoints = linspace(0, dist(end), 10000);
splineX = spline(dist, coordinates(:, 1), distpoints)';
splineY = spline(dist, coordinates(:, 2), distpoints)';

x2 = [splineX(2:end); splineX(1)];
y2 = [splineY(2:end); splineY(1)];
A = 1/2*sum(splineX.*y2 - x2.*splineY);
centerMassX = sum((splineX.*y2 - x2.*splineY).*(splineX + x2))/(6*A);
centerMassY = sum((splineX.*y2 - x2.*splineY).*(splineY + y2))/(6*A);

clf('reset');
hold on;
plot(splineX, splineY, 'b', 'LineWidth', 2);
title('The center of mass');
fill(splineX, splineY, 'g');
plot(coordinates(:, 1), coordinates(:, 2), 'r*');
plot(centerMassX, centerMassY, 'kX', 'LineWidth', 30);
hold off;

end
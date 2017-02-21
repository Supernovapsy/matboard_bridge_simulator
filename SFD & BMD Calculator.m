% Program that calculates the shear force diagram and bending moment
% diagram for a uniform beam with already calculated point loads.

length = 18;
divisions_per_unit = 10;
elementN = divisions_per_unit * length + 1;
% load_distribution needs to have length + 1 elements.
load_distribution = [0, 1, 0, 1, -4.5, 1, 0, 1, 0, 1, 0, 1, 0, 1, -4.5, 1, 0, 1, 0];

beam = linspace(0, length, elementN);
for i = 0:length
    beam(i*divisions_per_unit + 1) = load_distribution(i + 1);
end

SFD = linspace(0, length, elementN);
SFD(1) = beam(1);
for i = 2:elementN
    SFD(i) = SFD(i - 1) + beam(i);
end

BMD = linspace(0, length, elementN);
for i = 2:elementN
    BMD(i) = BMD(i - 1) + SFD(i - 1);
end

x = 1:elementN;
plot(x, SFD);
title('shear force diagram');
plot(x, BMD);
title('bending moment diagram');
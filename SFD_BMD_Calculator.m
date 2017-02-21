% Program that calculates the shear force diagram and bending moment
% diagram for a uniform beam with already calculated point loads.

length = 36;
divisions_per_unit = 10;
elementN = divisions_per_unit * length + 1;
% load_distribution needs to have length + 1 elements.
% Best two solenoid distribution: load_distribution = [0, 0, 1, 0, 0, 0, 1, 0, 0, -4.5, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, -4.5, 0, 0, 1, 0, 0, 0, 1, 0, 0];
% *************10.27 cm from centre.
% Best three solenoid distribution: load_distribution = [0, 0, 1, 0, 0, 0, -2, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, -2, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, -2, 0, 0, 0, 1, 0, 0];
load_distribution = [0, 0, 1, 0, 0, 0, 1, 0, 0, -4.5, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, -4.5, 0, 0, 1, 0, 0, 0, 1, 0, 0];

beam = zeros(1, elementN);
for i = 0:length
    beam(i*divisions_per_unit + 1) = load_distribution(i + 1);
end

SFD = zeros(1, elementN);
SFD(1) = beam(1);
for i = 2:elementN
    SFD(i) = SFD(i - 1) + beam(i);
end

BMD = zeros(1, elementN);
for i = 2:elementN
    BMD(i) = BMD(i - 1) + SFD(i - 1);
end

x = 1:elementN;
subplot(2, 2, 1);
plot(x, beam);
title('force profile');
subplot(2, 2, 2);
plot(x, SFD);
title('shear force diagram');
subplot(2, 2, 3);
plot(x, BMD);
title('bending moment diagram');
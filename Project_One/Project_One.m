% Project One
% Mukesh Ghimire
% Yiqiu Dai


clc
clear

speed = 45;
v = speed * 0.44704;
L = 0.65;

% phase shift
f = 2*pi*v/L;


p = 2*f;

TT=2+3*(2*pi/f);




% Masses
m2 = 75; % mass of the driver

m1 = 125; % mass of the seat

m = 150; % mass of the bike

% spring constants
k = 25000;
k1 = 4000;
k2 = 6000;

% Damping coefficient
b = 220;
b1 = 170;
b2 = 10;

sim Project_One_Simulink
for i = length(d):-1:1
    if (abs(d(i)) >= 0.001) 
        fprintf('Settling time for a speed of %g mph is approximately: %g seconds\n', speed, ceil(t(i)));
        break;
    end
end

fprintf('max force is: %g \n', max(abs(force))) ;

    
% Displacement vs Time
 plot(t, d);
% grid on;







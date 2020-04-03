clc
clear

m = 10; % mass = 10 kg
m_un = 0.05; % mass of unbalanced load = 0.05 kg
e = 0.1; % distance from the center of rotation 
k = 10*1000; % stiffness in N/m starting at 10kN/m 
j = 0.01; % damping coefficient 
for i = 1:1:10
    w_n(i) = sqrt(k/m);
    num = [-m_un*e/m 0 0];
    den = [1 2*j*w_n(i) w_n(i)^2];
    system = tf(num, den);
    bode(system)
    [mag] = bode(system, w_n(i))  % amplitude of the system at resonant frequency
    hold on;
    grid on;
    k = k +(10*1000);
end
legend('k=10kN','k=20kN','k=30kN','k=40kN','k=50kN','k=60kN','k=70kN','k=80kN','k=90kN','k=100kN');


[x, y] = ginput;

% loop over ginput to find resonant frequencies
for i = 1:length(y)
    displacement(i) = 10^(y(i)/20);
end

for i = 1:length(w_n)
    w_r = w_n(i).*sqrt(1-2*(j^2));
    rpm(i) = (w_r./(2*pi)).*60;
end

displacement    
rpm



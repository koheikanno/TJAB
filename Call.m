clc
clear all
close all
M0 = 2
alt = 20000
pi_c = 20
Tt4 = 2000
Tt7 = 2220
d = linspace(0.1,2,1000)
Tt = zeros(length(pi_c),7)
Pt = zeros(length(pi_c),7)

for i = 1:length(d)
[Tt(i,:), Pt(i,:), M9(i), f(i), S(i), F_m0(i), T(i), D_add(i)] = realTJAB(M0, alt, pi_c, Tt4, Tt7, d(i))
end

subplot(2,3,1)
plot(d,M9)
title('Exit Mach vs Compressor Pressure Ratio')
xlabel('Pic')
ylabel('Exit Mach Number')

subplot(2,3,2)
plot(d,f)
title('Air Fuel Ratio vs Compressor Pressure Ratio')
xlabel('Pic')
ylabel('Air Fuel Ratio')

subplot(2,3,3)
plot(d,S)
title('Specific Fuel Consumption vs Compressor Pressure Ratio')
xlabel('Pic')
ylabel('Specific Fuel Consumption')

subplot(2,3,4)
plot(d,F_m0)
title('Specific Thrust vs Compressor Pressure Ratio')
xlabel('Pic')
ylabel('Specific Thrust')

subplot(2,3,5)


plot(d,T)
title('Thrust vs Diameter of Inlet')
xlabel('Diameter of Inlet [m]')
ylabel('Thrust [N]')
set(gcf, 'color' ,'white');
x = [0,max(d)]
y = [160000 160000]
z = line(x,y)
z.Color = 'r'
legend ('Thrust [N]','Takeoff Thrust Required [N]')




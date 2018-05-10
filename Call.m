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
disp('I like coconuts')

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

Tt4 = linspace(0,2000,100);
Tt7 = linspace(0,2200,100);
for i = 1:length(Tt4)
    for j = 1:length(Tt7)
        [~, ~, ~, ~, ~, ~, ~, ~, F_burn(j,i), ~] = realTJAB(3, 18000, 5, Tt4(i), Tt7(j), 0.9);
    end
end

%%
pic = linspace(2,20,100);
d = linspace(0,2,100);
for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, T1800(j,i), ~, ~, ~] = realTJAB(0, 0, pic(i), 2000, 1800, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, T2000(j,i), ~, ~, ~] = realTJAB(0, 0, pic(i), 2000, 2000, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, T2200(j,i), ~, ~, ~] = realTJAB(0, 0, pic(i), 2000, 2200, d(j));
    end
end

figure,
s1800 = surf(pic, d, T1800)
hold on,
s2000 = surf(pic, d, T2000)
hold on,
s2200 = surf(pic, d, T2200)

x = [pic(1), pic(end)];
y = [d(1), d(end)];
z = [160e3, 160e3; 160e3, 160e3];

hold on,
plane = surf(x, y, z)

%%
pic = linspace(2,20,100);
d = linspace(0,2,100);
for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, ~, ~, F1800(j,i), ~] = realTJAB(3, 18000, pic(i), 2000, 1800, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, ~, ~, F2000(j,i), ~] = realTJAB(3, 18000, pic(i), 2000, 2000, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, ~, ~, F2200(j,i), ~] = realTJAB(3, 18000, pic(i), 2000, 2200, d(j));
    end
end

figure,
f1800 = surf(pic, d, F1800)
hold on,
f2000 = surf(pic, d, F2000)
hold on,
f2200 = surf(pic, d, F2200)
clc
clear all
close all
M0 = 0;
alt = 0;
pi_c = 20;
Tt4 = 2000;
Tt7 = 2220;
d = linspace(0,1.5,100);
Tt = zeros(length(pi_c),7);
Pt = zeros(length(pi_c),7);
size = 20;

for i = 1:length(d)
[Tt0(i,:), Pt0(i,:), M90(i), f0(i), S0(i), F_m00(i), T0(i), D_add0(i)] = realTJAB(M0, alt, pi_c, Tt4, Tt7, d(i));
end

q = plot(d,T0);
title('Thrust vs Diameter of Inlet','fontsize',size);
xlabel('Diameter of Inlet [m]','fontsize',size);
ylabel('Thrust [N]','fontsize',size);
set(gcf, 'color' ,'white');
x = [0,max(d)];
y = [160000 160000];
z = line(x,y);
ylim([0,350000]);
z.Color = 'r';
grid on
leg = legend ('Thrust [N]','Takeoff Thrust Required [N]','location','northwest');
leg.FontSize = size;
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
%%
d0 = 0.75

pic = linspace(2,40,100)
for i = 1:length(pic)
[Tt1(i,:), Pt1(i,:), M91(i), f1(i), S1(i), F_m01(i), T1(i), D_add1(i)] = realTJAB(M0, alt, pic(i), Tt4, Tt7, d0)
end


clc
clear all
close all
%%
M0 = 0;
alt = 0;
pi_c = 3;
Tt4 = 2000;
Tt7 = 2220;
d = linspace(0,1.5,100);
Tt = zeros(length(pi_c),7);
Pt = zeros(length(pi_c),7);
size = 20;

for i = 1:length(d)
[Tt0(i,:), Pt0(i,:), M90(i), f0(i), S0(i), F_m00(i), T0(i), D_add0(i), etap(i), etat(i), eta0(i) ,f_ab(i), F_burn(i),mdot_0(i)] = realTJAB(M0, alt, pi_c, Tt4, Tt7, d(i));
end
figure
q = plot(d,T0);
title('Takeoff Thrust vs Diameter of Inlet','fontsize',size);
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
clear all
Tt4 = 2000;
Tt7 = 2220;
d0 = 0.8283;
M0 = 3;
alt = 18000;
pic = linspace(1,10,100);
size = 20;
for i = 1:length(pic);
[Tt1(i,:), Pt1(i,:), M91(i), f1(i), S1(i), F_m01(i), T1(i), D_add1(i), etap(i), etat(i), eta0(i), f_ab(i), F_burn(i),mdot_0(i)] = realTJAB(M0, alt, pic(i), Tt4, Tt7, d0);
end

figure
plot(pic,T1)
title('Cruise Thrust vs \pi_c','fontsize',size)
xlabel('Compressor Pressure Ratio \pi_c','fontsize',size)
ylabel('Thrust [N]','fontsize',size)
set(gcf, 'color' ,'white');


figure
subplot(2,3,1)
plot(pic,M91)
title({'Exit Mach vs';'Compressor Pressure Ratio'})
xlabel('Compressor Pressure Ratio')
ylabel('Exit Mach Number')


subplot(2,3,2)
plot(pic,f1)
title({'Air Fuel Ratio vs' ;'Compressor Pressure Ratio'})
xlabel('Compressor Pressure Ratio')
ylabel('Air Fuel Ratio')

subplot(2,3,3)
plot(pic,S1*1e6)
title({'Specific Fuel Consumption vs';'Compressor Pressure Ratio'})
xlabel('Compressor Pressure Ratio')
ylabel('Specific Fuel Consumption [mg/s/N]')

subplot(2,3,4)
plot(pic,F_m01)
title({'Specific Thrust vs';'Compressor Pressure Ratio'})
xlabel('Compressor Pressure Ratio')
ylabel('Specific Thrust [N/kg/s]')


subplot(2,3,5)
plot(pic,T1)
title({'Thrust vs';'Compressor Pressure Ratio'})
xlabel('Compressor Pressure Ratio')
ylabel('Thrust [N]')
set(gcf, 'color' ,'white');

subplot(2,3,6)
plot(pic,f_ab)
title({'Afterburner Air Fuel Ratio vs ';'Compressor Pressure Ratio'})
xlabel('Compressor Pressure Ratio')
ylabel('Afterburner Air Fuel Ratio')
set(gcf, 'color' ,'white');


figure('name','Efficiency vs Compressor Pressure Ratio');
subplot(1,3,1)
plot(pic,etap)
xlabel('Compressor Pressure Ratio','fontsize',size);
ylabel('Propulsive Efficiency','fontsize',size);
set(gcf, 'color' ,'white');

subplot(1,3,2)
plot(pic,etat)
xlabel('Compressor Pressure Ratio','fontsize',size);
ylabel('Thermal Efficiency','fontsize',size);
set(gcf, 'color' ,'white');

subplot(1,3,3)
plot(pic,eta0)
xlabel('Compressor Pressure Ratio','fontsize',size);
ylabel('Overall Efficiency','fontsize',size);
set(gcf, 'color' ,'white');
[ax,h1]=suplabel('Efficiencies vs Compressor Pressure Ratios' ,'t'); 
set(h1,'FontSize',30) 

figure
plot(pic,F_burn)
xlabel('Compressor Pressure Ratio','fontsize',size);
ylabel('Mass of fuel burnt [kg]','fontsize',size)
set(gcf, 'color' ,'white');
title({'Mass of Fuel Burnt vs ';'Compressor Pressure Ratio'},'fontsize',size)
%%
clear all
Tt4 = 2000;
Tt7 = 2220;
d0 = 0.8283;
M0 = 1.5;
M1 = 2;
M2 = 2.5;
M3 = 3;
pic1 = linspace(1,20,1000);
alt = 18000;
size = 20;
for i = 1:length(pic1);
[Tt1(i,:), Pt1(i,:), M91(i), f1(i), S1(i), F_m01(i), T1(i), D_add1(i), etap(i), etat(i), eta0(i), f_ab(i), F_burn(i),mdot_01(i)] = realTJAB(M0, alt, pic1(i), Tt4, Tt7, d0);
end
for i = 1:length(pic1);
[Tt1(i,:), Pt1(i,:), M91(i), f1(i), S2(i), F_m02(i), T1(i), D_add1(i), etap(i), etat(i), eta0(i), f_ab(i), F_burn(i),mdot_02(i)] = realTJAB(M1, alt, pic1(i), Tt4, Tt7, d0);
end
for i = 1:length(pic1);
[Tt1(i,:), Pt1(i,:), M91(i), f1(i), S3(i), F_m03(i), T1(i), D_add1(i), etap(i), etat(i), eta0(i), f_ab(i), F_burn(i),mdot_03(i)] = realTJAB(M2, alt, pic1(i), Tt4, Tt7, d0);
end
for i = 1:length(pic1);
[Tt1(i,:), Pt1(i,:), M91(i), f1(i), S4(i), F_m03(i), T1(i), D_add1(i), etap(i), etat(i), eta0(i), f_ab(i), F_burn(i),mdot_03(i)] = realTJAB(M3, alt, pic1(i), Tt4, Tt7, d0);
end

figure
hold on
plot(pic1,S1)
plot(pic1,S2)
plot(pic1,S3)
plot(pic1,S4)
set(gcf, 'color' ,'white');
xlabel('Compressor Pressure Ratio \pi_c','fontsize',size)
ylabel('Specific Fuel Consumption','fontsize',size)
legend('M_0 = 1.5','M_0 = 2','M_0 = 2.5','M_0 = 3')
title('Specific Fuel Consumption vs \pi_c','fontsize',size)
hold off








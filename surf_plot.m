%% Takeoff Conditions
pic = linspace(2,20,100);
d = linspace(0,2,100);
size = 18;
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
s1800.FaceColor = 'b'
hold on,
s2000 = surf(pic, d, T2000)
s2000.FaceColor = 'y'
hold on,
s2200 = surf(pic, d, T2200)
s2200.FaceColor = 'r'

x = [pic(1), pic(end)];
y = [d(1), d(end)];
z = [160e3, 160e3; 160e3, 160e3];

hold on,
plane = surf(x, y, z)
plane.FaceColor = 'g'
xlabel('\pi_c','fontsize',size)
ylabel('Inlet Diameter [m]','fontsize',size)
zlabel('Thrust [N]','fontsize',size)
set(gcf, 'color' ,'white');
title('Takeoff Conditions','fontsize',size)
leg = legend('Tt7=1800k','Tt7=2000k','Tt7=2200k','Required Thrust')
leg.FontSize = size;
%% Cruise Fuel Consumption
pic = linspace(2,20,100);
d = linspace(0,2,100);
for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, ~, ~,~,~,~,~, F1800(j,i), ~] = realTJAB(3, 18000, pic(i), 2000, 1800, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, ~, ~, ~,~,~,~,F2000(j,i), ~] = realTJAB(3, 18000, pic(i), 2000, 2000, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, ~, ~, ~,~,~,~,F2200(j,i), ~] = realTJAB(3, 18000, pic(i), 2000, 2200, d(j));
    end
end

figure,
f1800 = surf(pic, d, F1800)
f1800.FaceColor = 'b'
hold on,
f2000 = surf(pic, d, F2000)
f2000.FaceColor = 'y'
hold on,
f2200 = surf(pic, d, F2200)
f2200.FaceColor = 'r'

xlabel('\pi_c','fontsize',size)
ylabel('Inlet Diameter [m]','fontsize',size)
zlabel('Fuel Consumed [kg]','fontsize',size)
set(gcf, 'color' ,'white');
title('Cruise Conditions','fontsize',size)
leg = legend('Tt7=1800k','Tt7=2000k','Tt7=2200k')
leg.FontSize = size;
%% Cruise Thrust Conditions
pic = linspace(2,20,100);
d = linspace(0,2,100);
for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, T1800(j,i), ~, ~, ~] = realTJAB(3, 18000, pic(i), 2000, 1800, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, T2000(j,i), ~, ~, ~] = realTJAB(3, 18000, pic(i), 2000, 2000, d(j));
    end
end

for i = 1:length(pic)
    for j = 1:length(d)
        [~, ~, ~, ~, ~, ~, T2200(j,i), ~, ~, ~] = realTJAB(3, 18000, pic(i), 2000, 2200, d(j));
    end
end

figure,
s1800 = surf(pic, d, T1800)
s1800.FaceColor = 'b'
hold on,
s2000 = surf(pic, d, T2000)
s2000.FaceColor = 'y'
hold on,
s2200 = surf(pic, d, T2200)
s2200.FaceColor = 'r'

x = [pic(1), pic(end)];
y = [d(1), d(end)];
z = [160e3, 160e3; 160e3, 160e3];

hold on,
% plane = surf(x, y, z)
xlabel('\pi_c','fontsize',size)
ylabel('Inlet Area [m \^2 ]','fontsize',size)
zlabel('Thrust [N]','fontsize',size)
set(gcf, 'color' ,'white');
title('Cruise Conditions','fontsize',size)
leg = legend('Tt7=1800k','Tt7=2000k','Tt7=2200k')
leg.FontSize = size;
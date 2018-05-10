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
%% JP-8/Air Mixture Ratio of Specific Heats (gamma)
%
% Professor Vergine
%
% Kohei Kanno, Scott Sherod, Alex Lui, Andy Lee
%
% 5/1/2018
%
% According to Mattingly, J. D. & von Ohain, H., "Elements of Propulsion:
% Gas Turbines and Rockets", 2nd Edition, p. 357.
%
% INPUTS:
% T: Temperature of the mixture (K)
% f: Fuel/air ratio
%
% OUTPUT:
% g: Ratio of specific heats, gamma


function g = gamma_f(T, f)
load gamma_tab.mat

for ii = 1:length(gamma_fuel)
    afr(ii) = gamma_fuel(ii).f;
end

for ii = 1:length(gamma_fuel)
    vq(ii) = interp1(gamma_fuel(ii).tab(:,1), gamma_fuel(ii).tab(:,2), T, 'pchip', 'extrap');
end

g = interp1(afr, vq, f, 'pchip', 'extrap');
end
%% JP-8/Air Mixture Specific Heat
%
% Professor Vergine
%
% Kohei Kanno, Scott Sherod, Alex Lui, Andy Lee
%
% 5/1/2018
%
% According to Mattingly, J. D. & von Ohain, H., "Elements of Propulsion:
% Gas Turbines and Rockets", 2nd Edition, p. 356.
%
% INPUTS:
% T: Temperature of the mixture (K)
% f: Fuel/air ratio
%
% OUTPUT:
% cp: Specific heat (J/kg-K)


function [cp, var] = cp_f(T, f)
load cp_tab.mat
var = 1;
for ii = 1:length(cp_tab)
    afr(ii) = cp_tab(ii).f;
end

for ii = 1:length(cp_tab)
    vq(ii) = interp1(cp_tab(ii).tab(:,1), cp_tab(ii).tab(:,2), T, 'pchip', 'extrap');
end

cp = interp1(afr, vq, f, 'pchip', 'extrap');
end
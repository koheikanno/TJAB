%% AE 167 Final Project
%
% Professor Vergine
%
% Kohei Kanno, Scott Sherod, Andy Lee, Alex Lui
%
% Real Turbojet Engine w/ Afterburner Performance Calculator
%
% Assumes M1 = 0.5, Level 4 technology, Jet-A/JP-8
%
% INPUTS:
% M0: Freestream Mach number
% alt: Altitude (m)
% pi_c: Compressor pressure ratio
% Tt4: Total temperature after combuster (Throttle setting) (K)
% Tt7: Total temperature after afterburner (K)
% d: Inlet diameter (m)
%
% OUTPUTS:
% Tt: Total temperature array, stations 0, 2, 3, 4, 5, 7, 9(K)
% Pt: Total pressure array, stations 0, 2, 3, 4, 5, 7, 9 (K)
% M9: Exit Mach number
% f: Air/fuel ratio
% f_ab: Air/fuel ratio for afterburner
% S: TSFC (kg/kg/s)
% F_m0: Specific thrust (N/kg/s)
% T: thrust (N)

function [Tt, Pt, M9, f, S, F_m0, T, D_add] = realTJAB(M0, alt, pi_c, Tt4, Tt7, d)
[T0, a0, P0, rho0] = atmoscoesa(alt);
cp_c = 1004.8; %j/kgk
gamma_c = 1.3999;
R_c = (1 - 1/gamma_c) * cp_c;

% cp_t, gamma_t and cp_ab and gamma_ab are functions of themselves...???
cp_t = 1335.4; %j/kgk
gamma_t = 1.2754;
R_t = (1 - 1/gamma_t) * cp_t;
cp_ab = 1426.8; %j/kgk
gamma_ab = 1.2576;
R_ab = (1 - 1/gamma_ab) * cp_ab;
gc = 1;
M1 = 0.5;

s0 = 7291.7; % J/kg-K
hpr = 42800e3; % J/kg

A1 = pi * d^2 / 4; % m2
mdot_0 = rho0 * M1 * a0 * A1;

% Ram Air
tau_r = 1 + (gamma_c - 1)/2 * M0 ^2;
pi_r = tau_r ^ (gamma_c / (gamma_c - 1));
if M0 <= 1
    eta_r = 1;
elseif M0 < 5
    eta_r = 1 - 0.075 * (M0 - 1)^1.35;
else
    eta_r = 800 / (M0^4 + 935);
end
Tt(1) = T0 * tau_r;
Pt(1) = P0 * pi_r;

% Inlet + Diffuser
pi_d_max = 0.96;
pi_d = pi_d_max * eta_r;
tau_d = 1;
eta_d = (tau_r * pi_d ^ ((gamma_c - 1)/gamma_c) - 1) / (tau_r - 1);
Tt(2) = Tt(1) * tau_d;
Pt(2) = Pt(1) * pi_d;

% Compressor
e_c = 0.9;
tau_c = pi_c ^((gamma_c - 1) / (gamma_c * e_c));
eta_c = (pi_c ^((gamma_c - 1) / gamma_c) - 1) / (tau_c -1);
Tt(3) = Tt(2) * tau_c;
Pt(3) = Pt(2) * pi_c;

% Combustion
pi_b = 0.95;
eta_b = 0.999;
Pt(4) = Pt(3) * pi_b;
Tt(4) = Tt4;
f = (cp_c * Tt(3) - cp_t * Tt(4)) / (cp_t * Tt(4) - eta_b * hpr);

% Turbine
tau_l = cp_t * Tt(4) / cp_c / T0;
eta_m = 0.995;
e_t = 0.89;
tau_t = 1 - 1 / (eta_m * (1 + f)) * tau_r / tau_l * (tau_c - 1);
pi_t = tau_t ^ (gamma_t / ((gamma_t - 1) * e_t));
Tt(5) = Tt(4) * tau_t;
Pt(5) = Pt(4) * pi_t;

% Afterburner
pi_ab = 0.95;
eta_ab = 0.999;
Pt(6) = Pt(5) * pi_ab;
Tt(6) = Tt7;
tau_l_ab = cp_ab / cp_c * Tt(6) / T0;
f_ab = (1 + f) * (tau_l_ab - tau_l * tau_t) / (eta_ab * hpr / (cp_c * T0) - tau_l_ab);

% Nozzle
tau_n = 1;
pi_n = 0.97;
Tt(7) = Tt(6) * tau_n;
Pt(7) = Pt(6) * pi_n;

% Other shizzles
P9 = P0;
P0_P9 = P0 / P9;
Pt9_P9 = pi_r * pi_d * pi_c * pi_b * pi_ab * pi_n;
M9 = (2 / (gamma_ab - 1) * (Pt9_P9 ^ ((gamma_ab - 1) / gamma_ab) - 1))^0.5;

T9_T0 = Tt7 / T0 / Pt9_P9^((gamma_ab - 1) / gamma_ab);
T9 = T0 * T9_T0;
V9_a0 = M9 * ((gamma_ab * R_ab * T9) / (gamma_c * R_c * T0))^0.5;
F_m0 = a0 / gc * ((1 + f + f_ab) * V9_a0 - M0 + (1 + f + f_ab) * R_ab / R_c * T9_T0 / V9_a0 * (1 - P0_P9) / gamma_c);
T = F_m0 * mdot_0;
S = (f + f_ab) / F_m0;
P1 = Pt(1) / ((1 + (gamma_c - 1)/2 * M1 ^2) ^ (gamma_c / (gamma_c - 1)));

MFP_1 = (gamma_c * gc / R_c)^0.5 * M1 * (1 + (gamma_c - 1)/2 * M1^2)^(-(gamma_c + 1) / (2 * (gamma_c - 1)));
mdot_1 = MFP_1 * Pt(1) * A1 / Tt(1)^0.5;
MFP_0 = (gamma_c * gc / R_c)^0.5 * M0 * (1 + (gamma_c - 1)/2 * M0^2)^(-(gamma_c + 1) / (2 * (gamma_c - 1)));

if MFP_0 ~= 0
    A0 = mdot_1 * Tt(1)^0.5 / Pt(1) / MFP_0;
    D_add = P1 * A1 * (1 + gamma_c * M1^2) - P0 * A0 * gamma_c * M0^2 - P0 * A1;
else
    D_add = P1 * A1 * (1 + gamma_c * M1^2) - P0 * A1;
end

T = T - D_add;
end
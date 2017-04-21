%demonstrate that the mixing of a perturbation field with an existing
%field, when the perturbation field simply oscillates sinusoidally, creates
%zero net change in the intensity. This has relevance to HabEx, where the
%mechanical oscillations of the secondary may cause perturbing field that
%can average out over a frame. Also, WFIRST similarly can benefit from such
%averaging out of jitter induced field perturbations. 
% Bijan Nemati - UAH - 21-Apr-2017

clear 
clc

% time
N = 100;
t = (1:N)-1;
onev = ones(1, 100);

Ephase = pi/3;
dEphase = Ephase + pi/7; 

% First create an exiting field
E = onev * exp(1i*Ephase);

% now a sinusoidally varying perturbing field
dE = 0.5 * sin(2*pi*(2/N)*t) * exp(1i * dEphase);

% finally the total field which is the sum of E and dE
Etot = E + dE;


twoReEdE = 2*real(conj(E).*dE);

plot(t, conj(E).*E, t, conj(dE).*dE, t, conj(Etot).*Etot, t, twoReEdE)
legend('E^*E', '\Delta{E^*}\Delta{E}', '|E+\Delta{E}|^2', '2Re[E^*\Delta{E}]')
grid
title('Intensities of E, \Delta{E}, and their sum')
ylabel('Intensity')
xlabel('t')


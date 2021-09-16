%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                GNU GENERAL PUBLIC LICENSE
%                 Version 3, 29 June 2007
%          https://www.gnu.org/copyleft/gpl.html
%          Author: Costanzo Manes, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% leptin_main
% main program that simulates the Leptin model in
% "A mathematical model of murine metabolic regulation by leptin..."
% By J. Tam, D. Fukumura, R.K. jain, Cell Metab. 2009

% needs: 
%   Model parameters.m
%   leptin_model.m

close all, clear all, clc

% Define Simulation Interval
dt=0.1;  Tend=30;
Tsim=0:dt:Tend;

% Set model type
global SetPmodel Settling
%SetPmodel=1;  Settling=1-SetPmodel;
 Settling=0;   SetPmodel=1-Settling;
% Note: 
%    Set point model:      SetPmodel=1; Settling=0;
%    Settling point model: Settling=1; SetPmodel=0;


% setting parameters
mod_parameters

% a2=a2/10;
% a4=a4/10;

% Initial values
% E_0 FM_0 Lep_plasma_0 

FM_0=2;  %g
E_0=FM_0*pho_fat;  %g*kcal/g=kcal
Lep_plasma_0=(FM_0*R_syn)/(GFR*RenClearance); % (g*(ml/week)/((ml/week)*(N/A)))=g;

% Initial state
if SetPmodel
   x0=[ Lep_plasma_0; E_0; 0];
end
if Settling
   x0=[ Lep_plasma_0; E_0];
end

[T,X]=ode45('leptin_model',Tsim,x0);

Lep_plasma=X(:,1);
Fat_mass=X(:,2)/pho_fat;

if SetPmodel
    Titolofig='Set Point Simulation';
end
if Settling
    Titolofig='Settling Point Simulation';
end

figure(1)
title(Titolofig)
subplot(211)
plot(T,Lep_plasma), grid
ylabel('Plasma Leptin')
subplot(212)
plot(T,Fat_mass), grid
ylabel('Fat mass')
set(1,'Position',[10 20 830 560])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main References
% 
% Tam, J.; Fukumura, D.;  Jain, R. K.; A mathematical model of murine
% metabolic regulation by leptin: energy balance and defense of a stable
% body weight. Cell Metab. 2009 January 7; 9(1): 52–63.
% doi:10.1016/j.cmet.2008.11.005. 
% 
% Uluseker, C.; Mathematical Model for
% Leptin Dynamics. Master of Science Thesis, MathMods Erasmus Mundus M.Sc.
% Programme, Mathematical Models in Life and Social Sciences. Department of
% Information Engineering, Computer Science and Mathematics. University of
% L'Aquila: Italy: 2014.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                GNU GENERAL PUBLIC LICENSE
%                 Version 3, 29 June 2007
%          https://www.gnu.org/copyleft/gpl.html
%          Author: Costanzo Manes, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function xdot=leptin_model(t,x)

% Leptin Model from paper:
% "A mathematical model of murine metabolic regulation by leptin..."
% By J. Tam, D. Fukumura, R.K. jain, Cell Metab. 2009

##xdot=0*x;

global k1 k2 k3 k4 k5 k6 k7 k8
global FFM  SetPt beta alfa R_syn GFR RenClearance pho_fat pho_food
global a1 a2 a3 a4 c1 c2

global SetPmodel Settling
% Set point model:      SetPmodel=1; Settling=0;
% Settling point model: Settling=1; SetPmodel=0;

% State variables
Lep_plasma=x(1); % Leptin in plasma
E=x(2);          % Stored Energy

if SetPmodel
    IntErr=x(3);     % Integral of the error
end

% Fat Mass
FM=E/pho_fat;
% Body Mass
BM=FM+FFM; % [Equation 7]
% Blood Volume
BV=alfa*BM+beta;

Lep_brain=k1*Lep_plasma/(k2+Lep_plasma)+k3*Lep_plasma; % [Eq. 2]

% Set point model: Proportional + Integral term
if SetPmodel
   FoodIntake=a1*(Lep_brain - SetPt)+a2*IntErr + c1;    % [Equation 8]
   Eout=BM*(a3*(Lep_brain - SetPt)+a4*IntErr+c2);       % [Equation 9]
end

% Settling point model
if Settling
   FoodIntake=k4*(1-Lep_brain/(k5+Lep_brain));         % [Equation 3]
   Eout=k6*BM*(1+k7*Lep_brain/(k8+Lep_brain));         % [Equation 5]
end

Ein=pho_food*FoodIntake;    % [Equation 4]

xdot(1)=(FM*R_syn-GFR*RenClearance*Lep_plasma)/BV;      % [Equation 1]
xdot(2)=Ein-Eout;              % [Equation 6]

if SetPmodel
   xdot(3)=Lep_brain - SetPt;  % Integral of the error
end

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                GNU GENERAL PUBLIC LICENSE
%                 Version 3, 29 June 2007
%          https://www.gnu.org/copyleft/gpl.html
%          Author: Costanzo Manes, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Model parameters
% Collected by Jorge

global k1 k2 k3 k4 k5 k6 k7 k8
global FFM  SetPt beta alfa R_syn GFR RenClearance pho_fat pho_food
global a1 a2 a3 a4 c1 c2

k1=1.42;%ng/g
k2=15.6;%ng/ml
k3=0.00272;%ml/g
k4=5.6;%g/week
k5=0.55;%ng/g
k6=0.24432;%kcal/g/week this value is the papers value multiplied by 10^-3
k7=1;%N/A
k8=0.22;%ng/g
% k9=7;
% k10=9;

FFM=22;%g
beta=1.5;
alfa=0.022;

R_syn=51.84;%ng/g/week
% R_syn=0;
GFR=284.4;%ml/week
RenClearance=0.25;%N/A

% Those values are redefined in the second simulation setting
% pho_fat=9*4.18;
pho_fat=9;% this parameter is not given by the paper and the values from Msc thesis does not provide the aimed behavour

% pho_food=0.5;
pho_food=3.2;%kcal/g

% a1=-0.24*7;%g^2/ng/week
% a2=-288*49;%g^2/ng/week^2
% a3=7.2*7;%cal/ng/week
% a4=86.4*49;%kcal/ng/week^2

a1=-0.24;%g^2/ng/week
a2=-288;%g^2/ng/week^2
% a3=7.2;%cal/ng/week
% a4=86.4;%kcal/ng/week^2
a3=80.2469;
a4=243.4089;

% a1=-0.1;
% a2=-0.1;
% a3=0.1;
% a4=0.1;
% SetPt=0.0;
SetPt=0.3370;
% SetPt=0.6869;

% c1=0.1;
% c2=0.1;
% c1=SetPt;
% c2=SetPt;

c1=3.4724;
c2=11.1116;

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

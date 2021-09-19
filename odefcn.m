## Copyright (C) 2021 Jorge Guerra Pires
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{dydt} =} fn (@var{t}, @var{y})
##
## @seealso{}
## @end deftypefn

## Author: Jorge <jorgeguerrabrazil@gmail.com>
## Created: 2021-09-17

function xdot = odefcn( x, parameters)
 
size(x) 


#### just for testing
##FM=10;
##BV=20;
##SetPmodel=1;

##parameters used on the model_1
R_syn=parameters(1);
GFR=parameters(2);
RenClearance=parameters(3);
a1=parameters(4);
SetPt=parameters(5);
a2=parameters(6);
c1=parameters(7);
c2=parameters(8);
SetPmodel=parameters(9);
k1=parameters(10);
k2=parameters(11);
k3=parameters(12);
pho_fat=parameters(13);
FFM=parameters(14);
alfa=parameters(15);
beta=parameters(16);
a3=parameters(17);
a4=parameters(18);
pho_food=parameters(19);


####

% State variables
Lep_plasma=x(1); % Leptin in plasma
E=x(2);          % Stored Energy

% Fat Mass
FM=E/pho_fat;
% Body Mass
BM=FM+FFM; % [Equation 7]
% Blood Volume
BV=alfa*BM+beta;

## dynamic system
input=FM*R_syn;
output=GFR*RenClearance*Lep_plasma; 
xdot(1)=(input-output)/BV;  % [Equation 1]

Lep_brain=k1*Lep_plasma/(k2+Lep_plasma)+k3*Lep_plasma; % [Eq. 2]

% Set point model: Proportional + Integral term
if SetPmodel
   IntErr=x(3);     % Integral of the error 
   FoodIntake=a1*(Lep_brain - SetPt)+a2*IntErr + c1;    % [Equation 8]
   Eout=BM*(a3*(Lep_brain - SetPt)+a4*IntErr+c2);       % [Equation 9]
end

Ein=pho_food*FoodIntake;    % [Equation 4]

xdot(2)=Ein-Eout;              % [Equation 6]

if SetPmodel
   xdot(3)=Lep_brain - SetPt;  % Integral of the error
end


endfunction



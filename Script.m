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
## @deftypefn {} {@var{retval} =} fn (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Jorge <jorgeguerrabrazil@gmail.com>
## Created: 2021-09-17


##parametrization 
mod_parameters; %load parameters
parameters(1)=R_syn;
parameters(2)=GFR;
parameters(3)=RenClearance;
parameters(4)=a1;
parameters(5)=SetPt;
parameters(6)=a2;
parameters(7)=c1;
parameters(8)=c2;

SetPmodel=1;
parameters(9)=SetPmodel;

parameters(10)=k1;
parameters(11)=k2;
parameters(12)=k3;


parameters(13)=pho_fat;

parameters(14)=FFM;

parameters(15)=alfa;

parameters(16)=beta;
parameters(17)=a3;
parameters(18)=a4;
parameters(19)=pho_food;


FM_0=2;  %g
E_0=FM_0*pho_fat;  %g*kcal/g=kcal
Lep_plasma_0=(FM_0*R_syn)/(GFR*RenClearance); % (g*(ml/week)/((ml/week)*(N/A)))=g;

% Initial state
if SetPmodel
   x0=[Lep_plasma_0; E_0; 0];
end


##Simulation parameters
tspan=[0,10];
##x0=[0];

## running the model
[t,y] = ode45(@(t,y) odefcn(y, parameters), tspan, x0);

##plotting the final results from the simulations
##plot(t,y(:,1),'-o',t,y(:,2),'-.')
##plot(t,y)

figure(1)
title(Titolofig)
subplot(211)
plot(t,y(:,1),'-o'), grid
ylabel('Plasma Leptin')
subplot(212)
plot(t,y(:,2),'-.'), grid
ylabel('Fat mass')
set(1,'Position',[10 20 830 560])

##Lep_plasma=y(:,1);
##Fat_mass=y(:,2)/pho_fat;
##
##if SetPmodel
##    Titolofig='Set Point Simulation';
##end
####if Settling
####    Titolofig='Settling Point Simulation';
####end
##
##
####figure(1)
####title(Titolofig)
####subplot(211)
####plot(T,Lep_plasma), grid
####ylabel('Plasma Leptin')
####subplot(212)
####plot(T,Fat_mass), grid
####ylabel('Fat mass')
####set(1,'Position',[10 20 830 560])
##
##
##

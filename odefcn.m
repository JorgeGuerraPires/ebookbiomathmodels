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

function xdot = odefcn(x, parameters)

## just for testing
FM=10;
BV=20;

##parameters used on the model_1
R_syn=parameters(1);
GFR=parameters(2);
RenClearance=parameters(3);
####

% State variables
Lep_plasma=x(1); % Leptin in plasma

## dynamic system
input=FM*R_syn;
output=GFR*RenClearance*Lep_plasma; 
xdot(1)=(input-output)/BV;  % [Equation 1]

endfunction



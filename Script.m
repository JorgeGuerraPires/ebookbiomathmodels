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
A = 1;
B = 2;
tspan = [0 5];
y0 = [0 0.01];

## running the model
[t,y] = ode45(@(t,y) odefcn(t,y,A,B), tspan, y0);

##plotting the final results from the simulations
plot(t,y(:,1),'-o',t,y(:,2),'-.')



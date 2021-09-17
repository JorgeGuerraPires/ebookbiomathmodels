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

function dydt = odefcn(t,y,A,B)
dydt = zeros(2,1);
dydt(1) = y(2);
dydt(2) = (A/B)*t.*y(1);
endfunction



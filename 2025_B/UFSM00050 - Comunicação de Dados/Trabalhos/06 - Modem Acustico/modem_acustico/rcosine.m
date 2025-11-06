## Copyright (C) 2011 David Crist <dave.crist@gmail.com>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{num} =} rcosine (@var{Fd},@var{Fs})
## @deftypefnx {Function File} {[@var{num},@var{den}] =} rcosine (@var{Fd},@var{Fs},@var{type_flag})
## @deftypefnx {Function File} {[@var{num},@var{den}] =} rcosine (@var{Fd},@var{Fs},@var{type_flag},@var{r})
## @deftypefnx {Function File} {[@var{num},@var{den}] =} rcosine (@var{Fd},@var{Fs},@var{type_flag},@var{r},@var{delay})
## @deftypefnx {Function File} {[@var{num},@var{den}] =} rcosine (@var{Fd},@var{Fs},@var{type_flag},@var{r},@var{delay},@var{tol})
## 
## Create a raised-cosine filter, or a root-raised-cosine filter.
## Currently, the IIR options are not supported, and will return zero vectors.
##
## @var{Fd} - the rate of 'data' , also known as the 'symbol rate'
##
## @var{Fs} - the sample rate
##
## @var{type_flag} - should be one of the following
## @example
## @group
## 'default' or 'fir/normal' for a raised-cosine fir
## 'sqrt'    or 'fir/sqrt'   for a root-raised-cosine fir
## @end group
## @end example
##
## @var{r} - the rolloff factor, sometimes referred to as alpha or beta
##
## @var{delay} - the group-delay, in units of whole symbols
##
## @var{tol} - the tolerance, this is only used for the IIR filters, which are currently not supported

function [num,den] = rcosine(Fd,Fs,type_flag,r,delay,tol);
if(nargin < 2 || nargin > 6)
	printf('proper usage of rcosine:\n');
	printf('num = rcosine(Fd,Fs)\n');
	printf('[num,den] = rcosine(Fd,Fs,type_flag)\n');
	printf('[num,den] = rcosine(Fd,Fs,type_flag,r)\n');
	printf('[num,den] = rcosine(Fd,Fs,type_flag,r,delay)\n');
	printf('[num,den] = rcosine(Fd,Fs,type_flag,r,delay,tol)\n');
	num=zeros(1,10);den=1;Fd=1;Fs=1;type_flag='default';r=0.5;delay=1;tol=0.01;
	return ;
end

## Defaults
if(nargin < 6 )
	tol = 0.01;
end
if(nargin < 5 )
	delay=3;
end
if(nargin < 4 )
	r=0.5;
end
if(nargin < 3 )
	type_flag = 'fir/normal';
end

## DBG_NARGIN = nargin
## DBG_FD = Fd
## DBG_FS = Fs
## DBG_TYPEFLAG = type_flag
## DBG_R = r 
## DBG_DELAY = delay 
## DBG_TOL = tol 

Td=1/Fd;
Ts=1/Fs;

## Code applicable to all four cases
t=-(floor(delay*Td/Ts)):1:(ceil(delay*Td/Ts));
t=t.*Ts;
num=zeros(1,length(t));
den=1;

## The 4 Possibilities for rcosine
##     1) Finite impulse response (FIR)    'default' or 'fir/normal'
##     2) Infinite impulse response (IIR)  'iir' or ''iir/normal''
##     3) Square-root raised cosine FIR    'sqrt' or 'fir/sqrt'
##     4) Square-root raised cosine IIR    'iir/sqrt'

type_flag = tolower(type_flag);
if( strcmp(type_flag,'default') || strcmp(type_flag,'fir/normal') )
	## 1) Finite impulse response (FIR)    'default' or 'fir/normal'
	for idx=1:length(t)
		## This sinc refers to a normalized sinc, where sinc(x) = sinc(pi*x)/(pi*x)
		if( abs(r*t(idx)/Td) == 1/2 )
			rSave = r;
			## 1/(2^23) is the value of the least significant bit in a single precision number
			## If abs(r*t(idx)/Td) == 1/2, then the 2nd and 3rd terms are zero, and resulting
			## filter is not a smooth kernel.  In testing, this happens when r=1, at +- Td/2
			r = r - 1/(2^23);
			num(idx) = sinc(t(idx)/Td) * cos(pi*r*t(idx)/Td) / (1 - (2*r*t(idx)/Td)^2 );
			r = rSave;
		else
			num(idx) = sinc(t(idx)/Td) * cos(pi*r*t(idx)/Td) / (1 - (2*r*t(idx)/Td)^2 );
		end
	end
	## normalize filter kernel to a sum of 1
	num = num / (sum(num));
elseif( strcmp(type_flag,'iir') || strcmp(type_flag,'iir/normal') )
	## 2) Infinite impulse response (IIR)  'iir' or ''iir/normal''
	## not implemented
elseif( strcmp(type_flag,'sqrt') || strcmp(type_flag,'fir/sqrt') )
	## 3) Square-root raised cosine FIR    'sqrt' or 'fir/sqrt'
	for idx=1:length(t)
		if( t(idx) == 0 )
			num(idx) = 1 - r + 4*(r/pi);
		elseif( abs(t(idx)) == Td/(r*4) )
			num(idx) = (r/sqrt(2)) * ( (1+2/pi)*sin(pi/(4*r)) + (1-2/pi)*cos(pi/(4*r)) );
		else
			num(idx) = ( sin(pi*(t(idx)/Td)*(1-r)) + (4*r)*(t(idx)/Td)*cos(pi*(t(idx)/Td)*(1+r)) );
			num(idx) = num(idx) / ( pi * (t(idx)/Td) * (1-(4*r*(t(idx)/Td))^2) );
		end
	end
	## normalize filter kernel to a sum of 1
	num = num / (sum(num));
elseif( strcmp(type_flag,'iir/sqrt') )
	## not implemented
	## 4) Square-root raised cosine IIR    'iir/sqrt'
end

end ## function


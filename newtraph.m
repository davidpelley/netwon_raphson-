function [root,ea,iter] = newtraph(func,dfunc,xr,es,maxIt,varargin)
% newtraph: Newton-Raphson root location zeroes
% [root,ea,iter] = newtraph(func,dfunc,xr,es,maxIt,p1,p2..):
% uses Newton-Raphson method to find the root of function
% Input:
%   func = function to evaluate
%   dfunc = derivative of function to evaluate
%   xr = initial guess
%   et = relative error tolerance (default = 0.0001%)
%   maxIt = maximum allowable iterations (default = 50)
%   p1,p2,.. = additional parameters used by function
% Output:
%   root = real root
%   ea = magnitude of approximate relative error(%)
%   iter = number of iterations

% Created by: David Pelley
% 9/15/2019

if nargin < 3, error('At least 3 input arguments required'), end
if nargin <4|isempty(es), es = 0.0001; end
if nargin <5|isempty(maxIt), maxIt = 50; end

iter = 0;
ea = 100;
while(1) 
    xrold = xr;
    xr = xr-func(xr)/dfunc(xr);
    iter = iter+1;
    if xr ~=0
        ea = abs((xr-xrold)/xr)*100;
    end
    if ea <=es|iter>=maxIt, break, end
end
root = xr;

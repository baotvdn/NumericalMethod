function [i,x_out,f_out,ea_out] = nonlin_fixed_point(func,func_updated,x_guess,es,imax)

syms x y
if nargin<4||isempty(es)
	es=0.1;
end
if nargin<5||isempty(imax)
	imax=50;
end
i = 0;
x0=x_guess;
ea = 100;
f(x,y) = func;
f_updated(x,y) = func_updated;

while((ea > es) && (i < imax))
    x_old = x0;
    x0 = f_updated(x0(1),x0(2));
    i = i + 1;
    ea=100*max(abs((x0-x_old)./x0));
    x_out = double(x0);
    f_out = double(f(x0(1),x0(2)));
    ea_out = double(ea);
end
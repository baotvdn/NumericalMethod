function [i,x_out,f_out,ea_out] = nonlin_newton_raphson(func,x_guess,es,imax)

syms x y
if nargin<3||isempty(es)
    es=0.1;
end
if nargin<4||isempty(imax)
    imax=50;
end

i = 0;
x0=x_guess;
ea = 100;
f(x,y) = func;
J(x,y) = jacobian(f, [x;y]);

while((ea > es) && (i < imax))
    f_recent = f(x0(1),x0(2));
    J_recent = J(x0(1),x0(2));
    dx=J_recent\f_recent;
    x0=x0-dx;
    i = i + 1;
    ea=100*max(abs(dx./x0));
    x_out = double(x0);
    f_out = double(f(x0(1),x0(2)));
    ea_out = double(ea);
end


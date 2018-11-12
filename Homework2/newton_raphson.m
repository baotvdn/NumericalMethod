function [root, results] = newton_raphson(func,func_prime,guess,es,imax)

if (nargin<4||isempty(es))
    es=0.1;
end
if (nargin<5||isempty(imax))
    imax = 100;
end

ea = 100;
i=0;
xr = guess;
results = [];

while((ea > es) && (i < imax))   
    xr_old = xr;
    xr = xr - func(xr)/func_prime(xr);
    i = i + 1;
    
    if xr ~= 0
        ea = abs((xr - xr_old)/xr)*100;
    end
    
    results(i+1,1) = i;             %Iteration
    results(i+1,2) = xr;            %Root
    results(i+1,3) = func(xr);      %F(root)
    results(i+1,4) = ea;            %Ea, %
end
results(1,2) = guess;
results(1,3) = func(guess);
results(1,4) = NaN;
root = xr;
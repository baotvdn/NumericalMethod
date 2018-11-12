function [root, results] = bisection(func,x_lower,x_upper,es,imax)

if (nargin<4||isempty(es))
    es=0.1;
end
if (nargin<5||isempty(imax))
    imax=100;
end

i = 0;
xr = x_lower; 
ea = 100;
results = [];

while ((ea > es) && (i < imax))
	xr_old = xr;
	xr = (x_lower + x_upper)/2;
	i = i + 1;
	if xr ~= 0
        ea = abs((xr - xr_old)/xr) * 100;
	end
	test = func(xr)*func(x_lower);
    
	if test < 0
		x_upper = xr;
	elseif test > 0
		x_lower = xr;
	else
		ea = 0;
    end
    
    results(i,1) = i;             %Iteration
    results(i,2) = x_lower;       %X_low
    results(i,3) = x_upper;       %X_high
    results(i,4) = xr;            %Root
    results(i,5) = func(xr);      %F(root)
    results(i,6) = ea;            %Ea, %

end
results(1,6) = 0;
root = xr;


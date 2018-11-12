function output = incremental(func,x_lower,x_upper,region_number)

x = linspace(x_lower,x_upper,region_number);
f = func(x);
bracket_number = 0; 
output = []; 

for i = 1:length(x) - 1
    if sign(f(i)) ~= sign(f(i+1)) 
        bracket_number = bracket_number + 1;
        output(bracket_number,1) = x(i);
        output(bracket_number,2) = x(i+1);
    end
end

if isempty(output)
    disp('no brackets')
end
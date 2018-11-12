%% 
%Problem 1
clear;clc;
fx = @(x) -12-21*x-18*x.^2-2.75*x.^3

% xl = ?10 and xu = 10, and a stopping criterion of 0.1%. 
incremental_result = incremental(fx,-10,10,100)
[bisection_root, bisection_result] = bisection(fx,-10,10,0.1)
[false_position_root, false_position_result] = false_position(fx,-10,10,0.1)

%% 
%Problem 2
clear;clc;
fh = @(h) pi*h^2*((3*3-h)/3) - 30;

%Employ a lower limit of xl = 0 and xu = R = 3
[bisection_root, bisection_result] = bisection(fh,0,3)
[false_position_root, false_position_result] = false_position(fh,0,3)

%% 
%Problem 3
clear;clc;
ft = @(t) 9*exp(-t)*sin(2*pi*t) - 3;
ft_prime = @(t) 9*(-exp(-t)*sin(2*pi*t) + exp(-t)*2*pi*cos(2*pi*t));
ft_modified = @(t) log(3*sin(2*pi*t));
%Since we find the lowest value of such that i =3A, the guess value is set to be 0.01%
[newton_raphson_root,newton_raphson_result] = newton_raphson(ft,ft_prime,0.01)
[modified_secant_root,modified_secant_result] = modified_secant(ft,0.01,1e-6)
[fixed_point_root,fixed_point_result] = fixed_point(ft,ft_modified,0.01)

%% 
%Problem 4
clear;clc;
fn = @(N) (1/2)*(N+sqrt(N.^2+4*(6.21*10^9)^2)) - 1/(6*10^6 * 1.6*10^(-19) * 1300*(1000/300)^(-2.42));

[bisection_root, bisection_result] = bisection(fn,1,10^11)
[modified_secant_root,modified_secant_result] = modified_secant(fn,3,1e-6)

%% 
%Problem 5 
clear;clc;

fx = @(x) (1/(4*pi*8.85*10^(-12)))*((4*10^(-10)*x)/((x^2+(0.9)^2)^(3/2))) - 1;
fx_modified = @(x) (4*pi*8.85*10^(-12))*((x^2+(0.9)^2)^(3/2))/(4*10^(-10));
fx_prime = @(x) (1/(4*pi*8.85*10^(-12)))*(4*10^(-10))*((0.9^2-2*x^2)/((x^2+0.9^2)^(5/2)));

[newton_raphson_root,newton_raphson_result] = newton_raphson(fx,fx_prime,2,0.1)
[fixed_point_root,fixed_point_result] = fixed_point(fx,fx_modified,2,0.1)
[modified_secant_root,modified_secant_result] = modified_secant(fx,2,1e-6,0.1)

%% 
%Problem 6
clear;clc;
fx = @(x) 1/75-sqrt(1/50625+(.6e-6*x-2./x).^2);

%The x_upper of false_position method is set to be 100 because if it is 1,
%there are over 100 loops
[bisection_root, bisection_result] = bisection(fx,1,1000,0.1)
[false_position_root, false_position_result] = false_position(fx,100,1000,0.1)

%% 
%Problem 7
clear;clc;
fx = @(x) sqrt(1/(5*10^(-4))-(x/10)^2)-1;
fx_prime = @(x) -x/(100*(2000 - x^2/100)^(1/2));

%The result is around 447
[newton_raphson_root,newton_raphson_result] = newton_raphson(fx,fx_prime,450)
[bisection_root, bisection_result] = bisection(fx,1,1000)
[false_position_root, false_position_result] = false_position(fx,400,450)

%% 
%Problem 8
clear;clc;
syms x y

f = [-(x)^2+x-y+0.75; x^2-y-5*x*y];
guess = [1.2;1.2];
%Fixed point Iteration
x0 = guess(1);
y0 = guess(2);
xnew = sqrt(x0+0.75-y0);
ynew = xnew^2 / (1+5*xnew);
% second iteration
xnew2 = sqrt(xnew+0.75-ynew);
ynew2 = xnew2^2 / (1+5*xnew2);
% third iteration
xnew3 = sqrt(xnew2+0.75-ynew2);
ynew3 = xnew3^2 / (1+5*xnew3);
% forth iteration
xnew4 = sqrt(xnew3+0.75-ynew3);
ynew4 = xnew4^2 / (1+5*xnew4);
root_fixed_point_iteration = [xnew4; ynew4]

% Newton_Raphson Method
[i,root_newton_raphson,f,ea] = nonlin_newton_raphson(f,guess);
root_newton_raphson

%Discussion: we should not use fixed point iteration to solve nonlinear equations 
%because the updated values of x and y depend mostly on which functions we
%pick. In other word, they depend on luck. 

%% 
%Problem 9
clear;clc;
syms x y

plot(4*cos(linspace(0,2*pi)),4*sin(linspace(0,2*pi)))
hold on
plot(sqrt(5)*cos(linspace(0,2*pi))+4,sqrt(5)*sin(linspace(0,2*pi))+4)
grid on
axis equal
%By looking at the graph, we can guess two roots be about 2 and 3.5
f = [(x-4)^2+(y-4)^2-5; x^2+y^2-16];
guess = [2;3.5];
[i,x0,f,ea] = nonlin_newton_raphson(f,guess)







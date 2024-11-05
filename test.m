clear
clc
% 1
A = [4.2 2.2  6    1.4;
    -1.2 0    2.3 -0.4;
     3.5 1.4 -3.5  0;
     0   2.3  0.5  4.1];
B = [8.5; 
    -4.6;
     1.5;
     4.5];
X = linsolve(A,B);
disp(X)

syms x1 x2 x3

eqn1 = x1^2 + 3*x2^2 - 4*x3 == 4;
eqn2 = x1 - 2*x2^2 + x3^2 == 12;
eqn3 = 2*x1^2 + x2^2 - x3^2 == 8;

sol = solve([eqn1,eqn2,eqn3],[x1,x2,x3]);
disp(double(sol.x1))
disp(double(sol.x2))
disp(double(sol.x3))

%2 

x0 = 0; 
y0 = sin(1+x0^2) - log(1/(1+x0)); 
y1 = sin(1+(x0+0.001)^2) - log(1/(1+(x0+0.001))); 
deri = (y1-y0)/0.001;

for i = 1:10 
    x0 = x0 - y0/deri; 
    y0 = sin(1+x0^2) - log(1/(1+x0)); 
    y1 = sin(1+(x0+0.001)^2) - log(1/(1+(x0+0.001))); 
    deri = (y1-y0)/0.001;
end
disp(x0)

x0 = 3; 
y0 = tan(1+x0) + 1/exp(x0) - 1/(1+x0^2);
y1 = tan(1+x0+0.001) + 1/exp(x0+0.001) - 1/(1+(x0+0.001)^2); 
deri = (y1-y0)/0.001;

for i = 1:20
    x0 = x0 - y0/deri; 
    y0 = tan(1+x0) + 1/exp(x0) - 1/(1+x0^2);
    y1 = tan(1+x0+0.001) + 1/exp(x0+0.001) - 1/(1+(x0+0.001)^2); 
    deri = (y1-y0)/0.001;

end
disp(x0)

%3 
x = [2 7 10 15 20];
y = [6 14 5 24 8];

n = 4;

p = polyfit(x, y, n);

x_fit = linspace(min(x), max(x), 100); 
y_fit = polyval(p, x_fit);             

plot(x, y, 'o', x_fit, y_fit, '-');
xlabel('x');
ylabel('y');
title('Polynomial Fit');
legend('Data Points', 'Polynomial Fit');

%4 
syms y(x)
Dy = diff(y, x);        
D2y = diff(y, x, 2);        

eqn = D2y + 0.1*Dy + 10*y == 5*sin(10*x);

y0 = 10;                      
Dy0 = 0;                      
conds = [y(0) == y0, Dy(0) == Dy0];

ySol = dsolve(eqn, conds);
disp(ySol);

syms y(x)
Dy = diff(y, x);        

eqn = Dy == (y-5)/(-y+5);

y0 = 0;                      
Dy0 = -1;                      
conds = [y(0) == y0, Dy(0) == Dy0];

ySol = dsolve(eqn, conds);
disp(ySol);

syms y(t) x(t)

Dy = diff(y, t);
Dx = diff(x, t);

eqn1 = Dy == y + 5;
eqn2 = Dx == -y + 5;

cond1 = y(0) == 0;
cond2 = x(0) == 0;

[ySol, xSol] = dsolve([eqn1, eqn2], [cond1, cond2]);
disp(ySol);
disp(xSol);

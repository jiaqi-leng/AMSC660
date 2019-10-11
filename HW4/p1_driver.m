%% Problem 1(f) Convergence study
% parameters

%% Test 1: Fix A, F. Solve AU = F.

error = zeros(up_bd - low_bd + 1, 1)

for n = 10:300
    A = my_A(n);
    U = rand(n,1);
    U1 = solver(A,A*U);
    error(n - low_bd + 1) = norm(U - U1, 2);
end

plot(error)
title('Absolute Error between $U$ and $\tilde{U}$, in $l^2$ norm', 'Interpreter','latex')
xlabel('n')

%% Test 2.1: Fix u = sin(3*pi*x), F = -9*pi^2 sin(3*pi*x)/2. Time step = 1/n. 

R = zeros(991, 1);
index = linspace(10,1000, 991);

for n = 10:1000
    
    dx = 1/n;
    r = sqrt(n);
    discrt = (linspace(1/n, (n-1)/n, n-1))';
    U_a = sin(3* pi*discrt);
    F = -(9*pi^2/2)*sin(pi*discrt);
    A = my_A(n-1);
    U = solver(A, 2*dx^2*F);
    F1 = A * U/(2*dx^2);
    R(n - 9) = norm(A * (U - U_a)/(2*dx^2), 2)/r;

end

plot( log(index), log(R))
hold on
plot( log(index), log(power(index, -2)) ,'k--' )
title('Test case 1: $\|R\|_{\Delta x}$ plot for $10 \le n \le 1000$, in log-log scale', 'Interpreter','latex')
xlabel('$\log(n)$', 'Interpreter','latex')
legend('$\|R\|_{\Delta x}$', '$O(n^{-2})$', 'Interpreter','latex')

%% Test 2.2: Fix u = 2*exp(x) + (2-2*exp(1))*x - 2, F = epx(x). Time step = 1/n. 

R = zeros(991, 1);
index = linspace(10,1000, 991);

for n = 10:1000
    
    dx = 1/n;
    r = sqrt(n);
    discrt = (linspace(1/n, (n-1)/n, n-1))';
    U_a = 2*exp(discrt) + (2-2*exp(1))*discrt - 2;
    F = exp(discrt);
    A = my_A(n-1);
    U = solver(A, 2*dx^2*F);
    F1 = A * U/(2*dx^2);
    R(n - 9) = norm(A * (U - U_a)/(2*dx^2), 2)/r;

end

plot( log(index), log(R))
hold on
plot( log(index), log(power(index, -2)) ,'k--' )
title('Test case 2: $\|R\|_{\Delta x}$ plot for $10 \le n \le 1000$, in log-log scale', 'Interpreter','latex')
xlabel('$\log(n)$', 'Interpreter','latex')
legend('$\|R\|_{\Delta x}$', '$O(n^{-2})$', 'Interpreter','latex')
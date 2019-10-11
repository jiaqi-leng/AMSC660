%% Problem 3(d)
% Computing E_n using E_n = 1- nE_{n-1}
% E_0 = 1-1/e
% nmax = 19

%% Parameters

E0 = 1 - exp(-1);  % first term by 2(a)
nmax = 19;  % upper bound of iteration

E = zeros(nmax+1,1); % (nmax+1) for E_n, n = 0:nmax
E(1) = E0 % initialize the first term E_0

%% Interation

for k = 1:nmax 
    E(k+1) = 1 - k*E(k)
end

%% Upper/lower bounds obtained in 3(c)

index = linspace(0,nmax, nmax+1)
U = 1./(index + 1)
L = exp(-1).*U

%% Plot E_n and the bounds
% plot of the computed value and its upper/lower bounds
hold on
plot(index, E, 'k-')
plot(index, U, 'r--')
plot(index, L, 'b--')
title('Estimated value of $E_n$, nmax=19', 'Interpreter','latex')
xlabel('n')
legend('E_n','Upper bound', 'Lower bound')
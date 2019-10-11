%% Problem 2
% Parameters

N = 1200; % upper bound for n
a = zeros(N+1,N+1); % a_{n,k} for n = 0:N, k = 0:n
aa = zeros(N+1, 1); % a_{n,n} for n = 0:N
E = zeros(1, N); % E(n) to be computed 
M = zeros(1, N); % M(n) = max_k a_{n,k}
ind = linspace(0,N,N+1);

a(:,1) = 1; % initialize the vector a_{n,k} for k = 0
aa(1) = 1; % initialize the vector a_{n,n} for n = 0

%% Interation
for n = 1:N 
    for k = 1:n % compute a_{n,k} for fixed n, a_{n,k+1} = a_{n,k}(n-k)/(k+1)
        a(n+1,k+1) = (n-k+1)*a(n+1,k)/k;
    end
    aa(n+1) = a(n+1,n+1);
    E(n) = dot(a(n+1,:), ind)/power(2,n); % summation via dot product
    M(n) = max(a(n+1,:));
end

%% Problem 2(a)
figure(1) % plot of the error 
plot(abs(aa - 1))
title('Absolute error between $a_{n,n}$ and 1, n = 1:1200','Interpreter','latex')
xlabel('n')

%% Problem 2(b)
% plot E(n) & M(n)

figure(2) % plot of E(n), compared to n/2
plot(E, 'k-')
hold on
plot(ind/2, 'r--')
legend('E(n)','n/2')
title('E(n) for n = 1:1200')

figure(3) % plot of E(n), compared to log(2^n)
plot(log(M))
hold on
plot(log(power(2,ind)), 'r--')
legend('$\log[M(n)]$', '$\log(2^n)$','Interpreter','latex')
title('M(n) in log scale for n = 1:1200')
%% Error Analysis
E_ac = linspace(1,N,N)/2; % accurate value for E(n), n = 1:N
error = E - E_ac % absolute error

figure(4) %plot of the absolute error
plot(abs(error))
title('Errors between E(n) and n/2, for n = 1:1200')
xlabel('n')
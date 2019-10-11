%%
% Computing f_{0,k} iteratively and the absolute error
% f(j,k) = sin(x0 + (j-k)*pi/3)
% f(j,k+1) = f(j,k) - f(j+1,k) 
% k = 1:60

%% Parameters
x0 = 1 % parameter x0 in f(j,k)
N = 60 % upper bound of iteration
ind1 = linspace(1, N, N) % index vector [1:N]
ind2 = linspace(1, N+1, N+1) % index vector [1:N+1]
fhat = zeros(N+1,N+1) 

%% Initialize fhat at level k = 0
fhat(:,1) = sin(x0 + (ind2-1)*pi/3) % f(j,0) for j = 0:60

%% Interation
shift = zeros(N+1,1) % at each k, shift the vector one element to the left

for k = 1:N
    shift = fhat(:,k)
    shift(1) = [] % delete the first element 
    shift = cat(1, shift, 0) % make the shift
    fhat(:,k+1) = fhat(:,k) - shift % f(j,k+1) = f(j,k) - f(j+1,k)
end

%% Computing the error
f0k = sin(x0 - ind1*pi/3) % exact value of f(0,k) for k = 1:60
error = fhat(1,2:N+1) - f0k % absolute error between fhat and f

% print the error
g = sprintf(' %d ', error);
fprintf('The errors are: %s\n', g)

%% plot 
% e_k in linear scale
figure(1) 
plot(ind1, abs(error)) % plot using absolute value of error
title('Absolute Error $e_k$ in linear scale', 'Interpreter','latex')
xlabel('k')
ylabel('$|e_k|$', 'Interpreter','latex')

% e_k in log scale and comparision with doubling error
figure(2)
er_double = error(1)*power(2,ind1 - 1) % initial error as e_1, then double it each time
semilogy(abs(error))
hold on
semilogy(abs(er_double), '--')
title('Absolute Errors $e_k$ in Log scale', 'Interpreter','latex')
xlabel('k')
ylabel('$\log(|e_k|$)', 'Interpreter','latex')
legend('Error','Comparison')
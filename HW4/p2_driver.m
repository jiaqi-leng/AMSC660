%% Problem 2
% parameter

lambda = 1
mu = 4
t = 1

%% Problem 2(e) Check r_k are right eigenvectors.

A = mctr(4, lambda, mu);
[R, Lam] = eig(A);

for k = 1:4
    r = R(:,k)
    Ar = A * r
    lr = Lam(k,k) * r
    er = norm(Ar - lr, 2)
    
end

%% Problem 2(f) check l_k are left eigenvectors.

L = R^(-1)
E = zeros(1, 4) % the errors defined as in HW 4.

for k = 1:4
    l = L(k,:);
    lA = l * A
    factor = lA(1)/l(1);
    E(k) = norm(lA - factor*l, 2);
    
end

l2 = L(2,:)
p_inf = (1-1/4)/(1-1/(4)^4)*[1, 1/4, 1/4^2, 1/4^3]

%% Problem 2(g) Use two methods to compute S(1) and compare the results.

error = zeros(80, 1);
cdt = zeros(80, 1); % condition numbers

for n = 4:80
    A = mctr(n, 1, 4);
    [R1, Lam1] = eig(A);
    S = fund_soln(A, 1); % use the eigenvalues method
    S1 = expm(1*A); % use the matlab build-in function expm
    
    error( n , 1 ) = norm(S - S1, 1);
    cdt( n , 1) = cond(R1);
end

plot(log(error))
hold on 
plot(log(cdt), 'k--')
title('Errors and condition numbers in log scale')
legend('errors','condition numbers')

%% Problem 2(h) Figure out the correct answer by checking the stable distribution.

E1 = zeros(80, 1)
E2 = zeros(80, 1)

for n = 4:80
    A = mctr(n, 1, 4);
    col1 = zeros(n,1) + 1; % all column 1 vector
    p = pinf(n, 1, 4)
    S3n_1 = fund_soln(A, 3*n); % use the eigenvalues method
    S3n_2 = expm(3*n*A); % use the matlab build-in function expm
    std = col1 * p; %stable distribution
    
    E1(n) = norm(S3n_1 - std, 2)
    E2(n) = norm(S3n_2 - std, 2)
    
end

plot(log(E1), '-')
hold on 
plot(log(E2), '-x')
title('Errors between computed values and the stable distributions, in log scale')
legend('eigenvalue-method','expm-method')
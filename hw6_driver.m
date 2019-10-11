%% Problem 1

%% 1 (c) Implement and test the index function

% Test case 1: n = 2. (1,0) is of index 4
ind1 = index_func(2, 1, 0)

% Test case 2: n = 3. (2,1) is of index 9
ind2 = index_func(3, 2, 1)


%% 1 (e) Implement and test the mycolumn function
% Test case: d = [0, 1], w = 1, n = 2, x0 = (1, -3).
v_e = [exp(-3 * i); i * exp(-3 * i); - exp(-3 * i); 0; 0; 0];
d1 = [0; 1];
x0 = [1 -3];
v_c = mycolumn(1, 2, d1, x0);

% compute residual
error1 = norm(v_e - v_c, 2)


%% 1 (f) Implement and test the matrix builder function

% Test case: d_1 = [1;0], d_2 = [0;1], w = 1, n = 1, x0 = (1, -3).
A_e = [exp(i) exp(-3 * i); 0  i * exp(-3 * i); i * exp(i) 0];
d = [1 0; 0 1];
x0 = [1 -3];

A_c = mymatrix(1, 1, d, x0);

% compute residual
error2 = norm(A_e - A_c, 2)

%% Problem 2
% 2 (b) Implement and test the right-hand-side builder
x0 = [1; -3];
alpha = sqrt(2)/2;

b_e = [exp(-2*i*alpha); i * alpha * exp(-2*i*alpha); -alpha^2 * exp(-2*i*alpha);
    i * alpha * exp(-2*i*alpha); - alpha^2 * exp(-2*i*alpha); - alpha^2 * exp(-2*i*alpha)];

b_c = rhs(2, x0);

% compute residual
error3 = norm(b_e - b_c, 2)

%% Problem 4

%% 4 (a) Compute the rank of matrices

Rank = zeros(21:10);
x0 = [1;-3];

for N = 1:21
    D = direction(N); % the function direction generates direction vectors.
  
    for n = 1:10
        A = mymatrix(1, n, D, x0);
        Rank(N, n) = rank(A);
    end
end      
    
%% 4 (b) Graph: rank A - n

graph = zeros(10,1)

for r = 1:10
    graph(r) = Rank(2 * r + 1, r);
end

plot(graph)
title('rank of the matrix as a function of n')
xlabel('n')
ylabel('rank of the matrix')

%% Problem 5. Solving linear system by QR decomposition

x0 = [1;-3];
U1 = zeros(31, 15);
for n = 1: 15
    N = 2 * n + 1;
    D = direction(N);
    A = mymatrix(1, n, D, x0); % A is a M * N matrix. M >= N.
    b = rhs(n, x0);
    U1(1:N, n) = qrsolver(A, b);
end   

%% Problem 6. Solving linear system by Choleski factorization

x0 = [1;-3];

U2 = zeros(31, 15);

for n = 1: 15
    N = 2 * n + 1;
    D = direction(N);
    A = mymatrix(1, n, D, x0); % A is a M * N matrix. M >= N.
    
    R = chol(A' * A);
    L = R';
    b = rhs(n, x0);
    U2(1: N , n) = mysolver(L, A' * b);
    
end
    
%% Problem 7 Compare the two methods

% In the QR factorization, the system involved is A.
% In the choleski factorization, the system involved is A' * A. 
x0 = [1;-3];

g1 = zeros(15, 2);
residual = zeros(15, 2);

% compute the condition numbers and residuals
for n = 1: 15
    N = 2 * n + 1;
    D = direction(N);
    A = mymatrix(1, n, D, x0); 
    b = rhs(n, x0);
    g1(n, 1) = cond(A);
    g1(n, 2) = cond(A' * A);
    residual(n, 1) = norm(A * U1(1:N,n)  - b, 2);
    residual(n, 2) = norm(A * U2(1:N,n)  - b, 2);
end

%% Plot 1: condition numbers

figure(1)
semilogy(g1(:, 1), '-');
hold on 
semilogy(g1(:, 2), 'x-');
title('Condition number of the system as a function of n')
xlabel('n')
ylabel('condition number (in log scale)')
legend('QR decomp', 'Choleski decomp')
hold off

%% Plot 2: residuals

figure(2)
semilogy(residual(:, 1), '-');
hold on
semilogy(residual(:, 2), 'x-');
title('l2 norm of the residual as a function of n')
xlabel('n')
ylabel('l2 norm of the residual (in log scale)')
legend('QR decomp', 'Choleski decomp')
hold off


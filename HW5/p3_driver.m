%% Problem 3 (c) Test three methods of Choleski factorization

%% Parameters
n = 5000;
A = my_A(n);

%% Running time 

tic;
L1 = chol(A)'; % MATLAB chol function
t1 = toc

tic;
L2 = chol_tridiag(A); % Choleski factorization for tridiagonal matrices
t2 = toc

tic;
L3 = chol_class(A); % Choleski factorization presented in class
t3 = toc

%% Error analysis

er1 = norm(L1 - L2, 2)
er2 = norm(L1 - L3, 2)
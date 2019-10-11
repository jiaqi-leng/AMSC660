function  L = ptd_eig(n, lambda, mu, s)
    A = mctr(n, lambda, mu);
    B = zeros(n);
    L = zeros(n,1);
    
    % set the matrix B
    B(1,1) = -1;
    B(2, n) = 1;
    
    As = A + s * B; % set the matrix A(s)
    L = eig(As); % compute eigenvalues

end 
% This function solves Ax = b by QR factorization. 

function x = qrsolver(A, b)
    [m n] = size(A);
    [Q R] = qr(A);
    h = Q' * b; % now it becomes Rx = h.
    
    % backward substitution
    x = zeros(n,1);
    x(n) = h(n)/R(n,n);
    
    for i = 1 : n-1
        j = n - i;
        x(j) = (h(j) - dot(R(j,j+1:n), x(j+1:n)) )/R(j, j);
    end 
end 
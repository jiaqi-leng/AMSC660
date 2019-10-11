% This function solves LL*x = h. 
% We use forward substitution, and then backward substitution. 

function x = mysolver(L, h)
    [m, n] = size(L);
    y = zeros(n, 1);
    x = zeros(n, 1);
   
    y(1) = h(1)/L(1,1);
    for k = 2 : n
        y(k) = (h(k) - dot(L(k, 1:k-1), y(1:k-1)) )/ L(k,k);
    end
    
    P = L';
    x(n) = y(n)/ P(n, n);
    for i = 1 : n - 1
        j = n - i;
        x(j) = (y(j) - dot(P(j, j+1:n), x(j+1:n)) )/P(j,j);
    end
end 
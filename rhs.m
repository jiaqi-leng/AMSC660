function b = rhs(n, x) % return the matrix A with dimension n
    M = (n + 1) * (n + 2) / 2;
    b = zeros(M, 1);
    ind = myindex(n);
    
    f = exp(i * cos(pi/4) * x(1) + i * sin(pi/4) * x(2));
    
    for k = 1 : M
        b(k) = (i * cos(pi/4))^ sum(ind(k,:)) * f;
    end
     
end 
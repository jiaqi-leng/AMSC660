function p = pinf(n, lambda, mu)
    q = lambda/mu;
    a = (1-q)/(1-q^n);
    p = zeros(1, n);
    
    for k = 1:n
        p(k) = q^(k-1);
    end
    
    p = a * p
end
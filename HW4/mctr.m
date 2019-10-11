
function M = mctr(n, lambda, mu) % return the Markov chain transition matrix
    
M = zeros(n);
    M(1,1) = - lambda; 
    M(1,2) = lambda;
    M(n,n-1) = mu; 
    M(n, n) = - mu;
    
    for j = 2: (n-1)
        M(j,j-1) = mu;
        M(j, j) = - (lambda + mu);
        M(j, j+1) = lambda;
    end
end 



function M = my_A(n) % return the matrix A with dimension n
    M = zeros(n);

    for j = 1: (n-1)
        M(j,j) = -2;
        M(j, j+1) = 1;
        M(j+1, j) = 1;
    end
    
     M(n,n) = -2;
     M = -(n^2/2)*M;
     
end 

function L = chol_class(A) 
    n = size(A);
    L = zeros(n);
    L(1,1) = sqrt(A(1,1));
    
    for r = 2:n
        L(r, 1) = A(r, 1)/L(1, 1);
    end
    
    for j = 2 : n
        L(j,j) = sqrt(A(j,j) - dot(L(j ,1 : j-1), L(j ,1 : j-1)));
    
        for i = j+1 : n
            L(i,j) = (A(i,j) - dot( L(i,1 : j-1), L(j, 1:j-1) ))/L(j,j);
        end
    end
     
end 
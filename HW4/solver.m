function U = solver(A, F)   % solve equation AU = F, for fixed A and F.
                           %A is an n*n invertible matrix, F is a n*1 vector. 
                           
    U = A\F
end
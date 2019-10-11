% return the the coefficient matrix A.
% d is a 2 * N matrix. The l-th column the 2-d vector d_l. 

function  A = mymatrix(w, n, d, x) 
    M = (n + 1) * (n + 2) / 2; % M is the number of rows.
    [r, N] = size(d); % N is the number of column vectors.
    A = zeros(M , N);
    
   for l = 1 : N
       A(:, l) = mycolumn(w, n, d(:, l), x);
   end
     
end 
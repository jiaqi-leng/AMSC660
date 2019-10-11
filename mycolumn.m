% return the r-th column of the coefficient matrix A.
% dr is the r-th 2-d vector. It is supposed to be a column vector.
% x is a 2*1 vector. 

function  C = mycolumn(w, n, dr, x0) 
    d1 = dr(1);
    d2 = dr(2);
    M = (n + 1) * (n + 2) / 2; % M is the number of rows.
    ind = myindex(n);
    C = zeros(M,1);
    
    f = exp(i * w * (d1 * x0(1) + d2 * x0(2)));
    
   for k = 1 : M
       C(k) = (i * w * d1)^ind(k,1) * (i * w * d2)^ind(k,2) * f;
   end
     
end 
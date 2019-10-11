
function S = fund_soln(M, t)
    [m , n] = size(M);

    [R, Lam] = eig(M);
    L = R^(-1);
    
    B = zeros(m);
    for j = 1:m
        B(j,j) = exp(t*M(j,j));
    end
    S = L * B * R;
    
end
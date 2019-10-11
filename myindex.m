function B = myindex(n) % return the matrix A with dimension n
    M = (n + 1) * (n + 2) / 2;
    B = zeros(M, 2);

    for i = 0 : n
        a = 1 + (2 * n + 3 - i) * i /2;
        b = (2 * n + 2 - i) * (i + 1) /2;
        for j = a : b
            B(j,1) = i;
            B(j,2) = j - a;
        end
    end
     
end 
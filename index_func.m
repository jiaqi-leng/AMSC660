% this index function outputs the index of the pair (i_x, i_y), given a
% fixed n

function  ind = index_func(n, ix, iy) 
    ind = 1 + iy + (2 * n + 3 - ix) * ix /2;
end 
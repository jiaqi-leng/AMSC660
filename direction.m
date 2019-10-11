% return N direction vectors.

function  D = direction(N) 
   D = zeros(2, N);
   
   for l = 1:N
       D(1, l) = cos(2 * l * pi/ N);
       D(2, l) = sin(2 * l * pi/ N);
   end
     
end 
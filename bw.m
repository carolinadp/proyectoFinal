function g = bw (img, clasif)
    [n, m] = size(clasif);
    
    g = zeros (n, m);
    
    for i=1:n
        for j=1:m
            if (clasif(i, j) ~= 14)
                g (i,j) = 255;
            end
        end
    end
    
    
    
                
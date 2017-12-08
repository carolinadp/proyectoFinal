function [g, c] = applyMask(img, clasif, bw)
    
    [n, m] = size(clasif);
    
    g = zeros(n, m, 3, 'uint8');
    c = zeros(n, m, 'uint8');
    
    for i=1:n
        for j=1:m
            if (clasif(i,j) ~= 14 && bw(i, j) == 255)
                g(i, j, :) = img(i,j, :);
                c(i, j) = clasif(i, j);
            else
                g(i, j, :) = 220;
                c(i, j) = 14;
            end
        end
    end
   
    
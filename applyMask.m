function [img, fclass] = applyMask(f, clasif, mask)
    [n, m] = size(clasif);
    img = zeros(n, m, 3, 'uint8');
    flcass = zeros(n,m,'uint8');
    for i=1:n
        for j=1:m
            if (mask(i,j,1) > 0)
                img(i, j, :) = f(i, j, :);
                fclass(i,j) = clasif(i,j);
            else
                img(i,j, :) = 220;
                fclass(i,j) = 14;
            end
        end
    end
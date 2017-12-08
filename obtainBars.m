function g = obtainBars(clasif)
    [n, m] = size(clasif);
    
    ccol = zeros(1, m, 'uint8');
    
    for j=1:m
        times = zeros(1, 14, 'uint8');
        for i=1:n
            if (clasif(i,j) ~= 14 && clasif(i,j) ~= 13)
                times(clasif(i, j)) = times(clasif(i, j)) + 1;
            end
        end
        may = max(times);
        mej = 14;
        if (may > 0)
            for k=1:12
                if (times(k) == may)
                    mej = k;
                end
            end
        end
        ccol(j) = mej;
    end
    
    g = compress(ccol);
    
    
            
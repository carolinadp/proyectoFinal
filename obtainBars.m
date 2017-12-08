function g = obtainBars(clasif)
    [n, m] = size(clasif);
    
    ccol = zeros(m, 1, 'uint8');
    
    for j=1:m
        times = zeros(14, 1, 'uint8');
        for i=1:n
            if (clasif(i,j) ~= 14)
                times(clasif(i, j)) = times(clasif(i, j)) + 1;
            end
        end
        may = max(times);
        mej = 14;
        for k=1:13
            if (times(k) == may)
                mej = k;
            end
        end
        ccol(j) = mej;
    end
    
    cur = 0;
    
    g = [];
    
    for j = 1:m
        if (ccol(j) ~= cur)
            if (ccol(j) ~= 14 && ccol(j) ~= 13)
                g = cat(2, g, (ccol(j)));
            end
        end
        cur = ccol(j);
    end
            
function g = obtainBars(clasif)
    [n, m] = size(clasif);
    
    ccol = zeros(1, m, 'uint8');
    
    for j=1:m
        times = zeros(1, 14, 'uint8');
        for i=1:n
            if (clasif(i,j) ~= 14)
                times(clasif(i, j)) = times(clasif(i, j)) + 1;
            end
        end
        may = max(times);
        mej = 14;
        if (may > 6)
            for k=1:13
                if (times(k) == may)
                    mej = k;
                end
            end
        end
        ccol(j) = mej;
    end
    
    ccol
    
    g = compress(ccol);
    
    [ugh, l] = size(g);
    
    s = 0;
    e = l+1;
    
    for i = 1:l
        if (g(i) == 13)
            s = i;
            break;
        end
    end
    
    for i = l:-1:1
        if (g(i) == 13)
            e = i;
            break;
        end
    end 
    
    g = g(s+1:e-1);
            
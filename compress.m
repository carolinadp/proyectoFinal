function g = compress(f)
    l = 0;
    
    [n, m] = size(f);
    
    cur = 0;
    ap = 0;
    
    for j = 1:m
        if (f(j) ~= cur)
            if (cur ~= 14 && ap > 3)
                l = l + 1;
                g(l) = cur;
            end
            ap = 0;
        else 
            ap = ap + 1;
        end
        cur = f(j);
    end
    
    if (cur ~= 14 && ap > 3)
        l = l + 1;
        g(l) = cur;
    end
    
    
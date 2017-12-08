function g = compress(f)
    l = 0;
    
    [n, m] = size(f);
    
    cur = 0;
    
    for j = 1:m
        if (f(j) ~= cur || j == 1)
            if (f(j) ~= 14 && f(j) ~= 13)
                l = l + 1;
                g(l) = f(j);
            end
        end
        cur = f(j);
    end
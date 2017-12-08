function cuenta(f, cat)
    %f = imread('testImage.png');
    bw = roipoly(f);

    if (exist('count.mat','file') == 0)
        count = zeros(256,256,256,14,'uint8');
    else 
        load('count', 'count');
    end

    % 1 - negro
    % 2 - cafe
    % 3 - rojo
    % 4 - naranja
    % 5 - amarillo
    % 6 - verde 
    % 7 - azul
    % 8 - violeta
    % 9 - gris
    % 10 - blanco
    % 11 - dorado
    % 12 - plata
    % 13 - fondo
    % 14 - papel y alambre

    [n, m, o] = size(f);

    for i=1:n
        for j=1:m
            if (bw(i,j) == 1)
                r = f(i, j, 1);
                g = f(i, j, 2);
                b = f(i, j, 3);
                count (r + 1, g + 1, b + 1, cat) = count (r + 1, g + 1, b + 1, cat) + 1;
            end
        end
    end

    save('count', 'count');

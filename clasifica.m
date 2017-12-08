clear all
close all
clc

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

f = imread('test.png');

if (exist('count.mat','file') == 0)
    count = zeros(256,256,256,14);
else 
    load('count', 'count');
end

[n, m, o] = size(f);

img = zeros(n, m, o, 'uint8');
clasif = zeros(n, m, 'uint8');

colors = [0, 0, 0
 139, 69, 19
 255, 0, 0
 255, 140, 0
 255, 255, 0
 0, 255, 0
 0, 0, 255
 148, 0, 211
 128, 128, 128
 255, 255, 255
 218, 165, 32
 192, 192, 192
 222,184,135
 220, 220, 220
 ];

for i=1:n
    for j=1:m
        r = f(i, j, 1);
        g = f(i, j, 2);
        b = f(i, j, 3);
        
        maxv = max(count(r + 1, g + 1, b + 1, :));
        pos = 0;
        if (maxv > 0)
            for k=1:14
                if (count(r + 1,g + 1,b + 1,k) == maxv)
                    pos = k;
                end
            end
            img(i, j, :) = colors(pos,:);
            
        end
        clasif(i, j) = pos;
    end
end

figure, imshow(img)

vec = [0,1
    0,-1 
    -1,0
    1,0];

for i=1:n
    for j=1:m
       veces = zeros(14,1);
       if (clasif(i, j) == 0)
           for k=1:4
               x = i + vec(k,1);
               y = j + vec(k,2);
               if (x >= 1 && y >= 1 && x <= n && y <= m && clasif(x,y) > 0)
                   veces(clasif(x,y)) = veces(clasif(x,y)) + 1;
               end
           end
           may = max(veces);
           mej = 0;
           if (may > 0)
               for k=1:14
                   if veces(k) == may
                       mej = k;
                   end
               end
           end
           
           clasif(i,j) = mej;
           if (mej > 0)
               img(i,j,:) = colors(mej,:);
           end
           
       end
    end
end

figure,imshow (img)
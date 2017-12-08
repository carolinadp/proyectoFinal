url = 'http://192.168.100.18:8080/shot.jpg';
ss  = imread(url);

fh = image(ss);
while(1)
    ss  = imread(url);
    set(fh,'CData',ss);
    drawnow;
end

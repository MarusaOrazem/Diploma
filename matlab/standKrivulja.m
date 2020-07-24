function standKrivulja(tocke,poligon)
%nariše parametri?no krivuljo v standarni bazi, z kontrolnimi tockami
%tocke, kjer so prva vrstica x koordinate, druga pa y. poligon nastavimo na
%1 ?e želimo še izris poligona.

n = length(tocke)-1;
fx = @(t) 1; 
fy = @(t) 1 ;
tockex = tocke(1,:);
tockey = tocke(2,:);
for i=0:n
    p_i = @(t)  t.^i;
    fx = @(t) fx(t) + tockex(i+1).*p_i(t); 
    fy = @(t) fy(t) + tockey(i+1).*p_i(t) ;  
end
fx = @(t) fx(t) -1;
fy = @(t) fy(t) -1;
x = linspace(-1,1,100000);
plot(fx(x),fy(x));
hold on 
if poligon
    plot(tockex,tockey);
end
end


function bernKrivulja( tocke, poligon )
%funkcije nariše krivuljo v bernsteinovi bazi in kontrolnimi tockami
%'tocke', kjer je prva vrstica x koordinate, druga pa y.
%drugi parameter nastavimo na 1 ?e želimo izrisati tudi kontrolni poligon.
n = length(tocke)-1;
fx = @(t) 1; 
fy = @(t) 1 ;
tockex = tocke(1,:);
tockey = tocke(2,:);
for i=0:n
    b_i = @(t) nchoosek(n,i) .* t.^i .* (1-t).^(n-i);
    fx = @(t) fx(t) + tockex(i+1).*b_i(t); 
    fy = @(t) fy(t) + tockey(i+1).*b_i(t) ;  
end
fx = @(t) fx(t) -1;
fy = @(t) fy(t) -1;
x = linspace(0,1,100);
plot(fx(x),fy(x));
hold on 
if poligon
    plot(tockex,tockey);
end
end


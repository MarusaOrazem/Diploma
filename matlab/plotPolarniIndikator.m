function plotPolarniIndikator(tocke, celostni)
%nariše polarne indikatorje na krivulji, ki je podana s to?kami tocke v
%standarni bazi. ?e je celostni nastavljen na 1, nariše vektorje do
%izhodiš?a.

n = length(tocke)-1;
fx = @(t) 1; 
fy = @(t) 1 ;
fz = @(t) 1 ;

tockex = tocke(1,:);
tockey = tocke(2,:);
tockez = tocke(3,:);

for i=0:n
    p_i = @(t)  t.^i;
    fx = @(t) fx(t) + tockex(i+1).*p_i(t); 
    fy = @(t) fy(t) + tockey(i+1).*p_i(t) ;  
    fz = @(t) fz(t) + tockez(i+1).*p_i(t) ;  

end
fx = @(t) fx(t) -1;
fy = @(t) fy(t) -1;
fz = @(t) fz(t) -1;

t = linspace(-1,1,100);
plot3(fx(t),fy(t), fz(t),'LineWidth',4, 'Color','b');
hold on
if celostni
    for i=t(1:2:end)
        plot3([0 fx(i)],[0 fy(i)],[0 fz(i)],'r');
    end
else 
    for i=t(1:2:end)
        norma = norm([fx(i), fy(i), fz(i)]);
        %nariše samo del vektorjev
        %plot3([fx(i),0.7*fx(i)],[fy(i),0.7*fy(i)],[fz(i),0.7*fz(i)], 'b');
        quiver3(fx(i),fy(i),fz(i),-1/norma*fx(i),-1/norma*fy(i),-1/norma*fz(i),'r');
    end
end

end

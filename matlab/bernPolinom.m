function b = bernPolinom(n)
%Funkcija nariše bernsteinove bazne polinome stopnje n. Vrne seznam b, v
%katerem so bernsteinovi bazni polinomi.
x = linspace(0,1,100);
for i= 0:n
   b_i = @(t) nchoosek(n,i) .* t.^i .* (1-t).^(n-i);
   plot(x, b_i(x))
   axis([-1 1 -1 1])
   hold on
end
end


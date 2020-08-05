function PlotFreneOgrodje
%funkcija nariše frenejevo ogrodje, na dani krivulji f, df je odvod.
syms t
R = [cos(t), sin(2*t), cos(2*t)];
R_dot = diff(R,t) %odvod po t
R_ddot = diff(R_dot,t) %drugi odvod po t
r = [cos(t), sin(2*t), cos(2*t)];
fplot3(r(1),r(2),r(3),[0,2*pi])
hold on
th = R_dot/norm(R_dot) %tangenta
T = linspace(0, 2*pi);
TH = subs(th, t, T.');
quiver3(cos(T), sin(2*T), cos(2*T), TH(:,1).', TH(:,2).', TH(:,3).', 'r');

bh = cross(R_dot, R_ddot)/norm(cross(R_dot,R_ddot));
B = linspace(0,2*pi);
BH = subs(bh, t, B.');
quiver3(cos(B), sin(2*B), cos(2*B), BH(:,1).', BH(:,2).', BH(:,3).', 'b');

nh = cross(bh,th);
N = linspace(0,2*pi);
NH = subs(nh, t, N.');
quiver3(cos(N), sin(2*N), cos(2*N), NH(:,1).', NH(:,2).', NH(:,3).', 'g');

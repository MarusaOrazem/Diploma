function PlotFreneOgrodje2
%funkcija nari�e frenejevo ogrodje, na dani krivulji f, df je odvod.
syms t
R = [cos(t), sin(t), t];
R_dot = diff(R,t) %odvod po t
R_ddot = diff(R_dot,t) %drugi odvod po t
r = [cos(t), sin(t), t];
fplot3(r(1),r(2),r(3),[0, 2*pi],'k')
hold on
th = R_dot/norm(R_dot) %tangenta
T = linspace(pi,pi);
TH = subs(th, t, T.')
axis equal
quiver3(cos(T), sin(T), T, 0.5*TH(:,1).', 0.5*TH(:,2).', 0.5*TH(:,3).',0, 'LineWidth', 2,'Color', 'b');

bh = cross(R_dot, R_ddot)/norm(cross(R_dot,R_ddot));
B = linspace(pi,pi);
BH = subs(bh, t, B.');
quiver3(cos(B), sin(B), B, 0.5*BH(:,1).', 0.5*BH(:,2).', 0.5*BH(:,3).',0, 'LineWidth', 2,'Color', 'g');

nh = cross(bh,th);
N = linspace(pi,pi);
NH = subs(nh, t, N.');
quiver3(cos(N), sin(N), N, 0.5*NH(:,1).', 0.5*NH(:,2).', 0.5*NH(:,3).',0, 'LineWidth', 2, 'Color', 'g');

%zarotiramo n in b
e_2 =  cos(pi/3)*NH + sin(pi/3)* BH;
e_3 = -sin(pi/3)*NH + cos(pi/3) *BH;
quiver3(cos(B), sin(B), B, 0.5*e_3(:,1).', 0.5*e_3(:,2).', 0.5*e_3(:,3).',0, 'LineWidth', 2,'Color', 'r');
quiver3(cos(N), sin(N), N, 0.5*e_2(:,1).', 0.5*e_2(:,2).', 0.5*e_2(:,3).',0, 'LineWidth', 2, 'Color', 'r');


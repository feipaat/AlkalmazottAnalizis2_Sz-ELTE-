function [h, t, y]=RK4(a,b,y0,N)

%% Bemenõ paraméterek listája

% a           az intervallum kezdete
% b           az intervallum vége
% y0          a kezdeti érték
% N           a lépésközök száma


%% Kimenõ paraméter

% y           a numerikus megoldás vektora
% y(N+1)      a numerikus megoldás


%% Elõkészületek

h=(b-a)/N;                    %lépésköz
t=linspace(a,b,N+1);          % az intervallum felosztása
y=zeros(1,N+1);               % numerikus megoldas vektora


%% A javított Euler módszer algoritmusa

y(1)=y0;
for j=1:N
	k1=f(t(j),y(j));
	k2=f(t(j)+0.5*h,y(j)+0.5*h*k1);
        k3=f(t(j)+0.5*h,y(j)+0.5*h*k2);
	k4=f(t(j)+h,y(j)+h*k3);
        y(j+1)=y(j)+h*(1/6*k1+1/3*k2+1/3*k3+1/6*k4);
end

%y;



%% Az f, vagyis az y'(t)=f(t,y(t)) egyenlet jobboldala 
function ered=f(t,y)
ered=1-y;

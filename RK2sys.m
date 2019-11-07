function [h, t, y]=RK2sys(a,b,y0,N)

%% Bemenõ paraméterek listája

% a           az intervallum kezdete
% b           az intervallum vége
% y0          a kezdeti érték
% N           a lépésközök száma


%% Kimenõ paraméter

% y           a numerikus megoldás vektora
% y(N+1)      a numerikus megoldás


%% Elõkészületek

h=(b-a)/N;                    %lepeskoz
t=linspace(a,b,N+1);          % az intervallum felosztasa
m=length(y0);                 % a redszer mérete
y=zeros(m,N+1);               % numerikus megoldas vektora


%% A javított Euler módszer algoritmusa

y(:,1)=y0; % kezdeti érték megadása
for j=1:N
	k1=f(t(j),y(:,j));
	k2=f(t(j)+0.5*h,y(:,j)+0.5*h*k1);
        y(:,j+1)=y(:,j)+h*k2;
end

%y;



%% Az f, vagyis az y'(t)=f(t,y(t)) egyenlet jobboldala 
function ered=f(t,y)

L=2;
V1=10;
V2=5;

ered=zeros(2,1);
ered(1)=-L/V1*y(1);
ered(2)=-L/V2*(y(2)-y(1));

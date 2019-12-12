function [h, t, y]=hongkong(a,b,y0,N)

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
m=length(y0);                 % a redszer mérete
y=zeros(m,N+1);               % numerikus megoldas vektora


%% A RK4 módszer algoritmusa

y(:,1)=y0; % kezdeti érték megadása
for j=1:N
	k1=f(t(j),y(:,j));
	k2=f(t(j)+0.5*h,y(:,j)+0.5*h*k1);
    k3=f(t(j)+h,y(:,j)-h*1*k1+h*2*k2);
    y(:,j+1)=y(:,j)+h*((1/6)*k1+(2/3)*k2+(1/6)*k3);
end

%y;

%% Az f, vagyis az y'(t)=f(t,y(t)) egyenlet jobboldala 
function ered=f(t,y)

beta=1/2;
gamma=1/3;

ered=zeros(3,1);
ered(1)=-beta*y(1)*y(2);
ered(2)=beta*y(1)*y(2)-gamma*y(2);
ered(3)=gamma*y(2);

function [h,t,y]=AB2sys(a,b,f,y0,N)

%% Bemeno parameterek listaja

% a           az intervallum kezdete
% b           az intervallum vege
% f           feladat jobboldala
% y0          a kezdeti ertek vektora
% N           a lepeskozok szama


%% Kimeno parameter

% h           lepeskoz
% t           az idobeli racshalo
% y           a numerikus megoldovektor

%% Elokeszuletek
h=(b-a)/N;                    
t=linspace(a,b,N+1);  
m=length(y0);      
y=zeros(m,N+1);             
y(:,1)=y0;

%% Az AB2 elinditasahoz egy ERK2 modszer
for j=1:1 %ERK3
    k1=f(t(j),y(:,j));
    k2=f(t(j)+0.5*h,y(:,j)+0.5*h*k1);
    y(:,j+1)=y(:,j)+h*k2;
end

%% Az AB2 algoritmusa
for j=2:N
    y(:,j+1)=y(:,j)+h*(3/2*f(t(j),y(:,j))-1/2*f(t(j-1),y(:,j-1)));
end


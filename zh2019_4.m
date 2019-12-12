a=2; b=5; %intervallum
alpha=-1; beta=1; %peremértékek
%Rács
N=64;
h=(b-a)/(N+1);
% A_h
e=ones(N+2,1);
A_h=(1/h^2)*spdiags([-e 2*e -e],[-1,0,1],N+2,N+2);
A_h(1,1)=1; A_h(1,2)=0;
A_h(N+2,N+1)=0; A_h(N+2,N+2)=1;
%f jobboldal
x=linspace(a,b,N+2)';
f=x.^2-2; f(1)=alpha; f(N+2)=beta;
% Numerikus és pontos
y=A_h\f;
ynorm=norm(y,2)
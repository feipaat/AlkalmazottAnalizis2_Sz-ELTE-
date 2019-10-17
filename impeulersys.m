function [t,y,it]=impeulersys(a,b,y0,N,TOL,maxit)

%% Bemeno parameterek listaja

% a           az intervallum kezdete
% b           az intervallum vege
% y0          a kezdeti ertek
% N           a lepeskozok szama
% TOL 	      relativ hiba
% maxit


%% Kimeno parameter

% y           a numerikus megoldas vektora
% y(N+1)      a numerikus megoldas

%% Elokeszuletek
h=(b-a)/N;
t=linspace(a,b,N+1);
m=length(y0);
y=zeros(m,N+1);             
y(:,1)=y0;

%% Implicit Euler
for j=1:N
	yo=y(:,j);
	yj=yo; %Kezdo Newton; itt lehet egy explicit Eulerrel lepni, hogy a mo kozelebe keruljunk
	it=0;  %Newton lepesszamlalo
	flag=1; % Biztonsagi flag (1 oke, 0 nem oke)

	while flag
		yc=yj;
		[f,J]=problem(t(j+1),yc);
		Jacobi=eye(m)-h*J;
        	g=yc-yo-h*f;
		dy=Jacobi\g; %dy=y_{j+1}-y_j
        	yj = yc - dy;
		it=it+1;
	        if norm(dy) < TOL * norm(yj) || it == maxit
			flag=0;
	        end
	end
        y(:,j+1)=yj;
end


function [f,J]=problem(t,y)
%% Kimeno parameter
% f      az egyenlet jobboldala
% J      az f Jacobija


a = 0.04; b = 1e+4; c = 3e+7;
f = [-a*y(1) + b*y(2)*y(3); a*y(1) - b*y(2)*y(3) - c*y(2)*y(2); c*y(2)*y(2)];
if nargout > 1
J = zeros(3,3);
J(1,1) = -a; J(1,2) = b*y(3); J(1,3) = b*y(2);
J(2,1) = a; J(2,2) = -b*y(3) - 2*c*y(2); J(2,3) = -b*y(2);
J(3,2) = 2*c*y(2);

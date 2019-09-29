function [x,it] = jacobi(A,b,x0,TOL,maxit)

%% Jacobi-iteracio adott leallasi feltetelekkel (mas feltelre lasd: Farago-Horvath 3.6.5. fejezetet)
% Input parameterek
% A       matrix
% b       oszlopvektor
% xo      kezdeti vektor
% TOL     adott tolerancia szint; leallasi feltetel numerikus megoldo vektor rel.hibajara max.normaban
% maxit   maximalis iteracioszam; leallasi feltetel


relerr = inf; %Kezdetben nagy relativ hibat adunk meg
it = 1;
X(:,1) = x0;

%% Felbontas
D=diag(diag(A));	
L=tril(sparse(A),-1);
U=triu(sparse(A),1);

%% Jacobi a leallasi feltetelekkel
while (relerr>TOL) && (it<maxit) 	% maxiterig vagy az eloirt hiba elereseig iteraljon
X(:,it+1) = D\(-(L+U)*X(:,it)+b);
relerr = norm(X(:,it+1)-X(:,it),inf)/norm(X(:,it),inf);
it = it+1;
end
x= X(:, it);

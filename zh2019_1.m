function zh2019_1(A)
for j=1:length(A)
    diag_elojel(j)=A(j,j)>0;
end
if sum(diag_elojel)<length(A)
   disp('A foatloban kert pozitivitas nem teljesul')
else
    A=A-diag(diag(A));
    for j=1:length(A)
        for k=1:length(A)
            offdiag_elojel(j,k)=A(j,k)<=0;
        end
    end
    if sum(sum(offdiag_elojel))==length(A)^2
        disp('Az adott matrix teljesiti az M-matrixhoz tartozo elojeleloszlast')
    else
        disp('Az adott matrix foatloja pozitiv, de az offdiagonalja tartalmaz pozitiv elemet, igy nem lehet M-matrix')
    end
end
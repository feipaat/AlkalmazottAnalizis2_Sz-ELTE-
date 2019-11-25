function ltmrend(a,b)

%% Linearis k-lepeses modszer rendjenek meghatarozasa
%Példa1 a=[1 4 -5]; b=[0 4 2]; 
%Példa2 a =[1 -48/25 36/25 -16/25 3/25]; b=[12/25 0 0 0 0]; %BDF4


TOL=1e-14;
k=length(a);
pmax=2*length(a);

if sum(a)==0
    for j=1:pmax
        for i=1:k
            A(i,j)=(i-1)^j*a(i)/j+(i-1)^(j-1)*b(i);
        end
    end
    format long
    osszeg=sum(A);
    prend=osszeg;
    prend(prend < TOL) = 0;
    prend;
    p=find(prend,1)-1;
    X = ['A modszer rendje ', num2str(p),'.'];
    disp(X)
else disp('A modszer nem konzisztens.')
end






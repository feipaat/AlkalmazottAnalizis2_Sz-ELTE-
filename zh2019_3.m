[h, t, y]=AB4sys(0,100,@(t,y)[-0.5*y(1)*y(2) 0.5*y(1)*y(2)-(1/3)*y(2) (1/3)*y(2)]',[1; 0.00000126582; 0]',1000);
y(:,end)*7900000
format long
%[h, t, y]=hongkong(0,100,[1 1/(7900000) 0]',1000);
[h,t,y]=hongkong(0,100,[1; 0.00000126582; 0],1000);
[TOUT,YOUT] = ode45(@(t,y)[-0.5*y(1)*y(2) 0.5*y(1)*y(2)-(1/3)*y(2) (1/3)*y(2)]', [0 100], [1; 0.00000126582; 0]);
plot(t,y,TOUT,YOUT,'*')
legend('RK3-S','RK3-I','RK3-R','ode45-S','ode45-I','ode45-R')
title('Az egyes osztalyok alakulasa az elso 100 napban')



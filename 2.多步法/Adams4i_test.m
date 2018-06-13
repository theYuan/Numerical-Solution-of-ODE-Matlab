clc;
%%dufun=inline('-30*u');
tspan=[0,1];
u0=1;
h=0.01;
tspan1=[0,3*h];
[t1,u1]=Kutta42(@dufun1,tspan1,u0,h);
[t2,u2]=Adams4_Implict(@dufun1,tspan,u0,u1(2),u1(3),u1(4),h);
t=tspan(1):h:tspan(2);
uexact=exp(-30*t);
plot(t2,u2,'o-',t,uexact,'*-');
legend('h=0.05','exactsolu');
title('Implict Adams4 h=0.05');
xlabel('t');ylabel('u');
figure(2);
err=uexact-u2;
plot(t,err);xlabel('t');ylabel('error')
title('Error h=0.05');
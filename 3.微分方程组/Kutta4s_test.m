%%主程序
%[u1,u2,u3]=dsolve('Du1=u2','Du2=u3','Du3=2*u3','u1(0)=1','u2(0)=1','u3(0)=1')
clc;
clf;
tspan=[0,2];
u0=[1,1,1];
h=0.1;
[t1,u1]=Kutta4s(@dufun2,tspan,u0,h);

u1exact=1/4*exp(2*t1)+t1/2+3/4;
u2exact=1/2*exp(2*t1)+1/2;
u3exact=exp(2*t1);

plot(t1,u1(1,:),'-*',t1,u1(2,:),'-*',t1,u1(3,:),'-*',t1,u1exact,'o',t1,u2exact,'o',t1,u3exact,'o');
legend('u1-数值解','u2-数值解','u3-数值解','u1-精确解','u2-精确解','u3-精确解');
xlabel('t');ylabel('u');
title('h=0.5');

figure(2)
err1=abs(u1exact-u1(1,:));
err2=abs(u2exact-u1(2,:));
err3=abs(u3exact-u1(3,:));

plot(t1,err1,'r*',t1,err2,'b*',t1,err3,'g*');
legend('u1-误差','u2-误差','u3-误差');
xlabel('t');ylabel('error');
title('h=0.5');
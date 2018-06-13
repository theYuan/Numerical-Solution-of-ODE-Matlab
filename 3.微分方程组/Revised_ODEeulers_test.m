%%主程序
%求精确解：[u1,u2]=dsolve('Du1=-0.01*u1-99.99*u2','Du2=-100*u2','u1(0)=2','u2(0)=1')
clc;
clf;
tspan=[0,500];
u0=[2,1];
h=0.01;
[t1,u1]=Revised_ODEeulers(@dufun1,tspan,u0,h);

u1exact=exp(-0.01*t1)+exp(-100*t1);
u2exact=exp(-100*t1);

subplot(2,2,1);
plot(t1,u1(1,:),'*',t1,u1exact,'.');
legend('u1-数值解','u1-精确解');
xlabel('t');ylabel('u');
title('u1数值解与精确解');

subplot(2,2,2);
plot(t1,u1(2,:),'*',t1,u2exact,'.');
legend('u2-数值解','u2-精确解');
xlabel('t');ylabel('u');
title('u2数值解与精确解');

subplot(2,2,3);
err1=u1exact-u1(1,:);
plot(t1,err1,'r*');
legend('u1-误差');
xlabel('t');ylabel('error');
title('u1误差');

subplot(2,2,4);
err2=u2exact-u1(2,:);
plot(t1,err2,'r*');
legend('u2-误差');
xlabel('t');ylabel('error');
title('u2误差');

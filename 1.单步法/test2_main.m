%ȡ����Ϊ0.1ʹ�����ַ�����⣬�������Ա�ͼ
%dsolve('Du=-30*u','u(0)=1','t')
clc;
clf;
dufun=inline('-30*u');
tspan=[0,1];
h=0.05;
u0=1;
[t1,u1]=ODEeuler(dufun,tspan,u0,h);
[t2,u2]=Revised_ODEeuler(dufun,tspan,u0,h);
[t3,u3]=Kutta3(dufun,tspan,u0,h);
[t4,u4]=Kutta4(dufun,tspan,u0,h);
plot(t1,u1,'*',t2,u2,'*',t3,u3,'*',t4,u4,'*',t,uexact,'o');
legend('Euler','�Ľ�Euler','����Kutta','�Ľ�Kutta','exactsolu');
title('h=0.05 ���ַ����Ա�ͼ');
xlabel('t');ylabel('u');

t=tspan(1):h:tspan(2);
uexact=exp(-30*t);
err1=abs(uexact-u1);
err2=abs(uexact-u2);
err3=abs(uexact-u3);
err4=abs(uexact-u4);
figure(2);
plot(t1,err1,'-',t2,err2,'-',t3,err3,'-',t4,err4,'-');
legend('���-Euler','���-�Ľ�Euler','���-����Kutta','���-�Ľ�Kutta');
title('h=0.05 ���ַ������ͼ');
xlabel('t');ylabel('u');
max1=norm(err1,inf)
max2=norm(err2,inf)
max3=norm(err3,inf)
max4=norm(err4,inf)


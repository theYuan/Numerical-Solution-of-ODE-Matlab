clc;
dufun=inline('(1-t*cos(u))*cot(u)');
tspan=[0,2];
u0=acos(1/2);
h=0.01;
[t1,u1]=Adams4_PC(dufun,tspan,u0,h);
[t2,u2]=Adams4(dufun,tspan,u0,h);
uexact=acos(1./(t1+1+exp(t1)));
plot(t1,u1,'*',t2,u2,'*',t1,uexact,'o','LineWidth',1);
legend('Adams4Ԥ��У��','Adams4��ʽ','��ȷ��');
title('Adams4 h=0.01');
xlabel('t');ylabel('u');
figure(2)
err1=abs(uexact-u1);
err2=abs(uexact-u2);
plot(t1,err1,'-',t2,err2,'-','LineWidth',1);
legend('err-Adams4Ԥ��У��','err-Adams4��ʽ');
xlabel('t');ylabel('error')
title('Error h=0.01');
max1=norm(err1,inf)
max2=norm(err2,inf)
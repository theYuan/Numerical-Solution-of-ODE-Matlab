clc;
dufun=inline('(1-t*cos(u))*cot(u)');
tspan=[0,2];
u0=acos(1/2);
h=0.1;
[t1,u1]=Adams4(dufun,tspan,u0,h)
[t2,u2]=Adams4_Implict(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
uexact=acos(1./(t+1+exp(t)));
plot(t1,u1,'*',t2,u2,'*',t,uexact,'o-');
legend('xianshi','yinshi','exactsolu');
title('Implict Adams4');
xlabel('t');ylabel('u');
figure(2)
err1=uexact-u1;
err2=uexact-u2;
plot(t,err1,t,err2);
legend('xianshi','yinshi');
xlabel('t');ylabel('error')
title('Error h=0.1');
max1=norm(err1,inf)
max2=norm(err2,inf)
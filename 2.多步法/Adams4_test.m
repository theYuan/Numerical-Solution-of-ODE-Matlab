clc;
clf;

dufun=inline('(1-t*cos(u))*cot(u)');
tspan=[0,2];
u0=acos(1/2);
h=0.1;
[t2,u2]=Adams4(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
uexact=acos(1./(t+1+exp(t)));
plot(t2,u2,'o-',t,uexact,'*-');
legend('h=0.1','exactsolu');
title('Adams4');
xlabel('t');ylabel('u');
figure(2)
err=uexact-u2;
plot(t,err);xlabel('t');ylabel('error')
title('Error h=0.1');
max=norm(err,inf)
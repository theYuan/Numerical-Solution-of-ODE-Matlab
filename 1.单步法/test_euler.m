% dsolve('Du=-u^2','u(0)=1','t')
clc;
clf;
dufun=inline('-u^2');
tspan=[0,10];
h=0.1;
u0=1;
[t,u]=ODEeuler(dufun,tspan,u0,h);
uexact=(1./(t+1));
plot(t,u,'o-',t,uexact);
legend('h=0.1','exactsolu');
xlabel('t');
ylabel('u');
title('Euler h=0.1');
figure(2)
err=abs(uexact-u);
plot(t,err);
xlabel('t');
ylabel('err');
title('Euler Îó²î');
max=norm(err,inf)

%u=dsolve('-D2u+2*x*Du+2*u=0','u(0)=1','u(1)=exp(1)','x')
clc;
clf;

a=0;
b=1;
n=100;
ua=1;
ub=exp(1);
%函数f p r q
f=inline('0');
p=inline('1');
r=inline('2*x');
q=inline('2');
[x,u]=twopointsprq(a,b,ua,ub,p,r,q,f,n);
plot(x,u,'-o');
y=exp(x.^2)';
hold on;
plot(x,y,'r');
legend('数值解','精确解');
title('Two points');
xlabel('x');ylabel('u');


figure(2);
err=abs(y-u);
plot(x,err);
title('Two points误差');
xlabel('x');ylabel('err');
max=norm(err,inf)

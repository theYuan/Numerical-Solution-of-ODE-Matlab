%u=dsolve('-D2u+Du+2*u=2*x*exp(x^2)-4*x^2*exp(x^2)','u(0)=1','u(1)=exp(1)','x')
%simplify(u)
clc;
clf;
a=0;
b=1;
n=100;
ua=1;ub=exp(1);
coef=[-1,1,2];  %系数
f=inline('2*x*exp(x^2)-4*x^2*exp(x^2)');  %f
[x,u]=twopoints(a,b,ua,ub,coef,f,n);
plot(x,u,'-o');
y=exp(x.^2)';
hold on;
plot(x,y);
legend('数值解','精确解');
title('Two points, n=50');
xlabel('x');ylabel('u');

figure(2);
err=abs(y-u);
plot(x,err);
title('Two points误差, n=50');
xlabel('x');ylabel('err');
max=norm(err,inf)

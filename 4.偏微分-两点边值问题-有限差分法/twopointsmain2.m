%s=dsolve('D2y-y=0','y(0)=0,y(1)=0.5*(exp(1)-exp(-1))')
clc;
clf;
a=0;
b=1;
n=50;
ua=0;
ub=0.5*(exp(1)-exp(-1));
coef=[1,0,-1];

f=inline('0');
[x,u]=twopoints(a,b,ua,ub,coef,f,n);
plot(x,u,'-o');

y=0.5*(exp(x)-exp(-x))';
hold on;
plot(x,y);
legend('数值解','精确解');
title('Two points');
xlabel('x');ylabel('u');

figure(2);
err=abs(y-u);
plot(x,err);
title('Two points误差');
xlabel('x');ylabel('err');
max=norm(err,inf)
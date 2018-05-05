%Adams四步四阶显式法作常微分方程数值计算
%[a,b]为求解区间,h为步长
clc;
F='(1-x*cos(y))*cot(y)';
a=0;
b=2;
h=0.05;
n=(b-a)/h;
X=a:h:b;
Y=zeros(1,n+1);
Y(1)= acos(1/2);
%以四阶R-K法启动 Start with R-K-4 method
for i=1:3
   x=X(i);
   y=Y(i);
   K1=h*eval(F);
   x=x+h/2;
   y=y+K1/2;
   K2=h*eval(F);
   x=x;
   y=Y(i)+K2/2;
   K3=h*eval(F);
   x=X(i)+h;
   y=Y(i)+K3;
   K4=h*eval(F);
   Y(i+1)=Y(i)+(K1+2*K2+2*K3+K4)/6;
end
%Adams四步四阶显式法 Adams 4-step-4th-order method
for i=4:n
   x=X(i-3);
   y=Y(i-3);
   f1=eval(F);
   x=X(i-2);
   y=Y(i-2);
   f2=eval(F);
   x=X(i-1);
   y=Y(i-1);
   f3=eval(F);
   x=X(i);
   y=Y(i);
   f4=eval(F);
   Y(i+1)=Y(i)+h*(55*f4-59*f3+37*f2-9*f1)/24;
end
 
%准确解 acurate solution
temp=[];
f='acos(1/(x+1+exp(x)))';
df=zeros(1,n+1);
for i=1:n+1
   temp=subs(f,'x',X(i));
   df(i)=double(vpa(temp));
end


%画图观察效果 to see the plot
figure;
plot(X,df,'k*',X,Y,'--r');
grid on;
title('Adams四步四阶显式法解常微分方程');
legend('准确值','Adams四步四阶显式法');

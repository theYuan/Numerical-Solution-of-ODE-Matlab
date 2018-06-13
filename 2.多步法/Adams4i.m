function u=Adams4i(dufun,h,a,b,u0)
format long;
N=(b-a)/h;
u=zeros(1,N+1);
t=a:h:b;
u(1)=u0;
u(2)=1.108960991057469;
u(3)=1.160335224588050;
u(4)=
for i=3:N
    u(i+1)=u(i)+(h/24)*(9*feval(dufun,t(i+1),u(i+1))+19*feval(dufun,t(i),u(i))-5*feval(dufun,t(i-1),u(i-1))+feval(dufun,t(i-2),u(i-2)));
end
plot(t,u,'-rs');
hold on;
t1=0:0.1:2;
uexact=acos(1./(1+t+exp(t)));
plot(t1,uexact,'b-*');
legend('numerical solu','exact solu');
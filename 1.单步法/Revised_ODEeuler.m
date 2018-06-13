%改进欧拉法
function [t,u]=Revised_ODEeuler(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
u(1)=u0;
for n=1:(length(t)-1)
    u1(n+1)=u(n)+h*feval(dufun,u(n));
    u(n+1)=u(n)+h/2*(feval(dufun,u(n))+feval(dufun,u1(n+1)));
    %函数f中有变量t
    %u1(n+1)=u(n)+h*feval(dufun,t(n),u(n));
    %u(n+1)=u(n)+h/2*(feval(dufun,t(n),u(n))+feval(dufun,t(n+1),u1(n+1)));
end
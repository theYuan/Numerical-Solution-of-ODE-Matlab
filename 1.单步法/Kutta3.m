%Kutta三阶格式
%注意：f中不含变量t时要把feval中不含变量t
function [t,u]=Kutta3(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
u(1)=u0;
for n=1:(length(t)-1)
    %k1=feval(dufun,t(n),u(n));
    %k2=feval(dufun,t(n)+h/2,u(n)+h/2*k1);
    %k3=feval(dufun,t(n)+h,u(n)-h*k1+2*h*k2);
    k1=feval(dufun,u(n));
    k2=feval(dufun,u(n)+h/2*k1);
    k3=feval(dufun,u(n)-h*k1+2*h*k2);
    u(n+1)=u(n)+h/6*(k1+4*k2+k3);
end
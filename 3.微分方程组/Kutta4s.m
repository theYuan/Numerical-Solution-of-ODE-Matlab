function [t,u]=Kutta4s(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
u=zeros(length(u0),length(t));
u(:,1)=u0(:);
for n=1:(length(t)-1)
    k1=feval(dufun,t(n),u(:,n));
    k2=feval(dufun,t(n)+h/2,u(:,n)+h/2.*k1);
    k3=feval(dufun,t(n)+h/2,u(:,n)+h/2.*k2);
    k4=feval(dufun,t(n)+h,u(:,n)+h.*k3);
    u(:,n+1)=u(:,n)+h/6.*(k1+2.*k2+2.*k3+k4);
end
function [t,u]=ODEeulers(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
u=zeros(length(u0),length(t));
u(:,1)=u0(:);
for n=1:(length(t)-1)
    u(:,n+1)=u(:,n)+h.*feval(dufun,t(n),u(:,n));
end
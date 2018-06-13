%œ‘ Ω≈∑¿≠∑®
function [t,u]=ODEeuler(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
u(1)=u0;
for n=1:(length(t)-1)
    u(n+1)=u(n)+h*feval(dufun,u(n));
    %u(n+1)=u(n)+h*feval(dufun,t(n),u(n));
end
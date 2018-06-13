function [t,u]=Adams42(dufun,tspan,u0,u1,u2,u3,h)
%%format long;
t=tspan(1):h:tspan(2);
u(1)=u0;
u(2)=u1;
u(3)=u2;
u(4)=u3;
for n=4:(length(t)-1)
    k1=feval(dufun,u(n))
    k2=feval(dufun,u(n-1));  
    k3=feval(dufun,u(n-2));
    k4=feval(dufun,u(n-3));
    u(n+1)=u(n)+h/24*(55*k1-59*k2+37*k3-9*k4);
end
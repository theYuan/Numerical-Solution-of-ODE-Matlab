function [t,u]=Adams4_PC(dufun,tspan,u0,h)
t= tspan(1):h:tspan(2);
u(1)=u0;
for n=1:3
    k1=feval(dufun,t(n),u(n));
    k2=feval(dufun,t(n)+h/2,u(n)+h/2*k1);  
    k3=feval(dufun,t(n)+h/2,u(n)+h/2*k2);
    k4=feval(dufun,t(n)+h,u(n)+h*k3);
    u(n+1)=u(n)+h*(k1+2*k2+2*k3+k4)/6;
end
for n=4:(length(t)-1)
    k1=feval(dufun,t(n),u(n))
    k2=feval(dufun,t(n-1),u(n-1));  
    k3=feval(dufun,t(n-2),u(n-2));
    k4=feval(dufun,t(n-3),u(n-3));
    u(n+1)=u(n)+h/24*(55*k1-59*k2+37*k3-9*k4);
    k=feval(dufun,t(n+1),u(n+1));
    u(n+1)=u(n)+h/24*(9*k+19*k1-5*k2+k3);
end
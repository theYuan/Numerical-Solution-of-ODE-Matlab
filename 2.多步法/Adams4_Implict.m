function [t,u]=Adams4_Implict(dufun,tspan,u0,h)
t=tspan(1):h:tspan(2);
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
    u0=u(n)+h/24*(55*k1-59*k2+37*k3-9*k4);
    u1=inf;
    while abs(u1-u0)>1e-4   %Îó²î
        u1=u(n)+h*9/24*feval(dufun,t(n+1),u0)+h/24*(19*feval(dufun,t(n),u(n))-5*feval(dufun,t(n-1),u(n-1))+feval(dufun,t(n-2),u(n-2)));
        u0=u1;
    end
    u(n+1)=u1;
end
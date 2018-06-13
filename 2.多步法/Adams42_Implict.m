function [t,u]=Adams42_Implict(dufun,tspan,u0,u1,u2,u3,h)
t=tspan(1):h:tspan(2);
u(1)=u0;
u(2)=u1;
u(3)=u2;
u(4)=u3;
for n=4:(length(t)-1)
    u0=u(n)+h/24*(55*feval(dufun,u(n))-59*feval(dufun,u(n-1))+37*feval(dufun,u(n-2))-9*feval(dufun,u(n-3)));
    u1=inf;
    while abs(u1-u0)>1e-4   %Îó²î
        u1=u(n)+h*9/24*feval(dufun,u0)+h/24*(19*feval(dufun,u(n))-5*feval(dufun,u(n-1))+feval(dufun,u(n-2)));
        u0=u1;
    end
    u(n+1)=u1;
end
function [t,u]=Implicit_Euler(odefun,tspan,u0,h)
t=tspan(1):h:tspan(2);
u(1)=u0;
for k=1:length(t)-1
    z0=u(k)+h*feval(odefun,u(k)); %��ʽEuler����u(k+1)�ĳ�ֵ
    %��f���б���t
    %z0=u(k)+h*feval(odefun,t(k),u(k));
    z1=inf;
    while abs(z1-z0)>1e-4   %�������������
        z1=u(k)+h*feval(odefun,z0);
        %z1=u(k)+h*feval(odefun,t(k+1),z0);
        z0=z1;
    end
    u(k+1)=z1;
end

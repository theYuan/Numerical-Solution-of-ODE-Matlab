function [x,U]=twopoints(a,b,ua,ub,coef,f,n)
h=(b-a)/n;

%ÏµÊýp,r,q
p=coef(1);
r=coef(2);
q=coef(3);

%¾ØÕóA
A=sparse(n-1,n-1);
b=zeros(n-1,1);

for i=1:n-2
    A(i,i)=-2*p/h^2+q;
    A(i,i+1)=p/h^2+r/(2*h);
    A(i+1,i)=p/h^2-r/(2*h);
end
A(n-1,n-1)=-2*p/h^2+q;

for i=1:n-1
    x(i)=a+i*h;
    b(i)=feval(f,x(i));
end

b(1)=b(1)-ua*(p/h^2-r/(2*h));
b(n-1)=b(n-1)-ub*(p/h^2-r/(2*h));

U=A\b;   %b/A
return;

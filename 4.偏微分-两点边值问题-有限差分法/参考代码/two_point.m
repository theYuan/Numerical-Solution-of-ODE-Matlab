function [x,U]=two_point(f,coef,a,b,n,ua,ub)
h=(b-a)/n
h2=h*h
c2=coef(1)
c1=coef(2)
c0=coef(3)

A=zeros(n-1,n-1)
F=zeros(n-1,1)
for i=1:n-2
    A(i,i)=-2*c2/h2+c0
    A(i+1,i)=c2/h2-c1/(2*h)
    A(i,i+1)=c2/h2+c1/(2*h)
end
A(n-1,n-1)=-2*c2/h2+c0
for i=1:n-1
    x(i)=a+i*h
    F(i)=feval(f,x(i))
end
F(1)=F(1)-ua*(c2/h2-c1/(2*h))
F(n-1)=F(n-1)-ub*(c2/h2+c1/(2*h))
U=inv(A)*F
end
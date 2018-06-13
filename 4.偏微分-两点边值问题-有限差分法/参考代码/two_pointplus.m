function [x1,U]=two_pointplus(f,p,r,q,a,b,n,ua,ub)
%按笔记的形式
%主函数输入时p不要带负号
h=(b-a)/n
h2=h*h
A=zeros(n-1,n-1)
F=zeros(n-1,1)
for i=1:2*n-1
    x(i)=a+i*h/2 
    P(i)=feval(p,x(i))    
end
for i=1:n-1
    x1(i)=x(2*i)
end
for j=1:n-1
  F(j)=feval(f,x1(j))
  R(j)=feval(r,x1(j))
  Q(j)=feval(q,x1(j))
end
for i=1:n-2
    A(i,i)=(P(2*i+1)+P(2*i-1))/h2+Q(i)
    A(i+1,i)=-(P(2*i+1)/h2+R(i+1)/(2*h))
    A(i,i+1)=-(P(2*i+1)/h2-R(i)/(2*h))
end
A(n-1,n-1)=(P(2*n-1)+P(2*n-3))/h2+Q(n-1)
F(1)=F(1)+ua*(P(1)/h2+R(1)/(2*h))
F(n-1)=F(n-1)+ub*(P(2*n-1)/h2-R(n-1)/(2*h))
U=inv(A)*F
return
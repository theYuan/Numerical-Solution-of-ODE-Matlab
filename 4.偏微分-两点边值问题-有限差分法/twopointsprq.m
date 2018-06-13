function [x,U]=twopointsprq(a,b,ua,ub,fp,fr,fq,f,n)
h=(b-a)/n;
A=sparse(n-1,n-1);
b=zeros(n-1,1);
r=zeros(n-1,1);
q=zeros(n-1,1);
p=zeros(n-1,1);
%计算各点的各函数值
for i=1:n-1
    x(i)=a+i*h;
    y(i)=a+i*h-h/2;
    b(i)=feval(f,x(i));
    r(i)=feval(fr,x(i));
    q(i)=feval(fq,x(i));
    p(i)=feval(fp,y(i));
end
%计算矩阵A
for i=1:n-2
    A(i,i)=(p(i)+p(i+1))/h^2+q(i);
    A(i+1,i)=-p(i+1)/h^2-r(i+1)/(2*h);
    A(i,i+1)=-p(i+1)/h^2+r(i)/(2*h);
end
A(n-1,n-1)=1/h^2*(p(n-2)+p(n-1))+q(n-2);

b(1)=b(1)+ua*(p(1)/h^2+r(1)/(2*h));
b(n-1)=b(n-1)+ub*(p(n-1)/h^2-r(n-1)/(2*h));

U=A\b;

%%step1£∫∂®“Âdufun
function du=dufun(t,u)
%%du=zeros(2,1);
du(1)=0*t+u(2);
du(2)=0*t+4*u(1);
du=du(:);

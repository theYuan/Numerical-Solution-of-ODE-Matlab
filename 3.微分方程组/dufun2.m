%%step1£∫∂®“Âdufun
function du=dufun2(t,u)
%%du=zeros(2,1);
du(1)=0*t+u(2);
du(2)=0*t+u(3);
du(3)=0*t+2*u(3);
du=du(:);
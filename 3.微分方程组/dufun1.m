%%step1£∫∂®“Âdufun
function du=dufun1(t,u)
du(1)=0*t-0.01*u(1)-99.99*u(2);
du(2)=0*t-100*u(2);
du=du(:);
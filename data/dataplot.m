clear;
clc;

v=0:0.1:2;
v=v';
upstream=load('upstream.txt')';
downstream=load('downstream.txt')';

figure(1)
plot(v,downstream,v,upstream)
title('temperature of downstream and upstream')

figure(2)
plot(v,downstream-upstream)
title('Difference of temperature of downstream and upstream - Vitesse')
title('Temperature de sortie - Vitesse')
xlabel('m/s')
ylabel('V')


ro=6.84e-8;
roT=0.0069;

L=517e-6;
t=2e-7;
W=307e-6;

res_downstream=ro*L/(t*W)*(1+roT*(downstream-273));

res_upstream=ro*L/(t*W)*(1+roT*(upstream-273));

figure(3)

plot(v,res_downstream)
title('resistence of downstream')

figure(4)

plot(v,res_upstream)
title('resistence of upstream')

res_com=ro*L/(t*W)*(1+roT*27);

V=5;

detV=V*(1/2-(res_downstream)./(res_com+res_downstream));
figure(5)
plot(v,detV)
% ylim([-0.5,0.5])
title('Tension de sortie - Vitesse')
xlabel('m/s')
ylabel('V')

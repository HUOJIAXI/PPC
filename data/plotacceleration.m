clear;
clc;

ro=6.84e-8;
roT=0.0069;

L=517e-6;
t=2e-7;
W=307e-6;

down=load('acceleration-down.txt');

up=load('acceleration-up.txt');

temp=0:0.1:2;

a=1*temp;

figure(1)
plot(a,down-up)
title('Difference de température entre le dowmstream et le upstream - Acceleration')
xlabel('m/s2')
ylabel('K')

res_downstream=ro*L/(t*W)*(1+roT*(down-273));

res_upstream=ro*L/(t*W)*(1+roT*(up-273));

res_com=ro*L/(t*W)*(1+roT*27);

V=5;

detV=V*(1/2-(res_downstream)./(res_com+res_downstream));
figure(2)
plot(a,detV)
title('Tension de sortie - Acceleration')
xlabel('m/s2')
ylabel('V')


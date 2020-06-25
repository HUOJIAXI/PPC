%% Sensor response to wall shear stress variations
k=0.384;
C=4.127;
v=1.562e-5;
rho=1.184;

theta=0:0.0001:0.03; % On définit mais peut être mesuré avec la profile de vitesse du boundary layer 
Ucen=20;
ReT=(theta*Ucen)/v;

Cf=2*(1/k*log(ReT)+C).^(-2);

figure
plot(theta,Cf)
title('skin friction coefficient  - theta')
xlabel('theta')
ylabel('skin friction coefficient')

tau=1/2*rho*Ucen*Ucen*Cf;

figure
plot(theta,tau)
title('wall shear stress - theta')
xlabel('theta')
ylabel('wall shear stress (Pa)')

%% Electrical and thermal response measurements
TCR=2380e-6;
R0=330;
temp=25:1:65;
dtemp=temp-25;

dRes=TCR*dtemp*R0;
plot(temp,dRes+330)
title('resistance - temperature')
xlabel('temperature (oC)')
ylabel('resistance (ohm)')


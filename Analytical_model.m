%% Analyticalmodel of the air
clear 
clc
%% Params
% Gas
ro=1.78;% KG/m3
Cp=848.7;
lambda=0.01715;

% Geographique
d=150e-6;
ly=0.5e-3;
lz=2e-3;
L=(427e-6)/2;

%% Model
alpha=lambda/(ro*Cp);
a=2*L*2*lz/ly;
b=2*ly*lz;
c=4/(ly*ly);

% P=12e-3;
Tmax=2;
gap=1e-3;

temp=0:gap:Tmax;

v=1/2*temp.*temp;
v=temp;

P=12e-3*ones(1,Tmax/gap+1);

THeater=P./(a*lambda+b*lambda*sqrt(v.^2/(alpha*alpha)+c));

Tdown=THeater.*exp(d*(v/(2*alpha)-sqrt(v.^2/(alpha^2)+c)/2));

Tup=THeater.*exp(d*(-v/(2*alpha)-sqrt(v.^2/(alpha^2)+c)/2));

figure(1)
plot(v,THeater)
title('THeater')
xlabel('Flow speed')
ylabel('Temperature')

figure(2)
plot(v,Tdown)
title('Downstream')
xlabel('Flow speed')
ylabel('Temperature')
figure(3)
plot(v,Tup)
title('Upstream')
xlabel('Flow speed')
ylabel('Temperature')
figure(4)
% plot(v,THeater-Tdown)
% hold on
plot(v,Tdown-Tup)

title('Difference of temperature of downstream and upstream - Vitesse')
xlabel('Flow speed m/s')
ylabel('Temperature K')
% legend(('between Heater and downstream'),('between downstream and upstream'))

disp('Turn point du model downstream')
vturn=alpha*sqrt(c);
disp('speed: ')
disp(vturn)
disp('Temperatures: ')
Tturn=P(1)/(a*lambda+b*lambda*sqrt(2*c))*exp(d*sqrt(c)*(1/2-sqrt(2)/2));
disp(Tturn)

disp('Turn point analytique downstream')
Tturn_ana=max(Tdown);
vturn_ana=v(find(Tdown==Tturn_ana));
disp('speed: ')
disp(vturn_ana)
disp('Temperatures: ')
disp(Tturn_ana)

disp('We find the point in the model as the temperaure = Tturn')
vturn_model=v(find(Tturn-(1e-3)<Tdown&Tdown<Tturn+(1e-3)));
disp(vturn_model)
%%
ro=6.84e-8;
roT=0.0069;

L=517e-6;
t=2e-7;
W=307e-6;


Tdown=THeater.*exp(d*(v/(2*alpha)-sqrt(v.^2/(alpha^2)+c)/2));

res_downstream=ro*L/(t*W)*(1+roT*(Tdown));

% res_upstream=ro*L/(t*W)*(1+roT*(up-273));

res_com=ro*L/(t*W)*(1+roT*27);

V=5;

detV=V*(1/2-(res_downstream)./(res_com+res_downstream));

figure 
plot(temp,detV)
title('Theorique: Tension de sortie - Vitesse')
xlabel('m/s')
ylabel('V')

%%

ro=6.84e-8;
roT=0.0069;

L=517e-6;
t=2e-7;
W=307e-6;


Tdown=THeater.*exp(d*(v/(2*alpha)-sqrt(v.^2/(alpha^2)+c)/2));

res_downstream=ro*L/(t*W)*(1+roT*(Tdown));

% res_upstream=ro*L/(t*W)*(1+roT*(up-273));

res_com=ro*L/(t*W)*(1+roT*27);

V=5;

detV=V*(1/2-(res_downstream)./(res_com+res_downstream));
figure

plot(temp,Tdown-Tup)
title('Theorique: Difference de température entre le dowmstream et le upstream - Acceleration')
xlabel('m/s2')
ylabel('K')

figure 
plot(temp,detV)
title('Theorique: Tension de sortie - Acceleration')
xlabel('m/s2')
ylabel('V')




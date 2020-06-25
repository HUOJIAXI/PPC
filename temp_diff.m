%% Analyticalmodel of the air
clear 
clc
%% Params
% Gas
ro=1.225;% KG/m3
Cp=1005;
lambda=0.026;
lambdam=0.15; % W/mK
Cpm=1300;

% Geographique
L=192e-6;
tm=100e-6;
h1=1e-3;
h2=0.5e-3;
h3=h1*h2/(h1+h2);

%% Model
alpha=lambda/(ro*Cp);

v=0.28:1e-2:1.04;
THeater=375;
% diff=1*(THeater*exp(ro*Cp*h1*L*v/(4*(0.5*(h1+h2)*lambda+tm*lambdam))-sqrt(16*lambda*(0.5*(h1+h2)*lambda+tm*lambdam)/(Cp*Cp*ro*ro*h1*h1*h3)+v.^2))-THeater*exp(-Cp*ro*h1*L*v/(4*(0.5*(h1+h2)*lambda+tm*lambdam))-sqrt(16*lambda*(0.5*(h1+h2)*lambda+tm*lambdam)/(Cp*Cp*ro*ro*h1*h1*h3)+v.^2)));
diff=1*(THeater*exp(ro*Cp*h1*L*v/(4*(0.5*(h1+h2)*lambda+tm*lambdam))-sqrt(16*lambda*(0.5*(h1+h2)*lambda+tm*lambdam)./(Cp*Cp*ro*ro*h1*h1*h3*v.^2)))-THeater*exp(-Cp*ro*h1*L*v/(4*(0.5*(h1+h2)*lambda+tm*lambdam))-sqrt(16*lambda*(0.5*(h1+h2)*lambda+tm*lambdam)./(Cp*Cp*ro*ro*h1*h1*h3*v.^2))));
figure(1)
plot(v,diff)



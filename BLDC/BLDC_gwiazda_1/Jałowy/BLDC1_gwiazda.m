clc;clear;

global Udc R L M Ke KT Thetaon J D TL us tmax

Udc=30;     R=0.027;    L=0.000386;     M=0.0000386; Ke=0.0277; 
KT=0.0282;  Thetaon=0;  J=0.0012;       D=0.0001;    TL=0.0001; 

tprob=0.0001;
tmax=0.3;
t0=[0:tprob:tmax];

x0=[0 0 0 0 0];

[t,x]=ode45('BLDC1_fun',t0, x0);

for k=1:max(size(t)); 
    
    u1(k)=ustojana1(x(k,5),Thetaon);
    u2(k)=ustojana2(x(k,5),Thetaon);
    u3(k)=ustojana3(x(k,5),Thetaon);
    u1s(k)=(Udc/2)*u1(k);
    u2s(k)=(Udc/2)*u2(k);
    u3s(k)=(Udc/2)*u3(k);

    e1(k)=eindu1(x(k,5));
    e2(k)=eindu2(x(k,5));
    e3(k)=eindu3(x(k,5));
    e1s(k)=(x(k,4)*Ke)*e1(k);
    e2s(k)=(x(k,4)*Ke)*e2(k);
    e3s(k)=(x(k,4)*Ke)*e3(k);
    
    eplus(k)=e1s(k)+e2s(k)+e3s(k);
    Te(k)=KT*(e1(k)*x(k,1))    +    KT*(e2(k)*x(k,2))   +   KT*(e3(k)*x(k,3));
    
    un0(k)=(1/3)*((u1s(k)-e1s(k))+(u2s(k)-e2s(k))+(u3s(k)-e3s(k)));

    
    
    u1(k)=u1s(k)-un0(k);
    u2(k)=u2s(k)-un0(k);
    u3(k)=u3s(k)-un0(k);
   
     n=9.5493*x(:,4);
    end 
%% I1 I2 I3 PRADY
f1=figure;
subplot(4,1,1);
plot(t,x(:,1),t,x(:,2),t,x(:,3)); grid
title('f(t)=I1 I2 I3');

subplot(4,1,2);
plot(t,x(:,1)+x(:,2)+x(:,3));grid
title('f(t)=I1+I2+I3');

subplot(4,1,3);
plot(x(:,5),x(:,1),x(:,5),x(:,2),x(:,5),x(:,3));grid
title('f(\theta)=I1 I2 I3');
%% FI OMEGA TE
f2=figure;
subplot(7,1,1); 
plot(t,x(:,5));grid
title('f(t)=\theta');

subplot(7,1,2);
plot(t,x(:,4));grid
title('f(t)=\omega [rad/s]');

subplot(7,1,3);
plot(t,n); grid
title('f(t)=n [RPM]');

subplot(7,1,4);
plot(t,Te); grid
title('f(t)=Te')


subplot(7,1,5);
plot(x(:,5),x(:,4));grid
title('f(\theta)=\omega');

subplot(7,1,6);
plot(x(:,5),Te);grid
title('f(\theta)=Te');

subplot(7,1,7);
plot(n,Te);grid
title('f(n)=Te');
%% U1S U2S U3S 
f3=figure;
subplot(2,1,1); 
plot(t,u1s,t,u2s,t,u3s); grid
title('f(t)=u1s u2s u3s');

subplot(2,1,2); 
plot(t,u1s+u2s+u3s); grid
title('f(t)=u1s+u2s+u3s');
%% E1 E2 E3 NAPIECIA INDUKOWANE
f4=figure;
subplot(2,1,1); 
plot(t,e1s,t,e2s,t,e3s);grid
title('f(t)=e1 e2 e3');

subplot(2,1,2); 
plot(t,eplus);grid
title('f(t)=e1+e2+e3');
%% Un0 U1 U2 U3 
f5=figure ;
subplot(3,1,1);
plot(t,un0);grid
title('f(t)=Un0');

subplot(3,1,2);
plot(t,u1,t,u2,t,u3);grid
title('f(t)=U1 U2 U3');

subplot(3,1,3);
plot(t,u1+u2+u3);grid
title('f(t)=U1+U2+U3');

%% FFT  
 
f6=figure;
tmax; % okno.czas 
fs=1/tprob;    %f probk. 
tprob; %dt czas probk.
% nf=tmax/tprob; %ilosc probek
nf=3000;
%% FFt I 
subplot(4,1,1);
ARG=x(1094:2544,1); %element użyty do obliczenia jego DFT
y1=fft(ARG,nf);
py1 = sqrt(y1.*conj(y1))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py1(2:nf2) = 2*py1(2:nf2);
py1(nf2+2:nf) = [];
bar(f,py1);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py1) ]);
title('FFT I1')

subplot(4,1,2);
ARG=x(1094:2544,2); %element użyty do obliczenia jego DFT
y2=fft(ARG,nf);
py2 = sqrt(y2.*conj(y2))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py2(2:nf2) = 2*py2(2:nf2);
py2(nf2+2:nf) = [];
bar(f,py2);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py2) ]);
title('FFT I2');

subplot(4,1,3);
ARG=x(1094:2544,2); %element użyty do obliczenia jego DFT
y3=fft(ARG,nf);
py3 = sqrt(y3.*conj(y3))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py3(2:nf2) = 2*py3(2:nf2);
py3(nf2+2:nf) = [];
bar(f,py3);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py3) ]);
title('FFT I3');

subplot(4,1,4);
ARG=x(1094:2544,1),x(1094:2544,2),x(1094:2544,3); %element użyty do obliczenia jego DFT
y4=fft(ARG,nf);
py4 = sqrt(y4.*conj(y4))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py4(2:nf2) = 2*py4(2:nf2);
py4(nf2+2:nf) = [];
bar(f,py4);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py4) ]);
title('FFT I1 I2 I3');

%% FFT U 
f7=figure;
subplot(4,1,1);
ARG=u1(1,1160:2329); %element użyty do obliczenia jego DFT
y5=fft(ARG,nf);
py5 = sqrt(y5.*conj(y5))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py5(2:nf2) = 2*py5(2:nf2);
py5(nf2+2:nf) = [];
bar(f,py5);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py5) ]);
title('FFT U1')

subplot(4,1,2);
ARG=u2(1,1160:2329); %element użyty do obliczenia jego DFT
y6=fft(ARG,nf);
py6 = sqrt(y6.*conj(y6))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py6(2:nf2) = 2*py6(2:nf2);
py6(nf2+2:nf) = [];
bar(f,py6);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py6) ]);
title('FFT U2');

subplot(4,1,3);
ARG=u3(1,1160:2329); %element użyty do obliczenia jego DFT
y7=fft(ARG,nf);
py7 = sqrt(y7.*conj(y7))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py7(2:nf2) = 2*py7(2:nf2);
py7(nf2+2:nf) = [];
bar(f,py7);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py7) ]);
title('FFT U3');

subplot(4,1,4);
ARG=u1(1,1160:2329),u2(1,1160:2329),u3(1,1160:2329); %element użyty do obliczenia jego DFT
y8=fft(ARG,nf);
py8 = sqrt(y8.*conj(y8))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py8(2:nf2) = 2*py8(2:nf2);
py8(nf2+2:nf) = [];
bar(f,py8);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py8) ]);
title('FFT U1 U2 U3');
%% FFT Te
f8=figure;

subplot(1,1,1);
ARG=Te(1,1151:2380); %element użyty do obliczenia jego DFT
y9=fft(ARG,nf);
py9 = sqrt(y9.*conj(y9))/nf; %sprzezo
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py9(2:nf2) = 2*py9(2:nf2);
py9(nf2+2:nf) = [];
bar(f,py9);grid
ylabel('Amplituda'); xlabel('Frequency HZ');
axis([0 500,0 max(py9) ]);
title('FFT Te')


clc;clear;

global Udc R L M Ke KT Thetaon J D TL pre us tmax

Udc=30;     R=0.027;    L=0.000386;     M=0.0000386; Ke=0.0277; 
KT=0.0282;  Thetaon=0;  J=0.0012;       D=0.0001;    TL=0.0001; 

tprob=0.0001;
tmax=10;
t0=[0:tprob:tmax];

x0=[0 0 0 0 0];

[t,x]=ode45('BLDC1_funtroj',t0, x0);

for k=1:max(size(t));


if k>0 && k<=10000;
    
    

Udc=30;
u1(k)=ustojana1t(x(k,5),Thetaon);
u2(k)=ustojana2t(x(k,5),Thetaon);
u3(k)=ustojana3t(x(k,5),Thetaon);
u1s(k)=(Udc)*u1(k);
u2s(k)=(Udc)*u2(k);
u3s(k)=(Udc)*u3(k);

    e1(k)=eindu1t(x(k,5));
    e2(k)=eindu2t(x(k,5));
    e3(k)=eindu3t(x(k,5));
    e1s(k)=(x(k,4)*Ke)*e1(k);
    e2s(k)=(x(k,4)*Ke)*e2(k);
    e3s(k)=(x(k,4)*Ke)*e3(k);
    
    Te(k)=KT*(e1(k)*x(k,1))    +    KT*(e2(k)*x(k,2))   +   KT*(e3(k)*x(k,3));
 
        I1(k)=x(k,1);
        I2(k)=x(k,2);
        I3(k)=x(k,3);
        
        Ia(k)=I1(k)-I3(k);
        Ib(k)=-I1(k)+I2(k);
        Ic(k)=-I2(k)+I3(k);
    
else if k>10000 && k<=80000;
        
    Udc=0;
u1(k)=ustojana1t(x(k,5),Thetaon);
u2(k)=ustojana2t(x(k,5),Thetaon);
u3(k)=ustojana3t(x(k,5),Thetaon);
u1s(k)=(Udc)*u1(k);
u2s(k)=(Udc)*u2(k);
u3s(k)=(Udc)*u3(k);

    e1(k)=eindu1t(x(k,5));
    e2(k)=eindu2t(x(k,5));
    e3(k)=eindu3t(x(k,5));
    e1s(k)=(x(k,4)*Ke)*e1(k);
    e2s(k)=(x(k,4)*Ke)*e2(k);
    e3s(k)=(x(k,4)*Ke)*e3(k);
    
    Te(k)=KT*(e1(k)*x(k,1))    +    KT*(e2(k)*x(k,2))   +   KT*(e3(k)*x(k,3));
    
        I1(k)=x(k,1);
        I2(k)=x(k,2);
        I3(k)=x(k,3);
        
        Ia(k)=I1(k)-I3(k);
        Ib(k)=-I1(k)+I2(k);
        Ic(k)=-I2(k)+I3(k);
    
    else if k>80000
    
    Udc=30;
u1(k)=ustojana1t(x(k,5),Thetaon);
u2(k)=ustojana2t(x(k,5),Thetaon);
u3(k)=ustojana3t(x(k,5),Thetaon);
u1s(k)=(Udc)*u1(k);
u2s(k)=(Udc)*u2(k);
u3s(k)=(Udc)*u3(k);

    e1(k)=eindu1t(x(k,5));
    e2(k)=eindu2t(x(k,5));
    e3(k)=eindu3t(x(k,5));
    e1s(k)=(x(k,4)*Ke)*e1(k);
    e2s(k)=(x(k,4)*Ke)*e2(k);
    e3s(k)=(x(k,4)*Ke)*e3(k);
    
   I1(k)=x(k,1);
        I2(k)=x(k,2);
        I3(k)=x(k,3);
        
        Ia(k)=I1(k)-I3(k);
        Ib(k)=-I1(k)+I2(k);
        Ic(k)=-I2(k)+I3(k);
        Te(k)=KT*(e1(k)*x(k,1))    +    KT*(e2(k)*x(k,2))   +   KT*(e3(k)*x(k,3));
 end   
    end
end  
    
 
n=9.5493*x(:,4);

end    
%% PRADY I
f1=figure;

subplot(3,1,1);
plot(t,x(:,1),t,x(:,2),t,x(:,3)); grid
title('f(t)=I1 I2 I3');

subplot(3,1,2);
plot(t,x(:,1)+x(:,2)+x(:,3));grid
title('f(t)=I1+I2+I3');

subplot(3,1,3);
plot(t,Ia,t,Ib,t,Ic);grid
title('f(t)=Ia Ib Ic');
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
title('f(t)=u1 u2 u3');

subplot(2,1,2); 
plot(t,u1s+u2s+u3s); grid
title('f(t)=u1+u2+u3');

%% E INDUKOWANE
f4=figure;
subplot(2,1,1); 
plot(t,e1s,t,e2s,t,e3s);grid
title('f(t)=e1 e2 e3');

subplot(2,1,2); 
plot(t,e1s+e2s+e3s);grid
title('f(t)=e1+e2+e3');
%% Un0 U1 U2 U3 
% %% FFT
% f6=figure;
% tmax; % okno.czas 
% fs=1/tprob;    %f probk. 
% tprob; %dt czas probk.
% %nf=tmax/tprob; %ilosc probek
% nf=2000;
% 
% 
% subplot(2,1,1);
% ARG=x(:,1); %element użyty do obliczenia jego DFT
% y1=fft(ARG,nf);
% py1 = sqrt(y1.*conj(y1))/nf; %sprzezo
% nf2 = nf/2;
% f = (0:nf2)*fs/nf;
% py1(2:nf2) = 2*py1(2:nf2);
% py1(nf2+2:nf) = [];
% bar(f,py1);grid
% ylabel('Amplituda'); xlabel('Frequency HZ');
% axis([0 length(f),0 max(py1) ]);
% title('FFT I1')
% 
% subplot(2,1,2);
% ARG=Te; %element użyty do obliczenia jego DFT
% y2=fft(ARG,nf);
% py2 = sqrt(y2.*conj(y2))/nf; %sprzezo
% nf2 = nf/2;
% f = (0:nf2)*fs/nf;
% py2(2:nf2) = 2*py2(2:nf2);
% py2(nf2+2:nf) = [];
% bar(f,py2);grid
% ylabel('Amplituda'); xlabel('Frequency HZ');
% axis([0 length(f),0 max(py2) ]);
% title('FFT Te');


function xprime=BLDC1_funtroj(t,x);

global Udc R L M Ke KT Thetaon J D TL  pre us

 I=[x(1:3)]; %prady 1 2 3 
 pre=[x(4)]; %predkosc omega
 teta=[x(5)]; %kat fi lub theta
 
R1=[ R 0 0
    0 R 0
    0 0 R ];
L1=[ L    M   M
     M    L   M
     M    M   L];

e1=eindu1t(teta);
e2=eindu2t(teta);
e3=eindu3t(teta);

e1s=(pre*Ke)*e1;
e2s=(pre*Ke)*e2;
e3s=(pre*Ke)*e3;
e=        [ e1s
            e2s
            e3s ];

u1=ustojana1t(teta,Thetaon);
u2=ustojana2t(teta,Thetaon);
u3=ustojana3t(teta,Thetaon);
u1s=Udc*u1;
u2s=Udc*u2;
u3s=Udc*u3;
us=    [   u1s
           u2s
           u3s  ]; 

U=us;

Te=KT*(e1*I(1))      +      KT*(e2*I(2))    +       KT*(e3*I(3));    %Te elektromage

xprime= [ L1^-1*(U-(R1*I)-e)                        %I 1:3
          (1/J) *(Te-D*pre-TL)                      %pre.dkosc 4 
          pre];                                     %the.ta 5 
         
end

 
                           
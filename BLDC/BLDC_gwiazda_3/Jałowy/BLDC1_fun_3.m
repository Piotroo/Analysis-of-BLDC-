function xprime=BLDC1_fun_3(t,x);

global Udc R L M Ke KT Thetaon J D TL L1 pre us

I=[x(1:2)]; %prady 1 2 3 
pre=[x(3)]; %predkosc omega
teta=[x(4)]; %kat fi lub theta

R1=[ 2*R 0  
     0  2*R ];
 
L2=[ 2*(L-M)    0       
      0     2*(L-M)  ];

e1=eindu1(teta);
e2=eindu2(teta);
e3=eindu3(teta);
e1s=(pre*Ke)*e1;
e2s=(pre*Ke)*e2;
e3s=(pre*Ke)*e3;

e=[ e1s-e3s
    e2s-e3s];
            
u1=ustojana1(teta,Thetaon);
u2=ustojana2(teta,Thetaon);
u3=ustojana3(teta,Thetaon);
u1s=(Udc/2)*u1;
u2s=(Udc/2)*u2;
u3s=(Udc/2)*u3;

U=[u1s-u3s
   u2s-u3s];

I1=[    1    0
        0    1
       -1   -1]*[   x(1)
                    x(2)];

              
Te=KT*(e1*I1(1))+   KT*(e2*I1(2))    +   KT*(e3*I1(3));

xprime= [ L2^-1*(U-(R1*I)-e)              %I 1:2
          (1/J) *(Te-D*pre-TL)                  %pre.dkosc 3 
          pre];                                 %the.ta 4 
         
end

 
                           
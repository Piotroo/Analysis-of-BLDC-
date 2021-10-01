function xprime=BLDC1_fun_2(t,x);

global Udc R L M Ke KT Thetaon J D TL L1 pre us

I=[x(1:3)]; %prady 1 2 3 
pre=[x(4)]; %predkosc omega
teta=[x(5)]; %kat fi lub theta

R1=[ 2*R 0  0
     0  2*R 0
     0  0  2*R ];
 
L1=[ 2*(L-M)    0       0
      0     2*(L-M)     0
      0     0       2*(L-M)];

e1s=eindu1(teta);
e2s=eindu2(teta);
e3s=eindu3(teta);
e=(pre*Ke)*[e1s; 
            e2s;
            e3s];
        
e_minus=[   e(1)-e(2)
            e(2)-e(3)
            e(3)-e(1) ];

            
u1=ustojana1(teta,Thetaon);
u2=ustojana2(teta,Thetaon);
u3=ustojana3(teta,Thetaon);

u1s=(Udc/2)*u1;
u2s=(Udc/2)*u2;
u3s=(Udc/2)*u3;

         
U=[  u1s-u2s
     u2s-u3s
     u3s-u1s];
 
Te=KT*((e1s*I(1))   +   KT*(e2s*I(2))   +   KT*(e3s*I(3)));

xprime= [ L1^-1*(U-(R1*I)-e_minus)               %I 1:3
          (1/J) *(Te-D*pre-TL)                  %pre.dkosc 4 
          pre];                                 %the.ta 5 
         
end

 
                           
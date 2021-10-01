function xprime=BLDC1_fun(t,x);
  
global Udc R L M Ke KT Thetaon J D TL  pre us 

I=[x(1:3)];           %prady 1 2 3 
pre=[x(4)];           %predkosc kątowa omega
teta=[x(5)];          %kat fi lub theta
 
R1=[ R 0 0
    0 R 0
    0 0 R ];
L1=[ L-M    0       0
      0     L-M     0
      0     0       L-M];

e1s=eindu1(teta);
e2s=eindu2(teta);
e3s=eindu3(teta);
e=(pre*Ke)*[e1s;
            e2s;
            e3s];
       
u1=ustojana1(teta,Thetaon);
u2=ustojana2(teta,Thetaon);
u3=ustojana3(teta,Thetaon);
us=(Udc/2)*[u1;
            u2;
            u3]; 
      
un0=(1/3)*((us(1)-e(1))+(us(2)-e(2))+(us(3)-e(3)));
Un0=[un0
     un0
     un0];
 
U=us-Un0;

Te=KT*(e1s*I(1))      +      KT*(e2s*I(2))    +       KT*(e3s*I(3));

xprime= [ L1^-1*(U-(R1*I)-e)                    %I 1:3
          (1/J) *(Te-D*pre-TL)                  %pre.dkosc 4 
          pre];                                 %the.ta 5 

end




 
                         
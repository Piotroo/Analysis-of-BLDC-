function u1s = ustojana1t(teta,Thetaon);
%u1s
u1s=1;
teta1=mod(teta-Thetaon,2*pi);
if teta1 >= 0 && teta1 < pi/6
    u1s = 0.5;
else
    if teta1 >= pi/6 && teta1 < pi/2
        u1s = 1;
    else 
        if teta1 >= pi/2 && teta1 < 5/6*pi
            u1s =0.5;
        else 
            if teta1 >= 5/6*pi && teta1 < 7/6*pi
                u1s = -0.5;
            else
                if teta1 >= 7/6*pi && teta1 < 3/2*pi
                    u1s = -1;
                else
                    if teta1 >= 3/2*pi && teta1< 11/6*pi
                        u1s=-0.5;
                    else
                        if teta 1>= 11/6*pi && teta1< 2*pi
                            u1s=0.5;
                        end
                    end
                end
            end
        end
    end
end
end


      
         
         
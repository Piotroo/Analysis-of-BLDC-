function u3s=ustojana3t(teta,Tetaon);
%u3s
u3s=1;
teta3=mod(teta-(4/3*pi)-Tetaon,2*pi);
if teta3 >= 0 && teta3 < pi/6
    u3s = 0.5;
else
    if teta3 >= pi/6 && teta3 < pi/2
        u3s = 1;
    else 
        if teta3 >= pi/2 && teta3 < 5/6*pi
            u3s =0.5;
        else 
            if teta3 >= 5/6*pi && teta3 < 7/6*pi
                u3s = -0.5;
            else
                if teta3 >= 7/6*pi && teta3 < 3/2*pi
                    u3s = -1;
                else
                    if teta3 >= 3/2*pi && teta3 < 11/6*pi
                        u3s=-0.5;
                    else
                        if teta3 >= 11/6*pi && teta3 < 2*pi
                            u3s=0.5;
                        end
                    end
                end
            end
        end
    end
end
end
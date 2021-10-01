function u2s= ustojana2t(teta,Tetaon);
%u2s
u2s=1;
teta2=mod(teta-(2/3*pi)-Tetaon,2*pi);
if teta2 >= 0 && teta2 < pi/6
    u2s = 0.5;
else
    if teta2 >= pi/6 && teta2 < pi/2
        u2s = 1;
    else 
        if teta2 >= pi/2 && teta2 < 5/6*pi
            u2s =0.5;
        else 
            if teta2 >= 5/6*pi && teta2 < 7/6*pi
                u2s = -0.5;
            else
                if teta2 >= 7/6*pi && teta2 < 3/2*pi
                    u2s = -1;
                else
                    if teta2 >= 3/2*pi && teta2< 11/6*pi
                        u2s=-0.5;
                    else
                        if teta2 >= 11/6*pi && teta2< 2*pi
                            u2s=0.5;
                        end
                    end
                end
            end
        end
    end
end
end
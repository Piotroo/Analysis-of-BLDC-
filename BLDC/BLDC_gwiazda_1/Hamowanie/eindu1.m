function e1s = eindu1(teta);
%e1
e1s=1;
teta1=mod(teta,2*pi);
if teta1 >= 0 && teta1 < pi/6
    e1s = (6/pi)*teta1;
else
    if teta1 >= pi/6 && teta1 < 5/6*pi
        e1s = 1;
    else 
        if teta1 >= 5/6*pi && teta1 < 7/6*pi
            e1s = (-(6/pi)*teta1)+6;
        else 
            if teta1 >= 7/6*pi && teta1 < 11/6*pi
                e1s = -1;
            else
                if teta1 >= 11/6*pi && teta1 < 2*pi
                    e1s = (6/pi)*teta1-12;
                end
            end
        end
    end
    
end
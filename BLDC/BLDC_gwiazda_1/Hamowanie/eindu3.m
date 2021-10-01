function e3s=eindu3(teta);
%e3
teta3=mod(teta-(4/3*pi),2*pi);
if teta3 >= 0 && teta3 < pi/6
    e3s = (6/pi)*teta3;
else
    if teta3 >= pi/6 && teta3 < 5/6*pi
        e3s = 1;
    else 
        if teta3 >= 5/6*pi && teta3 < 7/6*pi
            e3s = (-(6/pi)*teta3)+6;
        else 
            if teta3 >= 7/6*pi && teta3 < 11/6*pi
                e3s = -1;
            else
                if teta3 >= 11/6*pi && teta3 < 2*pi
                    e3s = (6/pi)*teta3-12;
                end
            end
        end
    end
end
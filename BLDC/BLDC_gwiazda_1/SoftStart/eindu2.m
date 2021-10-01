function e2s=eindu2(teta);
%e2
teta2=mod(teta-(2/3*pi),2*pi);
if teta2 >= 0 && teta2 < pi/6
    e2s = (6/pi)*teta2;
else
    if teta2 >= pi/6 && teta2 < 5/6*pi
        e2s = 1;
    else 
        if teta2 >= 5/6*pi && teta2 < 7/6*pi
            e2s = (-(6/pi)*teta2)+6;
        else 
            if teta2 >= 7/6*pi && teta2 < 11/6*pi
                e2s = -1;
            else
                if teta2 >= 11/6*pi && teta2 < 2*pi
                    e2s = (6/pi)*teta2-12;
                end
            end
        end
    end
end
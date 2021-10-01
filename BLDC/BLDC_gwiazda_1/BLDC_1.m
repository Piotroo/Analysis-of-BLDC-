choice = menu('BLDC_wariant 1','Stan jałowy','Hamowanie i zmiana napięcia','SoftStart','Zmiana TL');
switch choice
    case 1
        run('Jałowy/BLDC1_gwiazda.m')
    case 2
        run('Hamowanie/BLDC1_gwiazda.m')
    case 3 
        run('SoftStart/BLDC1_gwiazda.m')
    case 4
        run ('Zmiana TL/BLDC1_gwiazda.m')
end
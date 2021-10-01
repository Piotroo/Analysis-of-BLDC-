choice = menu('BLDC_wariant 4','Stan jałowy','Hamowanie i zmiana napiecia');
switch choice
    case 1
        run('Jałowy/BLDC1_troj.m')
    case 2 
        run('Hamowanie/BLDC1_troj.m')
end
function [nuIT1, nuIT2] = Devoir4(vT1, vT2)
% DEVOIR4  Calcule la fréquence et l'intensité du son détecté par deux objects en mouvement

    %%%%%%%%%%
    %%% 1 etape: On calcul la direction de propagation du signal
    %%% u_1 est la direction du signal tel que recu par le recepteur 1
    %%% (emit par le train 2). Formule page 60, ch07.
    %%%%%%%%%%
        
    %%%%%%%%%%
    %%% 2 etape: On veut calculer v_1, la frequence de l'onde dans le
    %%% selon le recepteur 1. Formule par 61, ch07.
    %%%%%%%%%%
    
    %%%%%%%%%%
    %%% 3 etape: On calcule l'intensite du son en se servant de la formule
    %%% fournie dans l'enonce
    %%%%%%%%%%
        
t = 0;

% calcul des vitesses vectorielles
u1 = [1 0;];
u2 = -1/sqrt(2) * [1 1;];

vt_1 = vT1 * u1 * 0.2778;
vt_2 = vT2 * u2 * 0.2778;

% Position du train 1 au temps 0
r_1 = [0 0;];

% Position du train 2 au temps 0
r_2 = [3000 2000;];

while t <= 101
    t = t + 1;
    %deltat = 0;
    nuIT1(t,:) = [0 0;];
    nuIT2(t,:) = [0 0;];
    
    %while t - deltat > 0 && nuIT1(t,1) == 0 && t - deltat < 80
    deltat = getSoundInfo2(vt_1(1), vt_2(1), vt_2(2), t);
    if t-ceil(deltat) > 0  && t - deltat < 80
        nuIT1(t,:) = getSoundInfo(r_1, r_2, t, deltat, vt_1, vt_2, 170);
        %deltat = deltat + 1;
    end
    
    deltat = getSoundInfo2(vt_2(1), vt_1(1), vt_1(2), t);
    if t-ceil(deltat) > 0  && t - deltat < 80
        nuIT2(t,:) = getSoundInfo(r_2, r_1, t, deltat, vt_2, vt_1, 120);
        %deltat = deltat + 1;
    end
    
    %while t - deltat > 0 && nuIT2(t,1) == 0 && t - deltat < 80
    %    nuIT2(t,:) = getSoundInfo(r_2, r_1, t, deltat, vt_2, vt_1, 120);
    %    deltat = deltat + 1;
    %end
    
    %%%%%%%%%%
    %%% 4 etape: On fait avancer les trains
    %%%%%%%%%%
    r_1(t+1,:) = r_1(t,:) + vt_1;
    r_2(t+1,:) = r_2(t,:) + vt_2;
    
end
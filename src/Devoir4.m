function [nuIT1, nuIT2] = Devoir4(vT1, vT2)
% DEVOIR4  Calcule la fréquence et l'intensité du son détecté par deux objects en mouvement
h = 10;
t = 0;
c_son = (331.3 + 0.606 * h);

% calcul des vitesses vectorielles
u1 = [1 0;];
u2 = -1/sqrt(2) * [1 1;];

vt_1 = vT1 * u1 * 0.2778;
vt_2 = vT2 * u2 * 0.2778;

% frequence des sont dans le referentiel des emetteurs (Hz)
vs1 = 120;
vs2 = 170;

% Position du train 1 au temps 0
r_1 = [0 0;];

% Position du train 2 au temps 0
r_2 = [3000 2000;];

while t <= 101
    t = t + 1;
    
    % distance entre les deux trains a l'emission du son
    d = abs(r_1(t,:)-r_2(t,:));
    
    %%%%%%%%%%
    %%% 1 etape: On calcul la direction de propagation du signal
    %%% u_1 est la direction du signal tel que recu par le recepteur 1
    %%% (emit par le train 2). Formule page 60, ch07.
    %%%%%%%%%%
    
    % recepteur 1
    u_1 = (r_1(t,:)-r_2(t,:))/norm(r_1(t,:)-r_2(t,:))
    
    % recepteur 2
    u_2 = (r_2(t,:)-r_1(t,:))/norm(r_2(t,:)-r_1(t,:));
    
    
    %%%%%%%%%%
    %%% 2 etape: On veut calculer v_1, la frequence de l'onde dans le
    %%% selon le recepteur 1. Formule par 61, ch07.
    %%%%%%%%%%
    
    % recepteur 1
    b_r1 = dot(vt_1, u_1) / c_son;
    b_s1 = dot(vt_2, u_1) / c_son;
    nuIT1(t,1) = (1-b_r1)/(1-b_s1) * vs2
    
    % recepteur 2
    b_r2 = dot(vt_2, u_2) / c_son;
    b_s2 = dot(vt_1, u_2) / c_son;
    nuIT2(t,1) = (1-b_r2)/(1-b_s2) * vs1
    
    
    %%%%%%%%%%
    %%% 3 etape: On calcule l'intensite du son en se servant de la formule
    %%% fournie dans l'enonce
    %%%%%%%%%%
    
    
    %%%%%%%%%%
    %%% 4 etape: On fait avancer les trains
    %%%%%%%%%%
    r_1(t+1,:) = r_1(t,:) + vt_1;
    r_2(t+1,:) = r_2(t,:) + vt_2;
    
end
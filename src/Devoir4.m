function [nuIT1, nuIT2] = Devoir4(vT1, vT2)
% DEVOIR4  Calcule la fréquence et l'intensité du son détecté par deux objects en mouvement
h = 10;
c_son = (331.3 + 0.606 * h)

t = 1;

% Position du train 1 au temps 0
r_1 = [0 0;];
% Position du train 2 au temps 0
r_1 = [3000 2000;];

while t <= 101
    % recepteur 1
    u_1 = (r_1(t)-r_2(t))/norm(r_1(t)-r_2(t))
end
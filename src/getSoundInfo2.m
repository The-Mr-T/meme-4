function [ nuI ] = getSoundInfo2( vt1x, vt2x, vt2y, t)
    % Calcul de la vitesse du son
    h = 10;
    c_son = (331.3 + 0.606 * h);
    nuI = [0 0;];
    
    % Calcul de la position du train 1 le long de l'axe des x
    val = vt1x * t;
    pos_t1 = [val;  0];
    % Calcul de la position du train 2 le long de 1/sqrt(2)xy
    pos_t2 = [vt2x * t * -1/sqrt(2) + 3000; vt2y * t * -1/sqrt(2) + 2000];
    
    %Calculs des vecteurs va et vb
    va = [-1/sqrt(2); -1/sqrt(2)];
    vb = [pos_t2(1) - pos_t1(1); pos_t2(2) - pos_t1(2)];
    
    segment_b = norm(vb);
    
    vb = vb/norm(vb); % Vecteur unitaire
    
    % Calcul de l'angle entre a et b
    %angle = atan2(norm(cross(va',vb')), dot(va',vb'))
    angle = acos(dot(va / norm(va), vb / norm(vb)));

    %angle = atan2(norm(cross(va,vb)), dot(va,vb));
    
    vt2 = norm([vt2x;vt2y]);
    
    valpos = ((2*vt2*segment_b*cos(angle)) + (sqrt(((-vt2*segment_b*cos(angle))^2)- 4 * ((vt2^2) - (c_son^2)) * segment_b^2)))/(2 * ((vt2^2)-(c_son^2)))
    valneg = ((2*vt2*segment_b*cos(angle)) - (sqrt(((-vt2*segment_b*cos(angle))^2)- 4 * ((vt2^2) - (c_son^2)) * segment_b^2)))/(2 * ((vt2^2)-(c_son^2)))
    
    nuI = valneg;

end
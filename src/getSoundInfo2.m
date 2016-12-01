% IN:
% vt1x = La vitesse en x du premier train (m/s)
% vt2x = La vitesse en x du deuxieme train (m/s)
% vt2y =  La vitesse en y du deuxieme train (m/s)
% t = le temps présent
% OUT:
% nuI = le delta-t
function deltat = getSoundInfo2(vt2, pos_t1, pos_t2, t)
    % Calcul de la vitesse du son
    h = 10;
    c_son = (331.3 + 0.606 * h);
    
    %Calculs des vecteurs va et vb
    va = [-1/sqrt(2); -1/sqrt(2)];
    vb = [pos_t2(1) - pos_t1(1); pos_t2(2) - pos_t1(2)];
    
    segment_b = norm(vb);
    
    vb = vb/norm(vb); % Vecteur unitaire
    
    % Calcul de l'angle entre a et b
    %angle = atan2(norm(cross(va',vb')), dot(va',vb'))
    angle = acos(dot(va / norm(va), vb / norm(vb)));

    %angle = atan2(norm(cross(va,vb)), dot(va,vb));
    
    vt2_n = norm(vt2);
    
    valpos = (-(2*vt2_n*segment_b*cos(angle)) + (sqrt(((-vt2_n*segment_b*cos(angle))^2)- 4 * ((vt2_n^2) - (c_son^2)) * segment_b^2)))/(2 * ((vt2_n^2)-(c_son^2)));
    valneg = (-(2*vt2_n*segment_b*cos(angle)) - (sqrt(((-vt2_n*segment_b*cos(angle))^2)- 4 * ((vt2_n^2) - (c_son^2)) * segment_b^2)))/(2 * ((vt2_n^2)-(c_son^2)));
    
    deltat = valneg;
    
    if valpos > 0 && valpos < 80
        deltat = valpos;
    end

end

function [ nuI ] = getSoundInfo( r_r, r_s, t, deltat, vt_r, vt_s, vs )
    h = 10;
    c_son = (331.3 + 0.606 * h);
    nuI = [0 0;];
    
    % Distance entre emetteur et recepteur
    r_sr = norm(r_r(t,:)-r_s(t - deltat,:));
    
    % Distance parcourue par le son
    d = c_son * deltat;
    
    % Est-ce que le son s'est rendu?
    if r_sr <= d
        % Direction entre l'emetteur et le recepteur
        u_sr = (r_r(t,:)-r_s(t - deltat,:))/norm(r_r(t,:)-r_s(t - deltat,:))

        b_r = dot(vt_r, u_sr) / c_son
        b_s = dot(vt_s, u_sr) / c_son
        nuI(1) = (1-b_r)/(1-b_s) * vs;
        
        dI = d / 1000 * (0.3 + 0.005 * (nuI(1) - 100));
        nuI(2) = 100 - dI;
    end
end


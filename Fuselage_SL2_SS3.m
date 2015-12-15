function Fuselage_SL2_SS3_out = Fuselage_SL2_SS3(Fuselage_skin_material,L_fuselage,d_fuselage,Mass_payload)
d_internal = d_fuselage - 0.2;   % Width of frame
r_o = d_fuselage/2;
r_i = d_internal/2;
Area_CS = pi * (r_o^2 - r_i^2);

P_internal = 80E03;             % Assuming cabin altitude of 7000 ft
P_payload = (Mass_payload * 9.81)/Area_CS;
P_total = P_internal + P_payload;
P_atm = 12E03;                % Assuming maximum altitude of 50000 ft

delta_P = P_total - P_atm;


t_skin_fuselage = 0.0012;

Sigma_burst = (delta_P * d_fuselage)/(2 * t_skin_fuselage);

if Fuselage_skin_material == 1       % Aluminum alloy
    Ulti_skin = 310E06;              % Ultimate strength
    rho_skin = 2700;                 % Density
    
    while Sigma_burst > Ulti_skin
        t_skin_fuselage = t_skin_fuselage + 0.0001;
        Sigma_burst = (delta_P * d_fuselage)/(2 * t_skin_fuselage);
    end
    
    Volume_skin_fuselage = pi * L_fuselage * t_skin_fuselage *...
                            (d_fuselage - t_skin_fuselage);
    Mass_skin_fuselage = Volume_skin_fuselage * rho_skin;
    Cost_per_kg = 1.8;          
    Cost_skin_fuselage = Cost_per_kg * Mass_skin_fuselage;
    
    
elseif Fuselage_skin_material == 2       % Carbon fiber
    Ulti_skin = 600E06;
    rho_skin = 1900;
    
    while Sigma_burst > Ulti_skin
        t_skin_fuselage = t_skin_fuselage + 0.0001;
        Sigma_burst = (delta_P * d_fuselage)/(2 * t_skin_fuselage);
    end
    
    Volume_skin_fuselage = pi * L_fuselage * t_skin_fuselage *...
                            (d_fuselage - t_skin_fuselage);
    Mass_skin_fuselage = Volume_skin_fuselage * rho_skin;
    Cost_per_kg = 140;          
    Cost_skin_fuselage = Cost_per_kg * Mass_skin_fuselage;
    
    
elseif Fuselage_skin_material == 3       % Titanium alloy
    Ulti_skin = 950E06;
    rho_skin = 4500;
    
    while Sigma_burst > Ulti_skin
        t_skin_fuselage = t_skin_fuselage + 0.0001;
        Sigma_burst = (delta_P * d_fuselage)/(2 * t_skin_fuselage);
    end
    
    Volume_skin_fuselage = pi * L_fuselage * t_skin_fuselage *...
                            (d_fuselage - t_skin_fuselage);
    Mass_skin_fuselage = Volume_skin_fuselage * rho_skin;
    Cost_per_kg = 1800;          
    Cost_skin_fuselage = Cost_per_kg * Mass_skin_fuselage;
end

Fuselage_SL2_SS3_out = [Mass_skin_fuselage Cost_skin_fuselage];
end
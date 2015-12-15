function Fuselage_SL2_SS1_out = Fuselage_SL2_SS1(Frame_material,n_frames,Mass_payload)

t_frame = 0.4;                  % Assumed thickness of each frame
d_fuselage = 3;                 % Assumed initial diameter of fuselage
d_internal = d_fuselage - 0.2;   % Width of frame
r_o = d_fuselage/2;
r_i = d_internal/2;
Area_CS = pi * (r_o^2 - r_i^2);

P_internal = 80E03;             % Assuming cabin altitude of 7000 ft
P_payload = (Mass_payload * 9.81)/Area_CS;
P_total = P_internal + P_payload;
P_individual = P_total/n_frames;

Sigma_radial_max = P_individual;
Sigma_tangent_max = (P_individual * (r_i^2 + r_o^2))/(r_o^2 - r_i^2);

Sigma_mat = [Sigma_radial_max Sigma_tangent_max];
Stress_frame = max(Sigma_mat);

if Frame_material == 1  % Aluminum alloy
    rho_frame = 2700;
    Ulti_frame = 483E06;
    
    while Stress_frame > Ulti_frame
        d_fuselage = d_fuselage - 0.01;
        d_internal = d_fuselage - 0.2;   % Width of frame
        r_o = d_fuselage/2;
        r_i = d_internal/2;

        Sigma_radial_max = P_individual;
        Sigma_tangent_max = (P_individual * (r_i^2 + r_o^2))/(r_o^2 - r_i^2);

        Sigma_mat = [Sigma_radial_max Sigma_tangent_max];
        Stress_frame = max(Sigma_mat);
    end

    Volume_frame = 2*pi*(r_o - r_i)*t_frame;
    Mass_frame = Volume_frame * rho_frame;
    Cost_per_kg = 1.8;
    Cost_frame = Cost_per_kg * Mass_frame;
    
elseif Frame_material == 2  % Carbon fiber
    rho_frame = 1600;
    Ulti_frame = 600E06;
    
    while Stress_frame > Ulti_frame
        d_fuselage = d_fuselage - 0.01;
        d_internal = d_fuselage - 0.2;   % Width of frame
        r_o = d_fuselage/2;
        r_i = d_internal/2;

        Sigma_radial_max = P_individual;
        Sigma_tangent_max = (P_individual * (r_i^2 + r_o^2))/(r_o^2 - r_i^2);

        Sigma_mat = [Sigma_radial_max Sigma_tangent_max];
        Stress_frame = max(Sigma_mat);
    end

    Volume_frame = 2*pi*(r_o - r_i)*t_frame;
    Mass_frame = Volume_frame * rho_frame;
    Cost_per_kg = 140;
    Cost_frame = Cost_per_kg * Mass_frame;
end

Mass_frame = Mass_frame * n_frames;
Cost_frame = Cost_frame * n_frames;

Fuselage_SL2_SS1_out = [Mass_frame Cost_frame d_fuselage];    
end
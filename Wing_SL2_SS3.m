function Wing_SL2_SS3_out = Wing_SL2_SS3(Skin_material,l_wing,l_chord,W_to)
S_wing = l_wing * l_chord;  % Area of wing
n_ribs = 5;
c = 0.05;
a = l_wing/(n_ribs + 1);
rho_aluminum = 2700;
rho_carbon = 1900;
rho_titanium = 4500;
t_skin = 0.0012;
Volume_skin = t_skin * S_wing;

% Calculation of lift
rho_air = 1.125; % Density of air at sea level in kg/m^3
V_to = 120;      % Take off velocity
Cl_to = 1.5;     % Assumed co-efficient of lift at take off
% S_wing = 475;    % Area of the wing
% W_to = 150000;   % Gross take off weight of aircraft
alpha_to = 12;   % Take off angle of attack
L = 0.5*rho_air*(V_to)^2*Cl_to*S_wing;

% Calculation of drag
Cd_to = 0.015;    % Assumed co-efficient of lift at take off

D = 0.5*rho_air*(V_to)^2*Cd_to*S_wing;

% CALCULATE RESULTANT
F_perp = L - W_to;
F_horz = D;
R = sqrt((F_perp)^2 + (F_horz)^2);
R_tensile = R * sind(alpha_to);
A_cross = l_chord * t_skin;


% To calculate the tensile stress on the skin
T_stress = R_tensile/A_cross;


if Skin_material == 1       % Aluminum alloy
    Ulti_skin = 310E06;
    
    while T_stress > Ulti_skin
        t_skin = t_skin + 0.0001;
        A_cross = l_chord * t_skin;
        T_stress = R_tensile/A_cross;
    end  
    
    Mass_skin = Volume_skin * rho_aluminum;
    Cost_per_kg = 1.8;          
    Cost_skin = Cost_per_kg * Mass_skin;
    
    
    
    
elseif Skin_material == 2       % Carbon fiber
    Ulti_skin = 600E06;
    
    while T_stress > Ulti_skin
        t_skin = t_skin + 0.0001;
        A_cross = l_chord * t_skin;
        T_stress = R_tensile/A_cross;
    end  
    
    Mass_skin = Volume_skin * rho_carbon;
    Cost_per_kg = 140;          
    Cost_skin = Cost_per_kg * Mass_skin;
    
    
elseif Skin_material == 3       % Titanium alloy
    Ulti_skin = 950E06;
    
    while T_stress > Ulti_skin
        t_skin = t_skin + 0.0001;
        A_cross = l_chord * t_skin;
        T_stress = R_tensile/A_cross;
    end  
    
    Mass_skin = Volume_skin * rho_titanium;
    Cost_per_kg = 1800;          % Assuming titanium alloy
    Cost_skin = Cost_per_kg * Mass_skin;
    
end
    
Wing_SL2_SS3_out = [Cost_skin];
end
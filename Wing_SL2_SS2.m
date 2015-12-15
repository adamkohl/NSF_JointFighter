function Wing_SL2_SS2_out = Wing_SL2_SS2(l_chord,Rib_material,W_to,l_wing)
S_wing = l_wing * l_chord;
n_ribs = 5;
% Calculation of lift
rho_air = 1.125; % Density of air at sea level in kg/m^3
V_to = 120;      % Take off velocity
Cl_to = 1.5;     % Assumed co-efficient of lift at take off
% S_wing = 475;    % Area of the wing
% W_to = 150000;   % Gross take off weight of aircraft
alpha_to = 12;   % Take off angle of attack
L = 0.5*rho_air*(V_to)^2*Cl_to*S_wing;

% Calculation of drag
Cd_to = 0.015;    % Assumed co-efficient of drag at take off

D = 0.5*rho_air*(V_to)^2*Cd_to*S_wing;

% CALCULATE RESULTANT
F_perp = L - W_to;
F_horz = D;
R = sqrt((F_perp)^2 + (F_horz)^2);

Fvert = R*cosd(alpha_to);
Fhorz = R*sind(alpha_to);

F_individual = Fvert/n_ribs;

F_section = F_individual/3;

Width_rib = 0.04;
Height_rib = 6 * Width_rib;
I = (Width_rib*(Height_rib)^3)/12;    % Moment of inertia of spar
A_rib = Width_rib * Height_rib;  
y = Height_rib/2;
L1 = 0.7;
L2 = 1.7;
a = 2;
b = 3;
Z = I/y;

% Stress on section 1
Sigma_bend_1 = F_section*L1/Z;


% Stress on section 2
Sigma_bend_2 = F_section*a*b/((a+b)*Z);

%Stress on section 3
Sigma_bend_3 = F_section*L2/Z;

% Shear stress
Sigma_shear = F_section/A_rib;

Stress_max = [Sigma_bend_1,Sigma_bend_2,Sigma_bend_3,Sigma_shear];

Stress_max = max(Stress_max);


if Rib_material == 1 % Wood
    rho_rib = 160;
    Ulti_rib = 40E06;
    
    while Stress_max > Ulti_rib  
    Width_rib = Width_rib + 0.001;
    Height_rib = 6 * Width_rib;
    I = (Width_rib*(Height_rib)^3)/12;    % Moment of inertia of spar
    A_rib = Width_rib * Height_rib;  
    y = Height_rib/2;
    L1 = 0.7;
    L2 = 1.7;
    a = 2;
    b = 3;
    Z = I/y;

    % Stress on section 1
    Sigma_bend_1 = F_section*L1/Z;


    % Stress on section 2
    Sigma_bend_2 = F_section*a*b/((a+b)*Z);

    %Stress on section 3
    Sigma_bend_3 = F_section*L2/Z;

    % Shear stress
    Sigma_shear = F_section/A_rib;

    Stress_max = [Sigma_bend_1,Sigma_bend_2,Sigma_bend_3,Sigma_shear];

Stress_max = max(Stress_max);
    end
    
    Volume_rib = l_chord*Width_rib*Height_rib;
    Mass_rib = rho_rib * Volume_rib;
    Cost_rib_per_volume = 400;
    Cost_rib = Cost_rib_per_volume * Volume_rib;
    
    
    
    
elseif Rib_material == 2 % Aluminum
    rho_rib = 2700;
    Ulti_rib = 483E06;
    
    while Stress_max > Ulti_rib  
    Width_rib = Width_rib + 0.001;
    Height_rib = 6 * Width_rib;
    I = (Width_rib*(Height_rib)^3)/12;    % Moment of inertia of spar
    A_rib = Width_rib * Height_rib;  
    y = Height_rib/2;
    L1 = 0.7;
    L2 = 1.7;
    a = 2;
    b = 3;
    Z = I/y;

    % Stress on section 1
    Sigma_bend_1 = F_section*L1/Z;


    % Stress on section 2
    Sigma_bend_2 = F_section*a*b/((a+b)*Z);

    %Stress on section 3
    Sigma_bend_3 = F_section*L2/Z;

    % Shear stress
    Sigma_shear = F_section/A_rib;

    Stress_max = [Sigma_bend_1,Sigma_bend_2,Sigma_bend_3,Sigma_shear];

Stress_max = max(Stress_max);
    end
    
    Volume_rib = l_chord*Width_rib*Height_rib;
    Mass_rib = rho_rib * Volume_rib;
    Cost_rib_per_kg = 1.8;
    Cost_rib = Cost_rib_per_kg * Mass_rib;
    
    
    
    
    
elseif Rib_material == 3 % Composite
    rho_rib = 1600;
    Ulti_rib = 600E06;
    
    while Stress_max > Ulti_rib  
    Width_rib = Width_rib + 0.001;
    Height_rib = 6 * Width_rib;
    I = (Width_rib*(Height_rib)^3)/12;    % Moment of inertia of spar
    A_rib = Width_rib * Height_rib;  
    y = Height_rib/2;
    L1 = 0.7;
    L2 = 1.7;
    a = 2;
    b = 3;
    Z = I/y;

    % Stress on section 1
    Sigma_bend_1 = F_section*L1/Z;


    % Stress on section 2
    Sigma_bend_2 = F_section*a*b/((a+b)*Z);

    %Stress on section 3
    Sigma_bend_3 = F_section*L2/Z;

    % Shear stress
    Sigma_shear = F_section/A_rib;

       Stress_max = [Sigma_bend_1,Sigma_bend_2,Sigma_bend_3,Sigma_shear];

Stress_max = max(Stress_max);
    end
    
    Volume_rib = l_chord*Width_rib*Height_rib;
    Mass_rib = rho_rib * Volume_rib;
    Cost_rib_per_kg = 140;
    Cost_rib = Cost_rib_per_kg * Mass_rib;
end
 
Mass_rib = Mass_rib*n_ribs;
Cost_rib = Cost_rib*n_ribs;
%  Width_rib
%  Height_rib
%  Stress_max
Wing_SL2_SS2_out = [Mass_rib Cost_rib];
end
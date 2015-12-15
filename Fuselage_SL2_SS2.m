function Fuselage_SL2_SS2_out = Fuselage_SL2_SS2(L_fuselage, Longeron_material,n_longerons,M_wing,...
    M_empennage, M_landing_gear,M_engine,Mass_fuel,M_payload)



Mass_long_new = 1000;
Mass_long_old = 100;

i = 0;
while abs(Mass_long_old - Mass_long_new) > 10^-6

i = i+1;

Mass_long_old = Mass_long_new; 

P_fuselage  = (M_wing + M_empennage + M_landing_gear + M_engine + M_payload + Mass_fuel + Mass_long_new)*9.81;
P_longeron = P_fuselage/n_longerons;

Width_long = 0.05;   % Initial guess for width of longeron
I = (Width_long^4)/12;
y = Width_long/2;
Z = I/y;
Area_long = Width_long^2;
A = L_fuselage/6;               % Location of support 1 from the end of the longeron
B = L_fuselage/3;               % Distance between supports 1 and 2

% To calculate bendin moment on each longeron
M1_1 = (P_longeron*A^2)/2;
M2_1 = (P_longeron*B^2)/8;
M3_1 = (P_longeron*A^2)/2;
M = [M1_1 M2_1];
M_bend_long = max(M);
Sigma_bend_long = M_bend_long/Z;


if Longeron_material == 1  % Aluminum alloy
    rho_long = 2700;
    Ulti_long = 483E06;
    
    while Sigma_bend_long > Ulti_long
        Width_long = Width_long + 0.001;
        I = (Width_long^4)/12;
        y = Width_long/2;
        Area_long = Width_long^2;
        Z = I/y;
        A = 2;               % Location of support 1 from the end of the longeron
        B = 7;               % Distance between supports 1 and 2

        % To calculate bendin moment on each longeron
        M1_1 = (P_longeron*A^2)/2;
        M2_1 = (P_longeron*B^2)/8;
        M3_1 = (P_longeron*A^2)/2;
        M = [M1_1 M2_1];
        M_bend_long = max(M);
        Sigma_bend_long = M_bend_long/Z;       
    end
    
    Volume_long = Area_long * L_fuselage;
    Mass_long_new = Volume_long * rho_long * n_longerons;
    Cost_per_kg = 1.8;
    Cost_long = Cost_per_kg * Mass_long_new;

elseif Longeron_material == 2  % Aluminum alloy
    rho_long = 1600;
    Ulti_long = 600E06;
    
    while Sigma_bend_long > Ulti_long
        Width_long = Width_long + 0.001;
        I = (Width_long^4)/12;
        y = Width_long/2;
        Area_long = Width_long^2;
        Z = I/y;
        A = 2;               % Location of support 1 from the end of the longeron
        B = 7;               % Distance between supports 1 and 2

        % To calculate bendin moment on each longeron
        M1_1 = (P_longeron*A^2)/2;
        M2_1 = (P_longeron*B^2)/8;
        M3_1 = (P_longeron*A^2)/2;
        M = [M1_1 M2_1];
        M_bend_long = max(M);
        Sigma_bend_long = M_bend_long/Z;
    end
    
    Volume_long = Area_long * L_fuselage;
    Mass_long_new = Volume_long * rho_long* n_longerons;
    Cost_per_kg = 140;
    Cost_long = Cost_per_kg * Mass_long_new;
    
elseif Longeron_material == 3  % Titanium
    rho_long = 4500;
    Ulti_long = 950E06;
    
    while Sigma_bend_long > Ulti_long
        Width_long = Width_long + 0.001;
        I = (Width_long^4)/12;
        y = Width_long/2;
        Area_long = Width_long^2;
        Z = I/y;
        A = 2;               % Location of support 1 from the end of the longeron
        B = 7;               % Distance between supports 1 and 2

        % To calculate bendin moment on each longeron
        M1_1 = (P_longeron*A^2)/2;
        M2_1 = (P_longeron*B^2)/8;
        M3_1 = (P_longeron*A^2)/2;
        M = [M1_1 M2_1];
        M_bend_long = max(M);
        Sigma_bend_long = M_bend_long/Z;
    end
    
    Volume_long = Area_long * L_fuselage;
    Mass_long_new = Volume_long * rho_long* n_longerons;
    Cost_per_kg = 1800;
    Cost_long = Cost_per_kg * Mass_long_new;
end

end

Fuselage_SL2_SS2_out = [Mass_long_new Cost_long];   
end
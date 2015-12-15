function Wing_SL2_SS1_out = Wing_SL2_SS1(Spar_material,l_wing,W_to,l_chord)
S_wing = l_wing * l_chord;
%% To calculate the resulting stress on the spar
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

% Calculation of resultant force
l = 6;              % Distance between two spars
a1 = 0.26;          % Fractional distance between spar 1 and CG
b1 = 0.5;           % Fractional distance between spar 1 and CP
a2 = 0.73;          % Fractional distance between spar 2 and CG
b2 = 0.5;           % Fractional distance between spar 2 and CP
width_spar = 0.05;  % Initial guess for width of spar
Height_spar = 4 * width_spar;
I = (width_spar*(Height_spar)^3)/12;    % Moment of inertia of spar
A_spar = width_spar * Height_spar;     % Area of C/S of spar
y = Height_spar/2;
Z = I/y;                                % Section modulus

Fperp1 = a2*L - b2*W_to;       % Net force acting vertically
Fpara1 = a2*D;                 % Net force acting horizontally
R1 = sqrt(Fperp1^2 + Fpara1^2);  % Net resultant force on spar 

Fperp2 = a1*L - b1*W_to;       % Net force acting vertically
Fpara2 = a1*D;                 % Net force acting horizontally
R2 = sqrt(Fperp2^2 + Fpara2^2);  % Net resultant force on spar

% Resolving the resultant force along the web spar plane
W1 = R1*cosd(alpha_to);  % Load perpendicular to the plane
W11 = R1*sind(alpha_to);  % Load along the plane

W2 = R2*cosd(alpha_to);  % Load perpendicular to the plane
W22 = R2*sind(alpha_to);  % Load along the plane

A = l_wing/6;      % Location of pin 1 from the end of the spar
B = l_wing/3;      % Distance between pins 1 and 2

%% To calculate stresses on spar 1
% To calculate bending moments
M1_1 = (W1*A^2)/2;
M2_1 = (W1*B^2)/8;
M3_1 = (W1*A^2)/2;
    M1 = [M1_1 M2_1];
    M_bend_1 = max(M1);
    Sigma_bend_1 = M_bend_1/Z;

% To calculate shear forces
U1_1 = W1*A;
V1_1 = (M2_1-M1_1)/B - W1*B/2;
U2_1 = V1_1 + W1*B;
V2_1 = (M3_1-M2_1)/B - W1*B/2;
U3_1 = V2_1 + W1*B;
V3_1 = (0-M3_1)/A - W1*A/2;

% % To calculate shear load for any length of wing
% U1_1_length = U1_1 * l_wing/24;
% V1_1_length = V1_1 * l_wing/24;
% U2_1_length = U2_1 * l_wing/24;
% V2_1_length = V2_1 * l_wing/24;
% U3_1_length = U3_1 * l_wing/24;
% V3_1_length = V3_1 * l_wing/24;

ShearLoad_1 = [U1_1 V1_1 U2_1 V2_1 U3_1 V3_1];
Sigma_shear_1 = max(ShearLoad_1)/A_spar;

% To calculate maximum of the two stresses for spar 1
if Sigma_bend_1>Sigma_shear_1
    Stress1 = Sigma_bend_1;
else
    Stress1 = Sigma_shear_1;
end

%% TO calculate stress on spar 2
% To calculate bending moments
M1_2 = (W2*A^2)/2;
M2_2 = (W2*B^2)/8;
M3_2 = (W2*A^2)/2;
    M2 = [M1_2 M2_2];
    M_bend_2 = max(M1);
    Sigma_bend_2 = M_bend_2/Z;

    
% To calculate shear forces
U1_2 = W2*A;
V1_2 = (M2_2-M1_2)/B - W2*B/2;
U2_2 = V1_2 + W2*B;
V2_2 = (M3_2-M2_2)/B - W2*B/2;
U3_2 = V2_2 + W2*B;
V3_2 = (0-M3_2)/A - W2*A/2;


ShearLoad_2 = [U1_2 V1_2 U2_2 V2_2 U3_2 V3_2];
Sigma_shear_2 = max(ShearLoad_2)/A_spar;

% To calculate maximum of the two stresses for spar 2
if Sigma_bend_2>Sigma_shear_2
    Stress2 = Sigma_bend_2;
else
    Stress2 = Sigma_shear_2;
end

%% To evaluate greater of the stresses on the two spars
if Stress1>Stress2
    Stress_max = Stress1;
else
    Stress_max = Stress2;
end




if Spar_material == 1 % Wood
    rho_spar = 160;
    Ulti_spar = 40E06;
    
    while Stress_max > Ulti_spar
        width_spar = width_spar + 0.001;  % Initial guess for width of spar
        Height_spar = 4 * width_spar;
        I = (width_spar*(Height_spar)^3)/12;    % Moment of inertia of spar
        A_spar = width_spar * Height_spar;     % Area of C/S of spar
        y = Height_spar/2;
        Z = I/y;                                % Section modulus

        Fperp1 = a2*L - b2*W_to;       % Net force acting vertically
        Fpara1 = a2*D;                 % Net force acting horizontally
        R1 = sqrt(Fperp1^2 + Fpara1^2);  % Net resultant force on spar 

        Fperp2 = a1*L - b1*W_to;       % Net force acting vertically
        Fpara2 = a1*D;                 % Net force acting horizontally
        R2 = sqrt(Fperp2^2 + Fpara2^2);  % Net resultant force on spar

        % Resolving the resultant force along the web spar plane
        W1 = R1*cosd(alpha_to);  % Load perpendicular to the plane
        W11 = R1*sind(alpha_to);  % Load along the plane

        W2 = R2*cosd(alpha_to);  % Load perpendicular to the plane
        W22 = R2*sind(alpha_to);  % Load along the plane

        A = l_wing/6;      % Location of pin 1 from the end of the spar
        B = l_wing/3;      % Distance between pins 1 and 2

        %% To calculate stresses on spar 1
        % To calculate bending moments
        M1_1 = (W1*A^2)/2;
        M2_1 = (W1*B^2)/8;
        M3_1 = (W1*A^2)/2;
            M1 = [M1_1 M2_1];
            M_bend_1 = max(M1);
            Sigma_bend_1 = M_bend_1/Z;

        % To calculate shear forces
        U1_1 = W1*A;
        V1_1 = (M2_1-M1_1)/B - W1*B/2;
        U2_1 = V1_1 + W1*B;
        V2_1 = (M3_1-M2_1)/B - W1*B/2;
        U3_1 = V2_1 + W1*B;
        V3_1 = (0-M3_1)/A - W1*A/2;

        % % To calculate shear load for any length of wing
        % U1_1_length = U1_1 * l_wing/24;
        % V1_1_length = V1_1 * l_wing/24;
        % U2_1_length = U2_1 * l_wing/24;
        % V2_1_length = V2_1 * l_wing/24;
        % U3_1_length = U3_1 * l_wing/24;
        % V3_1_length = V3_1 * l_wing/24;

        ShearLoad_1 = [U1_1 V1_1 U2_1 V2_1 U3_1 V3_1];
        Sigma_shear_1 = max(ShearLoad_1)/A_spar;

        % To calculate maximum of the two stresses for spar 1
        if Sigma_bend_1>Sigma_shear_1
            Stress1 = Sigma_bend_1;
        else
            Stress1 = Sigma_shear_1;
        end

        %% TO calculate stress on spar 2
        % To calculate bending moments
        M1_2 = (W2*A^2)/2;
        M2_2 = (W2*B^2)/8;
        M3_2 = (W2*A^2)/2;
            M2 = [M1_2 M2_2];
            M_bend_2 = max(M1);
            Sigma_bend_2 = M_bend_2/Z;

        % To calculate shear forces
        U1_2 = W2*A;
        V1_2 = (M2_2-M1_2)/B - W2*B/2;
        U2_2 = V1_2 + W2*B;
        V2_2 = (M3_2-M2_2)/B - W2*B/2;
        U3_2 = V2_2 + W2*B;
        V3_2 = (0-M3_2)/A - W2*A/2;


        ShearLoad_2 = [U1_2 V1_2 U2_2 V2_2 U3_2 V3_2];
        Sigma_shear_2 = max(ShearLoad_2)/A_spar;

        % To calculate maximum of the two stresses for spar 2
        if Sigma_bend_2>Sigma_shear_2
            Stress2 = Sigma_bend_2;
        else
            Stress2 = Sigma_shear_2;
        end

        %% To evaluate greater of the stresses on the two spars
        if Stress1>Stress2
            Stress_max = Stress1;
        else
            Stress_max = Stress2;
        end
%         Stress_max
    end
    
    Volume_spar = l_wing*width_spar*Height_spar;
    Mass_spar = rho_spar * Volume_spar;
    Cost_spar_per_volume = 400;
    Cost_spar = Cost_spar_per_volume * Volume_spar;

    
    
    
    
    
elseif Spar_material == 2 % Aluminum
    rho_spar = 2700;
    Ulti_spar = 483E06;
    
    while Stress_max > Ulti_spar
        width_spar = width_spar + 0.01;  % Initial guess for width of spar
        Height_spar = 4 * width_spar;
        I = (width_spar*(Height_spar)^3)/12;    % Moment of inertia of spar
        A_spar = width_spar * Height_spar;     % Area of C/S of spar
        y = Height_spar/2;
        Z = I/y;                                % Section modulus

        Fperp1 = a2*L - b2*W_to;       % Net force acting vertically
        Fpara1 = a2*D;                 % Net force acting horizontally
        R1 = sqrt(Fperp1^2 + Fpara1^2);  % Net resultant force on spar 

        Fperp2 = a1*L - b1*W_to;       % Net force acting vertically
        Fpara2 = a1*D;                 % Net force acting horizontally
        R2 = sqrt(Fperp2^2 + Fpara2^2);  % Net resultant force on spar

        % Resolving the resultant force along the web spar plane
        W1 = R1*cosd(alpha_to);  % Load perpendicular to the plane
        W11 = R1*sind(alpha_to);  % Load along the plane

        W2 = R2*cosd(alpha_to);  % Load perpendicular to the plane
        W22 = R2*sind(alpha_to);  % Load along the plane

        A = l_wing/6;      % Location of pin 1 from the end of the spar
        B = l_wing/3;      % Distance between pins 1 and 2

        %% To calculate stresses on spar 1
        % To calculate bending moments
        M1_1 = (W1*A^2)/2;
        M2_1 = (W1*B^2)/8;
        M3_1 = (W1*A^2)/2;
            M1 = [M1_1 M2_1];
            M_bend_1 = max(M1);
            Sigma_bend_1 = M_bend_1/Z;

        % To calculate shear forces
        U1_1 = W1*A;
        V1_1 = (M2_1-M1_1)/B - W1*B/2;
        U2_1 = V1_1 + W1*B;
        V2_1 = (M3_1-M2_1)/B - W1*B/2;
        U3_1 = V2_1 + W1*B;
        V3_1 = (0-M3_1)/A - W1*A/2;

        % % To calculate shear load for any length of wing
        % U1_1_length = U1_1 * l_wing/24;
        % V1_1_length = V1_1 * l_wing/24;
        % U2_1_length = U2_1 * l_wing/24;
        % V2_1_length = V2_1 * l_wing/24;
        % U3_1_length = U3_1 * l_wing/24;
        % V3_1_length = V3_1 * l_wing/24;

        ShearLoad_1 = [U1_1 V1_1 U2_1 V2_1 U3_1 V3_1];
        Sigma_shear_1 = max(ShearLoad_1)/A_spar;

        % To calculate maximum of the two stresses for spar 1
        if Sigma_bend_1>Sigma_shear_1
            Stress1 = Sigma_bend_1;
        else
            Stress1 = Sigma_shear_1;
        end

        %% TO calculate stress on spar 2
        % To calculate bending moments
        M1_2 = (W2*A^2)/2;
        M2_2 = (W2*B^2)/8;
        M3_2 = (W2*A^2)/2;
            M2 = [M1_2 M2_2];
            M_bend_2 = max(M1);
            Sigma_bend_2 = M_bend_2/Z;

        % To calculate shear forces
        U1_2 = W2*A;
        V1_2 = (M2_2-M1_2)/B - W2*B/2;
        U2_2 = V1_2 + W2*B;
        V2_2 = (M3_2-M2_2)/B - W2*B/2;
        U3_2 = V2_2 + W2*B;
        V3_2 = (0-M3_2)/A - W2*A/2;


        ShearLoad_2 = [U1_2 V1_2 U2_2 V2_2 U3_2 V3_2];
        Sigma_shear_2 = max(ShearLoad_2)/A_spar;

        % To calculate maximum of the two stresses for spar 2
        if Sigma_bend_2>Sigma_shear_2
            Stress2 = Sigma_bend_2;
        else
            Stress2 = Sigma_shear_2;
        end

        %% To evaluate greater of the stresses on the two spars
        if Stress1>Stress2
            Stress_max = Stress1;
        else
            Stress_max = Stress2;
        end
    

    end
        Volume_spar = l_wing*width_spar*Height_spar;
    Mass_spar = rho_spar * Volume_spar;
    Cost_spar_per_kg = 140;
    Cost_spar = Cost_spar_per_kg * Mass_spar;
end

% width_spar
% Height_spar

Wing_SL2_SS1_out = [Mass_spar Cost_spar];
end
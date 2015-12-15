function LandingGear_SL1_out = LandingGear_SL1(Type_LG,Mass_return)
W_landing = 0.995 * Mass_return;
F_LG = W_landing * 9.81;
Assembly_cost = 5000;
Cost_per_kg = 8000;
rho_tyre = 720;

if Type_LG == 1 % Bicycle
    n = 2;
    F_per_tyre = F_LG/n;
    d_LG = 0.0163 * F_per_tyre^0.315;
    w_LG = 0.01043 * F_per_tyre^0.315;
    V_tyre = (pi/4) * (d_LG^2 - w_LG^2) * w_LG;
    Mass_tyre = V_tyre * rho_tyre * n/100000;
    Assembly_cost = Assembly_cost * n;
    Cost_manu = Cost_per_kg * Mass_tyre * n;
    Cost_tyre = Assembly_cost + Cost_manu;
    
    
elseif Type_LG == 2 % Tricycle
        n = 3;
        F_per_tyre = F_LG/n;
        d_LG = 1.63 * F_per_tyre^0.315;
        w_LG = 0.1043 * F_per_tyre^0.480;
        V_tyre = (pi/4) * (d_LG^2 - w_LG^2) * w_LG;
        Mass_tyre = V_tyre * rho_tyre * n/100000;
        Assembly_cost = Assembly_cost * n;
        Cost_manu = Cost_per_kg * Mass_tyre * n;
        Cost_tyre = Assembly_cost + Cost_manu;
        
        
elseif Type_LG == 3 % Quadricycle
        n = 4;
        F_per_tyre = F_LG/n;
        d_LG = 1.63 * F_per_tyre^0.315;
        w_LG = 0.1043 * F_per_tyre^0.480;
        V_tyre = (pi/4) * (d_LG^2 - w_LG^2) * w_LG;
        Mass_tyre = V_tyre * rho_tyre * n/100000;
        Assembly_cost = Assembly_cost * n;
        Cost_manu = Cost_per_kg * Mass_tyre * n;
        Cost_tyre = Assembly_cost + Cost_manu;
end
Mass_landinggear = Mass_tyre;
Cost_landinggear = Cost_tyre;

LandingGear_SL1_out = [Mass_landinggear Cost_landinggear];
end
function Engine_SL1_output = Engine_SL1(Type_engine,n_engines,Mass_wing,Mass_fuselage,Mass_landinggear,...
                            Mass_tail, Mass_payload,S_wing)
rho_air = 0.1875;
% V_cruise = 250;
Cl_cruise = 0.3;
% Cd_cruise = 0.007;
% L = 0.5 * rho_air * V_cruise^2 * Cl_cruise * S_wing;
% D = 0.5 * rho_air * V_cruise^2 * Cd_cruise * S_wing;
L_D = 15;
% W_cruise_frac = 0.4;

if Type_engine == 1
    Mass_per_engine = 1451;
    Mass_engine = n_engines * Mass_per_engine; 
    Cost_per_engine = 1200000;
    Cost_engine = n_engines* Cost_per_engine;
    Cost_fuel_per_kg = 1000;
    TSFC = 8.6e-6;
    SFC = 25e-4;
    
    Mass_fuel_old = 1000;
    Mass_fuel_new = 10000;
    j = 0;
    while (abs(Mass_fuel_old - Mass_fuel_new)) > 10^-6
        j = j + 1;
        Mass_fuel_old = Mass_fuel_new;
    W_to =  (Mass_wing + Mass_payload + Mass_fuselage + Mass_landinggear + Mass_tail + Mass_engine + Mass_fuel_new) * 9.81;
     W_cruise_1 = W_to * 0.95545;
    V_cruise_1 = sqrt(2 * W_cruise_1/(rho_air * Cl_cruise * S_wing));
    D_cruise_1 = W_cruise_1/L_D;
    
    Weight_fuel_takeoff = (W_to - W_cruise_1);
    
                Range_1 = (V_cruise_1/SFC) * (W_cruise_1/D_cruise_1) * log(1/W_cruise_frac_new1);

                flight_time_1 = Range_1/V_cruise_1;

                Mass_fuel_cruise_1 = TSFC * flight_time_1 *D_cruise_1;
                W_cruise1_end = W_cruise_1 - Mass_fuel_cruise_1 * 9.81;
                
    Range = 2.05 * Range_1; % Acccounting for return of aircraft
    Mass_fuel_cruise = Mass_fuel_cruise_1 * 2;
    W_cruise2_end  = W_cruise_1 - Mass_fuel_cruise * 9.81 - Mass_payload * 9.81;
      
    W_final = W_cruise2_end * 0.995;
        
    Weight_fuel_landing = W_cruise2_end - W_final;
    Mass_fuel_takeoff = Weight_fuel_takeoff/9.81;
    Mass_fuel_landing = Weight_fuel_landing/9.81;
    
    Mass_fuel_new = Mass_fuel_takeoff  + Mass_fuel_cruise + Mass_fuel_landing ;
    end 
    V_cruise_1;
    Mass_fuel_takeoff;
    Mass_fuel_cruise;
    Mass_fuel_landing;
    Mass_fuel_new;
    W_cruise_frac_new1;
    Cost_fuel = Cost_fuel_per_kg * Mass_fuel_new;
    Cost_engine = Cost_engine + Cost_fuel;

   
     
    
    
    elseif Type_engine == 2
    Mass_per_engine = 1680;
    Mass_engine = n_engines * Mass_per_engine; 
    Cost_per_engine = 1050000;
    Cost_engine = n_engines* Cost_per_engine;
    Cost_fuel_per_kg = 1000;
   TSFC = 9.2e-6;
    SFC = 32e-4;

     Mass_fuel_old = 1000;
    Mass_fuel_new = 10000;
    i = 0;
    while (abs(Mass_fuel_old - Mass_fuel_new)) > 10^-6
        i = i + 1;
        Mass_fuel_old = Mass_fuel_new;
    W_to =  (Mass_wing + Mass_payload + Mass_fuselage + Mass_landinggear + Mass_tail + Mass_engine + Mass_fuel_new) * 9.81;
     W_cruise_1 = W_to * 0.95545;
    V_cruise_1 = sqrt(2 * W_cruise_1/(rho_air * Cl_cruise * S_wing));
    D_cruise_1 = W_cruise_1/L_D;
    
    Weight_fuel_takeoff = (W_to - W_cruise_1);
    
%     W_cruise_frac_old1 = 0.8;
    W_cruise_frac_new1 = 0.6;
%         ii = 0;
%         while abs(W_cruise_frac_old1 - W_cruise_frac_new1) > 10^-6
%                 ii = ii + 1;
%                 W_cruise_frac_old1 = W_cruise_frac_new1;
    
                Range_1 = (V_cruise_1/SFC) * (W_cruise_1/D_cruise_1) * log(1/W_cruise_frac_new1);

                flight_time_1 = Range_1/V_cruise_1;

                Mass_fuel_cruise_1 = TSFC * flight_time_1 * D_cruise_1;
                W_cruise1_end = W_cruise_1 - Mass_fuel_cruise_1 * 9.81;
                
%                 W_cruise_frac_new1 = W_cruise1_end/W_cruise_1;
%         end
    Range = 2.05 * Range_1;
    Mass_fuel_cruise = Mass_fuel_cruise_1 * 2;
    W_cruise2_end  = W_cruise_1 - Mass_fuel_cruise * 9.81 - Mass_payload * 9.81;
      
    W_final = W_cruise2_end * 0.995;
        
    Weight_fuel_landing = W_cruise2_end - W_final;
    
    Mass_fuel_new = Weight_fuel_takeoff/9.81 + Mass_fuel_cruise + Weight_fuel_landing/9.81; 
    end 
    
    Cost_fuel = Cost_fuel_per_kg * Mass_fuel_new;
    Cost_engine = Cost_engine + Cost_fuel;
    
    
   
elseif Type_engine == 3
    Mass_per_engine = 3400;
    Mass_engine = n_engines * Mass_per_engine; 
    Cost_per_engine = 900000;
    Cost_engine = n_engines* Cost_per_engine;
    Cost_fuel_per_kg = 1000;
       TSFC = 10e-6;
    SFC = 36e-4;
    
     Mass_fuel_old = 1000;
    Mass_fuel_new = 10000;
    i = 0;
    while (abs(Mass_fuel_old - Mass_fuel_new)) > 10^-6
        i = i + 1;
        Mass_fuel_old = Mass_fuel_new;
    W_to =  (Mass_wing + Mass_payload + Mass_fuselage + Mass_landinggear + Mass_tail + Mass_engine + Mass_fuel_new) * 9.81;
     W_cruise_1 = W_to * 0.95545;
    V_cruise_1 = sqrt(2 * W_cruise_1/(rho_air * Cl_cruise * S_wing));
    D_cruise_1 = W_cruise_1/L_D;
    
    Weight_fuel_takeoff = (W_to - W_cruise_1);
    
%     W_cruise_frac_old1 = 0.8;
    W_cruise_frac_new1 = 0.6;
%         ii = 0;
%         while abs(W_cruise_frac_old1 - W_cruise_frac_new1) > 10^-6
%                 ii = ii + 1;
%                 W_cruise_frac_old1 = W_cruise_frac_new1;
    
                Range_1 = (V_cruise_1/SFC) * (W_cruise_1/D_cruise_1) * log(1/W_cruise_frac_new1);

                flight_time_1 = Range_1/V_cruise_1;

                Mass_fuel_cruise_1 = TSFC * flight_time_1 * D_cruise_1;
                W_cruise1_end = W_cruise_1 - Mass_fuel_cruise_1 * 9.81;
                
%                 W_cruise_frac_new1 = W_cruise1_end/W_cruise_1;
%         end
    Range = 2.05 * Range_1;
    Mass_fuel_cruise = Mass_fuel_cruise_1 * 2;
    W_cruise2_end  = W_cruise_1 - Mass_fuel_cruise * 9.81 - Mass_payload * 9.81;
      
    W_final = W_cruise2_end * 0.995;
        
    Weight_fuel_landing = W_cruise2_end - W_final;
    
    Mass_fuel_new = Weight_fuel_takeoff/9.81 + Mass_fuel_cruise + Weight_fuel_landing/9.81; 
    end 
    
    Cost_fuel = Cost_fuel_per_kg * Mass_fuel_new;
    Cost_engine = Cost_engine + Cost_fuel;
    
end
% V_cruise_1 = V_cruise_1*0.15;
% Range = Range - 5e6;
Mass_return = W_cruise2_end/9.81;
Mass_fuel_new;
W_to;
% V_cruise_1 = V_cruise_1 - 500
Engine_SL1_output = [Mass_engine Mass_fuel_new Cost_engine Range Mass_return V_cruise_1];  
    
end
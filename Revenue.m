function Aircraft_value = Value_function(N_aircraft,Price_per_aircraft, Type_LG,Tail_material, Type_tail,Wing_type,...
    Spar_material,l_wing,l_chord,Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload)

system_analysis_out = system_analysis(Type_LG,Tail_material, Type_tail,Wing_type,...
    Spar_material,l_wing,l_chord,Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload);
Mass_landinggear = system_analysis_out(1);
Cost_landinggear = system_analysis_out(2);
Mass_tail = system_analysis_out(3);
Cost_tail = system_analysis_out(4);
Mass_wing = system_analysis_out(5);
Cost_wing = system_analysis_out(6);
Mass_spar = system_analysis_out(7);
Cost_spar = system_analysis_out(8);
Mass_rib = system_analysis_out(9);
Cost_rib = system_analysis_out(10);
Cost_skin = system_analysis_out(11);
S_wing = system_analysis_out(12);
Mass_fuselage_new = system_analysis_out(13);
Cost_fuselage = system_analysis_out(14);
Mass_engine_new = system_analysis_out(15);
Mass_fuel_new = system_analysis_out(16);
Cost_engine = system_analysis_out(17);
Range = system_analysis_out(18);
Mass_return_new = system_analysis_out(19);
V_cruise_1 = system_analysis_out(20);
V_cruise_2 = system_analysis_out(21);
Total_mass_initial = system_analysis_out(22);
Total_cost = system_analysis_out(23);

if Range < 2000E03
    Num_sold_range = 0;
    
elseif Range >= 2000E03 && Range <= 12000E03
        Num_sold_range = 0.004 * Range - 8;
        
elseif Range >= 12000E03 && Range <= 25000E03
        Num_sold_range = 0.004615 * Range - 15.38;
        
else Num_sold_range = 100;
    
end


Vel = [V_cruise_1 V_cruise_2];
Velocity = max(Vel);

if Velocity < 50
    Num_sold_vel = 0;
    
elseif Velocity >= 50 && Velocity < 170
        Num_sold_vel = 0.6 * Velocity;
        
elseif Velocity >= 170 && Velocity < 340
        Num_sold_vel = 0.1764 * Velocity + 70;
         
else Num_sold_vel = 100
    
end


Profit = 0.02 * Total_cost;
Price_per_aircraft = Profit + Total_cost;

if Price_per_aircraft > 0 && Price_per_aircraft <= 1020E06
    Num_sold_price = -0.097 * Price_per_aircraft + 100;
    
elseif Price_per_aircraft > 1020E06
    Num_sold_price = 0;
    
end



if Stealth > 0 && Stealth <= 0.3
    Num_sold_stealth = 0.6 * Stealth + 5;
    
elseif Stealth > 0.3 
        Num_sold_stealth = 1.14 * Stealth + 20;
        
end


if Mass_payload <= 5000
    Num_sold_payload = 0;
    
elseif Mass_payload > 5000 && Mass_payload <= 30000
        Num_sold_payload = 0.003 * Mass_payload;
        
end


Num_sold = [Num_sold_range Num_sold_vel Num_sold_price Num_sold_stealth Num_sold_payload];
N_aircraft = min(Num_sold);

Revenue = N_aircraft * Price_per_aircraft;

Aircraft_value = Revenue - Total_cost;
 
    
end


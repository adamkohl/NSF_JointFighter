function Aircraft_value = Value_function_3(x)
Type_LG = x(1);
Tail_material = x(2);
Type_tail = x(3);
Wing_type =x(4);
Spar_material= x(5);
l_wing = x(6);
l_chord = x(7);
Rib_material = x(8);
Skin_material = x(9);
L_fuselage = x(10);
Frame_material = x(11);
n_frames = x(12);
Longeron_material = x(13);
n_longerons = x(14);
Fuselage_skin_material = x(15);
Type_engine = x(16);
n_engines = x(17);
Mass_payload = x(18);



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
% V_cruise_2 = system_analysis_out(21);
Total_mass_initial = system_analysis_out(21);
Total_cost = system_analysis_out(22);
d_fuselage = system_analysis_out(23);
Stealth = 0.5;

Profit = 0.1 * Total_cost;
Price_per_aircraft = Profit + Total_cost;

Velocity = V_cruise_1; 

Mass_payload;
% N_aircraft_sold = 1;



if Range < 2000e03
    N_aircraft_sold = 1;

%% Range cycle 1    
elseif Range >= 2000e03 && Range < 12000e03
    if Mass_payload < 5000 || Velocity < 50 || Price_per_aircraft > 10e09
        N_aircraft_sold = 1;
    end
        
    if Mass_payload >= 5000 && Mass_payload < 12000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 15;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 1.2e-06 * Range - 2.4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 24;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 1.8e-06 * Range - 3.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 30;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.4e-06 * Range - 4.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.2e-06 * Range - 6.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 18;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 1.5e-06 * Range - 3;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 28;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.2e-06 * Range - 6.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.8e-06 * Range - 7.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 2.3e-06 * Range - 4.6;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 1e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.3e-06 * Range - 8.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.7e-06 * Range - 7.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 2.3e-06 * Range - 4.6;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 1e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.3e-06 * Range - 8.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.7e-06 * Range - 7.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
           end
            
        end
                
            
%% Mass of payload cycle 2

    elseif Mass_payload >= 12000 && Mass_payload < 20000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 20;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 1.5e-06 * Range - 3;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 30;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.4e-06 * Range - 4.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 50;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.2e-06 * Range - 8.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 42;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.4e-06 * Range - 6.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 52;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.4e-06 * Range - 8.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.9e-06 * Range - 7.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.5e-06 * Range - 9;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.9e-06 * Range - 7.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.3e-06 * Range - 10.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.7e-06 * Range - 9.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range -10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.5e-06 * Range - 9;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.9e-06 * Range - 7.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.3e-06 * Range - 10.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.7e-06 * Range - 9.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range -10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        end
            
            
            
%% Mass of payload cycle 3

    elseif Mass_payload >= 20000 && Mass_payload < 40000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.8e-06 * Range - 5.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.8e-06 * Range - 7.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 60;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.2e-06 * Range - 10.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.7e-06 * Range - 5.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.4e-06 * Range - 6.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 64;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        end
        
 %% Mass of payload cycle 4
     elseif Mass_payload > 40000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.8e-06 * Range - 5.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.8e-06 * Range - 7.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 60;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.2e-06 * Range - 10.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.7e-06 * Range - 5.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.4e-06 * Range - 6.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 64;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
       elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        end
        
    end
     
    
    
       
%% Range cycle 2

elseif Range >= 12000e03 && Range < 20000e03
    if Mass_payload < 5000 || Velocity < 50 || Price_per_aircraft > 10e09
        N_aircraft_sold = 1;
    end
        
    if Mass_payload >= 5000 && Mass_payload < 12000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 15;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 1.2e-06 * Range - 2.4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 24;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 1.8e-06 * Range - 3.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 30;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.4e-06 * Range - 4.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.2e-06 * Range - 6.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 18;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 1.5e-06 * Range - 3;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 28;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.2e-06 * Range - 6.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.8e-06 * Range - 7.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 2.3e-06 * Range - 4.6;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 1e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.3e-06 * Range - 8.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.7e-06 * Range - 7.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 2.3e-06 * Range - 4.6;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 1e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.3e-06 * Range - 8.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.7e-06 * Range - 7.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
           end
            
        end
                
            
%% Mass of payload cycle 2

    elseif Mass_payload >= 12000 && Mass_payload < 20000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 20;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 1.5e-06 * Range - 3;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 30;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.4e-06 * Range - 4.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 50;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.2e-06 * Range - 8.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 42;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.4e-06 * Range - 6.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3e-06 * Range - 6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 52;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.4e-06 * Range - 8.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.9e-06 * Range - 7.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 7e-07 * Range - 1.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.5e-06 * Range - 9;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.9e-06 * Range - 7.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.3e-06 * Range - 10.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.7e-06 * Range - 9.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range -10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.5e-06 * Range - 9;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.9e-06 * Range - 7.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.8e-06 * Range - 11.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.3e-06 * Range - 10.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.7e-06 * Range - 9.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-06 * Range - 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 2.5e-06 * Range - 5;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range -10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
        end
            
            
            
%% Mass of payload cycle 3

    elseif Mass_payload >= 20000 && Mass_payload < 40000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.8e-06 * Range - 5.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.8e-06 * Range - 7.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 60;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.2e-06 * Range - 10.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.7e-06 * Range - 5.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.4e-06 * Range - 6.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 64;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        end
        
 %% Mass of payload cycle 4
     elseif Mass_payload > 40000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 2e-06 * Range - 4;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.8e-06 * Range - 5.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.8e-06 * Range - 7.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 60;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.2e-06 * Range - 10.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.6e-06 * Range - 9.2;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.6e-06 * Range - 5.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.7e-06 * Range - 5.4;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2e-06 * Range - 4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 2.6e-06 * Range - 5.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 1.9e-06 * Range - 3.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3e-07 * Range - 6e-01;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 3.4e-06 * Range - 6.8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 1.6e-06 * Range - 3.2;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1e-06 * Range - 2;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4e-06 * Range - 8;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 3.4e-06 * Range - 6.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 2.8e-06 * Range - 5.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 1.2e-06 * Range - 2.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.6e-06 * Range - 7.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 2.9e-06 * Range - 5.8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2.1e-06 * Range - 4.2;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 64;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3e-06 * Range - 6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.8e-06 * Range - 3.6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9e-07 * Range - 1.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 5e-07 * Range - 1;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 0.2;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 5e-06 * Range - 10;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 3.8e-06 * Range - 7.6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 3.2e-06 * Range - 6.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 2.2e-06 * Range - 4.4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 1.3e-06 * Range - 2.6;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6e-06 * Range - 12;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 5.4e-06 * Range - 10.8;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 4.8e-06 * Range - 9.6;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 3.3e-06 * Range - 6.6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.5e-06 * Range - 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 6.8e-06 * Range - 13.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 6.2e-06 * Range - 12.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 5.6e-06 * Range - 11.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 5e-06 * Range - 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 4.2e-06 * Range - 8.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 2.7e-06 * Range - 5.4;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 1.7e-06 * Range - 3.4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.1e-06 * Range - 2.2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6e-07 * Range - 1.2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3e-07 * Range - 0.6;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1e-07 * Range - 2e-01;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 7.8e-06 * Range - 15.6;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 7.2e-06 * Range - 14.4;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6.6e-06 * Range - 13.2;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 6e-06 * Range -1.2;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 5.2e-06 * Range - 10.4;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4.4e-06 * Range - 8.8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3.5e-06 * Range - 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 2.4e-06 * Range - 4.8;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 1.4e-06 * Range - 2.8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8e-07 * Range - 1.6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4e-07 * Range - 0.8;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2e-07 * Range - 0.4;
                end
                
            end
            
        end
        
    end

    N_aircraft_sold = N_aircraft_sold * 1.2;

%% Range cycle 3 
elseif Range > 20000e03
    if Mass_payload < 5000 || Velocity < 50 || Price_per_aircraft > 10e09
        N_aircraft_sold = 1;
    end
    
    if Mass_payload >= 5000 && Mass_payload < 12000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 15;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 12;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 7;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
                elseif Stealth >= 0.1 && Stealth < 0.3
                   
                    elseif Price_per_aircraft < 10e06
                        N_aircraft_sold = 24;    

                    elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                        N_aircraft_sold = 18;

                    elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                            N_aircraft_sold = 15;

                    elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                            N_aircraft_sold = 10;

                    elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                            N_aircraft_sold = 6;

                    elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 2e09
                            N_aircraft_sold = 3;

                    elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                            N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 30;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 24;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 10;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 32;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 20;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 18;
                    
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 15;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 14;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 7;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 30;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 25;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 19;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 28;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
            
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 28;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 22;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 32;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 20;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 7;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 38;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 33;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 19;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 36;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 30;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 3;
                           
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 30;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 23;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 1e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 29;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 43;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 37;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 30;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 58;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 46;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 40;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 25;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 7;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 36;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 30;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 23;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 1e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 1e09 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 29;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 43;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 37;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 30;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 58;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 46;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 40;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 25;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 7;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
        
                
            
%% Mass of payload cycle 2

    elseif Mass_payload >= 12000 && Mass_payload < 20000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 20;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 15;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 2e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 30;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 24;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 15;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 30;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 18;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 50;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 42;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 36;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 30;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 16;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 20;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 19;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 13;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 42;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 34;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 22;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 16;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 36;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 38;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 30;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 6;
                        
                        elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 27;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 52;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 44;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 39;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 32;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 7;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 58;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 46;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 40;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 25;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                           
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 45;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 39;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 58;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 53;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 47;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 40;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 25;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 16;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 48;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 45;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 39;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 58;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 53;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 47;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 40;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 25;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 16;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
              
        end
            
            
            
%% Mass of payload cycle 3

    elseif Mass_payload >= 20000 && Mass_payload < 40000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 20;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 28;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 17;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 38;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 60;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 52;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 46;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 27;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 19;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 13;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 34;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 22;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 16;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 36;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 36;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 29;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 13;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 64;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 44;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 38;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 30;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 27;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 38;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 13;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 60;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 54;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 33;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 27;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 78;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 72;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 66;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 60;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 38;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 13;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                        elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 60;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 54;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 33;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 27;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 78;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 72;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 66;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 60;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2;
                end
                
            end
            
        end

%% Mass of payload cycle 4        
   elseif Mass_payload > 40000
        
        if Velocity >= 50 && Velocity < 120
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 26;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 300e06
                    N_aircraft_sold = 20;
                    
                elseif Price_per_aircraft >= 300e06 && Price_per_aircraft < 600e06
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 600e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 2e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 28;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 17;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 38;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 60;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 52;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 46;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 26;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
        
        elseif Velocity >= 120 && Velocity < 170
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 34;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 27;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 20;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 32;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 26;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 19;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 13;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 40;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 34;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 22;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 16;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 36;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.2e09
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 1.2e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 10;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
             
       elseif Velocity >= 170 && Velocity < 272
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 46;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 40;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 34;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 28;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 12;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 56;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 36;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 29;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 21;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 13;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 64;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 44;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 38;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 30;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 4;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 27;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 18;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 9;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 5;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            end
            
            
     elseif Velocity >= 272 && Velocity < 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 38;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 13;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 60;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 54;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 33;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 27;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 78;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 72;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 66;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 60;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2;
                end
                
            end
            
        elseif Velocity > 340
            
            if Stealth >= 0 && Stealth < 0.1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 58;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 50;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 38;
                        
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 32;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 22;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 13;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.1 && Stealth < 0.3
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 68;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 60;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 54;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 48;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 3e09
                        N_aircraft_sold = 33;
                        
                elseif Price_per_aircraft >= 3e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 15;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 2;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.3 && Stealth < 0.7
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 78;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 68;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 62;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 56;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 50;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 42;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 3.5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 3.5e09 && Price_per_aircraft < 4.5e09
                        N_aircraft_sold = 27;
                        
                elseif Price_per_aircraft >= 4.5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 17;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 11;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 6;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 3;
                        
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 1;
                end
                
            elseif Stealth >= 0.7 && Stealth < 1
                
                if Price_per_aircraft < 10e06
                    N_aircraft_sold = 88;
                
                elseif Price_per_aircraft >= 10e06 && Price_per_aircraft < 100e06
                    N_aircraft_sold = 78;
                    
                elseif Price_per_aircraft >= 100e06 && Price_per_aircraft < 400e06
                        N_aircraft_sold = 72;
                        
                elseif Price_per_aircraft >= 400e06 && Price_per_aircraft < 800e06
                        N_aircraft_sold = 66;
                    
                elseif Price_per_aircraft >= 800e06 && Price_per_aircraft < 1.5e09
                        N_aircraft_sold = 60;
                        
                elseif Price_per_aircraft >= 1.5e09 && Price_per_aircraft < 2.5e09
                        N_aircraft_sold = 52;
                        
                elseif Price_per_aircraft >= 2.5e09 && Price_per_aircraft < 4e09
                        N_aircraft_sold = 44;
                        
                elseif Price_per_aircraft >= 4e09 && Price_per_aircraft < 5e09
                        N_aircraft_sold = 35;
                        
                elseif Price_per_aircraft >= 5e09 && Price_per_aircraft < 6e09
                        N_aircraft_sold = 24;
                        
                elseif Price_per_aircraft >= 6e09 && Price_per_aircraft < 7e09
                        N_aircraft_sold = 14;
                        
                elseif Price_per_aircraft >= 7e09 && Price_per_aircraft < 8e09
                        N_aircraft_sold = 8;
                        
                elseif Price_per_aircraft >= 8e09 && Price_per_aircraft < 9e09
                        N_aircraft_sold = 4;
                           
                elseif Price_per_aircraft >= 9e09 && Price_per_aircraft <= 10e09
                        N_aircraft_sold = 2;
                end
                
            end
                          
        end
    end
        
        N_aircraft_sold = N_aircraft_sold * 1.2; 
end
% Price_per_aircraft = Price_per_aircraft * 0.9;
N_aircraft_sold = ceil(N_aircraft_sold);

%% Calculating value
N_aircraft_sold
Range
Mass_payload
Price_per_aircraft
Velocity
Total_cost
Revenue = Price_per_aircraft * N_aircraft_sold;
Total_cost = Total_cost * N_aircraft_sold;
x;

Aircraft_value = -1 * (Revenue - Total_cost)

end
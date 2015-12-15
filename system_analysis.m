function system_analysis_out = system_analysis(Type_LG,Tail_material, Type_tail,Wing_type,...
    Spar_material,l_wing,l_chord,Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload)

i = 0;
Mass_return_old = 100;
Mass_fuselage_old = 100;
Mass_fuel_old = 100;
Mass_engine_old =  100;

Mass_return_new = 1001;
Mass_fuselage_new = 1001;
Mass_fuel_new = 1001;
Mass_engine_new = 1001;
    

while (abs(Mass_return_new - Mass_return_old) >= 10^-6 & ...
      abs(Mass_fuselage_new - Mass_fuselage_old) >= 10^-6 & ...
      abs(Mass_fuel_new - Mass_fuel_old) >= 10^-6 & ...
      abs(Mass_engine_new - Mass_engine_old) >= 10^-6)
  
    i = i+1;
    
    
    Mass_return_old = Mass_return_new;
    Mass_fuselage_old = Mass_fuselage_new;
    Mass_fuel_old = Mass_fuel_new;
    Mass_engine_old = Mass_engine_new;
   
    
LandingGear_SL1_out = LandingGear_SL1(Type_LG,Mass_return_new);
Mass_landinggear = LandingGear_SL1_out(1);
Cost_landinggear = LandingGear_SL1_out(2);


Tail_SL1_out = Tail_SL1(Tail_material,Type_tail);
Mass_tail = Tail_SL1_out(1);
Cost_tail = Tail_SL1_out(2);


Wing_SSL1_out = Wing_SSL1(Wing_type, Spar_material,l_wing,l_chord,...
Rib_material,Skin_material,Mass_fuel_new,Mass_payload,Mass_fuselage_new,...
    Mass_landinggear,Mass_tail,Mass_engine_new);
Mass_wing = Wing_SSL1_out(1);
Cost_wing  = Wing_SSL1_out(2);
Mass_spar  = Wing_SSL1_out(3);
Cost_spar  = Wing_SSL1_out(4);
Mass_rib  = Wing_SSL1_out(5);
Cost_rib  = Wing_SSL1_out(6);
Cost_skin  = Wing_SSL1_out(7);
S_wing = Wing_SSL1_out(8);


Fuselage_SSL1_out = Fuselage_SSL1(L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,...
    Mass_wing, Mass_tail, Mass_landinggear,Mass_engine_new,Mass_fuel_new,Mass_payload);
Mass_fuselage_new = Fuselage_SSL1_out(1);
Cost_fuselage = Fuselage_SSL1_out(2);
d_fuselage = Fuselage_SSL1_out(3);

Engine_SL1_output = Engine_SL1(Type_engine,n_engines,Mass_wing,Mass_fuselage_new,Mass_landinggear,...
                            Mass_tail, Mass_payload,S_wing);
Mass_engine_new = Engine_SL1_output(1);
Mass_fuel_new  = Engine_SL1_output(2);
Cost_engine  = Engine_SL1_output(3);
Range  = Engine_SL1_output(4);
Mass_return_new = Engine_SL1_output(5); 
V_cruise_1 = Engine_SL1_output(6);
                      
end

Total_mass_initial = (Mass_payload + Mass_fuselage_new + Mass_landinggear + Mass_tail + Mass_engine_new + Mass_fuel_new + Mass_wing);
Total_cost = Cost_landinggear + Cost_wing + Cost_fuselage + Cost_engine + Cost_tail;

system_analysis_out = [Mass_landinggear Cost_landinggear Mass_tail Cost_tail ...
          Mass_wing Cost_wing Mass_spar Cost_spar Mass_rib Cost_rib Cost_skin S_wing ...
          Mass_fuselage_new Cost_fuselage Mass_engine_new Mass_fuel_new Cost_engine Range Mass_return_new V_cruise_1 Total_mass_initial Total_cost d_fuselage];

end
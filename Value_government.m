function Value_aircraft_govt = Value_government(x)
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
m = x(19);
y = 5;


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
Stealth = 0.9;
% Range = Range + 5e6;

Profit = 0.1 * Total_cost;
Price_per_aircraft = Profit + Total_cost;

Velocity = V_cruise_1; 
% Velocity = Velocity + 200;

% m = 3;  % No. of operations performed in a campaign
r = 0.07;   % Time discount factor
% y = 5;
P_S = Prob_survive(Stealth, Velocity);
P_E_F_out = Prob_effective(Range, Mass_payload);
P_E_F = P_E_F_out(1);

P_operation_success = P_S * P_E_F;

% s = (P_S/(1 - P_S)) * ((1 - (P_S)^m)/(1 - (P_S)^m * (1 - r)^y));
% 
% Cost_per_operation = Price_per_aircraft/s;
% 
% Cost_per_success = Cost_per_operation/-log(1 - P_operation_success);

Value_aircraft_govt = -(P_operation_success)
% Value_aircraft_govt = Cost_per_success
Range
Mass_payload
Price_per_aircraft
Velocity
Total_cost
end
% Range
% Mass_payload
% Price_per_aircraft
% Velocity
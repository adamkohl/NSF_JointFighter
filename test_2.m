clc;
clear all;
format longEng
% 
Type_LG = 1;
Tail_material = 1;
Type_tail =2;
Wing_type =1;
Spar_material = 2;
l_wing = 20;
l_chord = 12;
Rib_material = 2;
Skin_material = 1;
L_fuselage = 25;
Frame_material = 2;
n_frames = 4;
Longeron_material = 3;
n_longerons = 12;
Fuselage_skin_material = 2;
Type_engine = 2;
n_engines = 2;
Mass_payload = 20000;
Stealth = 0.5;

x = [1 1 2 1 2 20 12 2 1 25 2 4 3 12 2 2 2 20000];

    x = [ 2.00000000000000e+000
        2.00000000000000e+000
        3.00000000000000e+000
        2.00000000000000e+000
        2.00000000000000e+000
        15.0578760307742e+000
        6.57481569196851e+000 
        1.00000000000000e+000 
        2.00000000000000e+000
        66.2138660430789e+000
        1.00000000000000e+000  
        14.0000000000000e+000  
        3.00000000000000e+000  
        15.0000000000000e+000  
        2.00000000000000e+000  
        1.00000000000000e+000 
        4.00000000000000e+000  
        90.0497997298575e+003];

% Aircraft_value = Value_function_3(x)
% 
% % 
lb = [1 1 1 1 1 10 1 1 1 1 1 2 1 2 1 1 2 0];
ub = [3 2 3 2 2 20 30 3 3 50 2 20 3 20 3 3 6 80000];
intcon = [1 2 3 4 5 8 9 11 12 13 14 15 16 17];
nvars = 18;

[x,fval,exitflag,output,population,score] = ga_aircraft(nvars,lb,ub,intcon)

% % % % % x =
% % % % % 
% % % % %   Columns 1 through 5
% % % % % 
% % % % %     3.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
% % % % % 
% % % % %   Columns 6 through 10
% % % % % 
% % % % %     40.3931558259926e+000    51.6465504817623e+000    1.00000000000000e+000    1.00000000000000e+000    66.1720569518011e+000
% % % % % 
% % % % %   Columns 11 through 15
% % % % % 
% % % % %     2.00000000000000e+000    13.0000000000000e+000    1.00000000000000e+000    11.0000000000000e+000    1.00000000000000e+000
% % % % % 
% % % % %   Columns 16 through 18
% % % % % 
% % % % %     2.00000000000000e+000    6.00000000000000e+000    56.0273576039712e+003
% % % % % 
% % % % % fval
% % % % % 
% % % % % fval =
% % % % % 
% % % % %    -4.93064505765176e+009
   
   
% x =[1.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    1.00000000000000e+000...
% 15.7661002919029e+000    12.3727848128780e+000    3.00000000000000e+000    3.00000000000000e+000    26.7732105120967e+000...
% 2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000    7.00000000000000e+000    3.00000000000000e+000...
% 2.00000000000000e+000    5.00000000000000e+000    46.3896132278752e+003];
% 
% Aircraft_value = Value_function(x);
% % 
% system_analysis_out = system_analysis(Type_LG,Tail_material, Type_tail,Wing_type,...
%     Spar_material,l_wing,l_chord,Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,...
%     Longeron_material,n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload)


% Aircraft_value = Value_function(Type_LG,Tail_material, Type_tail,Wing_type,...
%     Spar_material,l_wing,l_chord,Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,...
%     Longeron_material,n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload)

% Aircraft_value = Value_function(x);

% L_fuselage = 20;
% Frame_material = 1;
% n_frames = 5;
% Longeron_material = 1;
% n_longerons = 5;
% Fuselage_skin_material = 1;
% Mass_wing = 5000;
% Mass_tail = 1000;
% Mass_landing_gear = 2000;
% Mass_engine = 10000;
% Mass_payload = 2000;
% 
% 
%  Fuselage_SSL1_out = Fuselage_SSL1(L_fuselage,Frame_material,n_frames,...
%     Longeron_material,n_longerons,Fuselage_skin_material,...
%     Mass_wing, Mass_tail, Mass_landing_gear,Mass_engine,Mass_payload)



% Tail_material = 1;
% Type_tail = 1;
% Tail_SL1_out = Tail_SL1(Tail_material, Type_tail)

% Type_LG = 2;
% Mass_return = 10000;
% LandingGear_SL1_out = LandingGear_SL1(Type_LG,Mass_return)

% Type_engine = 1;
% n_engines = 2;
% Mass_wing = 1000;
% Mass_fuselage = 5000;
% Mass_landinggear = 1000;
% Mass_tail = 500;
% S_wing = 25; 
% Mass_payload = 10000;
% 
% 
% 
% Engine_SL1_output = Engine_SL1(Type_engine,n_engines,Mass_wing,Mass_fuselage,Mass_landinggear,...
%                             Mass_tail, Mass_payload,S_wing)
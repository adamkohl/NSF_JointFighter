% Created by Adam Kohl and Tensaki Submaranian
% Establishes a rank correlation for design alternatives
clc;clear;
format longEng

% Design alternative for testing
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
% Stealth = 0.5; For government value
design1 = [Type_LG,Tail_material,Type_tail,Wing_type,Spar_material,l_wing,l_chord,...
    Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,Longeron_material,...
    n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload];

% Design variables' upper and lower bounds 
lb = [1 1 1 1 1 10 1 1 1 1 1 2 1 2 1 1 2 0];
ub = [3 2 3 2 2 20 30 3 3 50 2 20 3 20 3 3 6 80000];
intcon = [1 2 3 4 5 8 9 11 12 13 14 15 16 17];
nvars = 18;

% Value output for design alternative
Aircraft_value = Value_function_3(design1);


% Genetic algorithm from matlab optmization toolbox
%[x,fval,exitflag,output,population,score] = ga_aircraft(nvars,lb,ub,intcon)


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

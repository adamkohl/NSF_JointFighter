% Created by Adam Kohl and Tensaki Submaranian
% Establishes a rank correlation for design alternatives
clc;clear;
format longEng
% Design alternative for testing
design_1 = [1 1 2 1 2 20 12 2 1 25 2 4 3 12 2 2 2 20000];
design_tot = design_1;
[n_designs,~] = size(design_tot);

for i = 1:n_designs
    design_iter = design_tot(i,:);
    Type_LG = design_iter(1);
    Tail_material = design_iter(2);
    Type_tail = design_iter(3);
    Wing_type = design_iter(4);
    Spar_material = design_iter(5);
    l_wing = design_iter(6);
    l_chord = design_iter(7);
    Rib_material = design_iter(8);
    Skin_material = design_iter(9);
    L_fuselage = design_iter(10);
    Frame_material = design_iter(11);
    n_frames = design_iter(12);
    Longeron_material = design_iter(13);
    n_longerons = design_iter(14);
    Fuselage_skin_material = design_iter(15);
    Type_engine = design_iter(16);
    n_engines = design_iter(17);
    Mass_payload = design_iter(18);
    % Stealth = design_iter(19); For government value output

    % Design variables' upper and lower bounds 
    lb = [1 1 1 1 1 10 1 1 1 1 1 2 1 2 1 1 2 0];
    ub = [3 2 3 2 2 20 30 3 3 50 2 20 3 20 3 3 6 80000];
    intcon = [1 2 3 4 5 8 9 11 12 13 14 15 16 17];
    [nvars,~] = size(design_iter);

    % Value output for design alternative
    Aircraft_value = Value_function_3(design_iter);
end

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

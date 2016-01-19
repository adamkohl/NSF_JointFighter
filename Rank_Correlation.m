% Created by Adam Kohl and Tensaki Submaranian
% Establishes a rank correlation for design alternatives
clc;clear;
format longEng
% Design alternative for testing
design_alt_1 = [2.0 2.0 3.0 2.0 2.0 15.05 6.545 1.0 2.0 66.21...
    1.0 14.0 3.0 15.0 2.0 2.0 4.0 90049.799];
design_alt_tot = design_alt_1;
[n_designs,~] = size(design_alt_tot);

% Design attributes' upper and lower bounds 
lb = [1 1 1 1 1 10 1 1 1 1 1 2 1 2 1 2 2 0];
ub = [3 2 3 2 2 20 30 3 3 70 2 20 3 20 3 3 6 100000];
intcon = [1 2 3 4 5 8 9 11 12 13 14 15 16 17];

%Preallocate graph information
CM = jet(n_designs);
color_index = 1;
numlines = n_designs;
lins = {'-','--',':','-.'};
linespec = {'b','m','c','r','g',[1 .6 0],'k'};
Legend = cell(numlines,1);
for iter=1:numlines
    Legend{iter}=strcat('Design ', num2str(iter));
end

% Utility Parameters
a = -0.275e-5;
a1 = 0.00000009;
a2 = 0.00000001;
a3 = 0;
a4 = -0.000000005;
a5 = -0.00000009;

no_samples = 100;
% Start iterating through all alternate designs
for i = 1:n_designs
    design_iter = design_alt_tot(i,:);
    [~,nvars] = size(design_iter);

    % Value output for design alternative
    aircraft_value = Value_function_3(design_iter);
    
    % Generate pdf's for attributes
    skew_mag(1:18) = 1.25;
    skew = true;
    var_variant(1:18) = 0.5;
   for j=1:nvars
       lb(j) = design_iter(j)-var_variant(j);
       ub(j) = design_iter(j)+var_variant(j);
        if skew == true
            dx(j,:) = [lb(j):(ub(j)-lb(j))/1000:ub(j)];
            skew_var = lb(j) + (design_iter(j)-lb(j))*skew_mag(j);
            pd(j) = makedist('Tri',lb(j),skew_var,ub(j));
            vars_pdf(j,:) = pdf(pd(1,j),dx(j,:));
        else
            dx(j,:) = [lb(j):(ub(j)-lb(j))/1000:ub(j)];
            pd(j) = makedist('Tri',lb(j),design_iter(j),ub(j));
            vars_pdf(j,:) = pdf(pd(1,j),dx(j,:));
        end
    end
    design(i).graphpdf = vars_pdf;
    design(i).graphdist = dx;
    design(i).monteselect = pd;
    
    % Begin Monte Carlo Simulation
    for k = 1:no_samples
        Type_LG = round(random(design(i).monteselect(1,1),1));
        Tail_material = round(random(design(i).monteselect(1,2),1));
        Type_tail = round(random(design(i).monteselect(1,3),1));
        Wing_type = round(random(design(i).monteselect(1,4),1));
        Spar_material = round(random(design(i).monteselect(1,5),1));
        l_wing = random(design(i).monteselect(1,6),1);
        l_chord = random(design(i).monteselect(1,7),1);
        Rib_material = round(random(design(i).monteselect(1,8),1));
        Skin_material = round(random(design(i).monteselect(1,9),1));
        L_fuselage = random(design(i).monteselect(1,10),1);
        Frame_material = round(random(design(i).monteselect(1,11),1));
        n_frames = random(design(i).monteselect(1,12),1);
        Longeron_material = round(random(design(i).monteselect(1,13),1));
        n_longerons = random(design(i).monteselect(1,14),1);
        Fuselage_skin_material = round(random(design(i).monteselect(1,15),1));
        Type_engine = round(random(design(i).monteselect(1,16),1));
        n_engines = round(random(design(i).monteselect(1,17),1));
        Mass_payload = random(design(i).monteselect(1,18),1);
        
        util_inputs(k,:) = [Type_LG,Tail_material,Type_tail,Wing_type,Spar_material,l_wing,...
            l_chord,Rib_material,Skin_material,L_fuselage,Frame_material,n_frames,...
            Longeron_material,n_longerons,Fuselage_skin_material,Type_engine,n_engines,Mass_payload];

        util_aircraft_value(i,k) = -1*Value_function_3(util_inputs(k,:));
        
        U1(i,k) = -(1/a1)*exp(-a1*util_aircraft_value(i,k)); % nEGATIVE eXPONENTIAL uTILITY fUNCTION
        U2(i,k) = -(1/a2)*exp(-a2*util_aircraft_value(i,k));  
        U3(i,k) = -(1/a3)*exp(-a3*util_aircraft_value(i,k)); % nEGATIVE eXPONENTIAL uTILITY fUNCTION
        U4(i,k) = -(1/a4)*exp(-a4*util_aircraft_value(i,k));
        U5(i,k) = -(1/a5)*exp(-a5*util_aircraft_value(i,k)); % nEGATIVE eXPONENTIAL uTILITY fUNCTION
        U6(i,k) = -(1/a)*exp(-a*-1*util_aircraft_value(i,k)); 
    end
    design(i).aircraft_value = util_aircraft_value;
    design(i).aircraft_valueavg = mean(util_aircraft_value);
    
    % Utility_Exp_outcome 
    [n_ut1(i,:),xout_ut1(i,:)] = hist(U1(i,:),no_samples);
    design(i).util1avg = sum(xout_ut1(i,:).*n_ut1(i,:))/length(U1(i,:));
    [n_ut2(i,:),xout_ut2(i,:)] = hist(U2(i,:),no_samples);
    design(i).util2avg = sum(xout_ut2(i,:).*n_ut2(i,:))/length(U2(i,:));
    [n_ut3(i,:),xout_ut3(i,:)] = hist(U3(i,:),no_samples);
    design(i).util3avg = sum(xout_ut3(i,:).*n_ut3(i,:))/length(U3(i,:));
    [n_ut4(i,:),xout_ut4(i,:)] = hist(U4(i,:),no_samples);
    design(i).util4avg = sum(xout_ut4(i,:).*n_ut4(i,:))/length(U4(i,:));
    [n_ut5(i,:),xout_ut5(i,:)] = hist(U5(i,:),no_samples);
    design(i).util5avg = sum(xout_ut5(i,:).*n_ut5(i,:))/length(U5(i,:));
    [n_ut6(i,:),xout_ut6(i,:)] = hist(U6(i,:),no_samples);
    design(i).util6avg = sum(xout_ut6(i,:).*n_ut6(i,:))/length(U6(i,:));
end

% Graph attribute pdfs
for z = 1:nvars
    figure(z)
    for i = 1:1
        switch z
            case 1
                title(sprintf('Type LG'));
            case 2
                title(sprintf('Tail Material'));
            case 3
                title(sprintf('Type Tail'));
            case 4 
                title(sprintf('Wing Type'));
            case 5
                title(sprintf('Spar Material'));
            case 6
                title(sprintf('L Wing'));
            case 7
                title(sprintf('L Chord'));
            case 8
                title(sprintf('Rib Material'));
            case 9
                title(sprintf('Skin Material'));
            case 10
                title(sprintf('L Fuselage'));
            case 11
                title(sprintf('Frame Material'));
            case 12
                title(sprintf('N Frames'));
            case 13
                title(sprintf('Longeron Material'));
            case 14
                title(sprintf('N Longerons'));
            case 15
                title(sprintf('Fuselage Skin Material'));
            case 16
                title(sprintf('Type Engine'));
            case 17
                title(sprintf('N Engines'));  
            otherwise
                title(sprintf('Mass Payload'));
        end
        hold on;
        plot(design(i).graphdist(z,:),design(i).graphpdf(z,:),'color',linespec{i},'linestyle',lins{i},'LineWidth',2.5)
        hold on;
        color_index = color_index+1;
        legend(Legend);
    end
end

% Output all results in an orderly fashion
filename = sprintf('Joint_Fighter_Results_%s.txt', datestr(now));
for i = 1:n_designs
    aircraft_valavg_out(i,1) = design(i).aircraft_valueavg;
    utility_1_out(i,1) = design(i).util1avg;
    utility_2_out(i,1) = design(i).util2avg;
    utility_3_out(i,1) = design(i).util3avg;
    utility_4_out(i,1) = design(i).util4avg;
    utility_5_out(i,1) = design(i).util5avg;
    utility_6_out(i,1) = design(i).util6avg; 
end

T = table(aircraft_valavg_out(:,1),utility_1_out(:,1),utility_2_out(:,1),utility_3_out(:,1),...
    utility_4_out(:,1),utility_5_out(:,1),utility_6_out(:,1));
T.Properties.VariableNames = {'Aircraft_Value' 'Utility_1' 'Utility_2' 'Utility_3'...
    'Utility_4' 'Utility_5' 'Utility_6'};
writetable(T,filename,'Delimiter',' '); 
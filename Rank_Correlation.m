% Created by Adam Kohl and Tensaki Submaranian
% Establishes a rank correlation for design alternatives
clc;clear;
format longEng
% Design alternative for testing
design_alt_1 = [1 1 2 1 2 20 12 2 1 25 2 4 3 12 2 2 2 20000];
design_alt_tot = design_alt_1;
[n_designs,~] = size(design_alt_tot);

% Design attributes' upper and lower bounds 
lb = [1 1 1 1 1 10 1 1 1 1 1 2 1 2 1 2 2 0];
ub = [3 2 3 2 2 20 30 3 3 50 2 20 3 20 3 3 6 80000];
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
a1 = 0.00000009;
a2 = 0.00000001;
a3 = 0;
a4 = -0.000000005;
a5 = -0.00000009;
R1 = 10*10^6;
R2 = -10*10^6;
b1 = 350*10^6;
alpha = 5;
alpha1 = -0.01;
alpha2 = alpha1+0.1;
alpha3 = alpha2+0.1;
alpha4 = alpha3+0.1;

% Start iterating through all alternate designs
for i = 1:n_designs
    design_iter = design_alt_tot(i,:);
    [~,nvars] = size(design_iter);

    % Value output for design alternative
    aircraft_value = Value_function_3(design_iter);
    
    % Generate pdf's for attributes
    for j=1:nvars
        dx(j,:) = [lb(j):(ub(j)-lb(j))/1000:ub(j)];
        pd(j) = makedist('Tri',lb(j),design_iter(j),ub(j));
        vars_pdf(j,:) = pdf(pd(1,j),dx(j,:));
    end
    design(i).graphpdf = vars_pdf;
    design(i).graphdist = dx;
    design(i).monteselect = pd;
    
    % Begin Monte Carlo Simulation
    for k = 1:100
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

        util_aircraft_value(i,k) = Value_function_3(util_inputs(k,:));
        
        U1(i,k) = -(1/a1)*exp(-a1*util_aircraft_value(i,k));
        U2(i,k) = -(1/a2)*exp(-a2*util_aircraft_value(i,k));
        U3(i,k) = util_aircraft_value(i,k).^(1/8);
        U4(i,k) = (1-exp(-util_aircraft_value(i,k)-a3)./R1)/(1-exp(-(b1-a3)./R1));
        U5(i,k) = (1-exp(-(util_aircraft_value(i,k)-a3)./R2))/(1-exp(-(b1-a3)./R2));
        U6(i,k) = (1/alpha)*util_aircraft_value(i,k).^alpha;
    end
    design(i).aircraft_value = util_aircraft_value;
    design(i).util1 = U1;
    design(i).util2 = U2;
    design(i).util3 = U3;
    design(i).util4 = U4;
    design(i).util5 = U5;
    design(i).util6 = U6;
    design(i).aircraft_valueavg = mean(util_aircraft_value);
    design(i).util1avg = mean(U1);
    design(i).util2avg = mean(U2);
    design(i).util3avg = mean(U3);
    design(i).util4avg = mean(U4);
    design(i).util5avg = mean(U5);
    design(i).util6avg = mean(U6);
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

filename = 'Joint_Fighter_Results.txt';
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
% Code for Wing output - System level
function Wing_SSL1_out = Wing_SSL1(Wing_type, Spar_material,l_wing,l_chord,...
    Rib_material,Skin_material,Mass_fuel,Mass_payload,Mass_fuselage,...
    Mass_landinggear,Mass_tail,Mass_engine)

S_wing = l_wing*l_chord;    % Area of wing = Length of wing * Length of chord 
W_to =  (Mass_payload + Mass_fuselage + Mass_landinggear + Mass_tail + Mass_engine + Mass_fuel) * 9.81;

Wing_SSL2_output = Wing_SSL2_analysis(Spar_material,l_wing,S_wing,W_to,l_chord,Rib_material, Skin_material);
Mass_spar = Wing_SSL2_output(1);
Cost_spar = Wing_SSL2_output(2);
Mass_rib = Wing_SSL2_output(3);
Cost_rib = Wing_SSL2_output(4);
Cost_skin = Wing_SSL2_output(5);

Mass_fittings = 5000;


if Wing_type == 1       % Rectangular wing
    Cost_manufacture = 10e6;
    Cost_wing = Cost_spar + Cost_rib + Cost_skin + Cost_manufacture;
    Mass_wing = Mass_spar + Mass_rib + Mass_fittings;
    
elseif Wing_type == 2   % Elliptical wing
    Cost_manufacture = 25e6;
    Cost_wing = Cost_spar + Cost_rib + Cost_skin + Cost_manufacture;
    Mass_wing = Mass_spar + Mass_rib + Mass_fittings;
end

Wing_SSL1_out = [Mass_wing Cost_wing Mass_spar Cost_spar Mass_rib Cost_rib Cost_skin S_wing];
end

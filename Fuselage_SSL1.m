function Fuselage_SSL1_out = Fuselage_SSL1(L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,...
    Mass_wing, Mass_tail, Mass_landing_gear,Mass_engine,Mass_fuel,Mass_payload)


Fuselage_SSL2_output = Fuselage_SSL2_analysis(L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,...
    Mass_wing, Mass_tail, Mass_landing_gear,Mass_engine,Mass_fuel,Mass_payload);
Mass_frame = Fuselage_SSL2_output(1);
Cost_frame  = Fuselage_SSL2_output(2);
d_fuselage = Fuselage_SSL2_output(3);
Mass_longerons  = Fuselage_SSL2_output(4);
Cost_longerons  = Fuselage_SSL2_output(5);
Mass_skin_fuselage  = Fuselage_SSL2_output(6);
Cost_skin_fuselage = Fuselage_SSL2_output(7);

Mass_fuselage = Mass_frame + Mass_longerons + Mass_skin_fuselage;
Cost_manufacturing = 5e5 * L_fuselage;
Cost_fuselage = Cost_manufacturing + Cost_frame + Cost_longerons + Cost_skin_fuselage;

Fuselage_SSL1_out = [Mass_fuselage Cost_fuselage d_fuselage];
end
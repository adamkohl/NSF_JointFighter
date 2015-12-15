function Fuselage_SSL2_output = Fuselage_SSL2_analysis( L_fuselage,Frame_material,n_frames,...
    Longeron_material,n_longerons,Fuselage_skin_material,...
    Mass_wing, Mass_tail, Mass_landing_gear,Mass_engine,Mass_fuel,Mass_payload)

Fuselage_SL2_SS1_out = Fuselage_SL2_SS1(Frame_material,n_frames,Mass_payload);
Mass_frame = Fuselage_SL2_SS1_out(1);
Cost_frame = Fuselage_SL2_SS1_out(2);
d_fuselage = Fuselage_SL2_SS1_out(3);

Fuselage_SL2_SS2_out = Fuselage_SL2_SS2(L_fuselage, Longeron_material,n_longerons,...
    Mass_wing, Mass_tail, Mass_landing_gear,Mass_engine,Mass_fuel,Mass_payload);
Mass_longerons = Fuselage_SL2_SS2_out(1);
Cost_longerons = Fuselage_SL2_SS2_out(2);

Fuselage_SL2_SS3_out = Fuselage_SL2_SS3(Fuselage_skin_material,L_fuselage,d_fuselage,Mass_payload);
Mass_skin_fuselage = Fuselage_SL2_SS3_out(1);
Cost_skin_fuselage = Fuselage_SL2_SS3_out(2);

Fuselage_SSL2_output = [Mass_frame Cost_frame d_fuselage Mass_longerons Cost_longerons Mass_skin_fuselage Cost_skin_fuselage];
end
function Wing_SSL2_output = Wing_SSL2_analysis(Spar_material,l_wing,S_wing,W_to,l_chord,Rib_material, Skin_material);

Wing_SL2_SS1_out = Wing_SL2_SS1(Spar_material,l_wing,W_to,l_chord);
    Mass_spar = Wing_SL2_SS1_out(1);
    Cost_spar = Wing_SL2_SS1_out(2);

Wing_SL2_SS2_out = Wing_SL2_SS2(l_chord,Rib_material,W_to,l_wing);
    Mass_rib = Wing_SL2_SS2_out(1);
    Cost_rib = Wing_SL2_SS2_out(2);
    
Wing_SL2_SS3_out = Wing_SL2_SS3(Skin_material,l_wing,l_chord,W_to);
    Cost_skin = Wing_SL2_SS3_out(1);
    
Wing_SSL2_output = [Mass_spar Cost_spar Mass_rib Cost_rib Cost_skin];
end

function P_E_F_out = Prob_effective(Range, Mass_payload)
% [x,y] = meshgrid(0:200e3:20000000,0:800:40000);
% z = (3200 * x + 2900000 * y )/2e11;
% % surf(x,y,z)
% [C,h] = contour(x,y,z)
% set(h,'ShowText','on','TextStep',get(h,'LevelStep')*1)
% % colormap cool
% Range 
% Mass_payload
if Range > 0 && Range <= 20000000
    if Mass_payload > 0 && Mass_payload <= 40000
        P_E_F = (3200 * Range + 2900000 * Mass_payload)/2e11;
    elseif Mass_payload > 40000
        P_E_F = (3200 * Range + 2900000 * 40000)/2e11;
    end
elseif Range > 20000000
    if Mass_payload > 0 && Mass_payload <= 40000
        P_E_F = (3200 * 20000000 + 2900000 * Mass_payload)/2e11;
    elseif Mass_payload > 40000
        P_E_F = (3200 * 20000000 + 2900000 * 40000)/2e11;
    end
else P_E_F = 0;
end
P_E_F_out = [P_E_F];
end


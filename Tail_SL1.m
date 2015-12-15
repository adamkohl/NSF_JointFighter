function Tail_SL1_out = Tail_SL1(Tail_material, Type_tail)

if Type_tail == 1   % Conventional tail
   Base_weight = 5000/3;
   Cost_manufacture = 75000;
   
    if Tail_material == 1   % Aluminum alloy
        Mass_tail = Base_weight * 2.5;
        Cost_per_kg = 1.8;
        Cost_tail = Cost_per_kg * Mass_tail;
        
    elseif Tail_material == 2   % Carbon fiber
        Mass_tail = Base_weight * 1.25;
        Cost_per_kg = 140;
        Cost_tail = Cost_per_kg * Mass_tail;
    end
    
   Cost_tail_total = Cost_tail + Cost_manufacture;
   
   
elseif Type_tail == 2   % H-tail
       Base_weight = 8000/3;
       Cost_manufacture = 50000;

        if Tail_material == 1   % Aluminum alloy
            Mass_tail = Base_weight * 2.5;
            Cost_per_kg = 1.8;
            Cost_tail = Cost_per_kg * Mass_tail;

        elseif Tail_material == 2   % Carbon fiber
            Mass_tail = Base_weight * 1.25;
            Cost_per_kg = 140;
            Cost_tail = Cost_per_kg * Mass_tail;
        end

       Cost_tail_total = Cost_tail + Cost_manufacture;
       
       
elseif Type_tail == 3   % V-tail
       Base_weight = 2500/3;
       Cost_manufacture = 100000;

        if Tail_material == 1   % Aluminum alloy
            Mass_tail = Base_weight * 2.5;
            Cost_per_kg = 1.8;
            Cost_tail = Cost_per_kg * Mass_tail;

        elseif Tail_material == 2   % Carbon fiber
            Mass_tail = Base_weight * 1.25;
            Cost_per_kg = 140;
            Cost_tail = Cost_per_kg * Mass_tail;
        end

       Cost_tail_total = Cost_tail + Cost_manufacture;        
end

Tail_SL1_out = [Mass_tail Cost_tail_total];

end
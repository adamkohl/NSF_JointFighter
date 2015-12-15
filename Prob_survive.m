
function P_S_out = Prob_survive(Stealth, Velocity)

% x = linspace(0,0.8,50);
% y = linspace(0,340,50);
% [x, y] = meshgrid(0:0.016:0.8, 0:6.8:340);
% z = (11 * x + 0.01 * y)./16;
% 
% surf(x,y,z)
% [C,h] = contour(x,y,z)
% % set(h,'ShowText','on','TextStep',get(h,'LevelStep')*1)
% % colormap cool

if Velocity >0 && Velocity <= 340
    P_S = (11 * Stealth + 0.01 * Velocity)./16;
else P_S = (11 * Stealth + 0.01 * 340)/16;
% if Velocity >0 && Velocity <= 450
%     P_S = (22.5 * Stealth + 0.04 * Velocity)./5;
% elseif Velocity > 450
%     P_S = (22.5 * Stealth + 0.04 *450)/5
end
P_S_out = [P_S];
end
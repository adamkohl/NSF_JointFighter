function [x,fval,exitflag,output,population,score] = ga_government(nvars,lb,ub,intcon)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'CrossoverFcn', {  @crossoverintermediate [] });
options = gaoptimset(options,'Display', 'off');
[x,fval,exitflag,output,population,score] = ...
ga(@Value_government,nvars,[],[],[],[],lb,ub,[],intcon,options);
end


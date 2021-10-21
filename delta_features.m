Delta=Delta_Waves_Total;
Delta1=vertcat(Delta{:}).';
Delta2=vertcat(Delta1{:}).';

deltas=Delta2;
% %%
% deltas=Delta_Waves_Total{1}.';
% deltas=deltas{3}.';
%%
% for i=1:length(deltas)
%     plot(deltas{i})
%     hold on
% end

%%
% close all
si=deltas;
timeasleep=0;
print_hist=1;
Rat=26;
tr=40;

[x,y,z,w,h,q,l,p,si_mixed,th,PCA_features]=delta_specs(si,timeasleep,print_hist);

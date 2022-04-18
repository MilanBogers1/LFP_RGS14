%c4
%%RGS
rgs_c4=GC_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
% mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(1000,:));

subplot(2,2,4)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])
title('rgs wideband')
%ylim([-200 30])
ylim([-200 200])
yticks([-200 0 200])

rgs_c4=GC_Bp_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
%mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(1000,:));

subplot(2,2,2)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])

title('rgs BP')
%ylim([-10 5])
ylim([-180 180])
yticks([-180 0 180])

%% Veh
rgs_c4=GC_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
%mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(200,:));

subplot(2,2,3)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])

title('veh wideband')
%ylim([-200 30])
ylim([-200 200])
yticks([-200 0 200])

rgs_c4=GC_Bp_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
%mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(200,:));

subplot(2,2,1)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])
title('veh BP')
%ylim([-10 5])
ylim([-180 180])
yticks([-180 0 180])

suptitle('c4')

%c2
%%RGS
rgs_c2=GC_cluster2_rgs_median_wa;
rgs_c2=cellfun(@(x) x(1,:) ,rgs_c2,'UniformOutput' ,false);
rgs_c2=cell2mat(rgs_c2);
% mean_rgs_c2=mean(rgs_c2);
mean_rgs_c2=(rgs_c2(1000,:));

subplot(2,2,4)
plot(([0:length(mean_rgs_c2)-1]/1000)-3,mean_rgs_c2)
xlim([-3 3])
xticks([-3 0 3])
title('rgs wideband')
%ylim([-200 30])
ylim([-200 200])
yticks([-200 0 200])

rgs_c2=GC_Bp_cluster2_rgs_median_wa;
rgs_c2=cellfun(@(x) x(1,:) ,rgs_c2,'UniformOutput' ,false);
rgs_c2=cell2mat(rgs_c2);
%mean_rgs_c2=mean(rgs_c2);
mean_rgs_c2=(rgs_c2(1000,:));

subplot(2,2,2)
plot(([0:length(mean_rgs_c2)-1]/1000)-3,mean_rgs_c2)
xlim([-3 3])
xticks([-3 0 3])

title('rgs BP')
%ylim([-10 5])
ylim([-180 180])
yticks([-180 0 180])

%% Veh
rgs_c2=GC_cluster2_veh_median_wa;
rgs_c2=cellfun(@(x) x(1,:) ,rgs_c2,'UniformOutput' ,false);
rgs_c2=cell2mat(rgs_c2);
%mean_rgs_c2=mean(rgs_c2);
mean_rgs_c2=(rgs_c2(1000,:));

subplot(2,2,3)
plot(([0:length(mean_rgs_c2)-1]/1000)-3,mean_rgs_c2)
xlim([-3 3])
xticks([-3 0 3])

title('veh wideband')
%ylim([-200 30])
ylim([-200 200])
yticks([-200 0 200])

rgs_c2=GC_Bp_cluster2_veh_median_wa;
rgs_c2=cellfun(@(x) x(1,:) ,rgs_c2,'UniformOutput' ,false);
rgs_c2=cell2mat(rgs_c2);
%mean_rgs_c2=mean(rgs_c2);
mean_rgs_c2=(rgs_c2(1000,:));

subplot(2,2,1)
plot(([0:length(mean_rgs_c2)-1]/1000)-3,mean_rgs_c2)
xlim([-3 3])
xticks([-3 0 3])
title('veh BP')
%ylim([-10 5])
ylim([-180 180])
yticks([-180 0 180])

suptitle('c2')

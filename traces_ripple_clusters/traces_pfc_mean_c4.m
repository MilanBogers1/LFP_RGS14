%c4
%%RGS
rgs_c4=GC_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,4)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])
title('rgs wideband')
%ylim([-20 30])
ylim([-20 20])
yticks([-20 0 20])

rgs_c4=GC_Bp_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,2)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])

title('rgs BP')
%ylim([-10 5])
ylim([-15 15])
yticks([-15 0 15])

%% Veh
rgs_c4=GC_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,3)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])

title('veh wideband')
%ylim([-20 30])
ylim([-20 20])
yticks([-20 0 20])

rgs_c4=GC_Bp_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(1,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,1)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-3 3])
xticks([-3 0 3])
title('veh BP')
%ylim([-10 5])
ylim([-15 15])
yticks([-15 0 15])
suptitle('c4')

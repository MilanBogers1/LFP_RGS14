%C4
%%RGS
rgs_c4=GC_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,4)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs wideband')
ylim([-80 80])
yticks([-80 0 80])

rgs_c4=GC_Bp_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,2)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs BP')
ylim([-10 10])

%% Veh
rgs_c4=GC_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,3)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh wideband')
ylim([-80 80])
yticks([-80 0 80])

rgs_c4=GC_Bp_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
mean_rgs_c4=mean(rgs_c4);

subplot(2,2,1)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh BP')
ylim([-10 10])
suptitle('C4')
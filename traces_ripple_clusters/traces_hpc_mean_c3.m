%C3
%%RGS
rgs_c3=GC_cluster3_rgs_median_wa;
rgs_c3=cellfun(@(x) x(2,:) ,rgs_c3,'UniformOutput' ,false);
rgs_c3=cell2mat(rgs_c3);
mean_rgs_c3=mean(rgs_c3);

subplot(2,2,4)
plot(([0:length(mean_rgs_c3)-1]/1000)-3,mean_rgs_c3)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs wideband')
%ylim([-40 60])
ylim([-80 80])
yticks([-80 0 80])

rgs_c3=GC_Bp_cluster3_rgs_median_wa;
rgs_c3=cellfun(@(x) x(2,:) ,rgs_c3,'UniformOutput' ,false);
rgs_c3=cell2mat(rgs_c3);
mean_rgs_c3=mean(rgs_c3);

subplot(2,2,2)
plot(([0:length(mean_rgs_c3)-1]/1000)-3,mean_rgs_c3)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs BP')
%ylim([-10 5])
ylim([-10 10])

%% Veh
rgs_c3=GC_cluster3_veh_median_wa;
rgs_c3=cellfun(@(x) x(2,:) ,rgs_c3,'UniformOutput' ,false);
rgs_c3=cell2mat(rgs_c3);
mean_rgs_c3=mean(rgs_c3);

subplot(2,2,3)
plot(([0:length(mean_rgs_c3)-1]/1000)-3,mean_rgs_c3)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh wideband')
%ylim([-40 60])
ylim([-80 80])
yticks([-80 0 80])

rgs_c3=GC_Bp_cluster3_veh_median_wa;
rgs_c3=cellfun(@(x) x(2,:) ,rgs_c3,'UniformOutput' ,false);
rgs_c3=cell2mat(rgs_c3);
mean_rgs_c3=mean(rgs_c3);

subplot(2,2,1)
plot(([0:length(mean_rgs_c3)-1]/1000)-3,mean_rgs_c3)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh BP')
%ylim([-10 5])
ylim([-10 10])
suptitle('C3')
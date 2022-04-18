%C1
%%RGS
rgs_c1=GC_cluster1_rgs_median_wa;
rgs_c1=cellfun(@(x) x(2,:) ,rgs_c1,'UniformOutput' ,false);
rgs_c1=cell2mat(rgs_c1);
%mean_rgs_c1=mean(rgs_c1);
mean_rgs_c1=(rgs_c1(1000,:));

subplot(2,2,4)
plot(([0:length(mean_rgs_c1)-1]/1000)-3,mean_rgs_c1)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs wideband')
%ylim([-20 30])
ylim([-300 300])
yticks([-300 0 300])

rgs_c1=GC_Bp_cluster1_rgs_median_wa;
rgs_c1=cellfun(@(x) x(2,:) ,rgs_c1,'UniformOutput' ,false);
rgs_c1=cell2mat(rgs_c1);
% mean_rgs_c1=mean(rgs_c1);
mean_rgs_c1=(rgs_c1(1000,:));

subplot(2,2,2)
plot(([0:length(mean_rgs_c1)-1]/1000)-3,mean_rgs_c1)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs BP')
%ylim([-10 5])
ylim([-100 100])

%% Veh
rgs_c1=GC_cluster1_veh_median_wa;
rgs_c1=cellfun(@(x) x(2,:) ,rgs_c1,'UniformOutput' ,false);
rgs_c1=cell2mat(rgs_c1);
%mean_rgs_c1=mean(rgs_c1);
mean_rgs_c1=(rgs_c1(1000,:));

subplot(2,2,3)
plot(([0:length(mean_rgs_c1)-1]/1000)-3,mean_rgs_c1)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh wideband')
%ylim([-20 30])
ylim([-300 300])
yticks([-300 0 300])

rgs_c1=GC_Bp_cluster1_veh_median_wa;
rgs_c1=cellfun(@(x) x(2,:) ,rgs_c1,'UniformOutput' ,false);
rgs_c1=cell2mat(rgs_c1);
%mean_rgs_c1=mean(rgs_c1);
mean_rgs_c1=(rgs_c1(1000,:));

subplot(2,2,1)
plot(([0:length(mean_rgs_c1)-1]/1000)-3,mean_rgs_c1)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh BP')
%ylim([-10 5])
ylim([-100 100])
suptitle('C1')

%c4
%%RGS
rgs_c4=GC_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
%mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(1000,:));

subplot(2,2,4)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs wideband')
%ylim([-20 30])
ylim([-300 300])
yticks([-300 0 300])

rgs_c4=GC_Bp_cluster4_rgs_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
% mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(1000,:));

subplot(2,2,2)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('rgs BP')
%ylim([-10 5])
ylim([-100 100])

%% Veh
rgs_c4=GC_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
%mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(300,:));

subplot(2,2,3)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh wideband')
%ylim([-20 30])
ylim([-300 300])
yticks([-300 0 300])

rgs_c4=GC_Bp_cluster4_veh_median_wa;
rgs_c4=cellfun(@(x) x(2,:) ,rgs_c4,'UniformOutput' ,false);
rgs_c4=cell2mat(rgs_c4);
%mean_rgs_c4=mean(rgs_c4);
mean_rgs_c4=(rgs_c4(300,:));

subplot(2,2,1)
plot(([0:length(mean_rgs_c4)-1]/1000)-3,mean_rgs_c4)
xlim([-1.5 1.5])
xticks([-1.5 0 1.5])

title('veh BP')
%ylim([-10 5])
ylim([-100 100])
suptitle('c4')

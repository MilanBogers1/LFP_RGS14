clear variables
cd('I:\Milan_DA\RGS14_Ephys_da\Data_RGS14_Downsampled_First_Session')

list = {'Wake','NREM','Transitional','REM'};
[indx] = listdlg('SelectionMode','single','ListString',list);

switch indx
    case 1
        ss = 1; 
        stage='Wake';
    case 2
        ss = 3; 
        stage='NREM';
    case 3
        ss = 4; %Transitional
        stage='Trans';
    case 4
        ss = 5; %REM
        stage='REM';
end



list = {'HPC','PFC'};
[indx2] = listdlg('SelectionMode','single','ListString',list);

switch indx2
    case 1
        barea='HPC';
    case 2
        barea='PFC';
end

ratiodelta_total_veh=[];
ratiodelta_total_rgs=[];
rat_folder = getfolder;
% for k=1:1
for k=1:length(rat_folder)
    cd(rat_folder{k})    
    g=getfolder;
%xo
    for j=1:length(g)
%     for j=2;
        if (contains(g{j}, 'CON'))
            cd(g{j})
        
%end

                st=dir;
                st={st.name};
                for y=1:length(st)
                    if ss~=5
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiodelta_total_veh=ratiodelta_total_veh(~isnan(ratiodelta_total_veh));
ratiodelta_total_rgs=ratiodelta_total_rgs(~isnan(ratiodelta_total_rgs));
ratiodelta_sd_mean_veh = mean(ratiodelta_total_veh);
ratiodelta_sd_mean_rgs = mean(ratiodelta_total_rgs);
ratiodelta_sd_rgs_SEM = (std(ratiodelta_total_rgs)/sqrt(length(ratiodelta_total_rgs)));
ratiodelta_sd_veh_SEM = (std(ratiodelta_total_veh)/sqrt(length(ratiodelta_total_veh)));
save(strcat('ratiodelta_SD_Mean_VEH_',stage,'_','CON','_',barea),'ratiodelta_sd_mean_veh')
save(strcat('ratiodelta_SD_Mean_RGS14_',stage,'_','CON','_',barea),'ratiodelta_sd_mean_rgs')
save(strcat('ratiodelta_SD_RGS14_SEM_',stage,'_','CON','_',barea),'ratiodelta_sd_rgs_SEM')
save(strcat('ratiodelta_SD_VEH_SEM_',stage,'_','CON','_',barea),'ratiodelta_sd_veh_SEM')
ratiodelta_total_veh_con=ratiodelta_total_veh';
ratiodelta_total_rgs_con=ratiodelta_total_rgs';

ratiodelta_total_veh=[];
ratiodelta_total_rgs=[];
rat_folder = getfolder;
% for k=1:1
for k=1:length(rat_folder)
    cd(rat_folder{k})    
    g=getfolder;
%xo
    for j=1:length(g)
%     for j=2;
        if (contains(g{j}, 'HC'))
            cd(g{j})
        
%end

                st=dir;
                st={st.name};
                for y=1:length(st)
                    if ss~=5
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiodelta_total_veh=ratiodelta_total_veh(~isnan(ratiodelta_total_veh));
ratiodelta_total_rgs=ratiodelta_total_rgs(~isnan(ratiodelta_total_rgs));
ratiodelta_sd_mean_veh = mean(ratiodelta_total_veh);
ratiodelta_sd_mean_rgs = mean(ratiodelta_total_rgs);
ratiodelta_sd_rgs_SEM = (std(ratiodelta_total_rgs)/sqrt(length(ratiodelta_total_rgs)));
ratiodelta_sd_veh_SEM = (std(ratiodelta_total_veh)/sqrt(length(ratiodelta_total_veh)));
save(strcat('ratiodelta_SD_Mean_VEH_',stage,'_','HC','_',barea),'ratiodelta_sd_mean_veh')
save(strcat('ratiodelta_SD_Mean_RGS14_',stage,'_','HC','_',barea),'ratiodelta_sd_mean_rgs')
save(strcat('ratiodelta_SD_RGS14_SEM_',stage,'_','HC','_',barea),'ratiodelta_sd_rgs_SEM')
save(strcat('ratiodelta_SD_VEH_SEM_',stage,'_','HC','_',barea),'ratiodelta_sd_veh_SEM')
ratiodelta_total_veh_hc=ratiodelta_total_veh';
ratiodelta_total_rgs_hc=ratiodelta_total_rgs';

ratiodelta_total_veh=[];
ratiodelta_total_rgs=[];
rat_folder = getfolder;
% for k=1:1
for k=1:length(rat_folder)
    cd(rat_folder{k})    
    g=getfolder;
%xo
    for j=1:length(g)
%     for j=2;
        if (contains(g{j}, 'OD'))
            cd(g{j})
        
%end

                st=dir;
                st={st.name};
                for y=1:length(st)
                    if ss~=5
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiodelta_total_veh=ratiodelta_total_veh(~isnan(ratiodelta_total_veh));
ratiodelta_total_rgs=ratiodelta_total_rgs(~isnan(ratiodelta_total_rgs));
ratiodelta_sd_mean_veh = mean(ratiodelta_total_veh);
ratiodelta_sd_mean_rgs = mean(ratiodelta_total_rgs);
ratiodelta_sd_rgs_SEM = (std(ratiodelta_total_rgs)/sqrt(length(ratiodelta_total_rgs)));
ratiodelta_sd_veh_SEM = (std(ratiodelta_total_veh)/sqrt(length(ratiodelta_total_veh)));
save(strcat('ratiodelta_SD_Mean_VEH_',stage,'_','OD','_',barea),'ratiodelta_sd_mean_veh')
save(strcat('ratiodelta_SD_Mean_RGS14_',stage,'_','OD','_',barea),'ratiodelta_sd_mean_rgs')
save(strcat('ratiodelta_SD_RGS14_SEM_',stage,'_','OD','_',barea),'ratiodelta_sd_rgs_SEM')
save(strcat('ratiodelta_SD_VEH_SEM_',stage,'_','OD','_',barea),'ratiodelta_sd_veh_SEM')
ratiodelta_total_veh_od=ratiodelta_total_veh';
ratiodelta_total_rgs_od=ratiodelta_total_rgs';

ratiodelta_total_veh=[];
ratiodelta_total_rgs=[];
rat_folder = getfolder;
% for k=1:1
for k=1:length(rat_folder)
    cd(rat_folder{k})    
    g=getfolder;
%xo
    for j=1:length(g)
%     for j=2;
        if (contains(g{j}, 'OR'))
            cd(g{j})
        
%end

                st=dir;
                st={st.name};
                for y=1:length(st)
                    if ss~=5
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiodelta_SD_Total_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiodelta_sd=load(st{y});
                             ratiodelta_sd=ratiodelta_sd.ratiodelta_sd;
                             if k==1 || k==2 || k==5 || k==8
                                ratiodelta_total_veh = [ratiodelta_total_veh ratiodelta_sd];
                             else
                                ratiodelta_total_rgs = [ratiodelta_total_rgs ratiodelta_sd]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiodelta_total_veh=ratiodelta_total_veh(~isnan(ratiodelta_total_veh));
ratiodelta_total_rgs=ratiodelta_total_rgs(~isnan(ratiodelta_total_rgs));
ratiodelta_sd_mean_veh = mean(ratiodelta_total_veh);
ratiodelta_sd_mean_rgs = mean(ratiodelta_total_rgs);
ratiodelta_sd_rgs_SEM = (std(ratiodelta_total_rgs)/sqrt(length(ratiodelta_total_rgs)));
ratiodelta_sd_veh_SEM = (std(ratiodelta_total_veh)/sqrt(length(ratiodelta_total_veh)));
save(strcat('ratiodelta_SD_Mean_VEH_',stage,'_','OR','_',barea),'ratiodelta_sd_mean_veh')
save(strcat('ratiodelta_SD_Mean_RGS14_',stage,'_','OR','_',barea),'ratiodelta_sd_mean_rgs')
save(strcat('ratiodelta_SD_RGS14_SEM_',stage,'_','OR','_',barea),'ratiodelta_sd_rgs_SEM')
save(strcat('ratiodelta_SD_VEH_SEM_',stage,'_','OR','_',barea),'ratiodelta_sd_veh_SEM')
ratiodelta_total_veh_or=ratiodelta_total_veh';
ratiodelta_total_rgs_or=ratiodelta_total_rgs';
Rat13=[ratiodelta_total_veh_con(1,1);ratiodelta_total_veh_hc(1,1);ratiodelta_total_veh_od(1,1);ratiodelta_total_veh_or(1,1);ratiodelta_total_rgs_con(1,1);ratiodelta_total_rgs_hc(1,1);ratiodelta_total_rgs_od(1,1);ratiodelta_total_rgs_or(1,1)];
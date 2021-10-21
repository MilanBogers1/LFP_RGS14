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

ratiotheta_SD_First_Half_veh=[];
ratiotheta_SD_First_Half_rgs=[];
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
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiotheta_SD_First_Half_veh=ratiotheta_SD_First_Half_veh(~isnan(ratiotheta_SD_First_Half_veh));
ratiotheta_SD_First_Half_rgs=ratiotheta_SD_First_Half_rgs(~isnan(ratiotheta_SD_First_Half_rgs));
ratiotheta_SD_First_Half_mean_veh = mean(ratiotheta_SD_First_Half_veh);
ratiotheta_SD_First_Half_mean_rgs = mean(ratiotheta_SD_First_Half_rgs);
ratiotheta_SD_First_Half_rgs_SEM = (std(ratiotheta_SD_First_Half_rgs)/sqrt(length(ratiotheta_SD_First_Half_rgs)));
ratiotheta_SD_First_Half_veh_SEM = (std(ratiotheta_SD_First_Half_veh)/sqrt(length(ratiotheta_SD_First_Half_veh)));
save(strcat('ratiotheta_SD_First_Half_Mean_VEH_',stage,'_','CON','_',barea),'ratiotheta_SD_First_Half_mean_veh')
save(strcat('ratiotheta_SD_First_Half_Mean_RGS14_',stage,'_','CON','_',barea),'ratiotheta_SD_First_Half_mean_rgs')
save(strcat('ratiotheta_SD_First_Half_RGS14_SEM_',stage,'_','CON','_',barea),'ratiotheta_SD_First_Half_rgs_SEM')
save(strcat('ratiotheta_SD_First_Half_VEH_SEM_',stage,'_','CON','_',barea),'ratiotheta_SD_First_Half_veh_SEM')
ratiotheta_total_veh_con=ratiotheta_SD_First_Half_veh';
ratiotheta_total_rgs_con=ratiotheta_SD_First_Half_rgs';

ratiotheta_SD_First_Half_veh=[];
ratiotheta_SD_First_Half_rgs=[];
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
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiotheta_SD_First_Half_veh=ratiotheta_SD_First_Half_veh(~isnan(ratiotheta_SD_First_Half_veh));
ratiotheta_SD_First_Half_rgs=ratiotheta_SD_First_Half_rgs(~isnan(ratiotheta_SD_First_Half_rgs));
ratiotheta_SD_First_Half_mean_veh = mean(ratiotheta_SD_First_Half_veh);
ratiotheta_SD_First_Half_mean_rgs = mean(ratiotheta_SD_First_Half_rgs);
ratiotheta_SD_First_Half_rgs_SEM = (std(ratiotheta_SD_First_Half_rgs)/sqrt(length(ratiotheta_SD_First_Half_rgs)));
ratiotheta_SD_First_Half_veh_SEM = (std(ratiotheta_SD_First_Half_veh)/sqrt(length(ratiotheta_SD_First_Half_veh)));
save(strcat('ratiotheta_SD_First_Half_Mean_VEH_',stage,'_','HC','_',barea),'ratiotheta_SD_First_Half_mean_veh')
save(strcat('ratiotheta_SD_First_Half_Mean_RGS14_',stage,'_','HC','_',barea),'ratiotheta_SD_First_Half_mean_rgs')
save(strcat('ratiotheta_SD_First_Half_RGS14_SEM_',stage,'_','HC','_',barea),'ratiotheta_SD_First_Half_rgs_SEM')
save(strcat('ratiotheta_SD_First_Half_VEH_SEM_',stage,'_','HC','_',barea),'ratiotheta_SD_First_Half_veh_SEM')
ratiotheta_total_veh_hc=ratiotheta_SD_First_Half_veh';
ratiotheta_total_rgs_hc=ratiotheta_SD_First_Half_rgs';

ratiotheta_SD_First_Half_veh=[];
ratiotheta_SD_First_Half_rgs=[];
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
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiotheta_SD_First_Half_veh=ratiotheta_SD_First_Half_veh(~isnan(ratiotheta_SD_First_Half_veh));
ratiotheta_SD_First_Half_rgs=ratiotheta_SD_First_Half_rgs(~isnan(ratiotheta_SD_First_Half_rgs));
ratiotheta_SD_First_Half_mean_veh = mean(ratiotheta_SD_First_Half_veh);
ratiotheta_SD_First_Half_mean_rgs = mean(ratiotheta_SD_First_Half_rgs);
ratiotheta_SD_First_Half_rgs_SEM = (std(ratiotheta_SD_First_Half_rgs)/sqrt(length(ratiotheta_SD_First_Half_rgs)));
ratiotheta_SD_First_Half_veh_SEM = (std(ratiotheta_SD_First_Half_veh)/sqrt(length(ratiotheta_SD_First_Half_veh)));
save(strcat('ratiotheta_SD_First_Half_Mean_VEH_',stage,'_','OD','_',barea),'ratiotheta_SD_First_Half_mean_veh')
save(strcat('ratiotheta_SD_First_Half_Mean_RGS14_',stage,'_','OD','_',barea),'ratiotheta_SD_First_Half_mean_rgs')
save(strcat('ratiotheta_SD_First_Half_RGS14_SEM_',stage,'_','OD','_',barea),'ratiotheta_SD_First_Half_rgs_SEM')
save(strcat('ratiotheta_SD_First_Half_VEH_SEM_',stage,'_','OD','_',barea),'ratiotheta_SD_First_Half_veh_SEM')
ratiotheta_total_veh_od=ratiotheta_SD_First_Half_veh';
ratiotheta_total_rgs_od=ratiotheta_SD_First_Half_rgs';

ratiotheta_SD_First_Half_veh=[];
ratiotheta_SD_First_Half_rgs=[];
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
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end
                    else
                        if (contains(st{y}, 'ratiotheta_SD_First_Half_') && contains(st{y}, barea) && contains(st{y}, stage) && ~contains(st{y}, 'NREM'))
                             ratiotheta_SD_First_Half=load(st{y});
                             ratiotheta_SD_First_Half=ratiotheta_SD_First_Half.ratiotheta_sd1;
                             if k==1 || k==2 || k==5 || k==8
                                ratiotheta_SD_First_Half_veh = [ratiotheta_SD_First_Half_veh ratiotheta_SD_First_Half];
                             else
                                ratiotheta_SD_First_Half_rgs = [ratiotheta_SD_First_Half_rgs ratiotheta_SD_First_Half]; 
                             end
                        end                        
                    end
                end
                
                
                
            cd ..
        end
        
    end
        cd ..
end
ratiotheta_SD_First_Half_veh=ratiotheta_SD_First_Half_veh(~isnan(ratiotheta_SD_First_Half_veh));
ratiotheta_SD_First_Half_rgs=ratiotheta_SD_First_Half_rgs(~isnan(ratiotheta_SD_First_Half_rgs));
ratiotheta_SD_First_Half_mean_veh = mean(ratiotheta_SD_First_Half_veh);
ratiotheta_SD_First_Half_mean_rgs = mean(ratiotheta_SD_First_Half_rgs);
ratiotheta_SD_First_Half_rgs_SEM = (std(ratiotheta_SD_First_Half_rgs)/sqrt(length(ratiotheta_SD_First_Half_rgs)));
ratiotheta_SD_First_Half_veh_SEM = (std(ratiotheta_SD_First_Half_veh)/sqrt(length(ratiotheta_SD_First_Half_veh)));
save(strcat('ratiotheta_SD_First_Half_Mean_VEH_',stage,'_','OR','_',barea),'ratiotheta_SD_First_Half_mean_veh')
save(strcat('ratiotheta_SD_First_Half_Mean_RGS14_',stage,'_','OR','_',barea),'ratiotheta_SD_First_Half_mean_rgs')
save(strcat('ratiotheta_SD_First_Half_RGS14_SEM_',stage,'_','OR','_',barea),'ratiotheta_SD_First_Half_rgs_SEM')
save(strcat('ratiotheta_SD_First_Half_VEH_SEM_',stage,'_','OR','_',barea),'ratiotheta_SD_First_Half_veh_SEM')
ratiotheta_total_veh_or=ratiotheta_SD_First_Half_veh';
ratiotheta_total_rgs_or=ratiotheta_SD_First_Half_rgs';
Rat13=[ratiotheta_total_veh_con(1,1);ratiotheta_total_veh_hc(1,1);ratiotheta_total_veh_od(1,1);ratiotheta_total_veh_or(1,1);ratiotheta_total_rgs_con(1,1);ratiotheta_total_rgs_hc(1,1);ratiotheta_total_rgs_od(1,1);ratiotheta_total_rgs_or(1,1)];
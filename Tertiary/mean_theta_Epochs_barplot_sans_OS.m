clear variables
cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')

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

iCON=[];
iHC=[];
iOD=[];
iOR=[];
err_CON=[];
err_HC=[];
err_OD=[];
err_OR=[];

% st=dir;
% st={st.name};
% 
% for y=1:length(st)
%     if ss ~= 5
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
%             ratiotheta_OS_CON=load(st{y});
%             ratiotheta_OS_CON=ratiotheta_OS_CON.ratiotheta_SD_First_Half_mean;
%             iCON=[iCON ratiotheta_OS_CON];
%         end
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
%             ratiotheta_OS_CON_SEM=load(st{y});
%             ratiotheta_OS_CON_SEM=ratiotheta_OS_CON_SEM.ratiotheta_SD_First_Half_SEM;
%             err_CON=[err_CON ratiotheta_OS_CON_SEM];
%         end
%     else
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_CON=load(st{y});
%             ratiotheta_OS_CON=ratiotheta_OS_CON.ratiotheta_SD_First_Half_mean;
%             iCON=[iCON ratiotheta_OS_CON];
%         end
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_CON_SEM=load(st{y});
%             ratiotheta_OS_CON_SEM=ratiotheta_OS_CON_SEM.ratiotheta_SD_First_Half_SEM;
%             err_CON=[err_CON ratiotheta_OS_CON_SEM];
%         end
%     end
% end
% 
% for y=1:length(st)
%     if ss ~= 5
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
%             ratiotheta_OS_HC=load(st{y});
%             ratiotheta_OS_HC=ratiotheta_OS_HC.ratiotheta_SD_First_Half_mean;
%             iHC=[iHC ratiotheta_OS_HC];
%         end
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
%             ratiotheta_OS_HC_SEM=load(st{y});
%             ratiotheta_OS_HC_SEM=ratiotheta_OS_HC_SEM.ratiotheta_SD_First_Half_SEM;
%             err_HC=[err_HC ratiotheta_OS_HC_SEM];
%         end
%     else
%        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_HC=load(st{y});
%             ratiotheta_OS_HC=ratiotheta_OS_HC.ratiotheta_SD_First_Half_mean;
%             iHC=[iHC ratiotheta_OS_HC];
%        end 
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_HC_SEM=load(st{y});
%             ratiotheta_OS_HC_SEM=ratiotheta_OS_HC_SEM.ratiotheta_SD_First_Half_SEM;
%             err_HC=[err_HC ratiotheta_OS_HC_SEM];
%         end
%     end
% end
% 
% for y=1:length(st)
%     if ss ~= 5
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
%             ratiotheta_OS_OD=load(st{y});
%             ratiotheta_OS_OD=ratiotheta_OS_OD.ratiotheta_SD_First_Half_mean;
%             iOD=[iOD ratiotheta_OS_OD];
%         end
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
%             ratiotheta_OS_OD_SEM=load(st{y});
%             ratiotheta_OS_OD_SEM=ratiotheta_OS_OD_SEM.ratiotheta_SD_First_Half_SEM;
%             err_OD=[err_OD ratiotheta_OS_OD_SEM];
%         end
%     else
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_OD=load(st{y});
%             ratiotheta_OS_OD=ratiotheta_OS_OD.ratiotheta_SD_First_Half_mean;
%             iOD=[iOD ratiotheta_OS_OD];
%         end 
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_OD_SEM=load(st{y});
%             ratiotheta_OS_OD_SEM=ratiotheta_OS_OD_SEM.ratiotheta_SD_First_Half_SEM;
%             err_OD=[err_OD ratiotheta_OS_OD_SEM];
%         end
%     end
% end
% 
% for y=1:length(st)
%     if ss~=5
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
%             ratiotheta_OS_OR=load(st{y});
%             ratiotheta_OS_OR=ratiotheta_OS_OR.ratiotheta_SD_First_Half_mean;
%             iOR=[iOR ratiotheta_OS_OR];
%         end
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
%             ratiotheta_OS_OR_SEM=load(st{y});
%             ratiotheta_OS_OR_SEM=ratiotheta_OS_OR_SEM.ratiotheta_SD_First_Half_SEM;
%             err_OR=[err_OR ratiotheta_OS_OR_SEM];
%         end
%     else
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_OR=load(st{y});
%             ratiotheta_OS_OR=ratiotheta_OS_OR.ratiotheta_SD_First_Half_mean;
%             iOR=[iOR ratiotheta_OS_OR];
%         end
%         if (contains(st{y}, 'ratiotheta_SD_First_Half_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
%             ratiotheta_OS_OR_SEM=load(st{y});
%             ratiotheta_OS_OR_SEM=ratiotheta_OS_OR_SEM.ratiotheta_SD_First_Half_SEM;
%             err_OR=[err_OR ratiotheta_OS_OR_SEM];
%         end
%     end
% end

cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')

st=dir;
st={st.name};

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_CON=load(st{y});
            ratiotheta_VEH_CON=ratiotheta_VEH_CON.ratiotheta_SD_First_Half_mean_veh;
            iCON=[iCON ratiotheta_VEH_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiotheta_VEH_CON_SEM=load(st{y});
            ratiotheta_VEH_CON_SEM=ratiotheta_VEH_CON_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_CON=[err_CON ratiotheta_VEH_CON_SEM];
        end
            
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_CON=load(st{y});
            ratiotheta_VEH_CON=ratiotheta_VEH_CON.ratiotheta_SD_First_Half_mean_veh;
            iCON=[iCON ratiotheta_VEH_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_CON_SEM=load(st{y});
            ratiotheta_VEH_CON_SEM=ratiotheta_VEH_CON_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_CON=[err_CON ratiotheta_VEH_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_HC=load(st{y});
            ratiotheta_VEH_HC=ratiotheta_VEH_HC.ratiotheta_SD_First_Half_mean_veh;
            iHC=[iHC ratiotheta_VEH_HC];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiotheta_VEH_HC_SEM=load(st{y});
            ratiotheta_VEH_HC_SEM=ratiotheta_VEH_HC_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_HC=[err_HC ratiotheta_VEH_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiotheta_VEH_HC=load(st{y});
            ratiotheta_VEH_HC=ratiotheta_VEH_HC.ratiotheta_SD_First_Half_mean_veh;
            iHC=[iHC ratiotheta_VEH_HC];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_HC_SEM=load(st{y});
            ratiotheta_VEH_HC_SEM=ratiotheta_VEH_HC_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_HC=[err_HC ratiotheta_VEH_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_OD=load(st{y});
            ratiotheta_VEH_OD=ratiotheta_VEH_OD.ratiotheta_SD_First_Half_mean_veh;
            iOD=[iOD ratiotheta_VEH_OD];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiotheta_VEH_OD_SEM=load(st{y});
            ratiotheta_VEH_OD_SEM=ratiotheta_VEH_OD_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_OD=[err_OD ratiotheta_VEH_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_OD=load(st{y});
            ratiotheta_VEH_OD=ratiotheta_VEH_OD.ratiotheta_SD_First_Half_mean_veh;
            iOD=[iOD ratiotheta_VEH_OD];        
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_OD_SEM=load(st{y});
            ratiotheta_VEH_OD_SEM=ratiotheta_VEH_OD_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_OD=[err_OD ratiotheta_VEH_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_OR=load(st{y});
            ratiotheta_VEH_OR=ratiotheta_VEH_OR.ratiotheta_SD_First_Half_mean_veh;
            iOR=[iOR ratiotheta_VEH_OR];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiotheta_VEH_OR_SEM=load(st{y});
            ratiotheta_VEH_OR_SEM=ratiotheta_VEH_OR_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_OR=[err_OR ratiotheta_VEH_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiotheta_VEH_OR=load(st{y});
            ratiotheta_VEH_OR=ratiotheta_VEH_OR.ratiotheta_SD_First_Half_mean_veh;
            iOR=[iOR ratiotheta_VEH_OR];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_OR_SEM=load(st{y});
            ratiotheta_VEH_OR_SEM=ratiotheta_VEH_OR_SEM.ratiotheta_SD_First_Half_veh_SEM;
            err_OR=[err_OR ratiotheta_VEH_OR_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_CON=load(st{y});
            ratiotheta_RGS_CON=ratiotheta_RGS_CON.ratiotheta_SD_First_Half_mean_rgs;
            iCON=[iCON ratiotheta_RGS_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiotheta_RGS_CON_SEM=load(st{y});
            ratiotheta_RGS_CON_SEM=ratiotheta_RGS_CON_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_CON=[err_CON ratiotheta_RGS_CON_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_CON=load(st{y});
            ratiotheta_RGS_CON=ratiotheta_RGS_CON.ratiotheta_SD_First_Half_mean_rgs;
            iCON=[iCON ratiotheta_RGS_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_CON_SEM=load(st{y});
            ratiotheta_RGS_CON_SEM=ratiotheta_RGS_CON_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_CON=[err_CON ratiotheta_RGS_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_HC=load(st{y});
            ratiotheta_RGS_HC=ratiotheta_RGS_HC.ratiotheta_SD_First_Half_mean_rgs;
            iHC=[iHC ratiotheta_RGS_HC];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiotheta_RGS_HC_SEM=load(st{y});
            ratiotheta_RGS_HC_SEM=ratiotheta_RGS_HC_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_HC=[err_HC ratiotheta_RGS_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_HC=load(st{y});
            ratiotheta_RGS_HC=ratiotheta_RGS_HC.ratiotheta_SD_First_Half_mean_rgs;
            iHC=[iHC ratiotheta_RGS_HC];
        end      
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_HC_SEM=load(st{y});
            ratiotheta_RGS_HC_SEM=ratiotheta_RGS_HC_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_HC=[err_HC ratiotheta_RGS_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_OD=load(st{y});
            ratiotheta_RGS_OD=ratiotheta_RGS_OD.ratiotheta_SD_First_Half_mean_rgs;
            iOD=[iOD ratiotheta_RGS_OD];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiotheta_RGS_OD_SEM=load(st{y});
            ratiotheta_RGS_OD_SEM=ratiotheta_RGS_OD_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_OD=[err_OD ratiotheta_RGS_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OD=load(st{y});
            ratiotheta_RGS_OD=ratiotheta_RGS_OD.ratiotheta_SD_First_Half_mean_rgs;
            iOD=[iOD ratiotheta_RGS_OD];
        end 
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OD_SEM=load(st{y});
            ratiotheta_RGS_OD_SEM=ratiotheta_RGS_OD_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_OD=[err_OD ratiotheta_RGS_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_OR=load(st{y});
            ratiotheta_RGS_OR=ratiotheta_RGS_OR.ratiotheta_SD_First_Half_mean_rgs;
            iOR=[iOR ratiotheta_RGS_OR];
        end
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiotheta_RGS_OR_SEM=load(st{y});
            ratiotheta_RGS_OR_SEM=ratiotheta_RGS_OR_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_OR=[err_OR ratiotheta_RGS_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_First_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OR=load(st{y});
            ratiotheta_RGS_OR=ratiotheta_RGS_OR.ratiotheta_SD_First_Half_mean_rgs;
            iOR=[iOR ratiotheta_RGS_OR];
        end      
        if (contains(st{y}, 'ratiotheta_SD_First_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OR_SEM=load(st{y});
            ratiotheta_RGS_OR_SEM=ratiotheta_RGS_OR_SEM.ratiotheta_SD_First_Half_rgs_SEM;
            err_OR=[err_OR ratiotheta_RGS_OR_SEM];
        end
    end
end



for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_CON=load(st{y});
            ratiotheta_VEH_CON=ratiotheta_VEH_CON.ratiotheta_SD_Second_Half_mean_veh;
            iCON=[iCON ratiotheta_VEH_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiotheta_VEH_CON_SEM=load(st{y});
            ratiotheta_VEH_CON_SEM=ratiotheta_VEH_CON_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_CON=[err_CON ratiotheta_VEH_CON_SEM];
        end
            
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_CON=load(st{y});
            ratiotheta_VEH_CON=ratiotheta_VEH_CON.ratiotheta_SD_Second_Half_mean_veh;
            iCON=[iCON ratiotheta_VEH_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_CON_SEM=load(st{y});
            ratiotheta_VEH_CON_SEM=ratiotheta_VEH_CON_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_CON=[err_CON ratiotheta_VEH_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_HC=load(st{y});
            ratiotheta_VEH_HC=ratiotheta_VEH_HC.ratiotheta_SD_Second_Half_mean_veh;
            iHC=[iHC ratiotheta_VEH_HC];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiotheta_VEH_HC_SEM=load(st{y});
            ratiotheta_VEH_HC_SEM=ratiotheta_VEH_HC_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_HC=[err_HC ratiotheta_VEH_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiotheta_VEH_HC=load(st{y});
            ratiotheta_VEH_HC=ratiotheta_VEH_HC.ratiotheta_SD_Second_Half_mean_veh;
            iHC=[iHC ratiotheta_VEH_HC];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_HC_SEM=load(st{y});
            ratiotheta_VEH_HC_SEM=ratiotheta_VEH_HC_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_HC=[err_HC ratiotheta_VEH_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_OD=load(st{y});
            ratiotheta_VEH_OD=ratiotheta_VEH_OD.ratiotheta_SD_Second_Half_mean_veh;
            iOD=[iOD ratiotheta_VEH_OD];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiotheta_VEH_OD_SEM=load(st{y});
            ratiotheta_VEH_OD_SEM=ratiotheta_VEH_OD_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_OD=[err_OD ratiotheta_VEH_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_OD=load(st{y});
            ratiotheta_VEH_OD=ratiotheta_VEH_OD.ratiotheta_SD_Second_Half_mean_veh;
            iOD=[iOD ratiotheta_VEH_OD];        
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_OD_SEM=load(st{y});
            ratiotheta_VEH_OD_SEM=ratiotheta_VEH_OD_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_OD=[err_OD ratiotheta_VEH_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH'))
            ratiotheta_VEH_OR=load(st{y});
            ratiotheta_VEH_OR=ratiotheta_VEH_OR.ratiotheta_SD_Second_Half_mean_veh;
            iOR=[iOR ratiotheta_VEH_OR];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiotheta_VEH_OR_SEM=load(st{y});
            ratiotheta_VEH_OR_SEM=ratiotheta_VEH_OR_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_OR=[err_OR ratiotheta_VEH_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiotheta_VEH_OR=load(st{y});
            ratiotheta_VEH_OR=ratiotheta_VEH_OR.ratiotheta_SD_Second_Half_mean_veh;
            iOR=[iOR ratiotheta_VEH_OR];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiotheta_VEH_OR_SEM=load(st{y});
            ratiotheta_VEH_OR_SEM=ratiotheta_VEH_OR_SEM.ratiotheta_SD_Second_Half_veh_SEM;
            err_OR=[err_OR ratiotheta_VEH_OR_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_CON=load(st{y});
            ratiotheta_RGS_CON=ratiotheta_RGS_CON.ratiotheta_SD_Second_Half_mean_rgs;
            iCON=[iCON ratiotheta_RGS_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiotheta_RGS_CON_SEM=load(st{y});
            ratiotheta_RGS_CON_SEM=ratiotheta_RGS_CON_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_CON=[err_CON ratiotheta_RGS_CON_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_CON=load(st{y});
            ratiotheta_RGS_CON=ratiotheta_RGS_CON.ratiotheta_SD_Second_Half_mean_rgs;
            iCON=[iCON ratiotheta_RGS_CON];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_CON_SEM=load(st{y});
            ratiotheta_RGS_CON_SEM=ratiotheta_RGS_CON_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_CON=[err_CON ratiotheta_RGS_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_HC=load(st{y});
            ratiotheta_RGS_HC=ratiotheta_RGS_HC.ratiotheta_SD_Second_Half_mean_rgs;
            iHC=[iHC ratiotheta_RGS_HC];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiotheta_RGS_HC_SEM=load(st{y});
            ratiotheta_RGS_HC_SEM=ratiotheta_RGS_HC_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_HC=[err_HC ratiotheta_RGS_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_HC=load(st{y});
            ratiotheta_RGS_HC=ratiotheta_RGS_HC.ratiotheta_SD_Second_Half_mean_rgs;
            iHC=[iHC ratiotheta_RGS_HC];
        end      
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_HC_SEM=load(st{y});
            ratiotheta_RGS_HC_SEM=ratiotheta_RGS_HC_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_HC=[err_HC ratiotheta_RGS_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_OD=load(st{y});
            ratiotheta_RGS_OD=ratiotheta_RGS_OD.ratiotheta_SD_Second_Half_mean_rgs;
            iOD=[iOD ratiotheta_RGS_OD];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiotheta_RGS_OD_SEM=load(st{y});
            ratiotheta_RGS_OD_SEM=ratiotheta_RGS_OD_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_OD=[err_OD ratiotheta_RGS_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OD=load(st{y});
            ratiotheta_RGS_OD=ratiotheta_RGS_OD.ratiotheta_SD_Second_Half_mean_rgs;
            iOD=[iOD ratiotheta_RGS_OD];
        end 
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OD_SEM=load(st{y});
            ratiotheta_RGS_OD_SEM=ratiotheta_RGS_OD_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_OD=[err_OD ratiotheta_RGS_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14'))
            ratiotheta_RGS_OR=load(st{y});
            ratiotheta_RGS_OR=ratiotheta_RGS_OR.ratiotheta_SD_Second_Half_mean_rgs;
            iOR=[iOR ratiotheta_RGS_OR];
        end
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiotheta_RGS_OR_SEM=load(st{y});
            ratiotheta_RGS_OR_SEM=ratiotheta_RGS_OR_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_OR=[err_OR ratiotheta_RGS_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OR=load(st{y});
            ratiotheta_RGS_OR=ratiotheta_RGS_OR.ratiotheta_SD_Second_Half_mean_rgs;
            iOR=[iOR ratiotheta_RGS_OR];
        end      
        if (contains(st{y}, 'ratiotheta_SD_Second_Half_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiotheta_RGS_OR_SEM=load(st{y});
            ratiotheta_RGS_OR_SEM=ratiotheta_RGS_OR_SEM.ratiotheta_SD_Second_Half_rgs_SEM;
            err_OR=[err_OR ratiotheta_RGS_OR_SEM];
        end
    end
end




data=[iCON;iOD;iOR;iHC];
labels={'CON';'OD';'OR';'HC'};
errlow=[err_CON;err_OD;err_OR;err_HC];
errhigh=[err_CON;err_OD;err_OR;err_HC];
bargraph=bar(data);
set(gca,'xticklabel',labels)
ylim([0 1])
hold on
ngroups = size(data, 1);
nbars = size(data, 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, data(:,i), errhigh(:,i), '.');
end
hold off
legend('VEH_SD_First_Half','RGS14_SD_First_Half','VEH_SD_Second_Half','RGS14_SD_Second_Half')
title(['Theta Frequencies ' stage ' ' barea])
cd ..
cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Plots/Power Analysis bar plots sans OS')

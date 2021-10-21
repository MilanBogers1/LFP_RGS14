clear variables
cd('/media/genzel/Data/Milan_DA/OS_ephys_da/Data_downsampled_First_Session')

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
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
%             ratiodelta_OS_CON=load(st{y});
%             ratiodelta_OS_CON=ratiodelta_OS_CON.ratiodelta_PT1_4_mean;
%             iCON=[iCON ratiodelta_OS_CON];
%         end
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
%             ratiodelta_OS_CON_SEM=load(st{y});
%             ratiodelta_OS_CON_SEM=ratiodelta_OS_CON_SEM.ratiodelta_PT1_4_SEM;
%             err_CON=[err_CON ratiodelta_OS_CON_SEM];
%         end
%     else
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_CON=load(st{y});
%             ratiodelta_OS_CON=ratiodelta_OS_CON.ratiodelta_PT1_4_mean;
%             iCON=[iCON ratiodelta_OS_CON];
%         end
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_CON_SEM=load(st{y});
%             ratiodelta_OS_CON_SEM=ratiodelta_OS_CON_SEM.ratiodelta_PT1_4_SEM;
%             err_CON=[err_CON ratiodelta_OS_CON_SEM];
%         end
%     end
% end
% 
% for y=1:length(st)
%     if ss ~= 5
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
%             ratiodelta_OS_HC=load(st{y});
%             ratiodelta_OS_HC=ratiodelta_OS_HC.ratiodelta_PT1_4_mean;
%             iHC=[iHC ratiodelta_OS_HC];
%         end
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
%             ratiodelta_OS_HC_SEM=load(st{y});
%             ratiodelta_OS_HC_SEM=ratiodelta_OS_HC_SEM.ratiodelta_PT1_4_SEM;
%             err_HC=[err_HC ratiodelta_OS_HC_SEM];
%         end
%     else
%        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_HC=load(st{y});
%             ratiodelta_OS_HC=ratiodelta_OS_HC.ratiodelta_PT1_4_mean;
%             iHC=[iHC ratiodelta_OS_HC];
%        end 
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_HC_SEM=load(st{y});
%             ratiodelta_OS_HC_SEM=ratiodelta_OS_HC_SEM.ratiodelta_PT1_4_SEM;
%             err_HC=[err_HC ratiodelta_OS_HC_SEM];
%         end
%     end
% end
% 
% for y=1:length(st)
%     if ss ~= 5
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
%             ratiodelta_OS_OD=load(st{y});
%             ratiodelta_OS_OD=ratiodelta_OS_OD.ratiodelta_PT1_4_mean;
%             iOD=[iOD ratiodelta_OS_OD];
%         end
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
%             ratiodelta_OS_OD_SEM=load(st{y});
%             ratiodelta_OS_OD_SEM=ratiodelta_OS_OD_SEM.ratiodelta_PT1_4_SEM;
%             err_OD=[err_OD ratiodelta_OS_OD_SEM];
%         end
%     else
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_OD=load(st{y});
%             ratiodelta_OS_OD=ratiodelta_OS_OD.ratiodelta_PT1_4_mean;
%             iOD=[iOD ratiodelta_OS_OD];
%         end 
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_OD_SEM=load(st{y});
%             ratiodelta_OS_OD_SEM=ratiodelta_OS_OD_SEM.ratiodelta_PT1_4_SEM;
%             err_OD=[err_OD ratiodelta_OS_OD_SEM];
%         end
%     end
% end
% 
% for y=1:length(st)
%     if ss~=5
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
%             ratiodelta_OS_OR=load(st{y});
%             ratiodelta_OS_OR=ratiodelta_OS_OR.ratiodelta_PT1_4_mean;
%             iOR=[iOR ratiodelta_OS_OR];
%         end
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
%             ratiodelta_OS_OR_SEM=load(st{y});
%             ratiodelta_OS_OR_SEM=ratiodelta_OS_OR_SEM.ratiodelta_PT1_4_SEM;
%             err_OR=[err_OR ratiodelta_OS_OR_SEM];
%         end
%     else
%         if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_OR=load(st{y});
%             ratiodelta_OS_OR=ratiodelta_OS_OR.ratiodelta_PT1_4_mean;
%             iOR=[iOR ratiodelta_OS_OR];
%         end
%         if (contains(st{y}, 'ratiodelta_PT1_4_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
%             ratiodelta_OS_OR_SEM=load(st{y});
%             ratiodelta_OS_OR_SEM=ratiodelta_OS_OR_SEM.ratiodelta_PT1_4_SEM;
%             err_OR=[err_OR ratiodelta_OS_OR_SEM];
%         end
%     end
% end

cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')

st=dir;
st={st.name};

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_CON=load(st{y});
            ratiodelta_VEH_CON=ratiodelta_VEH_CON.ratiodelta_PT1_4_mean_veh;
            iCON=[iCON ratiodelta_VEH_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiodelta_VEH_CON_SEM=load(st{y});
            ratiodelta_VEH_CON_SEM=ratiodelta_VEH_CON_SEM.ratiodelta_PT1_4_veh_SEM;
            err_CON=[err_CON ratiodelta_VEH_CON_SEM];
        end
            
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_CON=load(st{y});
            ratiodelta_VEH_CON=ratiodelta_VEH_CON.ratiodelta_PT1_4_mean_veh;
            iCON=[iCON ratiodelta_VEH_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_CON_SEM=load(st{y});
            ratiodelta_VEH_CON_SEM=ratiodelta_VEH_CON_SEM.ratiodelta_PT1_4_veh_SEM;
            err_CON=[err_CON ratiodelta_VEH_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_HC=load(st{y});
            ratiodelta_VEH_HC=ratiodelta_VEH_HC.ratiodelta_PT1_4_mean_veh;
            iHC=[iHC ratiodelta_VEH_HC];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiodelta_VEH_HC_SEM=load(st{y});
            ratiodelta_VEH_HC_SEM=ratiodelta_VEH_HC_SEM.ratiodelta_PT1_4_veh_SEM;
            err_HC=[err_HC ratiodelta_VEH_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiodelta_VEH_HC=load(st{y});
            ratiodelta_VEH_HC=ratiodelta_VEH_HC.ratiodelta_PT1_4_mean_veh;
            iHC=[iHC ratiodelta_VEH_HC];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_HC_SEM=load(st{y});
            ratiodelta_VEH_HC_SEM=ratiodelta_VEH_HC_SEM.ratiodelta_PT1_4_veh_SEM;
            err_HC=[err_HC ratiodelta_VEH_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_OD=load(st{y});
            ratiodelta_VEH_OD=ratiodelta_VEH_OD.ratiodelta_PT1_4_mean_veh;
            iOD=[iOD ratiodelta_VEH_OD];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiodelta_VEH_OD_SEM=load(st{y});
            ratiodelta_VEH_OD_SEM=ratiodelta_VEH_OD_SEM.ratiodelta_PT1_4_veh_SEM;
            err_OD=[err_OD ratiodelta_VEH_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_OD=load(st{y});
            ratiodelta_VEH_OD=ratiodelta_VEH_OD.ratiodelta_PT1_4_mean_veh;
            iOD=[iOD ratiodelta_VEH_OD];        
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_OD_SEM=load(st{y});
            ratiodelta_VEH_OD_SEM=ratiodelta_VEH_OD_SEM.ratiodelta_PT1_4_veh_SEM;
            err_OD=[err_OD ratiodelta_VEH_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_OR=load(st{y});
            ratiodelta_VEH_OR=ratiodelta_VEH_OR.ratiodelta_PT1_4_mean_veh;
            iOR=[iOR ratiodelta_VEH_OR];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiodelta_VEH_OR_SEM=load(st{y});
            ratiodelta_VEH_OR_SEM=ratiodelta_VEH_OR_SEM.ratiodelta_PT1_4_veh_SEM;
            err_OR=[err_OR ratiodelta_VEH_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiodelta_VEH_OR=load(st{y});
            ratiodelta_VEH_OR=ratiodelta_VEH_OR.ratiodelta_PT1_4_mean_veh;
            iOR=[iOR ratiodelta_VEH_OR];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_OR_SEM=load(st{y});
            ratiodelta_VEH_OR_SEM=ratiodelta_VEH_OR_SEM.ratiodelta_PT1_4_veh_SEM;
            err_OR=[err_OR ratiodelta_VEH_OR_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_CON=load(st{y});
            ratiodelta_RGS_CON=ratiodelta_RGS_CON.ratiodelta_PT1_4_mean_rgs;
            iCON=[iCON ratiodelta_RGS_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiodelta_RGS_CON_SEM=load(st{y});
            ratiodelta_RGS_CON_SEM=ratiodelta_RGS_CON_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_CON=[err_CON ratiodelta_RGS_CON_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_CON=load(st{y});
            ratiodelta_RGS_CON=ratiodelta_RGS_CON.ratiodelta_PT1_4_mean_rgs;
            iCON=[iCON ratiodelta_RGS_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_CON_SEM=load(st{y});
            ratiodelta_RGS_CON_SEM=ratiodelta_RGS_CON_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_CON=[err_CON ratiodelta_RGS_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_HC=load(st{y});
            ratiodelta_RGS_HC=ratiodelta_RGS_HC.ratiodelta_PT1_4_mean_rgs;
            iHC=[iHC ratiodelta_RGS_HC];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiodelta_RGS_HC_SEM=load(st{y});
            ratiodelta_RGS_HC_SEM=ratiodelta_RGS_HC_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_HC=[err_HC ratiodelta_RGS_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_HC=load(st{y});
            ratiodelta_RGS_HC=ratiodelta_RGS_HC.ratiodelta_PT1_4_mean_rgs;
            iHC=[iHC ratiodelta_RGS_HC];
        end      
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_HC_SEM=load(st{y});
            ratiodelta_RGS_HC_SEM=ratiodelta_RGS_HC_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_HC=[err_HC ratiodelta_RGS_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_OD=load(st{y});
            ratiodelta_RGS_OD=ratiodelta_RGS_OD.ratiodelta_PT1_4_mean_rgs;
            iOD=[iOD ratiodelta_RGS_OD];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiodelta_RGS_OD_SEM=load(st{y});
            ratiodelta_RGS_OD_SEM=ratiodelta_RGS_OD_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_OD=[err_OD ratiodelta_RGS_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OD=load(st{y});
            ratiodelta_RGS_OD=ratiodelta_RGS_OD.ratiodelta_PT1_4_mean_rgs;
            iOD=[iOD ratiodelta_RGS_OD];
        end 
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OD_SEM=load(st{y});
            ratiodelta_RGS_OD_SEM=ratiodelta_RGS_OD_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_OD=[err_OD ratiodelta_RGS_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_OR=load(st{y});
            ratiodelta_RGS_OR=ratiodelta_RGS_OR.ratiodelta_PT1_4_mean_rgs;
            iOR=[iOR ratiodelta_RGS_OR];
        end
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiodelta_RGS_OR_SEM=load(st{y});
            ratiodelta_RGS_OR_SEM=ratiodelta_RGS_OR_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_OR=[err_OR ratiodelta_RGS_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT1_4_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OR=load(st{y});
            ratiodelta_RGS_OR=ratiodelta_RGS_OR.ratiodelta_PT1_4_mean_rgs;
            iOR=[iOR ratiodelta_RGS_OR];
        end      
        if (contains(st{y}, 'ratiodelta_PT1_4_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OR_SEM=load(st{y});
            ratiodelta_RGS_OR_SEM=ratiodelta_RGS_OR_SEM.ratiodelta_PT1_4_rgs_SEM;
            err_OR=[err_OR ratiodelta_RGS_OR_SEM];
        end
    end
end



for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_CON=load(st{y});
            ratiodelta_VEH_CON=ratiodelta_VEH_CON.ratiodelta_PT5_mean_veh;
            iCON=[iCON ratiodelta_VEH_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiodelta_VEH_CON_SEM=load(st{y});
            ratiodelta_VEH_CON_SEM=ratiodelta_VEH_CON_SEM.ratiodelta_PT5_veh_SEM;
            err_CON=[err_CON ratiodelta_VEH_CON_SEM];
        end
            
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_CON=load(st{y});
            ratiodelta_VEH_CON=ratiodelta_VEH_CON.ratiodelta_PT5_mean_veh;
            iCON=[iCON ratiodelta_VEH_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_CON_SEM=load(st{y});
            ratiodelta_VEH_CON_SEM=ratiodelta_VEH_CON_SEM.ratiodelta_PT5_veh_SEM;
            err_CON=[err_CON ratiodelta_VEH_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_HC=load(st{y});
            ratiodelta_VEH_HC=ratiodelta_VEH_HC.ratiodelta_PT5_mean_veh;
            iHC=[iHC ratiodelta_VEH_HC];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiodelta_VEH_HC_SEM=load(st{y});
            ratiodelta_VEH_HC_SEM=ratiodelta_VEH_HC_SEM.ratiodelta_PT5_veh_SEM;
            err_HC=[err_HC ratiodelta_VEH_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiodelta_VEH_HC=load(st{y});
            ratiodelta_VEH_HC=ratiodelta_VEH_HC.ratiodelta_PT5_mean_veh;
            iHC=[iHC ratiodelta_VEH_HC];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_HC_SEM=load(st{y});
            ratiodelta_VEH_HC_SEM=ratiodelta_VEH_HC_SEM.ratiodelta_PT5_veh_SEM;
            err_HC=[err_HC ratiodelta_VEH_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_OD=load(st{y});
            ratiodelta_VEH_OD=ratiodelta_VEH_OD.ratiodelta_PT5_mean_veh;
            iOD=[iOD ratiodelta_VEH_OD];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiodelta_VEH_OD_SEM=load(st{y});
            ratiodelta_VEH_OD_SEM=ratiodelta_VEH_OD_SEM.ratiodelta_PT5_veh_SEM;
            err_OD=[err_OD ratiodelta_VEH_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'VEH') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_OD=load(st{y});
            ratiodelta_VEH_OD=ratiodelta_VEH_OD.ratiodelta_PT5_mean_veh;
            iOD=[iOD ratiodelta_VEH_OD];        
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_OD_SEM=load(st{y});
            ratiodelta_VEH_OD_SEM=ratiodelta_VEH_OD_SEM.ratiodelta_PT5_veh_SEM;
            err_OD=[err_OD ratiodelta_VEH_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH'))
            ratiodelta_VEH_OR=load(st{y});
            ratiodelta_VEH_OR=ratiodelta_VEH_OR.ratiodelta_PT5_mean_veh;
            iOR=[iOR ratiodelta_VEH_OR];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiodelta_VEH_OR_SEM=load(st{y});
            ratiodelta_VEH_OR_SEM=ratiodelta_VEH_OR_SEM.ratiodelta_PT5_veh_SEM;
            err_OR=[err_OR ratiodelta_VEH_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'VEH') && ~contains(st{y},'NREM'))
            ratiodelta_VEH_OR=load(st{y});
            ratiodelta_VEH_OR=ratiodelta_VEH_OR.ratiodelta_PT5_mean_veh;
            iOR=[iOR ratiodelta_VEH_OR];
        end
        if (contains(st{y}, 'ratiodelta_PT5_VEH_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiodelta_VEH_OR_SEM=load(st{y});
            ratiodelta_VEH_OR_SEM=ratiodelta_VEH_OR_SEM.ratiodelta_PT5_veh_SEM;
            err_OR=[err_OR ratiodelta_VEH_OR_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_CON=load(st{y});
            ratiodelta_RGS_CON=ratiodelta_RGS_CON.ratiodelta_PT5_mean_rgs;
            iCON=[iCON ratiodelta_RGS_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON'))
            ratiodelta_RGS_CON_SEM=load(st{y});
            ratiodelta_RGS_CON_SEM=ratiodelta_RGS_CON_SEM.ratiodelta_PT5_rgs_SEM;
            err_CON=[err_CON ratiodelta_RGS_CON_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_CON=load(st{y});
            ratiodelta_RGS_CON=ratiodelta_RGS_CON.ratiodelta_PT5_mean_rgs;
            iCON=[iCON ratiodelta_RGS_CON];
        end
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'CON') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_CON_SEM=load(st{y});
            ratiodelta_RGS_CON_SEM=ratiodelta_RGS_CON_SEM.ratiodelta_PT5_rgs_SEM;
            err_CON=[err_CON ratiodelta_RGS_CON_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_HC=load(st{y});
            ratiodelta_RGS_HC=ratiodelta_RGS_HC.ratiodelta_PT5_mean_rgs;
            iHC=[iHC ratiodelta_RGS_HC];
        end
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC'))
            ratiodelta_RGS_HC_SEM=load(st{y});
            ratiodelta_RGS_HC_SEM=ratiodelta_RGS_HC_SEM.ratiodelta_PT5_rgs_SEM;
            err_HC=[err_HC ratiodelta_RGS_HC_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_HC=load(st{y});
            ratiodelta_RGS_HC=ratiodelta_RGS_HC.ratiodelta_PT5_mean_rgs;
            iHC=[iHC ratiodelta_RGS_HC];
        end      
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'HC') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_HC_SEM=load(st{y});
            ratiodelta_RGS_HC_SEM=ratiodelta_RGS_HC_SEM.ratiodelta_PT5_rgs_SEM;
            err_HC=[err_HC ratiodelta_RGS_HC_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_OD=load(st{y});
            ratiodelta_RGS_OD=ratiodelta_RGS_OD.ratiodelta_PT5_mean_rgs;
            iOD=[iOD ratiodelta_RGS_OD];
        end
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD'))
            ratiodelta_RGS_OD_SEM=load(st{y});
            ratiodelta_RGS_OD_SEM=ratiodelta_RGS_OD_SEM.ratiodelta_PT5_rgs_SEM;
            err_OD=[err_OD ratiodelta_RGS_OD_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OD=load(st{y});
            ratiodelta_RGS_OD=ratiodelta_RGS_OD.ratiodelta_PT5_mean_rgs;
            iOD=[iOD ratiodelta_RGS_OD];
        end 
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OD') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OD_SEM=load(st{y});
            ratiodelta_RGS_OD_SEM=ratiodelta_RGS_OD_SEM.ratiodelta_PT5_rgs_SEM;
            err_OD=[err_OD ratiodelta_RGS_OD_SEM];
        end
    end
end

for y=1:length(st)
    if ss~=5
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14'))
            ratiodelta_RGS_OR=load(st{y});
            ratiodelta_RGS_OR=ratiodelta_RGS_OR.ratiodelta_PT5_mean_rgs;
            iOR=[iOR ratiodelta_RGS_OR];
        end
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR'))
            ratiodelta_RGS_OR_SEM=load(st{y});
            ratiodelta_RGS_OR_SEM=ratiodelta_RGS_OR_SEM.ratiodelta_PT5_rgs_SEM;
            err_OR=[err_OR ratiodelta_RGS_OR_SEM];
        end
    else
        if (contains(st{y}, 'ratiodelta_PT5_Mean_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && contains(st{y}, 'RGS14') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OR=load(st{y});
            ratiodelta_RGS_OR=ratiodelta_RGS_OR.ratiodelta_PT5_mean_rgs;
            iOR=[iOR ratiodelta_RGS_OR];
        end      
        if (contains(st{y}, 'ratiodelta_PT5_RGS14_SEM_') && contains(st{y}, stage) && contains(st{y}, barea) && contains(st{y}, 'OR') && ~contains(st{y}, 'NREM'))
            ratiodelta_RGS_OR_SEM=load(st{y});
            ratiodelta_RGS_OR_SEM=ratiodelta_RGS_OR_SEM.ratiodelta_PT5_rgs_SEM;
            err_OR=[err_OR ratiodelta_RGS_OR_SEM];
        end
    end
end




data=[iCON;iOD;iOR;iHC];
labels={'CON';'OD';'OR';'HC'};
errlow=[err_CON;err_OD;err_OR;err_HC];
errhigh=[err_CON;err_OD;err_OR;err_HC];
bargraph=bar(data);
set(gca,'xticklabel',labels)
ylim([0 .8])
hold on
ngroups = size(data, 1);
nbars = size(data, 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, data(:,i), errhigh(:,i), '.');
end
hold off
legend('VEH_PT1-4','RGS14_PT1-4','VEH_PT5','RGS14_PT5')
title(['delta Frequencies ' stage ' ' barea])
cd ..
cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Plots/Power Analysis bar plots sans OS')
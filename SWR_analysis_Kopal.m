clear variables
addpath(genpath('/Volumes/Samsung_T5/Milan_DA/OS_ephys_da/CorticoHippocampal'))
addpath ('/Volumes/Samsung_T5/Milan_DA/OS_ephys_da/ADRITOOLS')
cd('/Volumes/Samsung_T5/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')
% cd('/Volumes/Samsung_T5/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled')
      yy = {'HPC'};       
      xx = {'PFC'};
      ss = 3;   %NREM
%% Threshold Offset
prompt = {'Select a threshold offset from 5SD for HPC'};
dlgtitle = 'Threshold offset HPC';
definput = {'5'};
offset1 = inputdlg(prompt,dlgtitle,[1 40],definput);

prompt = {'Select a threshold offset from 5SD for Cortex'};
dlgtitle = 'Threshold Cortex';
definput = {'5'};
offset2 = inputdlg(prompt,dlgtitle,[1 40],definput);

nr_swr_HPC = [];
nr_swr_Cortex = [];
D_all = [];
nr_cohfos_pt_animal = [];    
fn = 1000;

nr_cohfos_pt = [];
rat_folder = getfolder;
% for k=1:length(rat_folder)
for k = 8 %rat index 
    cd(rat_folder{k})    
    g=getfolder;
    total_swrs=[];
    total_hfos=[]; 
    total_swrs_minute=[];
    total_hfos_minute=[];
%xo
    ripple_phases_comp=[];
    ripple_waveforms_comp=[];
    for j=1:length(g) %study day index 
%     for j=2
        
        
        nr_cohfos_pt=zeros(1,9);
        cd(g{j})
%end
        G=getfolder;
                
%%        
%Get presleep
cfold3=[];
cfold=G(or(cellfun(@(x) ~isempty(strfind(x,'pre')),G),cellfun(@(x) ~isempty(strfind(x,'Pre')),G)));
for q=1:length(cfold)
    if (~contains(cfold{q}, 'test') && ~contains(cfold{q}, 'Test'))
        cfold3=[cfold3; cfold{q}];
    end
end
if ~isempty(cfold3)
    cfold=cellstr(cfold3)';
end

% Get post trials
cfold3=[];
cfold2=G(or(cellfun(@(x) ~isempty(strfind(x,'post')),G),cellfun(@(x) ~isempty(strfind(x,'Post')),G)));
for q=1:length(cfold2)
    if (~contains(cfold2{q}, 'test') && ~contains(cfold2{q}, 'Test'))
        cfold3=[cfold3; cfold2{q}];
    end
end
cfold2=cellstr(cfold3)';

%%
%Ignore trial 6
for ind=1:length(cfold2)
  if  ~(contains(cfold2{ind},'trial1') ||contains(cfold2{ind},'trial2')||contains(cfold2{ind},'trial3')||contains(cfold2{ind},'trial4')||contains(cfold2{ind},'trial5')...
        ||contains(cfold2{ind},'Trial1')||contains(cfold2{ind},'Trial2')||contains(cfold2{ind},'Trial3')||contains(cfold2{ind},'Trial4')||contains(cfold2{ind},'Trial5')  )
      
      cfold2{ind}=[];    
  end
end

cfold2=cfold2(~cellfun('isempty',cfold2));

G=[cfold cfold2];

        
              
        if isempty(G) 
            no_folder=1;
            %g=NaN;
        else
            no_folder=0;

            for i=1:length(G); 
%               for i=3 
                clear states
%
%                 for i=3
%                  xo
                cd(G{i})
                A = dir('*states*.mat');
                A={A.name};
                
                if sum(contains(A, 'states')) > 0 %More than 2 sleep scoring files
                    A=A(cellfun(@(x) ~isempty(strfind(x,'states')),A));
                    A=A(~(cellfun(@(x) ~isempty(strfind(x,'eeg')),A)));
                    
                    if sum(contains(A, 'states')) > 0
                    cellfun(@load,A);


HPC=dir('*HPC_*.mat');
HPC=HPC.name;
HPC=load(HPC);
HPC=HPC.HPC;
HPC=HPC.*(0.195);

Cortex=dir(strcat('*',xx{1},'*.mat'));
Cortex=Cortex.name;
Cortex=load(Cortex);
Cortex=getfield(Cortex,xx{1});
Cortex=Cortex.*(0.195);



                                      

                    if and(~contains(G{i},'trial5'),~contains(G{i},'Trial5')) %Whenever it is not PostTrial 5 
                        
                        % Sleep Scoring data
                        if length(states)<45*60
                            states=[states nan(1,45*60-length(states))]; %Fill with NaNs.
                        else
                            states=states(1:45*60); %Take only 45 min.
                        end
                        
                        %Ephys data
                        if length(HPC)<45*60*1000
                            HPC=[HPC.' (nan(45*60*1000-length(HPC),1).')]; %Fill with NaNs.
                        else
                            HPC=HPC(1:45*60*1000).'; %Take only 45 min.
                        end
                        
                        if length(Cortex)<45*60*1000
                            Cortex=[Cortex.' (nan(45*60*1000-length(Cortex),1).')]; %Fill with NaNs.
                        else
                            Cortex=Cortex(1:45*60*1000).'; %Takeripple_timestamp only 45 min.
                        end
                                              
        
        %Find SD values
        [sd_swr]=find_std(HPC,Cortex,states,ss);
        
        Sd_Swr.sd2_hpc_co(i)=sd_swr.sd2_hpc_co;
        Sd_Swr.sd5_hpc_co(i)=sd_swr.sd5_hpc_co;
        Sd_Swr.sd2_pfc_co(i)=sd_swr.sd2_pfc_co;
        Sd_Swr.sd5_pfc_co(i)=sd_swr.sd5_pfc_co;
        Sd_Swr.sd2_hpc_long(i)=sd_swr.sd2_hpc_long;
        Sd_Swr.sd5_hpc_long(i)=sd_swr.sd5_hpc_long;
        Sd_Swr.sd2_pfc_long(i)=sd_swr.sd2_pfc_long;
        Sd_Swr.sd5_pfc_long(i)=sd_swr.sd5_pfc_long;
    
                    elseif contains(G{i}, 'rial5') % PostTrial 5 case 
%                         xo
                        %Sleep scoring data
                        if length(states)<45*60*4
                            states=[states nan(1,45*60*4-length(states))]; %Fill with NaNs.
                        else
                            states=states(1:45*60*4); %Take only 45 min.
                        end
                        
                        
                        %Ephys
                        if length(HPC)<45*60*1000*4
                            HPC=[HPC.' (nan(45*60*1000*4-length(HPC),1).')]; %Fill with NaNs.
                        else
                            HPC=HPC(1:45*60*1000*4).'; %Take only 45 min.
                        end
                        
                        if length(Cortex)<45*60*1000*4
                            Cortex=[Cortex.' (nan(45*60*1000*4-length(Cortex),1).')]; %Fill with NaNs.
                        else
                            Cortex=Cortex(1:45*60*1000*4).'; %Take only 45 min.
                        end

                        
                        %Chunk in 4
                        states1=states(1:2700);
                        states2=states(2700+1:2700*2);
                        states3=states(1+2700*2:2700*3);
                        states4=states(1+2700*3:2700*4);
                        
                        HPC_1=HPC(1:2700*1000);
                        HPC_2=HPC(2700*1000+1:2700*2*1000);
                        HPC_3=HPC(1+2700*2*1000:2700*3*1000);
                        HPC_4=HPC(1+2700*3*1000:2700*4*1000);
                        
                        Cortex_1=Cortex(1:2700*1000);
                        Cortex_2=Cortex(2700*1000+1:2700*2*1000);
                        Cortex_3=Cortex(1+2700*2*1000:2700*3*1000);
                        Cortex_4=Cortex(1+2700*3*1000:2700*4*1000);
                                    %Find SD values
                                    [sd_swr]=find_std(HPC_1,Cortex_1,states1,ss);
                                    Sd_Swr.sd2_hpc_co(6)=sd_swr.sd2_hpc_co;
                                    Sd_Swr.sd5_hpc_co(6)=sd_swr.sd5_hpc_co;
                                    Sd_Swr.sd2_pfc_co(6)=sd_swr.sd2_pfc_co;
                                    Sd_Swr.sd5_pfc_co(6)=sd_swr.sd5_pfc_co;
                                    Sd_Swr.sd2_hpc_long(6)=sd_swr.sd2_hpc_long;
                                    Sd_Swr.sd5_hpc_long(6)=sd_swr.sd5_hpc_long;
                                    Sd_Swr.sd2_pfc_long(6)=sd_swr.sd2_pfc_long;
                                    Sd_Swr.sd5_pfc_long(6)=sd_swr.sd5_pfc_long;
                                    
                                    
                                    [sd_swr]=find_std(HPC_2,Cortex_2,states2,ss);
                                    Sd_Swr.sd2_hpc_co(7)=sd_swr.sd2_hpc_co;
                                    Sd_Swr.sd5_hpc_co(7)=sd_swr.sd5_hpc_co;
                                    Sd_Swr.sd2_pfc_co(7)=sd_swr.sd2_pfc_co;
                                    Sd_Swr.sd5_pfc_co(7)=sd_swr.sd5_pfc_co;
                                    Sd_Swr.sd2_hpc_long(7)=sd_swr.sd2_hpc_long;
                                    Sd_Swr.sd5_hpc_long(7)=sd_swr.sd5_hpc_long;
                                    Sd_Swr.sd2_pfc_long(7)=sd_swr.sd2_pfc_long;
                                    Sd_Swr.sd5_pfc_long(7)=sd_swr.sd5_pfc_long;
                                    
                                    [sd_swr]=find_std(HPC_3,Cortex_3,states3,ss);
                                    Sd_Swr.sd2_hpc_co(8)=sd_swr.sd2_hpc_co;
                                    Sd_Swr.sd5_hpc_co(8)=sd_swr.sd5_hpc_co;
                                    Sd_Swr.sd2_pfc_co(8)=sd_swr.sd2_pfc_co;
                                    Sd_Swr.sd5_pfc_co(8)=sd_swr.sd5_pfc_co;
                                    Sd_Swr.sd2_hpc_long(8)=sd_swr.sd2_hpc_long;
                                    Sd_Swr.sd5_hpc_long(8)=sd_swr.sd5_hpc_long;
                                    Sd_Swr.sd2_pfc_long(8)=sd_swr.sd2_pfc_long;
                                    Sd_Swr.sd5_pfc_long(8)=sd_swr.sd5_pfc_long;       
                                    
                                    [sd_swr]=find_std(HPC_4,Cortex_4,states4,ss);
                                    Sd_Swr.sd2_hpc_co(9)=sd_swr.sd2_hpc_co;
                                    Sd_Swr.sd5_hpc_co(9)=sd_swr.sd5_hpc_co;
                                    Sd_Swr.sd2_pfc_co(9)=sd_swr.sd2_pfc_co;
                                    Sd_Swr.sd5_pfc_co(9)=sd_swr.sd5_pfc_co;
                                    Sd_Swr.sd2_hpc_long(9)=sd_swr.sd2_hpc_long;
                                    Sd_Swr.sd5_hpc_long(9)=sd_swr.sd5_hpc_long;
                                    Sd_Swr.sd2_pfc_long(9)=sd_swr.sd2_pfc_long;
                                    Sd_Swr.sd5_pfc_long(9)=sd_swr.sd5_pfc_long;                                      
    
                    end



%%

                    cd ..
                else
                    cd .. %Means there is no sleep scoring file.
                    end
                else
                    cd ..
                end
           
            end
                cd ..

        end
        

       %Sd_Swr
    TT=table;
    TT.Variables=...
        [
                [{g{j}};{'x'};{'x'};{'x'};{'x'};{'x'};{'x'};{'x'}] ...
        [{'HPC_2SD_Concatenated'};{'HPC_2SD_Longest'};{'HPC_5SD_Concatenated'};{'HPC_5SD_Longest'};{'PFC_2SD_Concatenated'};{'PFC_2SD_Longest'};{'PFC_5SD_Concatenated'};{'PFC_5SD_Longest'}] ...
    num2cell([ Sd_Swr.sd2_hpc_co;Sd_Swr.sd2_hpc_long;Sd_Swr.sd5_hpc_co;Sd_Swr.sd5_hpc_long ...
        ;Sd_Swr.sd2_pfc_co;Sd_Swr.sd2_pfc_long;Sd_Swr.sd5_pfc_co;Sd_Swr.sd5_pfc_long ...
      ]) ...
    num2cell([ mean(Sd_Swr.sd2_hpc_co); mean(Sd_Swr.sd2_hpc_long); mean(Sd_Swr.sd5_hpc_co);mean(Sd_Swr.sd5_hpc_long) ...
        ;mean(Sd_Swr.sd2_pfc_co);mean(Sd_Swr.sd2_pfc_long);mean(Sd_Swr.sd5_pfc_co);mean(Sd_Swr.sd5_pfc_long) ...
      ])...
      ];
corrected_means = []; 
 TT2=cell2mat(TT{:,3:end-1});
 for m=1:size(TT2,1)
    corrected_means = [corrected_means; mean(rmoutliers(nonzeros(TT2(m,3:end))))];
 end
 TT.corrected_means = num2cell(corrected_means);

       cd(g{j})
   ripple_timestamps={};
   ripple_phases={};
     for i=1:length(G); % Trial Index
%        for i = 2
%                  xo
                cd(G{i})
                clear states
                clear HPC Cortex
                A = dir('*states*.mat');
                A={A.name};
                
                if sum(contains(A, 'states')) > 0 %More than 2 sleep scoring files
                    A=A(cellfun(@(x) ~isempty(strfind(x,'states')),A));
                    A=A(~(cellfun(@(x) ~isempty(strfind(x,'eeg')),A)));
                    if sum(contains(A, 'states')) > 0
                    
%                     st2=st(cellfun(@(x) ~isempty(strfind(x,barea)),st)); %Brain area.
                    cellfun(@load,A);


                   
                    HPC=dir('*HPC_*.mat');
                    HPC=HPC.name;
                    HPC=load(HPC);
                    HPC=HPC.HPC;
                    HPC=HPC.*(0.195);
                    
                    Cortex=dir(strcat('*',xx{1},'*.mat'));
                    Cortex=Cortex.name;
                    Cortex=load(Cortex);
                    % Cortex=Cortex.Cortex;
                    Cortex=getfield(Cortex,xx{1});
                    Cortex=Cortex.*(0.195);



                                      

                    if and(~contains(G{i},'trial5'),~contains(G{i},'Trial5')) %Whenever it is not PostTrial 5 
                        
                        % Sleep Scoring data
%                         if length(states)<45*60
%                             states=[states nan(1,45*60-length(states))]; %Fill with NaNs.
%                         else
%                             states=states(1:45*60); %Take only 45 min.
%                         end
%                         
%                         %Ephys data
%                         if length(HPC)<45*60*1000
%                             HPC=[HPC.' (nan(45*60*1000-length(HPC),1).')]; %Fill with NaNs.
%                         else
%                             HPC=HPC(1:45*60*1000).'; %Take only 45 min.
%                         end
%                         
%                         if length(Cortex)<45*60*1000
%                             Cortex=[Cortex.' (nan(45*60*1000-length(Cortex),1).')]; %Fill with NaNs.
%                         else
%                             Cortex=Cortex(1:45*60*1000).'; %Take only 45 min.
%                         end
% 
%                         D1 = round(cell2mat(TT{3,end}) + str2num(cell2mat(offset1)));
%                         D2 = round(cell2mat(TT{7,end}) + str2num(cell2mat(offset2)));
[swr_hpc,swr_pfc,s_hpc,s_pfc,V_hpc,V_pfc,signal2_hpc,signal2_pfc,sd_swr, M_multiplets, Mx_multiplets, multiplets,ripples, Mono_hpc]=ripple_detection(HPC,Cortex,states,ss,offset1,offset2,TT,j,i);
% %                         [nr_swr_HPC(i,:), nr_swr_Cortex(i,:),nr_cohfos(i,:)]=bin_swr_detection(HPC,Cortex,states,ss,D1,D2,xx,yy,fn); 
if iscell(Mono_hpc)
concatenated_NREM_hpc = vertcat(Mono_hpc{:});
waveforms_ripples={};
    for c=1:size(ripples,1)
       waveforms_ripples{c,1}= concatenated_NREM_hpc(int32(ripples(c,5)*1000+1):int32(ripples(c,7)*1000+1));
    end
%         waveforms_mean_freq = cellfun(@(equis)(meanfreq(equis,1000)) ,waveforms_ripples,'UniformOutput',false);
%         waveforms_mean_freq =  cell2mat(waveforms_mean_freq);
%         mean_freq_under_hundred =  find(waveforms_mean_freq<100);
%         if ~isempty(mean_freq_under_hundred)
%             vvv
%         end
else
    waveforms_ripples={NaN};
end 
% waveforms_mean_freq = cellfun(@(equis)(meanfreq(equis,1000)) ,waveforms_ripples,'UniformOutput',false);
% waveforms_mean_freq =  cell2mat(waveforms_mean_freq);
% mean_freq_under_hundred =  find(waveforms_mean_freq<100);
% if ~isempty(mean_freq_under_hundred)
%     vvv
% end
ripple_waveform_total{i}=waveforms_ripples;
ripple_timestamps{i}=swr_hpc;
ripple_phases{i}=swr_pfc;
ripple_total_data{i}= ripples;
%                             multiplet_count={};
%                             for l=1:length(multiplets)
%                                 multiplet_count{l}=sum(cellfun('length', Mx_multiplets.(multiplets{l}).m_1));
% 
%                             end
%                             total_swrs(j,i) = sum(s_hpc);
%                             total_hfos(j,i) = sum(s_pfc);
%                             multiplet_count_total{j,i}=multiplet_count;
%                             stage_count = sum(states(:)==ss);
%                             total_swrs_minute(j,i)=(total_swrs(j,i)/stage_count*60);
%                             total_hfos_minute(j,i)=(total_hfos(j,i)/stage_count*60);                          

                    end

                   if contains(G{i}, 'rial5')
                       clear HPC_1 HPC_2 HPC_3 HPC_4 Cortex_1 Cortex_2 Cortex_3 Cortex_4
                                                    
                                                                            %Sleep scoring data
                        if length(states)<45*60*4
                            states=[states nan(1,45*60*4-length(states))]; %Fill with NaNs.
                        else
                            states=states(1:45*60*4); %Take only 45 min.
                        end
                        
                        
                        %Ephys
                        if length(HPC)<45*60*1000*4
                            HPC=[HPC.' (nan(45*60*1000*4-length(HPC),1).')]; %Fill with NaNs.
                        else
                            HPC=HPC(1:45*60*1000*4).'; %Take only 45 min.
                        end
                        
                        if length(Cortex)<45*60*1000*4
                            Cortex=[Cortex.' (nan(45*60*1000*4-length(Cortex),1).')]; %Fill with NaNs.
                        else
                            Cortex=Cortex(1:45*60*1000*4).'; %Take only 45 min.
                        end
% 
%                         
%                         %Chunk in 4
%                         states1=states(1:2700);
%                         states2=states(2700+1:2700*2);
%                         states3=states(1+2700*2:2700*3);
%                         states4=states(1+2700*3:2700*4);
%                         
%                         HPC_1=HPC(1:2700*1000);
%                         HPC_2=HPC(2700*1000+1:2700*2*1000);
%                         HPC_3=HPC(1+2700*2*1000:2700*3*1000);
%                         HPC_4=HPC(1+2700*3*1000:2700*4*1000);
%                         
%                         Cortex_1=Cortex(1:2700*1000);
%                         Cortex_2=Cortex(2700*1000+1:2700*2*1000);
%                         Cortex_3=Cortex(1+2700*2*1000:2700*3*1000);
%                         Cortex_4=Cortex(1+2700*3*1000:2700*4*1000);
                           for jj = 1:4
                           pfc = Cortex((2700*1000*(jj-1))+1:2700*1000*jj); 
                           hpc = HPC((2700*1000*(jj-1))+1:2700*1000*jj);
                           states_chunk= states(2700*(jj-1)+1:2700*jj);
                          [swr_hpc, swr_pfc, s_hpc, s_pfc, V_hpc, V_pfc, signal2_hpc, signal2_pfc, sd_swr, M_multiplets, Mx_multiplets, multiplets, ripples, Mono_hpc]=ripple_detection(hpc,pfc,states_chunk,ss,offset1,offset2,TT,j,i); 
%                         if length(states_chunk)<45*60;
%                         [nr_swr_HPC(i,:), nr_swr_Cortex(i,:),nr_cohfos(i,:)]=bin_swr_detection(HPC,Cortex,states,ss,D1,D2,xx,yy,fn);
                           if iscell(Mono_hpc)
                            concatenated_NREM_hpc = vertcat(Mono_hpc{:});
                            waveforms_ripples={};
                                for c=1:size(ripples,1)
                                   waveforms_ripples{c,1}= concatenated_NREM_hpc(int32(ripples(c,5)*1000+1):int32(ripples(c,7)*1000+1));
                                end
                            else
                                waveforms_ripples={NaN};
                            end 
                          ripple_waveform_total{i+jj-1}=waveforms_ripples;
                          ripple_timestamps{i+jj-1}=swr_hpc; 
                          ripple_phases{i+jj-1}= swr_pfc;
                          ripple_total_data{i+jj-1}= ripples;
%                         end
                           end 

%                                 multiplet_count={};
%                                 for l=1:length(multiplets)
%                                     multiplet_count{l}=sum(cellfun('length', Mx_multiplets.(multiplets{l}).m_1));
% 
%                                 end
%                                 
%                                 total_swrs(j,i) = sum(s_hpc);
%                                 total_hfos(j,i) = sum(s_pfc);
%                                 stage_count = sum(states1(:)==ss);
%                                 multiplet_count_total{j,i}=multiplet_count;
%                                 total_swrs_minute(j,i)=(total_swrs(j,i)/stage_count*60);
%                                 total_hfos_minute(j,i)=(total_hfos(j,i)/stage_count*60);
% 
%                                 [swr_hpc,swr_pfc,s_hpc,s_pfc,V_hpc,V_pfc,signal2_hpc,signal2_pfc,sd_swr, M_multiplets, Mx_multiplets, multiplets]=swr_check_thr(HPC_2,Cortex_2,states2,ss,D1,D2);
%                                 multiplet_count={};
%                                 ripple_timestamps{7}=swr_hpc;
%                                 ripple_phases{7}=swr_pfc;
%                                 
%                                 for l=1:length(multiplets)
%                                     multiplet_count{l}=sum(cellfun('length', Mx_multiplets.(multiplets{l}).m_1));
% 
%                                 end
                                
%                                 total_swrs(j,i+1) = sum(s_hpc);
%                                 total_hfos(j,i+1) = sum(s_pfc);
%                                 stage_count = sum(states2(:)==ss);
%                                 multiplet_count_total{j,i+1}=multiplet_count;
%                                 total_swrs_minute(j,i+1)=(total_swrs(j,i+1)/stage_count*60);
%                                 total_hfos_minute(j,i+1)=(total_hfos(j,i+1)/stage_count*60);
% 
%                                 [swr_hpc,swr_pfc,s_hpc,s_pfc,V_hpc,V_pfc,signal2_hpc,signal2_pfc,sd_swr, M_multiplets, Mx_multiplets, multiplets]=swr_check_thr(HPC_3,Cortex_3,states3,ss,D1,D2);
%                                 multiplet_count={};
%                                 ripple_timestamps{8}=swr_hpc;
%                                  ripple_phases{8}=swr_pfc;
%                                 for l=1:length(multiplets)
%                                     multiplet_count{l}=sum(cellfun('length', Mx_multiplets.(multiplets{l}).m_1));
% 
%                                 end
                                
%                                 total_swrs(j,i+2) = sum(s_hpc);
%                                 total_hfos(j,i+2) = sum(s_pfc);
%                                 stage_count = sum(states3(:)==ss);
%                                 multiplet_count_total{j,i+2}=multiplet_count;
%                                 total_swrs_minute(j,i+2)=(total_swrs(j,i+2)/stage_count*60);
%                                 total_hfos_minute(j,i+2)=(total_hfos(j,i+2)/stage_count*60);
% 
%                                 [swr_hpc,swr_pfc,s_hpc,s_pfc,V_hpc,V_pfc,signal2_hpc,signal2_pfc,sd_swr, M_multiplets, Mx_multiplets, multiplets]=swr_check_thr(HPC_4,Cortex_4,states4,ss,D1,D2);
%                                 multiplet_count={};
%                                 ripple_timestamps{9}=swr_hpc;
%                                  ripple_phases{9}=swr_pfc;
%                                 
%                                 for l=1:length(multiplets)
%                                     multiplet_count{l}=sum(cellfun('length', Mx_multiplets.(multiplets{l}).m_1));
% 
%                                 end
%                                 
%                                 total_swrs(j,i+3) = sum(s_hpc);
%                                 total_hfos(j,i+3) = sum(s_pfc);
%                                 stage_count = sum(states4(:)==ss);
%                                 multiplet_count_total{j,i+3}=multiplet_count;
%                                 total_swrs_minute(j,i+3)=(total_swrs(j,i+3)/stage_count*60);
%                                 total_hfos_minute(j,i+3)=(total_hfos(j,i+3)/stage_count*60);
%                                 

                    end
                end
                    
                end
                        
                cd ..
for r= 1:length(ripple_timestamps)
if isnumeric(ripple_timestamps{r})
ripple_timestamps{r}=NaN;
ripple_phases{r}= NaN;
end
end 
               end
                cd ..
%                 D_all(1,j) = D1;
%                 D_all(2,j) = D2;
              
%           clear SD_nr_Cortex SD_nr_HPC SD_nr_cohfos nr_swr_HPC nr_swr_Cortex nr_cohfos

% if isnumeric(ripple_timestamps{i})
% ripple_timestamps{i}={NaN};
% end
ripple_phases_comp= [ripple_phases_comp;ripple_phases];
ripple_waveforms_comp= [ripple_waveforms_comp; ripple_waveform_total];
save(strcat('ripple_timestamps_',g{j},'.mat'),'ripple_timestamps')
save(strcat('ripple_total_data_',g{j},'.mat'),'ripple_total_data')
save(strcat('ripple_waveforms_',g{j},'.mat'),'ripple_waveform_total')
save(strcat('ripple_phases_',g{j},'.mat'),'ripple_phases')
save(strcat('ripple_phases_compilation_Rat',rat_folder{k},'.mat'),'ripple_phases_comp')
save(strcat('ripple_waveforms_compilation_Rat',rat_folder{k},'.mat'),'ripple_waveforms_comp')
% clear ripple_timestamps ripple_phases
% save(strcat('ripple_phases_compilation_Rat',rat_folder{k},'.mat'),'ripple_phases_comp')
    end
% save(strcat('ripple_phases_compilation_Rat',rat_folder{k},'.mat'),'ripple_phases_comp')
% save(strcat('ripple_phases_compilation_Rat',k,'.mat'),'ripple_phases_comp')  
%        if ind_mode==3 
%            if k==1
%                 P_bar=waitbar(0,'Please wait...');
%            end
%                progress_bar(k,length(rat_folder),P_bar)
%         end  
    %xo
     %writetable(T,strcat('SD_values','.xls'),'Sheet',1,'Range','A1:Z50')
    cd ..
        
end
%         zsinglet_total=[];
%         zdoublet_total=[];
%         ztriplet_total=[];
%         zquadruplet_total=[];
%         zquintuplet_total=[];
%         zsextuplet_total=[];
%         zseptuplet_total=[];
%         zoctuplet_total=[];
%         znonuplet_total=[];
% 
% for r=1:size(multiplet_count_total,2)
%     for e=1:size(multiplet_count_total,1)
%         if ~isempty(multiplet_count_total{e,r})
%             zsinglet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,1));
%             zdoublet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,2));
%             ztriplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,3));
%             zquadruplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,4));
%             zquintuplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,5));
%             zsextuplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,6));
%             zseptuplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,7));
%             zoctuplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,8));
%             znonuplet_total(e,r)=cell2mat(multiplet_count_total{e,r}(1,9));
%         end
%     end
% end

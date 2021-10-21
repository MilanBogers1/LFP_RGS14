clear variables
cd('I:\Milan_DA\RGS14_Ephys_da\Data_RGS14_Downsampled_First_Session')

list = {'Wake','NREM','Transitional','REM'};
[indx1] = listdlg('SelectionMode','single','ListString',list);

switch indx1
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

rat_folder = getfolder;
for k=3
% for k=1:length(rat_folder)
    cd(rat_folder{k})    
    g=getfolder;
%xo
    for j=1:length(g)
%     for j=2;
        cd(g{j})
        pxx_PT1_4=[];
        pxx_PT5=[];
%end
        G=getfolder;
        if isempty(G)
            no_folder=1;
            %g=NaN;
        else
            no_folder=0;
            meanp_sd = {};
            meanp_pt = {};
            ratiothetasd = {};
            ratiotheta = {};
            ratiotheta_sd = [];
            for i=1:length(G);
%             for i=1:5;
                if (contains(G{i}, 'Trial6') || contains(G{i}, 'trial6') || contains(G{i}, 'Test') || contains(G{i}, 'test') || contains(G{i}, 'pre') || contains(G{i}, 'Pre'))
                    continue
                end
                cd(G{i})
                st=dir;
                st={st.name};
                qq=0;
                for y=1:length(st)
                    if (contains(st{y}, 'states'))
                        qq=qq+1;
                    end
                end

                    if qq > 0;
                        st1=st(cellfun(@(x) ~isempty(strfind(x,'states')),st));
                        st1=st1(~(cellfun(@(x) ~isempty(strfind(x,'eeg')),st1)));

                        st2=st(cellfun(@(x) ~isempty(strfind(x,barea)),st));

                        slpscr = load(st1{1});
                        slpscr = slpscr.states;

                        dwndat = load(st2{1});
                        if strcmp(barea,'HPC');
                            dwndat = dwndat.HPC;
                        end

                        if strcmp(barea,'PFC');
                            dwndat = dwndat.PFC;
                        end

                        if and(~contains(G{i},'trial5'),~contains(G{i},'Trial5'))
                            if length(slpscr)<45*60
                                slpscr=[slpscr nan(1,45*60-length(slpscr))]; %Fill with NaNs.
                            else
                                slpscr=slpscr(1:45*60); %Take only 45 min.
                            end

                            if length(dwndat)<45*60*1000
                                dwndat=[dwndat.' (nan(45*60*1000-length(dwndat),1).')]; %Fill with NaNs.
                            else
                                dwndat=dwndat(1:45*60*1000).'; %Take only 45 min.
                            end
                                bin_size=45*60;
                                nbins=size(slpscr,2)/bin_size;



                    slpscr_binned = {};
                    for n=1:nbins
                       slpscr_binned= [slpscr_binned slpscr(:,1+(n-1)*bin_size:bin_size*(n))];
                    end

                    bin_size2=45*60*1000; %45minutes
                    nbins=size(dwndat,2)/bin_size2;



                    dwndat_binned = {};
                    for n=1:nbins
                       dwndat_binned = [dwndat_binned dwndat(:,1+(n-1)*bin_size2:bin_size2*(n))];
                    end
                            
                            ratiotheta = {};
                    meanp_pt = {};
                    for m = 1:length(dwndat_binned)

                        
                        stateloc = find(slpscr_binned{m}==ss);
                        stateloc2={};
                        data=slpscr_binned{m}==ss;

                        if sum(data)>0;



                            nonZeroElements = data ~= 0;
                            % Define the closest regions can be.  If they are farther away than this,
                            % then they will be considered as separate regions.
                            
                                
                            
                            
                            minSeparation = 3;                    
                            
%                             Maybe increase minSeparation to 3 for all
%                             brain areas, (remove if condition)

                            nonZeroElements = ~bwareaopen(~nonZeroElements, minSeparation);
                            [labeledRegions, numRegions] = bwlabel(nonZeroElements);

                            MC=[];
                            for p = 1:numRegions
                                stateloc2{p}=dwndat_binned{m}(min(find(labeledRegions==p))*1000-999:max(find(labeledRegions==p))*1000);
                                [NC,~]=epocher( {stateloc2{p}},4);
                                MC=[MC ;NC.'];

                            end
                            if ~isempty(MC)
                            MC=rmmissing(MC);
%                               [pxx,f]=pmtm(MC.',4,[],1000);
                              [pxx,f]=pwelch(MC.',4000,2000,[],1000);
                              meanp = mean(pxx,2);
                              [minDistance1, indexOfMin1] = min(abs(f-5));
                              [minDistance2, indexOfMin2] = min(abs(f-10));
                              [minDistance3, indexOfMin3] = min(abs(f-30));
%                               ratiotheta = [ratiotheta sum(meanp(indexOfMin1:indexOfMin2))/ sum(meanp)];
%                               meanp_pt = [meanp_pt meanp];
%                               save(strcat('meanp_PT_',stage,'_',g{j},'_',G{i},'_',barea),'meanp_pt')
                              pxx_PT1_4 = horzcat(pxx_PT1_4,pxx);
                              
%                         else
%                                 ratiotheta=[ratiotheta NaN];
%                                 meanp_pt = [meanp_pt NaN];
%                                 save(strcat('meanp_PT_',stage,'_',g{j},'_',G{i}),'meanp_pt')
                            end

                        end
                        
                    end
                        else
                            if length(slpscr)<45*60*4
                                slpscr=[slpscr nan(1,45*60*4-length(slpscr))]; %Fill with NaNs.
                            else
                                slpscr=slpscr(1:45*60*4); %Take only 45 min.
                            end

                            if length(dwndat)<45*60*1000*4
                                dwndat=[dwndat.' (nan(45*60*1000*4-length(dwndat),1).')]; %Fill with NaNs.
                            else
                                dwndat=dwndat(1:45*60*1000*4).'; %Take only 45 min.
                            end
                                 bin_size=45*60; %45minutes
                    nbins=size(slpscr,2)/bin_size;



                    slpscr_binned = {};
                    for n=1:nbins
                       slpscr_binned= [slpscr_binned slpscr(:,1+(n-1)*bin_size:bin_size*(n))];
                    end

                    bin_size2=45*60*1000; %45minutes
                    nbins=size(dwndat,2)/bin_size2;



                    dwndat_binned = {};
                    for n=1:nbins
                       dwndat_binned = [dwndat_binned dwndat(:,1+(n-1)*bin_size2:bin_size2*(n))];
                    end

                    ratiotheta = {};
                    meanp_pt = {};
                    for m = 1:length(dwndat_binned)

                        stateloc = find(slpscr_binned{m}==ss);
                        stateloc2={};
                        data=slpscr_binned{m}==ss;

                        if sum(data)>0;



                            nonZeroElements = data ~= 0;
                            % Define the closest regions can be.  If they are farther away than this,
                            % then they will be considered as separate regions.
                            
                                
                            
                            
                            minSeparation = 3;                    
                            
%                             Maybe increase minSeparation to 3 for all
%                             brain areas, (remove if condition)

                            nonZeroElements = ~bwareaopen(~nonZeroElements, minSeparation);
                            [labeledRegions, numRegions] = bwlabel(nonZeroElements);

                            MC=[];
                            for p = 1:numRegions
                                stateloc2{p}=dwndat_binned{m}(min(find(labeledRegions==p))*1000-999:max(find(labeledRegions==p))*1000);
                                [NC,~]=epocher( {stateloc2{p}},4);
                                MC=[MC ;NC.'];

                            end
                            if ~isempty(MC)
                            MC=rmmissing(MC);
%                               [pxx,f]=pmtm(MC.',4,[],1000);
%                               meanp = mean(pxx,2);
                              [pxx,f]=pwelch(MC.',4000,2000,[],1000);
                              [minDistance1, indexOfMin1] = min(abs(f-5));
                              [minDistance2, indexOfMin2] = min(abs(f-10));
                              [minDistance3, indexOfMin3] = min(abs(f-30));
%                               ratiotheta = [ratiotheta sum(meanp(indexOfMin1:indexOfMin2))/ sum(meanp)];
%                               meanp_pt = [meanp_pt meanp];
%                               save(strcat('meanp_PT_',stage,'_',g{j},'_',G{i},'_',barea),'meanp_pt')
                              pxx_PT5 = horzcat(pxx_PT5,pxx);
                            end
                        end
                    end

                    end
    



                    bin_size=45*60; %45minutes
                    nbins=size(slpscr,2)/bin_size;



                    slpscr_binned = {};
                    for n=1:nbins
                       slpscr_binned= [slpscr_binned slpscr(:,1+(n-1)*bin_size:bin_size*(n))];
                    end

                    bin_size2=45*60*1000; %45minutes
                    nbins=size(dwndat,2)/bin_size2;



                    dwndat_binned = {};
                    for n=1:nbins
                       dwndat_binned = [dwndat_binned dwndat(:,1+(n-1)*bin_size2:bin_size2*(n))];
                    end

                    
                        cd ..
%                         meanp_sd = [meanp_sd {meanp_pt}];
%                         save(strcat('Meanpower_SD_',stage,'_',g{j},'_',barea), 'meanp_sd')
%                         ratiothetasd = [ratiothetasd {ratiotheta}];
%                         save(strcat('ratiotheta_SD_',stage,'_',g{j},'_',barea),'ratiothetasd')
%                         if ~isempty(pxx_total)
%                             meanp_SD = mean(pxx_total,2);
%                             save(strcat('Meanpower_SD_Total_',stage,'_',g{j},'_',barea), 'meanp_sd')
%                             
%                         else
%                             save(strcat('Meanpower_SD_Total_',stage,'_',g{j},'_',barea), 'meanp_sd')
%                             
%                         end
                    else
                        cd ..
                    end
                
           
                


            
            end
                cd ..
        end
        
        cd(g{j})
        ratiotheta_sec1=[];
        for q=1:size(pxx_PT1_4,2)
            pxx_sec1=pxx_PT1_4(:,q);
            ratiotheta_sec1(q)=sum(pxx_sec1(indexOfMin1:indexOfMin2))/sum(pxx_sec1(1:indexOfMin3));
        end
        ratiotheta_PT1_4=mean(ratiotheta_sec1);
        save(strcat('ratiotheta_PT1-4_',stage,'_',g{j},'_',barea),'ratiotheta_PT1_4')
        mean_pxx_PT1_4=mean(pxx_PT1_4,2);
        save(strcat('Mean_Meanpower_PT1-4_', stage, '_', g{j}, '_', barea), 'mean_pxx_PT1_4')
        save(strcat('PXX_PT1_4', stage, '_', g{j}, '_', barea), 'pxx_PT1_4')
        
        ratiotheta_sec2=[];
        for q=1:size(pxx_PT5,2)
            pxx_sec2=pxx_PT5(:,q);
            ratiotheta_sec2(q)=sum(pxx_sec2(indexOfMin1:indexOfMin2))/sum(pxx_sec2(1:indexOfMin3));
        end
        ratiotheta_PT5=mean(ratiotheta_sec2);
        save(strcat('ratiotheta_PT5_',stage,'_',g{j},'_',barea),'ratiotheta_PT5')
        mean_pxx_PT5=mean(pxx_PT5,2);
        save(strcat('Mean_Meanpower_PT5_', stage, '_', g{j}, '_', barea), 'mean_pxx_PT5')
        save(strcat('PXX_PT5', stage, '_', g{j}, '_', barea), 'pxx_PT5')
        cd ..
          
    end

    cd ..
end
save('Power_frequencies', 'f')
    


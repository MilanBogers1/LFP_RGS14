function [x,mean_meanpower_PT1_4_CON2,mean_meanpower_PT1_4_OD2,mean_meanpower_PT1_4_OR2,mean_meanpower_PT1_4_HC2] ...
    = Power_LinePlot_RGS14_PT1_4_fun(q,barea,stage,freq,z)
    cd('/media/lisa/REM/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')
    s=dir;
    s={s.name};
    for a=1:length(s)
        if (contains(s{a}, 'Power_frequencies'))
            pfreqs=load(s{a});
            pfreqs=pfreqs.f;
        end
    end
    rat_folder = getfolder;
    cd(rat_folder{q})
    g=getfolder;
    for j=1:length(g)
       if (contains(g{j}, 'CON'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_PT1-4') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_PT1_4_CON=load(st{y});
                    mean_meanpower_PT1_4_CON=mean_meanpower_PT1_4_CON.mean_pxx_PT1_4;
               end
           end

       elseif (contains(g{j}, 'HC'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_PT1-4') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_PT1_4_HC=load(st{y});
                    mean_meanpower_PT1_4_HC=mean_meanpower_PT1_4_HC.mean_pxx_PT1_4;
               end
           end

       elseif (contains(g{j}, 'OD'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_PT1-4') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_PT1_4_OD=load(st{y});
                    mean_meanpower_PT1_4_OD=mean_meanpower_PT1_4_OD.mean_pxx_PT1_4;
               end
           end

       elseif (contains(g{j}, 'OR'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_PT1-4') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_PT1_4_OR=load(st{y});
                    mean_meanpower_PT1_4_OR=mean_meanpower_PT1_4_OR.mean_pxx_PT1_4;
               end
           end

       end
       cd ..
    end

    [minDistance, indexOfMin] = min(abs(pfreqs-freq));
    if ~isempty(mean_meanpower_PT1_4_CON)
        mean_meanpower_PT1_4_CON2=mean_meanpower_PT1_4_CON(z:indexOfMin);
    else
        mean_meanpower_PT1_4_CON2=NaN(size(z:indexOfMin))';
    end
    if ~isempty(mean_meanpower_PT1_4_HC)
        mean_meanpower_PT1_4_HC2=mean_meanpower_PT1_4_HC(z:indexOfMin);
    else
        mean_meanpower_PT1_4_HC2=NaN(size(z:indexOfMin))';
    end
    if ~isempty(mean_meanpower_PT1_4_OD)
        mean_meanpower_PT1_4_OD2=mean_meanpower_PT1_4_OD(z:indexOfMin);
    else
        mean_meanpower_PT1_4_OD2=NaN(size(z:indexOfMin))';
    end
    if ~isempty(mean_meanpower_PT1_4_OR)
        mean_meanpower_PT1_4_OR2=mean_meanpower_PT1_4_OR(z:indexOfMin);
    else
        mean_meanpower_PT1_4_OR2=NaN(size(z:indexOfMin))';
    end
    x=pfreqs(z:indexOfMin);
end

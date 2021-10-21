function [x,mean_meanpower_total_CON2,mean_meanpower_total_OD2,mean_meanpower_total_OR2,mean_meanpower_total_HC2] ...
    = Power_LinePlot_RGS14_fun(q,barea,stage,freq,z)
    cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')
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
               if (contains(st{y}, 'Mean_Meanpower_total') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_total_CON=load(st{y});
                    mean_meanpower_total_CON=mean_meanpower_total_CON.mean_pxx_total;
               end
           end

       elseif (contains(g{j}, 'HC'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_total') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_total_HC=load(st{y});
                    mean_meanpower_total_HC=mean_meanpower_total_HC.mean_pxx_total;
               end
           end

       elseif (contains(g{j}, 'OD'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_total') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_total_OD=load(st{y});
                    mean_meanpower_total_OD=mean_meanpower_total_OD.mean_pxx_total;
               end
           end

       elseif (contains(g{j}, 'OR'))
           cd(g{j})
           st=dir;
           st={st.name};
           for y=1:length(st)
               if (contains(st{y}, 'Mean_Meanpower_total') && contains(st{y}, barea) && contains(st{y}, stage))
                    mean_meanpower_total_OR=load(st{y});
                    mean_meanpower_total_OR=mean_meanpower_total_OR.mean_pxx_total;
               end
           end

       end
       cd ..
    end

    [minDistance, indexOfMin] = min(abs(pfreqs-freq));
    mean_meanpower_total_CON2=mean_meanpower_total_CON(z:indexOfMin);
    mean_meanpower_total_HC2=mean_meanpower_total_HC(z:indexOfMin);
    mean_meanpower_total_OD2=mean_meanpower_total_OD(z:indexOfMin);
    mean_meanpower_total_OR2=mean_meanpower_total_OR(z:indexOfMin);
    x=pfreqs(z:indexOfMin);
end

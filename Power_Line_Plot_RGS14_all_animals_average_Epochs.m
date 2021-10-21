clear variables
cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')

list = {'Wake','NREM','Transitional','REM'};
[indx1] = listdlg('SelectionMode','single','ListString',list);

switch indx1
    case 1
        ss = 1; 
        stage='Wake_';
        stage2='Wake';
    case 2
        ss = 3; 
        stage='NREM_';
        stage2='NREM';
    case 3
        ss = 4; %Transitional
        stage='Trans_';
        stage2='Trans';
    case 4
        ss = 5; %REM
        stage='REM_';
        stage2='REM';
end

list = {'HPC','PFC'};
[indx2] = listdlg('SelectionMode','single','ListString',list);

switch indx2
    case 1
        barea='HPC';
    case 2
        barea='PFC';
end


list = {'30Hz','300Hz', '100-300Hz'};
[indx3] = listdlg('SelectionMode','single','ListString',list);

switch indx3
    case 1
        freq=30;
        z=1;
        zz=0;
    case 2
        freq=300;
        z=1;
        zz=0;
    case 3
        freq=300;
        z=100;
        zz=100;
end



[x,mean_meanpower_First_Half_CON1,mean_meanpower_First_Half_OD1,mean_meanpower_First_Half_OR1,mean_meanpower_First_Half_HC1] ...
    = Power_LinePlot_RGS14_First_Half_fun(1,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON2,mean_meanpower_First_Half_OD2,mean_meanpower_First_Half_OR2,mean_meanpower_First_Half_HC2] ...
    = Power_LinePlot_RGS14_First_Half_fun(2,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON6,mean_meanpower_First_Half_OD6,mean_meanpower_First_Half_OR6,mean_meanpower_First_Half_HC6] ...
    = Power_LinePlot_RGS14_First_Half_fun(5,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON9,mean_meanpower_First_Half_OD9,mean_meanpower_First_Half_OR9,mean_meanpower_First_Half_HC9] ...
    = Power_LinePlot_RGS14_First_Half_fun(8,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON3,mean_meanpower_First_Half_OD3,mean_meanpower_First_Half_OR3,mean_meanpower_First_Half_HC3] ...
    = Power_LinePlot_RGS14_First_Half_fun(3,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON4,mean_meanpower_First_Half_OD4,mean_meanpower_First_Half_OR4,mean_meanpower_First_Half_HC4] ...
    = Power_LinePlot_RGS14_First_Half_fun(4,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON7,mean_meanpower_First_Half_OD7,mean_meanpower_First_Half_OR7,mean_meanpower_First_Half_HC7] ...
    = Power_LinePlot_RGS14_First_Half_fun(6,barea,stage,freq,z);
[x,mean_meanpower_First_Half_CON8,mean_meanpower_First_Half_OD8,mean_meanpower_First_Half_OR8,mean_meanpower_First_Half_HC8] ...
    = Power_LinePlot_RGS14_First_Half_fun(7,barea,stage,freq,z);

First_Half= [mean_meanpower_First_Half_CON1,mean_meanpower_First_Half_CON2,mean_meanpower_First_Half_CON3, ...
    mean_meanpower_First_Half_CON4,mean_meanpower_First_Half_CON8,mean_meanpower_First_Half_CON6,mean_meanpower_First_Half_CON7, ...
    mean_meanpower_First_Half_CON9,mean_meanpower_First_Half_HC1,mean_meanpower_First_Half_HC2,mean_meanpower_First_Half_HC3, ...
    mean_meanpower_First_Half_HC4,mean_meanpower_First_Half_HC6,mean_meanpower_First_Half_HC7, ...
    mean_meanpower_First_Half_HC8,mean_meanpower_First_Half_HC9, mean_meanpower_First_Half_OD1, mean_meanpower_First_Half_OD2, ...
    mean_meanpower_First_Half_OD3,mean_meanpower_First_Half_OD4,mean_meanpower_First_Half_OD6,mean_meanpower_First_Half_OD7, ...
    mean_meanpower_First_Half_OD8,mean_meanpower_First_Half_OD9,mean_meanpower_First_Half_OR1,mean_meanpower_First_Half_OR2, ...
    mean_meanpower_First_Half_OR3,mean_meanpower_First_Half_OR4,mean_meanpower_First_Half_OR6,mean_meanpower_First_Half_OR7, ...
    mean_meanpower_First_Half_OR8,mean_meanpower_First_Half_OR9];

maxmax=max(max(First_Half));
mean_meanpower_First_Half_CON_VEH=mean([mean_meanpower_First_Half_CON1 mean_meanpower_First_Half_CON2 mean_meanpower_First_Half_CON6 mean_meanpower_First_Half_CON9],2);
mean_meanpower_First_Half_OD_VEH=mean([mean_meanpower_First_Half_OD1 mean_meanpower_First_Half_OD2 mean_meanpower_First_Half_OD6 mean_meanpower_First_Half_OD9],2);
mean_meanpower_First_Half_OR_VEH=mean([mean_meanpower_First_Half_OR1 mean_meanpower_First_Half_OR2 mean_meanpower_First_Half_OR9],2);
mean_meanpower_First_Half_HC_VEH=mean([mean_meanpower_First_Half_HC1 mean_meanpower_First_Half_HC2 mean_meanpower_First_Half_HC6 mean_meanpower_First_Half_HC9],2);
mean_meanpower_First_Half_CON_RGS=mean([mean_meanpower_First_Half_CON3 mean_meanpower_First_Half_CON4 mean_meanpower_First_Half_CON8],2);
mean_meanpower_First_Half_OD_RGS=mean([mean_meanpower_First_Half_OD3 mean_meanpower_First_Half_OD4 mean_meanpower_First_Half_OD7 mean_meanpower_First_Half_OD8],2);
mean_meanpower_First_Half_OR_RGS=mean([mean_meanpower_First_Half_OR3 mean_meanpower_First_Half_OR4 mean_meanpower_First_Half_OR7 mean_meanpower_First_Half_OR8],2);
mean_meanpower_First_Half_HC_RGS=mean([mean_meanpower_First_Half_HC3 mean_meanpower_First_Half_HC4 mean_meanpower_First_Half_HC7 mean_meanpower_First_Half_HC8],2);

[x,mean_meanpower_Second_Half_CON1,mean_meanpower_Second_Half_OD1,mean_meanpower_Second_Half_OR1,mean_meanpower_Second_Half_HC1] ...
    = Power_LinePlot_RGS14_Second_Half_fun(1,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON2,mean_meanpower_Second_Half_OD2,mean_meanpower_Second_Half_OR2,mean_meanpower_Second_Half_HC2] ...
    = Power_LinePlot_RGS14_Second_Half_fun(2,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON6,mean_meanpower_Second_Half_OD6,mean_meanpower_Second_Half_OR6,mean_meanpower_Second_Half_HC6] ...
    = Power_LinePlot_RGS14_Second_Half_fun(5,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON9,mean_meanpower_Second_Half_OD9,mean_meanpower_Second_Half_OR9,mean_meanpower_Second_Half_HC9] ...
    = Power_LinePlot_RGS14_Second_Half_fun(8,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON3,mean_meanpower_Second_Half_OD3,mean_meanpower_Second_Half_OR3,mean_meanpower_Second_Half_HC3] ...
    = Power_LinePlot_RGS14_Second_Half_fun(3,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON4,mean_meanpower_Second_Half_OD4,mean_meanpower_Second_Half_OR4,mean_meanpower_Second_Half_HC4] ...
    = Power_LinePlot_RGS14_Second_Half_fun(4,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON7,mean_meanpower_Second_Half_OD7,mean_meanpower_Second_Half_OR7,mean_meanpower_Second_Half_HC7] ...
    = Power_LinePlot_RGS14_Second_Half_fun(6,barea,stage,freq,z);
[x,mean_meanpower_Second_Half_CON8,mean_meanpower_Second_Half_OD8,mean_meanpower_Second_Half_OR8,mean_meanpower_Second_Half_HC8] ...
    = Power_LinePlot_RGS14_Second_Half_fun(7,barea,stage,freq,z);

Second_Half= [mean_meanpower_Second_Half_CON1,mean_meanpower_Second_Half_CON2,mean_meanpower_Second_Half_CON3, ...
    mean_meanpower_Second_Half_CON4,mean_meanpower_Second_Half_CON8,mean_meanpower_Second_Half_CON6,mean_meanpower_Second_Half_CON7, ...
    mean_meanpower_Second_Half_CON9,mean_meanpower_Second_Half_HC1,mean_meanpower_Second_Half_HC2,mean_meanpower_Second_Half_HC3, ...
    mean_meanpower_Second_Half_HC4,mean_meanpower_Second_Half_HC6,mean_meanpower_Second_Half_HC7, ...
    mean_meanpower_Second_Half_HC8,mean_meanpower_Second_Half_HC9, mean_meanpower_Second_Half_OD1, mean_meanpower_Second_Half_OD2, ...
    mean_meanpower_Second_Half_OD3,mean_meanpower_Second_Half_OD4,mean_meanpower_Second_Half_OD6,mean_meanpower_Second_Half_OD7, ...
    mean_meanpower_Second_Half_OD8,mean_meanpower_Second_Half_OD9,mean_meanpower_Second_Half_OR1,mean_meanpower_Second_Half_OR2, ...
    mean_meanpower_Second_Half_OR3,mean_meanpower_Second_Half_OR4,mean_meanpower_Second_Half_OR6,mean_meanpower_Second_Half_OR7, ...
    mean_meanpower_Second_Half_OR8,mean_meanpower_Second_Half_OR9];

maxmax=max(max(Second_Half));
mean_meanpower_Second_Half_CON_VEH=mean([mean_meanpower_Second_Half_CON1 mean_meanpower_Second_Half_CON2 mean_meanpower_Second_Half_CON6 mean_meanpower_Second_Half_CON9],2);
mean_meanpower_Second_Half_OD_VEH=mean([mean_meanpower_Second_Half_OD1 mean_meanpower_Second_Half_OD2 mean_meanpower_Second_Half_OD6 mean_meanpower_Second_Half_OD9],2);
mean_meanpower_Second_Half_OR_VEH=mean([mean_meanpower_Second_Half_OR1 mean_meanpower_Second_Half_OR2 mean_meanpower_Second_Half_OR9],2);
mean_meanpower_Second_Half_HC_VEH=mean([mean_meanpower_Second_Half_HC1 mean_meanpower_Second_Half_HC2 mean_meanpower_Second_Half_HC6 mean_meanpower_Second_Half_HC9],2);
mean_meanpower_Second_Half_CON_RGS=mean([mean_meanpower_Second_Half_CON3 mean_meanpower_Second_Half_CON4 mean_meanpower_Second_Half_CON8],2);
mean_meanpower_Second_Half_OD_RGS=mean([mean_meanpower_Second_Half_OD3 mean_meanpower_Second_Half_OD4 mean_meanpower_Second_Half_OD7 mean_meanpower_Second_Half_OD8],2);
mean_meanpower_Second_Half_OR_RGS=mean([mean_meanpower_Second_Half_OR3 mean_meanpower_Second_Half_OR4 mean_meanpower_Second_Half_OR7 mean_meanpower_Second_Half_OR8],2);
mean_meanpower_Second_Half_HC_RGS=mean([mean_meanpower_Second_Half_HC3 mean_meanpower_Second_Half_HC4 mean_meanpower_Second_Half_HC7 mean_meanpower_Second_Half_HC8],2);


subplot(2,2,1)
semilogy(x,mean_meanpower_First_Half_CON_VEH,x,mean_meanpower_First_Half_OD_VEH,x,mean_meanpower_First_Half_OR_VEH,x,mean_meanpower_First_Half_HC_VEH, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Vehicle ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'First_Half']);

subplot(2,2,2)
semilogy(x,mean_meanpower_First_Half_CON_RGS,x,mean_meanpower_First_Half_OD_RGS,x,mean_meanpower_First_Half_OR_RGS,x,mean_meanpower_First_Half_HC_RGS, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['RGS14 ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'First_Half']);

subplot(2,2,3)
semilogy(x,mean_meanpower_Second_Half_CON_VEH,x,mean_meanpower_Second_Half_OD_VEH,x,mean_meanpower_Second_Half_OR_VEH,x,mean_meanpower_Second_Half_HC_VEH, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Vehicle ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'Second_Half']);

subplot(2,2,4)
semilogy(x,mean_meanpower_Second_Half_CON_RGS,x,mean_meanpower_Second_Half_OD_RGS,x,mean_meanpower_Second_Half_OR_RGS,x,mean_meanpower_Second_Half_HC_RGS, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['RGS14 ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'Second_Half']);


cd('/media/genzel/Data/Milan_DA/RGS14_Ephys_da/Plots/Power_Density_Spectra_Epochs')
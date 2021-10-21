clear variables
cd('/media/lisa/REM/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')

list = {'Wake','NREM','Transitional','REM'};
[indx1] = listdlg('SelectionMode','single','ListString',list);

switch indx1
    case 1
        ss = 1; 
        stage='_Wake';
        stage2='Wake';
    case 2
        ss = 3; 
        stage='_NREM';
        stage2='NREM';
    case 3
        ss = 4; %Transitional
        stage='_Trans';
        stage2='Trans';
    case 4
        ss = 5; %REM
        stage='_REM';
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



[x,mean_meanpower_PT1_4_CON1,mean_meanpower_PT1_4_OD1,mean_meanpower_PT1_4_OR1,mean_meanpower_PT1_4_HC1] ...
    = Power_LinePlot_RGS14_fun(1,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON2,mean_meanpower_PT1_4_OD2,mean_meanpower_PT1_4_OR2,mean_meanpower_PT1_4_HC2] ...
    = Power_LinePlot_RGS14_fun(2,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON6,mean_meanpower_PT1_4_OD6,mean_meanpower_PT1_4_OR6,mean_meanpower_PT1_4_HC6] ...
    = Power_LinePlot_RGS14_fun(5,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON9,mean_meanpower_PT1_4_OD9,mean_meanpower_PT1_4_OR9,mean_meanpower_PT1_4_HC9] ...
    = Power_LinePlot_RGS14_fun(8,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON3,mean_meanpower_PT1_4_OD3,mean_meanpower_PT1_4_OR3,mean_meanpower_PT1_4_HC3] ...
    = Power_LinePlot_RGS14_fun(3,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON4,mean_meanpower_PT1_4_OD4,mean_meanpower_PT1_4_OR4,mean_meanpower_PT1_4_HC4] ...
    = Power_LinePlot_RGS14_fun(4,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON7,mean_meanpower_PT1_4_OD7,mean_meanpower_PT1_4_OR7,mean_meanpower_PT1_4_HC7] ...
    = Power_LinePlot_RGS14_fun(6,barea,stage,freq,z);
[x,mean_meanpower_PT1_4_CON8,mean_meanpower_PT1_4_OD8,mean_meanpower_PT1_4_OR8,mean_meanpower_PT1_4_HC8] ...
    = Power_LinePlot_RGS14_fun(7,barea,stage,freq,z);

PT1_4= [mean_meanpower_PT1_4_CON1,mean_meanpower_PT1_4_CON2,mean_meanpower_PT1_4_CON3, ...
    mean_meanpower_PT1_4_CON4,mean_meanpower_PT1_4_CON8,mean_meanpower_PT1_4_CON6,mean_meanpower_PT1_4_CON7, ...
    mean_meanpower_PT1_4_CON9,mean_meanpower_PT1_4_HC1,mean_meanpower_PT1_4_HC2,mean_meanpower_PT1_4_HC3, ...
    mean_meanpower_PT1_4_HC4,mean_meanpower_PT1_4_HC6,mean_meanpower_PT1_4_HC7, ...
    mean_meanpower_PT1_4_HC8,mean_meanpower_PT1_4_HC9, mean_meanpower_PT1_4_OD1, mean_meanpower_PT1_4_OD2, ...
    mean_meanpower_PT1_4_OD3,mean_meanpower_PT1_4_OD4,mean_meanpower_PT1_4_OD6,mean_meanpower_PT1_4_OD7, ...
    mean_meanpower_PT1_4_OD8,mean_meanpower_PT1_4_OD9,mean_meanpower_PT1_4_OR1,mean_meanpower_PT1_4_OR2, ...
    mean_meanpower_PT1_4_OR3,mean_meanpower_PT1_4_OR4,mean_meanpower_PT1_4_OR6,mean_meanpower_PT1_4_OR7, ...
    mean_meanpower_PT1_4_OR8,mean_meanpower_PT1_4_OR9];

maxmax=max(max(PT1_4));
mean_meanpower_PT1_4_CON_VEH=mean([mean_meanpower_PT1_4_CON1 mean_meanpower_PT1_4_CON2 mean_meanpower_PT1_4_CON6 mean_meanpower_PT1_4_CON9],2);
mean_meanpower_PT1_4_OD_VEH=mean([mean_meanpower_PT1_4_OD1 mean_meanpower_PT1_4_OD2 mean_meanpower_PT1_4_OD6 mean_meanpower_PT1_4_OD9],2);
mean_meanpower_PT1_4_OR_VEH=mean([mean_meanpower_PT1_4_OR1 mean_meanpower_PT1_4_OR2 mean_meanpower_PT1_4_OR6 mean_meanpower_PT1_4_OR9],2);
mean_meanpower_PT1_4_HC_VEH=mean([mean_meanpower_PT1_4_HC1 mean_meanpower_PT1_4_HC2 mean_meanpower_PT1_4_HC6 mean_meanpower_PT1_4_HC9],2);
mean_meanpower_PT1_4_CON_RGS=mean([mean_meanpower_PT1_4_CON3 mean_meanpower_PT1_4_CON4 mean_meanpower_PT1_4_CON8],2);
mean_meanpower_PT1_4_OD_RGS=mean([mean_meanpower_PT1_4_OD3 mean_meanpower_PT1_4_OD4 mean_meanpower_PT1_4_OD7 mean_meanpower_PT1_4_OD8],2);
mean_meanpower_PT1_4_OR_RGS=mean([mean_meanpower_PT1_4_OR3 mean_meanpower_PT1_4_OR4 mean_meanpower_PT1_4_OR7 mean_meanpower_PT1_4_OR8],2);
mean_meanpower_PT1_4_HC_RGS=mean([mean_meanpower_PT1_4_HC3 mean_meanpower_PT1_4_HC4 mean_meanpower_PT1_4_HC7 mean_meanpower_PT1_4_HC8],2);

[x,mean_meanpower_PT5_CON1,mean_meanpower_PT5_OD1,mean_meanpower_PT5_OR1,mean_meanpower_PT5_HC1] ...
    = Power_LinePlot_RGS14_fun(1,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON2,mean_meanpower_PT5_OD2,mean_meanpower_PT5_OR2,mean_meanpower_PT5_HC2] ...
    = Power_LinePlot_RGS14_fun(2,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON6,mean_meanpower_PT5_OD6,mean_meanpower_PT5_OR6,mean_meanpower_PT5_HC6] ...
    = Power_LinePlot_RGS14_fun(5,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON9,mean_meanpower_PT5_OD9,mean_meanpower_PT5_OR9,mean_meanpower_PT5_HC9] ...
    = Power_LinePlot_RGS14_fun(8,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON3,mean_meanpower_PT5_OD3,mean_meanpower_PT5_OR3,mean_meanpower_PT5_HC3] ...
    = Power_LinePlot_RGS14_fun(3,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON4,mean_meanpower_PT5_OD4,mean_meanpower_PT5_OR4,mean_meanpower_PT5_HC4] ...
    = Power_LinePlot_RGS14_fun(4,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON7,mean_meanpower_PT5_OD7,mean_meanpower_PT5_OR7,mean_meanpower_PT5_HC7] ...
    = Power_LinePlot_RGS14_fun(6,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON8,mean_meanpower_PT5_OD8,mean_meanpower_PT5_OR8,mean_meanpower_PT5_HC8] ...
    = Power_LinePlot_RGS14_fun(7,barea,stage,freq,z);

PT5= [mean_meanpower_PT5_CON1,mean_meanpower_PT5_CON2,mean_meanpower_PT5_CON3, ...
    mean_meanpower_PT5_CON4,mean_meanpower_PT5_CON8,mean_meanpower_PT5_CON6,mean_meanpower_PT5_CON7, ...
    mean_meanpower_PT5_CON9,mean_meanpower_PT5_HC1,mean_meanpower_PT5_HC2,mean_meanpower_PT5_HC3, ...
    mean_meanpower_PT5_HC4,mean_meanpower_PT5_HC6,mean_meanpower_PT5_HC7, ...
    mean_meanpower_PT5_HC8,mean_meanpower_PT5_HC9, mean_meanpower_PT5_OD1, mean_meanpower_PT5_OD2, ...
    mean_meanpower_PT5_OD3,mean_meanpower_PT5_OD4,mean_meanpower_PT5_OD6,mean_meanpower_PT5_OD7, ...
    mean_meanpower_PT5_OD8,mean_meanpower_PT5_OD9,mean_meanpower_PT5_OR1,mean_meanpower_PT5_OR2, ...
    mean_meanpower_PT5_OR3,mean_meanpower_PT5_OR4,mean_meanpower_PT5_OR6,mean_meanpower_PT5_OR7, ...
    mean_meanpower_PT5_OR8,mean_meanpower_PT5_OR9];

maxmax=max(max(PT5));
mean_meanpower_PT5_CON_VEH=mean([mean_meanpower_PT5_CON1 mean_meanpower_PT5_CON2 mean_meanpower_PT5_CON6 mean_meanpower_PT5_CON9],2);
mean_meanpower_PT5_OD_VEH=mean([mean_meanpower_PT5_OD1 mean_meanpower_PT5_OD2 mean_meanpower_PT5_OD6 mean_meanpower_PT5_OD9],2);
mean_meanpower_PT5_OR_VEH=mean([mean_meanpower_PT5_OR1 mean_meanpower_PT5_OR2 mean_meanpower_PT5_OR6 mean_meanpower_PT5_OR9],2);
mean_meanpower_PT5_HC_VEH=mean([mean_meanpower_PT5_HC1 mean_meanpower_PT5_HC2 mean_meanpower_PT5_HC6 mean_meanpower_PT5_HC9],2);
mean_meanpower_PT5_CON_RGS=mean([mean_meanpower_PT5_CON3 mean_meanpower_PT5_CON4 mean_meanpower_PT5_CON8],2);
mean_meanpower_PT5_OD_RGS=mean([mean_meanpower_PT5_OD3 mean_meanpower_PT5_OD4 mean_meanpower_PT5_OD7 mean_meanpower_PT5_OD8],2);
mean_meanpower_PT5_OR_RGS=mean([mean_meanpower_PT5_OR3 mean_meanpower_PT5_OR4 mean_meanpower_PT5_OR7 mean_meanpower_PT5_OR8],2);
mean_meanpower_PT5_HC_RGS=mean([mean_meanpower_PT5_HC3 mean_meanpower_PT5_HC4 mean_meanpower_PT5_HC7 mean_meanpower_PT5_HC8],2);


subplot(2,2,1)
semilogy(x,mean_meanpower_PT1_4_CON_VEH,x,mean_meanpower_PT1_4_OD_VEH,x,mean_meanpower_PT1_4_OR_VEH,x,mean_meanpower_PT1_4_HC_VEH, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Vehicle ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'PT1-4']);

subplot(2,2,2)
semilogy(x,mean_meanpower_PT1_4_CON_RGS,x,mean_meanpower_PT1_4_OD_RGS,x,mean_meanpower_PT1_4_OR_RGS,x,mean_meanpower_PT1_4_HC_RGS, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['RGS14 ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'PT1-4']);

subplot(2,2,3)
semilogy(x,mean_meanpower_PT5_CON_VEH,x,mean_meanpower_PT5_OD_VEH,x,mean_meanpower_PT5_OR_VEH,x,mean_meanpower_PT5_HC_VEH, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Vehicle ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'PT5']);

subplot(2,2,4)
semilogy(x,mean_meanpower_PT5_CON_RGS,x,mean_meanpower_PT5_OD_RGS,x,mean_meanpower_PT5_OR_RGS,x,mean_meanpower_PT5_HC_RGS, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['RGS14 ' barea ' ' stage2 ' ' int2str(freq) 'Hz ' 'PT5']);


cd('/media/lisa/REM/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')
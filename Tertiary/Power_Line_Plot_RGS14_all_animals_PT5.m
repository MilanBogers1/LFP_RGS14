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



[x,mean_meanpower_PT5_CON1,mean_meanpower_PT5_OD1,mean_meanpower_PT5_OR1,mean_meanpower_PT5_HC1] ...
    = Power_LinePlot_RGS14_PT5_fun(1,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON2,mean_meanpower_PT5_OD2,mean_meanpower_PT5_OR2,mean_meanpower_PT5_HC2] ...
    = Power_LinePlot_RGS14_PT5_fun(2,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON6,mean_meanpower_PT5_OD6,mean_meanpower_PT5_OR6,mean_meanpower_PT5_HC6] ...
    = Power_LinePlot_RGS14_PT5_fun(5,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON9,mean_meanpower_PT5_OD9,mean_meanpower_PT5_OR9,mean_meanpower_PT5_HC9] ...
    = Power_LinePlot_RGS14_PT5_fun(8,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON3,mean_meanpower_PT5_OD3,mean_meanpower_PT5_OR3,mean_meanpower_PT5_HC3] ...
    = Power_LinePlot_RGS14_PT5_fun(3,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON4,mean_meanpower_PT5_OD4,mean_meanpower_PT5_OR4,mean_meanpower_PT5_HC4] ...
    = Power_LinePlot_RGS14_PT5_fun(4,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON7,mean_meanpower_PT5_OD7,mean_meanpower_PT5_OR7,mean_meanpower_PT5_HC7] ...
    = Power_LinePlot_RGS14_PT5_fun(6,barea,stage,freq,z);
[x,mean_meanpower_PT5_CON8,mean_meanpower_PT5_OD8,mean_meanpower_PT5_OR8,mean_meanpower_PT5_HC8] ...
    = Power_LinePlot_RGS14_PT5_fun(7,barea,stage,freq,z);

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

subplot(4,2,1);
semilogy(x,mean_meanpower_PT5_CON1,x,mean_meanpower_PT5_OD1,x,mean_meanpower_PT5_OR1,x,mean_meanpower_PT5_HC1, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat1 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,2);
semilogy(x,mean_meanpower_PT5_CON3,x,mean_meanpower_PT5_OD3,x,mean_meanpower_PT5_OR3,x,mean_meanpower_PT5_HC3, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat3 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,3);
semilogy(x,mean_meanpower_PT5_CON2,x,mean_meanpower_PT5_OD2,x,mean_meanpower_PT5_OR2,x,mean_meanpower_PT5_HC2, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat2 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,4);
semilogy(x,mean_meanpower_PT5_CON4,x,mean_meanpower_PT5_OD4,x,mean_meanpower_PT5_OR4,x,mean_meanpower_PT5_HC4, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat4 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,5);
semilogy(x,mean_meanpower_PT5_CON6,x,mean_meanpower_PT5_OD6,x,mean_meanpower_PT5_OR6,x,mean_meanpower_PT5_HC6, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat6 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,6);
semilogy(x,mean_meanpower_PT5_CON7,x,mean_meanpower_PT5_OD7,x,mean_meanpower_PT5_OR7,x,mean_meanpower_PT5_HC7, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat7 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,7);
semilogy(x,mean_meanpower_PT5_CON9,x,mean_meanpower_PT5_OD9,x,mean_meanpower_PT5_OR9,x,mean_meanpower_PT5_HC9, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat9 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

subplot(4,2,8);
semilogy(x,mean_meanpower_PT5_CON8,x,mean_meanpower_PT5_OD8,x,mean_meanpower_PT5_OR8,x,mean_meanpower_PT5_HC8, 'LineWidth',2);
legend('CON','OD','ÓR','HC','Location','northeast');
ylabel('Power');
xlabel('Frequency');
xlim([zz, freq]);
ylim([0, maxmax]);
title(['Rat8 ' barea ' ' stage2 ' ' int2str(freq) 'Hz']);

cd('/media/lisa/REM/Milan_DA/RGS14_Ephys_da/Data_RGS14_Downsampled_First_Session')
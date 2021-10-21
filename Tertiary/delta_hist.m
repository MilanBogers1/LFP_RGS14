
subplot(3,2,1)
           % xlim([100 250])
            h1=histogram(x_veh); title('Instantaneous Frequencies');xlabel('Frequency (Hz)');ylabel('Count')
            h1.BinWidth=.5;
            hold on
            h2=histogram(x_rgs); title('Instantaneous Frequencies');xlabel('Frequency (Hz)');ylabel('Count')
            h2.BinWidth=.5;
            legend('Vehicle', 'RGS14')
            hold off
            
            subplot(3,2,2)
%             xlim([100 250])
            h1=histogram(y_veh); title('Average Frequencies');xlabel('Frequency (Hz)');ylabel('Count')
            h1.BinWidth=.25;
            hold on
            h2=histogram(y_rgs); title('Average Frequencies');xlabel('Frequency (Hz)');ylabel('Count')
            h2.BinWidth=.25;
            legend('Vehicle', 'RGS14')
            hold off
            
            
            subplot(3,2,3)
%             xlim([0 30])
            h1=histogram(z_veh); title('Amplitude');xlabel('\muV');ylabel('Count')
            h1.BinWidth=10;
            hold on
            h2=histogram(z_rgs); title('Amplitude');xlabel('\muV');ylabel('Count')
            h2.BinWidth=10;
            legend('Vehicle', 'RGS14')
            hold off
            
            
             subplot(3,2,4)
%             xlim([0 0.5])
            h1=histogram(l_veh); title('Area under the curve');xlabel('AUC');ylabel('Count')
            h1.BinWidth=.5;
            hold on
            h2=histogram(l_rgs); title('Area under the curve');xlabel('AUC');ylabel('Count')
            h2.BinWidth=.5;
            legend('Vehicle', 'RGS14')
            hold off
            
            subplot(3,2,5)
            h1=histogram(q_veh*1000); title('Duration');xlabel('MIliseconds');ylabel('Count') 
            h1.BinWidth=5;
            hold on
            h2=histogram(q_rgs*1000); title('Duration');xlabel('MIliseconds');ylabel('Count')
            h2.BinWidth=5;
            legend('Vehicle', 'RGS14')
            hold off
            
            subplot(3,2,6)
%             xlim([0 45])
            h1=histogram(p_veh); title('Peak-to-peak amplitude');xlabel('\muV');ylabel('Count'); 
            h1.BinWidth=10;
            hold on
            h2=histogram(p_rgs); title('Peak-to-peak amplitude');xlabel('\muV');ylabel('Count'); 
            h2.BinWidth=10;
            legend('Vehicle', 'RGS14')
            hold off

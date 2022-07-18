close all;
clear all;

fid = fopen('m50_1.txt');
data1 = fscanf(fid,'%f');
fclose(fid);
data1 = flipud(data1);
data1 = data1(103:end);
L = length(data1);
plot((0:L-1)/(L-1)*49+1,data1,'r'); hold on;

fid = fopen('m50_2.txt');
data2 = fscanf(fid,'%f');
fclose(fid);
data2 = flipud(data2);
data2 = data2(110:end-10);
L = length(data2);
plot((0:L-1)/(L-1)*49+1,data2,'k'); hold on;

fid = fopen('m50_3.txt');
data3 = fscanf(fid,'%f');
fclose(fid);
data3 = flipud(data3);
data3 = data3(95:end);
L = length(data3);
plot((0:L-1)/(L-1)*49+1,data3,'g'); hold on;

fid = fopen('m50_4.txt');
data4 = fscanf(fid,'%f');
fclose(fid);
data4 = flipud(data4);
data4 = data4(92:end-7);
L = length(data4);
plot((0:L-1)/(L-1)*49+1,data4,'b'); hold on;

% Free space path loss
fc = 2.412;
TxPower = 7;
TxGain = 0;
RxGain = 0;
d = 1:0.5:50;
PL = 32.44 + 20*log10(fc*d); % Free space path loss
plot(d,TxPower+TxGain+RxGain-PL,'k:');

ylabel('Received power (dBm)');
xlabel('Tx-Rx separation (m)');

set(gcf,'color','white')
legend('Measurement 1','Measurement 2','Measurement 3','Measurement 4','FSPL');

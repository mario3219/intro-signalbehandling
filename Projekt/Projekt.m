%% Ladda filen
load("projekt.mat")

% Tid vektor utifrån samplerna
Fs = 256;
t=0:1/Fs:length(ecg)/Fs-1/Fs;

%% Accelerometer

figure
subplot(311)
plot(t, acc(1,:))
title('X-riktning'), ylabel('a(m/s^2)'), xlabel('t(s)')
subplot(312)
plot(t, acc(2,:))
title('Y-riktning'),ylabel('a(m/s^2)'), xlabel('t(s)')
subplot(313)
plot(t, acc(3,:))
title('Z-riktning'),ylabel('a(m/s^2)'), xlabel('t(s)')

[r,l]=xcorr(acc(1,:));
figure
plot(l,r)
title('Autokorrelation av X-riktningen')

N=100000;
f=0:1/N:1-1/N;
figure
subplot(311), plot(f*Fs,abs(fft(acc(1,:),N))), title('|X(F)|'), xlabel('F')
subplot(312), plot(f*Fs,abs(fft(acc(2,:),N))), title('|Y(F)|'), xlabel('F')
subplot(313), plot(f*Fs,abs(fft(acc(3,:),N))), title('|Z(F)|'), xlabel('F')

% Hur rör sig klockan?
% Enligt x,y,z graferna:
% X-riktning: skiftar mellan negativ och positiv, antagligen pga att
% cyklisten trampar och lutar höger sen vänster
% Y-riktning: konstant positiva värden, betyder att detta är 'framåt' för
% cyklisten
% Z-riktning: positiva värden, vilket betyder att cyklisten åker i en
% uppförsbacke

% Periodicitet:
% Utifrån autokorrelationen:
% Avstånd mellan två toppar: 269 sampel
% 269/256=1.05 sekunder mellan varje vågtopp
% 1/1.05 = 0.95 trampslag per sekund


%% EKG

% Plottar EKG signalen

figure
plot(t, ecg(1,:));
title('EKG');
xlabel('t(s)')

N=100000;
f=0:1/N:1-1/N;
figure
plot(f*Fs,abs(fft(ecg(1,:),N))), title('|EKG(f)|'), xlabel('f')

[x,f] = pwelch(ecg,rectwin(2500),0,2500,Fs);
figure
plot(f,x), title('|EKGwelch(F)|'), xlabel('f')

[r,l]=xcorr(ecg(1,:));
figure
plot(l,r)
title('Autocorrelation of ECG'), xlabel('L')

b_IIR_LP=0.1;
a_IIR_LP=[1 -0.9];

b_IIR_HP=0.1;
a_IIR_HP=[1 0.9];

ecg_IIR_LP=filter(b_IIR_LP,a_IIR_LP,ecg);
ecg_IIR_HP=filter(b_IIR_HP,a_IIR_HP,ecg);

figure
plot(t, ecg_IIR_LP);
title('ekgLP');
xlabel('t(s)')

%%

r=0.995;
w=0.95488/256;
a = [1 -2*r*cos(2*pi*w) r^2];
b = [1 -2*cos(2*pi*w) 1];
x = filtfilt(b,a,ppg);

N=100000;
f=0:1/N:1-1/N;
figure
plot(f*Fs,abs(fft(x,N))), title('|PPG(F)| & |PPG_f_i_l_t_e_r_e_d(F)| & |ECG(F)|'), xlabel('F')
hold on
plot(f*Fs,abs(fft(ppg,N)))
hold on
plot(f*Fs,abs(fft(ecg,N)))
legend('|PPG_f_i_l_t_e_r_e_d(F)|', '|PPG(F)|', '|ECG(F)')

figure
plot(t, x);
hold on
plot(t, ppg);
title('PPG & PPG_f_i_l_t_e_r_e_d'), xlabel('t(s)');
legend('PPG_f_i_l_t_e_r_e_d','PPG')

figure
[r,l]=xcorr(x);
plot(l,r)
title('Autocorrelation of PPG_f_i_l_t_e_r_e_d'), xlabel('L');

%% impuls svar

r=0.995;
w=0.95488/256;
a = [1 -2*r*cos(2*pi*w) r^2];
b = [1 -2*cos(2*pi*w) 1];

fvtool(b,a)

%% PPG

% figure
% plot(t, ppg(1,:));
% title('PPG');
% xlabel('t(s)')

figure
plot(ppg(1,:));
title('PPG');

N=100000;
f=0:1/N:1-1/N;
figure
plot(f*Fs,abs(fft(ppg(1,:),N))), title('|PPG(F)|'), xlabel('F')

[x,f] = pwelch(ppg,rectwin(2500),0,2500,Fs);
figure
plot(f,x), title('|PPGwelch(F)|'), xlabel('F')

% Störning: 0.9216Hz, 0.0039varv/sampel, 0.0245 rad/sample

figure
subplot(211), [r,l]=xcorr(y);
plot(l,r)
title('Autokorrelation av PPG')

%% Notch filter

d1 = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',0.9,'HalfPowerFrequency2',0.95, ...
               'DesignMethod','butter','SampleRate',Fs);
y=filtfilt(d1,ppg);

figure, plot(y), title('ppgNotch');

N=100000;
f=0:1/N:1-1/N;
figure
plot(f*Fs,abs(fft(y,N))), title('|PPGnotch(F)|'), xlabel('F')
hold on
plot(f*Fs,abs(fft(ppg,N)))

[r,l]=xcorr(y);
figure
plot(l,r)
title('Autokorrelation av PPG')

% 1.66 ppg frekvens

%% Moving average

% n = 70;   % filter order
% y = filter(ones(n, 1)/n, 1, ppg);
% figure, plot(ppg), title('ppg');
% figure, plot(y), title('ppg filtered');

% Testing

%% Low pass

d2 = designfilt('lowpassfir','PassbandFrequency',0.0001, ...
         'StopbandFrequency',0.012,'PassbandRipple',0.5, ...
         'StopbandAttenuation',65,'DesignMethod','kaiserwin');
y=filtfilt(d2,ppg);

figure, plot(y), title('ppgLP');

N=100000;
f=0:1/N:1-1/N;
figure
plot(f*Fs,abs(fft(y,N))), title('|PPGLP(F)|'), xlabel('F')

%% high pass

d3 = designfilt('highpassfir','StopbandFrequency',0.0001, ...
         'PassbandFrequency',0.012,'PassbandRipple',0.5, ...
         'StopbandAttenuation',65,'DesignMethod','kaiserwin');
y=filtfilt(d3,ppg);

figure, plot(y), title('ppgHP');

N=100000;
f=0:1/N:1-1/N;
figure
plot(f*Fs,abs(fft(y,N))), title('|PPGHP(F)|'), xlabel('F')

% r=0.99;
% w=0.9216*2*pi;
% % a = [1 -2*r*cos(w) r^2];
% % b = [1 -2*cos(w) 1];
% a = [0.99 -1.99 0.99];
% b = [1 -1.99 0.99];
% x = filter(b,a,ppg);
% 
% N=100000;
% f=0:1/N:1-1/N;
% figure
% plot(f*Fs,abs(fft(x,N))), title('|PPGnotcdwdh(F)|'), xlabel('F')

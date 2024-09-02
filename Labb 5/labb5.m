%% Task 1

% Create two discrete signals with different frequencies

f1=0.25;
f2=0.3;
M=1000;
n=1:M;
x1=cos(2*pi*f1*n);
x2=cos(2*pi*f2*n);

% Create a third signal as the sum of the two

x3=x1+x2;

% Calculate DFT x(k) with M=1000 and plot

N=M;
figure
subplot(311), plot(abs(fft(x1,N)))
title('X1(k)')
subplot(312),plot(abs(fft(x2,N)))
title('X2(k)')
subplot(313),plot(abs(fft(x3,N)))
title('X3(k)')

% Calculate DFT x(f) with M=1000 and plot

f=0:1/N:1-1/N;
figure,
subplot(311), plot(f,abs(fft(x1,N))), ylabel('|X(f)|')
title('X1(f)')
subplot(312),plot(f,abs(fft(x2,N))), ylabel('|X(f)|')
title('X2(f)')
subplot(313),plot(f,abs(fft(x3,N))), xlabel('f'), ylabel('|X(f)|')
title('X3(f)')

%% Task 1 - Same again, M=100

% Create two discrete signals with different frequencies

f1=0.25;
f2=0.3;
M=100;
n=1:M;
x1=cos(2*pi*f1*n);
x2=cos(2*pi*f2*n);

% Create a third signal as the sum of the two

x3=x1+x2;

% Calculate DFT x(k) with M=100 and plot

N=M;
figure
subplot(311), plot(abs(fft(x1,N)))
title('X1(k)')
subplot(312),plot(abs(fft(x2,N)))
title('X2(k)')
subplot(313),plot(abs(fft(x3,N)))
title('X3(k)')

% Calculate DFT x(f) with M=100 and plot

f=0:1/N:1-1/N;
figure,
subplot(311), plot(f,abs(fft(x1,N))), ylabel('|X(f)|')
title('X1(f)')
subplot(312),plot(f,abs(fft(x2,N))), ylabel('|X(f)|')
title('X2(f)')
subplot(313),plot(f,abs(fft(x3,N))), xlabel('f'), ylabel('|X(f)|')
title('X3(f)')


%% Task 1 - Same again, M = 10

% Create two discrete signals with different frequencies

f1=0.25;
f2=0.3;
M=10;
n=1:M;
x1=cos(2*pi*f1*n);
x2=cos(2*pi*f2*n);

% Create a third signal as the sum of the two

x3=x1+x2;

% Calculate DFT x(k) with M=10 and plot

N=M;
figure
subplot(311), plot(abs(fft(x1,N)))
title('X1(k)')
subplot(312),plot(abs(fft(x2,N)))
title('X2(k)')
subplot(313),plot(abs(fft(x3,N)))
title('X3(k)')

% Calculate DFT x(f) with M=10 and plot

f=0:1/N:1-1/N;
figure,
subplot(311), plot(f,abs(fft(x1,N))), ylabel('|X(f)|')
title('X1(f)')
subplot(312),plot(f,abs(fft(x2,N))), ylabel('|X(f)|')
title('X2(f)')
subplot(313),plot(f,abs(fft(x3,N))), xlabel('f'), ylabel('|X(f)|')
title('X3(f)')

% How does the signal length affect the resolution?
% In fourier, the more cosinus terms the higher resolution you get,
% described by the sum DFT formula. If you have a smaller signal length,
% the peak amplitudes for given frequencies start to overlap and its harder
% to make distinct measures for which k or f that results in a peak.

% An example is when M=1000, its easy to find which k values that give
% peaks, compared to M=10 where the signals start increasing on the same
% value of k/f

%% Task 1 - Zero padding

% Create the same three signals as before with M=10

f1=0.25;
f2=0.3;
M=10;
n=1:M;
x1=cos(2*pi*f1*n);
x2=cos(2*pi*f2*n);
x3=x1+x2;

% N=10

N=10;
f=0:1/N:1-1/N;
figure,
subplot(311), plot(f,abs(fft(x1,N))), ylabel('|X(f)|')
title('X1(f)')
subplot(312),plot(f,abs(fft(x2,N))), ylabel('|X(f)|')
title('X2(f)')
subplot(313),plot(f,abs(fft(x3,N))), xlabel('f'), ylabel('|X(f)|')
title('X3(f)')

% N=100

N=100;
f=0:1/N:1-1/N;
figure,
subplot(311), plot(f,abs(fft(x1,N))), ylabel('|X(f)|')
title('X1(f)')
subplot(312),plot(f,abs(fft(x2,N))), ylabel('|X(f)|')
title('X2(f)')
subplot(313),plot(f,abs(fft(x3,N))), xlabel('f'), ylabel('|X(f)|')
title('X3(f)')

% N=1000

N=1000;
f=0:1/N:1-1/N;
figure,
subplot(311), plot(f,abs(fft(x1,N))), ylabel('|X(f)|')
title('X1(f)')
subplot(312),plot(f,abs(fft(x2,N))), ylabel('|X(f)|')
title('X2(f)')
subplot(313),plot(f,abs(fft(x3,N))), xlabel('f'), ylabel('|X(f)|')
title('X3(f)')

% How does the amount of points to calculate DFT affect the signal?
% The resolution increases with the amount of points to calculate.

%% Task 2 - Piano

% Clear workspace and load the piano data

clear all
load('piano8000.mat');

% Create time vectors

Fs = fs_piano;
tA=0:1/Fs:length(pianoA)/Fs-1/Fs;
tC=0:1/Fs:length(pianoC)/Fs-1/Fs;

% Plot the piano signals

figure
subplot(211), plot(pianoA);
xlabel('pianoA(n)')
subplot(212), plot(tA, pianoA);
xlabel('pianoA(t)')

figure
subplot(211), plot(pianoC);
xlabel('pianoC(n)')
subplot(212), plot(tC, pianoC);
xlabel('pianoC(t)')

% Listen to the signals

%soundsc(pianoA,Fs);
%soundsc(pianoC,Fs);

% How long are the signals?
% pianoA is 0.7s and pianoC is 1.2

% What similarities and differences between the two signals?
% One has a higher tone, one lower. The higher tones has thicker plots,
% showing that it has higher frequencies

% What periods do they have?
% Signal A: 0.098625s-0.096375s=0.0023s=2.3ms, 18.6 samples
% Signal C: 0.187625s-0.183875s=0.0037s=3.7ms, 29.8 samples

% Calculate FFT of channel 1 with both piano signals and N=4096 and plot
% them

N=4096;
f=0:1/N:1-1/N;
figure
subplot(211), plot(f,abs(fft(pianoA(:,1),N))), title('|pianoA(f)|'), xlabel('f')
subplot(212), plot(f,abs(fft(pianoC(:,1),N))), title('|pianoC(f)|'), xlabel('f')

% At what frequencies do we get amplitude peaks?
% We get peaks for every type of frequency that exists in the signal, which
% relates to the period times of different parts of the signal

% Plot the same signal but instead of normalized frequency, as regular
% frequency

N=4096;
f=0:1/N:1-1/N;
figure
subplot(211), plot(f*Fs,abs(fft(pianoA(:,1),N))), title('|pianoA(F)|'), xlabel('F')
subplot(212), plot(f*Fs,abs(fft(pianoC(:,1),N))), title('|pianoC(F)|'), xlabel('F')

% At what frequencies do we get amplitude peaks?
% Same frequencies as before, but converted into regular frequencies

%% Task 2 - Trumpet and trombone

% Clear workspace and load the piano data

clear all
load('brass.mat');

% Create time vectors

Fs = fs;
tTrombon=0:1/Fs:length(trombon)/Fs-1/Fs;
tTrumpet=0:1/Fs:length(trumpet)/Fs-1/Fs;

% Plot the signals

figure
subplot(211), plot(trumpet);
xlabel('trumpet(n)')
subplot(212), plot(tTrumpet, trumpet);
xlabel('trumpet(t)')

figure
subplot(211), plot(trombon);
xlabel('trombon(n)')
subplot(212), plot(tTrombon, trombon);
xlabel('trombon(t)')

% Listen to the signals

%soundsc(trumpet,Fs);
%soundsc(trombon,Fs);

% Plot the fft signals

figure
f=0:1/length(trumpet):1-1/length(trumpet);
subplot(211), plot(f*Fs,abs(fft(trumpet(:,1),length(trumpet)))), title('|trumpet(F)|'), xlabel('F')
f=0:1/length(trombon):1-1/length(trombon);
subplot(212), plot(f*Fs,abs(fft(trombon(:,1),length(trombon)))), title('|trombon(F)|'), xlabel('F')

% What similarities and differences are there?
% Both signals have very similar frequencies
% What tones are being played?
% 260Hz, 267Hz

%% Task 3

clear all
load('ppg_ecg_ex.mat')

% Plot the fft signals

Fs=250;
N=length(ekg);
f=0:1/N:1-1/N;
figure
subplot(211), plot(f*Fs,abs(fft(ekg(1,:),N))), title('|EKG(F)|'), xlabel('F')
subplot(212), plot(f*Fs,abs(fft(ppg(1,:),N))), title('|PPG(F)|'), xlabel('F')

% At what frequencies are there amplitude peaks?
% EKG: 1.1Hz and another peak at 62Hz
% PPG: 1.1Hz

% Compare the frequencies to the results from lab 2
% EKG lab 2: frequency of about 1, which is the same as this result

% Calculate and plot the welch spectra

figure
[x,f] = pwelch(ekg,rectwin(2500),0,2500,250);
subplot(211), plot(f,x), title('|EKGwelch(F)|'), xlabel('F')
[x,f] = pwelch(ppg,rectwin(2500),0,2500,250);
subplot(212), plot(f,x), title('|PPGwelch(F)|'), xlabel('F')

% What differences do you see between welch and non-welch?
% The resolution in the welch method is better

% Create a IIR lowpass and highpass filter

b_IIR_LP=0.1;
a_IIR_LP=[1 -0.9];

b_IIR_HP=0.1;
a_IIR_HP=[1 0.9];

% Filter the signal with each filter

ekg_IIR_LP=filter(b_IIR_LP,a_IIR_LP,ekg);
ekg_IIR_HP=filter(b_IIR_HP,a_IIR_HP,ekg);

% Calculate and plot the welch results for HP & LP filtered and
% non-filtered ECG

figure
[x,f] = pwelch(ekg,rectwin(2500),0,2500,250);
subplot(311), plot(f,x), title('|EKGwelch(F)|'), xlabel('F')
[x,f] = pwelch(ekg_IIR_HP,rectwin(2500),0,2500,250);
subplot(312), plot(f,x), title('|EKGHPwelch(F)|'), xlabel('F')
[x,f] = pwelch(ekg_IIR_LP,rectwin(2500),0,2500,250);
subplot(313), plot(f,x), title('|EKGLPwelch(F)|'), xlabel('F')

% Compare the spectrum. What similarities and differences do you see?
% They are both the same signal, except one has filtered out high
% frequencies and vice versa

%% Task 4

clear all
load('EEGOnsetSeizure.mat');
Fs=256;
eeg=X(:,3);

% Creating the time vector

t=0:1/Fs:length(X)/Fs-1/Fs;

% Plot channel 3
figure
plot(t, X(:,3))
title('Channel 3');

% How long is the recording?
% According to t vector: 24s

% At what point do you think the seizure starts?
% At 10s, because the signal gets more hectic at that time

% Divide the signal into 1s segments and calculate FFT with N=1024

[S,F,t]=stft(eeg,256,'Window',rectwin(256),'OverlapLength',0,'FFTLength',1024,'FrequencyRange','onesided');

% Plot as a function of frequency F and startime t for the segments

figure, surf(F,t,abs(S)')
xlabel('F (Hz)'), ylabel('t (s)'), zlabel('|X(F,t))|')

% Downsize the x-axis to 0-5Hz region

axis([0 5 0 23 0 8000])

% How does the frequency change over time?
% Amplitude of the frequencies increase and are more prevalent at time 10s

% Why?
% Because the seizure is increasing the activity at this time




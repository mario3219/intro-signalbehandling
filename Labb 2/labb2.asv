%% Uppgift 1

N = 1:10000;
% linspace(1,10000);
x1 = cos(2*pi*0.1*N);
x2 = cos(2*pi*0.7*N);
x3 = cos(2*pi*0.5*N);

[r,l]=xcorr(x1);
figure
subplot(311)
plot(l,r)
xlabel('l')
ylabel('r')
hold on
axis([-100, 100, -inf, inf])

[r,l]=xcorr(x2);
subplot(312)
plot(l,r)
xlabel('l')
ylabel('r')
hold on

[r,l]=xcorr(x3);
subplot(313)
plot(l,r)
xlabel('l')
ylabel('r')
hold on

% För vilka fördröjningar har funktionen toppar?
% Toppar vid varje L = 10*k (f=0,1)

% Vilken relation mellan frekvens och r toppar?
% k* 1/f för varje topp

%% Uppgift 2

% Skapa signaler
d=10;
x1=[0:10,10:-1:1];
x2=[zeros(1,d),x1];

% Plotta signaler
figure
subplot(211),stem(x1), axis([0 35 0 10])
subplot(212),stem(x2), axis([0 35 0 10])

% Beräkna och plotta korskorrelationen x2 och x1
[r,l]=xcorr(x2,x1);
figure
subplot(211)
stem(l,r)
title('x2 och x1')
xlabel('l')
ylabel('r')
hold on

% Vilket l är korskorrelationen maximal?
% Vid l = 10

% Beräkna och plotta korskorrelationen x1 och x2
[r,l]=xcorr(x1,x2);
subplot(212)
stem(l,r)
title('x1 och x1')
xlabel('l')
ylabel('r')
hold on

%% Uppgift 3

load('ppg_ecg_ex.mat');
figure
subplot(311)
plot(ekg(1,:))
title('EKG')
hold on

subplot(312)
plot(ppg(1,:))
title('PPG')
hold on

% Hur lång är inspelningen?
% 122760 sampel, 250 sampel/sekund
% -> 491 sekunder

Fs = 250;
t=0:1/Fs:length(ekg)/Fs-1/Fs;

subplot(313)
plot(t,ekg(1,:))
title('EKG')
xlabel('t(s)')

% Vilken hjärtfrekvens?
% En period: 332.308 - 331.324 = 0.984
% På 60s -> 59 hjärtfrekvens

%% Uppgift 4
load('ppg_ecg_ex.mat')

% Autokorrelera EKG
[r_ekg,l_ekg]=xcorr(ekg);
figure
subplot(211)
plot(l_ekg,r_ekg)
title('EKG autokorrelation')
xlabel('l')
ylabel('r')
hold on

% För vilka L har funktionen toppar?
% För varje ungefär 240 sampel
% En topp för varje förskjutning som leder till att
% frekvens topparna är över varandra

% Hur relaterar detta till tiden mellan pulserna i EKG?
% Patienten har en puls per sekund, alltså en puls per 250 sampel.
% Därför är L toppar vid varje förskjutning av 250 sampel. 250 sampel
% motsvarar ungefär 1 sekund, därför sker en L topp för varje förskjutning
% av 1 sekund.

% Autokorrelera PPG
[r_ppg,l_ppg]=xcorr(ppg);
subplot(212)
plot(l_ppg,r_ppg)
title('PPG autokorrelation')
xlabel('l')
ylabel('r')
hold on

% För vilka L har funktionen toppar?
% 237 sampel * k
% i PPG finns 255 mellan två toppar

% Hur relaterar detta till tiden mellan pulserna i PPG signalen?
% Tiden mellan två pulser är tiden mellan två L toppar

%% Uppgift 5

load('ppg_ecg_ex.mat')
figure
ax1=subplot(311); plot(ekg), grid on
title('EKG')
ax2=subplot(312); plot(ppg), grid on
title('PPG')
linkaxes([ax1,ax2],'x')

% Hur många sampels fördröjning?
% EKG: sampel 70298
% PPG: sampel 70355
% Fördröjning: 57 sampel
% PTT = 57/250 = 0.228 sekunder

[r,l]=xcorr(ekg,ppg);
subplot(313)
plot(l,r)
title('Korskorrelation EKG & PPG')

% Hur lång är PTT skattad med korskorrelation?
% Första topp från sampel 0 sker vid 59
% Fördröjd med 59 samplar
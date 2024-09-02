%% Uppgift 1:
import('ekg.mat')
figure
subplot(311), plot(ekg(1,:)),ylabel('I');
subplot(312), plot(ekg(2,:)),ylabel('II');
subplot(313), plot(ekg(3,:)),ylabel('III');

xlabel('n');

%%

% Sampling
Fs = 500;
t=0:1/Fs:length(ekg)/Fs-1/Fs;

figure
subplot(311), plot(t,ekg(1,:)),ylabel('I')
subplot(312), plot(t,ekg(2,:)),ylabel('II')
subplot(313), plot(t,ekg(3,:)),ylabel('III')
xlabel('t(s)')

% Hjärtfrekvens: ungefär 5 pulser på 5 sekunder -> 60

%%

% Upplösning: Göra om y-axeln till mV

figure
subplot(311), plot(t,(ekg(1,:)+25816)/38190),ylabel('I (mV)')
subplot(312), plot(t,(ekg(2,:)+23964)/54340),ylabel('II (mV)')
subplot(313), plot(t,(ekg(3,:)-18530)/53323),ylabel('III (mV)')
xlabel('t(s)')

% Varför olika offset & skalning?
% För att de olika avledningarna ger olika höga amplituder, behovet av
% skalning och offset ändras

%% Uppgift 2:

[x,Fs]=audioread('Harvard_sentence_ex.wav');
soundsc(x,Fs);

%%

Fs_rek = 10000
soundsc(x,Fs_rek);

%% Plotta signalen

[x,Fs]=audioread('Harvard_sentence_ex.wav');
t=0:1/Fs:length(x)/Fs-1/Fs;
figure
plot(t,x)
xlabel('t(s)')

%% Lyssna på utvalda segment

[x,Fs]=audioread('Harvard_sentence_ex.wav');
n_start=find(t>0.2,1,'first')
n_end=find(t<0.3,1,'last')
x_seg=x(n_start:n_end);
soundsc(x_seg,Fs)

% Vilken periodtid?
% x1 = 2.0326s, x2 = 2.03725s
% En våglängd på 0.00465s
% Frekvens = 215Hz

%% Få kvinnan att låta som en man

% f = 215
% 215/48000 = 100/Fs
% -> Fs = 22325

[x,Fs]=audioread('Harvard_sentence_ex.wav');
Fs_rek = 22325;
soundsc(x,Fs_rek);

%% Uppgift 3:

f1 = 0.2;
f2 = 0.6;
N = 3000;
n = 0:N;
Fs = 2000;

x1=cos(2*pi*f1*n);
x2=cos(2*pi*f2*n);

soundsc(x1,Fs);

% Två signaler, båda låter samma

% Högsta vi kan höra är +-0.5. Allt över blir en förskjuten signal.

% Vilka normerade frekvenser?
% k + f1 eller
% k + f2


%% Plotta signalerna

figure,
stem(n(1:100),x1(1:100));
hold on
stem(n(1:100),x2(1:100),':*r');

% i x-led, n värden från 1 till 100. Och y-led, plotta cosinus med ändrad n
% för varje steg. Vi ser en digital version av signalen

%% Uppgift 4:

load('mri.mat')
figure
imagesc(mrbild1);
colormap('gray');

%% Färgkoda bild 2's pixlar enligt fyra pixelvärden

load('mri.mat')
figure
imagesc(mrbild2);
colormap([0 0 0;0 0 1; 0 1 0; 1 0 0; 1 1 0])

% Vilka färger?
% Blå grön röd gul

%% Andra färger

load('mri.mat')
figure
imagesc(mrbild2);
colormap([0 0 0;1 0 1; 1 1 0; 1 0 0; 1 1 0])

%% Ändra bild 1 med andra färger

load('mri.mat')
figure
imagesc(mrbild1);
colormap([0 0 0;1 0 1; 1 1 0; 1 0 0; 1 1 0])

%% Skriv ut MR data från automatiserad segmentering med slice funktionen

load('mri.mat')

xslice = 100; %välj skikt i sagittalplanet
yslice = [80 200]; %välj skikt i coronalplanet
zslice = []; %välj skikt i axialplanet
figure
slice(v1,xslice,yslice,zslice); %Plotta valda skikt
colormap gray
axis equal %använd samma skalning för x,y, och z-axlarna
set(gcf,'Position',get(0,'Screensize'));%förstora bilden så att den fyller skärmen

plane = 'coronal'; % välj plan 'axial' 'coronal' 'sagittal'
sl = 50; % välj skikt (0-300)
switch plane
case 'axial'
I1 = v1(:,:,sl);
I2 = v2(:,:,sl);
case 'coronal'
I1 = squeeze(v1(:,sl,:)); %gör Mx1xN tensor till MxN matris
I2 = squeeze(v2(:,sl,:));
case 'sagittal'
I1 = squeeze(v1(sl,:,:)); %gör 1xMxN tensor till MxN matris
I2 = squeeze(v2(sl,:,:));
end
I1 = flipud(I1'); %vänd bild rätt
I2 = flipud(I2');

% Plotta matriser i1 och i2 från utvald segment:
figure
imagesc(I1);
colormap('gray');

figure
imagesc(mrbild2);
colormap('gray');

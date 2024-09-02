%% Task 1

% Create the filter

a_FIR=1;
b_FIR_LP=[0.25 0.25 0.25 0.25];

% Create the low frequency signal

f1=0.01;
N=200;
n=0:N;
x1=cos(2*pi*f1*n);

% Filter and plot the input and output

y1_FIR_LP = filter(b_FIR_LP,a_FIR,x1);
figure
plot(x1)
title('Low frequency signal')
hold on
plot(y1_FIR_LP,'r')

% How has the filter affected the signal?
% The filtered signal jumps at the start and is delayed with about 2
% samples compared to the input.

% 1. How many samples does the filter have to go through to fully work?
% 4 samples. You can see that the filtered signal is jagged before 4
% samples. The differencial equation derived from our filter also states
% that it requires the values of four input signals in the past for a given
% sample value.

% 2. Is the filtered signal shifted?
% Yes. Comparing the filtered signal apex vs the input signal shows a shift
% of ~ 2 samples.

% 3. Has the amplitude been affected by the filter?
% Yes. The filtered signal is about 0.003 smaller compared to the input.
% This is due to the mean value result of 4 sampled signals, which together
% is smaller compared to the input signal of a given sample value.

% Create the high frequency signal

f2=0.5;
N=200;
n=0:N;
x2=cos(2*pi*f2*n);

% Filter and plot the input and output

y2_FIR_LP = filter(b_FIR_LP,a_FIR,x2);
figure
plot(x2)
title('High frequency signal')
hold on
plot(y2_FIR_LP,'r')

% How has the filter affected the signal?
% The filtered signal is jagged at the start, and is then zero for the
% duration of the input signal. This is due to the differencial equation
% which has terms of cosine pi, and each 4 samples in which the equation
% accounts for results in a sum of zero. Before the four samples gets
% accounted for, the filtered signal summarizes one, then negative one and
% positive one, then negative one, positive one and positive one and lastly
% zero for the rest of the input.

% 1. Four samples, as per my last answer
% 2. The filtered signal has the value zero, which makes it hard to say
% 3. Yes, the filtered signal has an amplitude of a constant zero.

% Create a new signal as the sum of the low frequency and the high
% frequency

x3=x1+x2;

% Filter and plot the input and output

y3_FIR_LP=filter(b_FIR_LP,a_FIR,x3);
figure
plot(x3)
title('High + Low frequency signal')
hold on
plot(y3_FIR_LP,'r')

% How has the filter affected the signal?
% The filtered signal is following the general shape of the harmonical
% shape of the two signals. Following the criteria of the shape of their
% respective signals will explain this output. The filtered signal had the value
% zero in x2, and this results in a signal that doesnt deviate from the
% distance of the signals highest and lowest points, which is exactly what
% we see in the sum of x1 and x2. In x1 the filtered signal followed the
% harmonical shape with a slight shift, which also happens here. You could
% say that the filtered signal behavior in x1 and x2 is summarised in the
% combination of these two inputs.

% 1. Four samples
% 2. Yes, it should be 2 samples as per the first x1 signal
% 3. Yes, following the general shape of the harmonical signal, it should
% be shifted 0.003 aswell

%% Task 2

% Create the filter

b_FIR_HP=[0.25 -0.25 0.25 -0.25];

% Create the last three signals from task 1

f1=0.01;
N=200;
n=0:N;
x1=cos(2*pi*f1*n);

f2=0.5;
N=200;
n=0:N;
x2=cos(2*pi*f2*n);

x3=x1+x2;

% Filter and plot the input and output

y1_FIR_LP = filter(b_FIR_HP,a_FIR,x1);
figure
plot(x1)
title('Low frequency signal')
hold on
plot(y1_FIR_LP,'r')

y2_FIR_LP = filter(b_FIR_HP,a_FIR,x2);
figure
plot(x2)
title('High frequency signal')
hold on
plot(y2_FIR_LP,'r')

y3_FIR_LP=filter(b_FIR_HP,a_FIR,x3);
figure
plot(x3)
title('High + Low frequency signal')
hold on
plot(y3_FIR_LP,'r')

% How has the filter affected the signals?

% The filtered signal displays a much lower amplitude compared to the input signal in
% the low frequency signal, compared to the high frequency one. Because we are using a
% HP filter this time, the differencial equation summarizes only the amplitudes of
% high frequency signals, compared to low frequency ones.

% In the high + low frequency example the two results of their individual
% parts are displayed as a sum. The amplitude of the high frequency is
% preserved while the shape of the low frequency is carried over.

% 1. -//-
% 2. Filtered x1 signal has shifted by about 24 samples. The x2 signal
% hasn't shifted because the input is already a high frequency signal, and
% is allowed at every sample value. If you zoom in you can see that the
% filtered vs input apex points are on top of each other.
% 3. The amplitude of x1 has been reduced, the x2 signal is the same and
% the x3 signal have the sum of x1 and x2 results.

%% Task 3

% Create the filter

b_IIR_LP=0.1;
a_IIR_LP=[1 -0.9];

% Create the last three signals from task 1

f1=0.01;
N=200;
n=0:N;
x1=cos(2*pi*f1*n);

f2=0.5;
N=200;
n=0:N;
x2=cos(2*pi*f2*n);

x3=x1+x2;

% Filter and plot the input and output

y1_FIR_LP = filter(b_IIR_LP,a_IIR_LP,x1);
figure
plot(x1)
title('Low frequency signal')
hold on
plot(y1_FIR_LP,'r')

y2_FIR_LP = filter(b_IIR_LP,a_IIR_LP,x2);
figure
plot(x2)
title('High frequency signal')
hold on
plot(y2_FIR_LP,'r')

y3_FIR_LP=filter(b_IIR_LP,a_IIR_LP,x3);
figure
plot(x3)
title('High + Low frequency signal')
hold on
plot(y3_FIR_LP,'r')

% How has the filter affected the signal?
% The filtered signal follows the same outcome as the previous LP FIR
% filter, except instead of having an amplitude of zero in the high
% frequency filter, the signal fluctuates close to zero in a harmonical
% shape. Another detail is that the filter kicks in much earlier compared
% to the last filter.

% The shape of the harmonical filter can be explained from their respective
% differencial equation.

% x1:
% The signal has a low frequency, which means for every sample value the
% cosine signal has a value very close to 1, which means that the recursive
% response keeps summarizing positive numbers which are very close to its
% value to its predecessor. This happens also when the cosine signal is
% approaching zero, or a negative number. This results in a filtered signal
% which has a close resemblence to its input signal.

% x2:
% In this case, the cosine has a high frequency. For every sample value,
% the angle fluctuates between pi or 2pi, which means it fluctuates between
% a value of -1 or 1. If a given sample value has a value of 1, then the
% equation has to summarize its predecessor which has a value of -1, which
% gives zero. Because the coefficients are partial the total value is a
% signal close to zero, fluctuating between positive or negative as a
% result of the harmonical input.

% x3:
% The combined filtered signals criteria are summarised here, with their
% respective behavior acting at the same time.

% 1. This time, the filter kicks in at the second sample. The recursive
% equation requires the value of one predecessor, which implies that the
% filter needs atleast one value before a given sample.

% 2. The x1 signal is shifted as a result of the amplitudes being reduced
% and the recursive equation not fully summarising the amplitudes until
% after a few samples. The x2 signal is not shifted due to the input signal
% fluctuating between pi and 2pi at the same rate as the differencial
% equation

% 3. The amplitude in x1 has been reduced due to the coefficients at the
% most tracks 0.9 of the input signal value. In x2 the amplitude has been
% reduced to 0.05 due to continuous reduction of 0.1 to the 0.9 past value

%% Task 4

% Create the filter

b_IIR_HP=0.1;
a_IIR_HP=[1 0.9];

% Create the last three signals from task 1

f1=0.01;
N=200;
n=0:N;
x1=cos(2*pi*f1*n);

f2=0.5;
N=200;
n=0:N;
x2=cos(2*pi*f2*n);

x3=x1+x2;

% Filter and plot the input and output

y1_FIR_LP = filter(b_IIR_HP,a_IIR_HP,x1);
figure
plot(x1)
title('Low frequency signal')
hold on
plot(y1_FIR_LP,'r')

y2_FIR_LP = filter(b_IIR_HP,a_IIR_HP,x2);
figure
plot(x2)
title('High frequency signal')
hold on
plot(y2_FIR_LP,'r')

y3_FIR_LP=filter(b_IIR_HP,a_IIR_HP,x3);
figure
plot(x3)
title('High + Low frequency signal')
hold on
plot(y3_FIR_LP,'r')

% How has the filter affected the signal?
% Same reasoning as before, except amplifying the amplitudes of high
% frequency signals, which is shown in the plots.

% In the differencial equation, it subtracts instead of summarise. In the
% low frequency case, if a given sample is positive, then the past value is
% close in amplitude with a positive value aswell. These two summarised is
% close to zero. In the high frequency case, where the cosine signal
% fluctuates between pi and 2pi and therefore between 1 and -1, the
% difference equation leads to a sum of two positive numbers, therefore an
% increase in amplitude.

% 1. Because the differencial equation requires the value one sample in the
% past, for it to fully work it requires atleast 2 samples
% 2. x1 has been shifted due to a fluctuating amplitude due to slight
% difference in angle in one sample value in the past, and the x2 value
% experiences no shift due to a constant fluctuation of pi and 2pi, which
% changes at the same rate as the input signal.
% 3. The amplitude of x1 is significantly reduced and the amplitude of x2
% is initialy smaller, but gets closer to the input signal, but never
% exactly the same.

%% Task 5

% Create the impulse signal

x_imp=[1 zeros(1,20)];

% Create the same filters from task 1 to 4

a_FIR=1;
b_FIR_LP=[0.25 0.25 0.25 0.25];
b_FIR_HP=[0.25 -0.25 0.25 -0.25];

b_IIR_LP=0.1;
a_IIR_LP=[1 -0.9];

b_IIR_HP=0.1;
a_IIR_HP=[1 0.9];

% Filter the impulse signal with each filter

h_FIR_LP=filter(b_FIR_LP,a_FIR,x_imp);
h_FIR_HP=filter(b_FIR_HP,a_FIR,x_imp);
h_IIR_LP=filter(b_IIR_LP,a_IIR_LP,x_imp);
h_IIR_HP=filter(b_IIR_HP,a_IIR_HP,x_imp);

% Plot the results

figure
subplot(511), stem(x_imp)
subplot(512), stem(h_FIR_LP)
subplot(513), stem(h_FIR_HP)
subplot(514), stem(h_IIR_LP)
subplot(515), stem(h_IIR_HP)

% What differences and similarities can you notice?
% Comparing the FIR and IIR:
% If the FIR results in positive/negative values the IIR does the same. The
% difference is that the IIR example is continous despite the impulse
% signal stopping after sample 1, which makes sense considering that the
% filter uses values of its predecessor and reducing it with a factor below
% 1.

% Task 6

% Re-create the signal x3 from task 1-4

f1=0.01;
N=200;
n=0:N;
x1=cos(2*pi*f1*n);

f2=0.5;
N=200;
n=0:N;
x2=cos(2*pi*f2*n);

x3=x1+x2;

y3_FIR_LP=filter(b_FIR_LP,a_FIR,x3);
y3_FIR_HP=filter(b_FIR_HP,a_FIR,x3);
y3_IIR_LP=filter(b_IIR_LP,a_IIR_LP,x3);
y3_IIR_HP=filter(b_IIR_HP,a_IIR_HP,x3);

% Convolute the x3 signal with respective impulse response

y3_conv_h_FIR_LP=conv(x3,h_FIR_LP);
y3_conv_h_FIR_HP=conv(x3,h_FIR_HP);
y3_conv_h_IIR_LP=conv(x3,h_IIR_LP);
y3_conv_h_IIR_HP=conv(x3,h_IIR_HP);

% Plot the results

figure,
subplot(511), plot(x3), axis([0 200 -2 2]), title('Insignal')
subplot(512), plot(y3_FIR_LP), axis([0 200 -2 2]), title('FIR LP filtrerad')
hold on, plot(y3_conv_h_FIR_LP,'r:')
subplot(513), plot(y3_FIR_HP), axis([0 200 -2 2]), title('FIR HP filtrerad')
hold on, plot(y3_conv_h_FIR_HP,'r:')
subplot(514), plot(y3_IIR_LP), axis([0 200 -2 2]), title('IIR LP filtrerad')

hold on, plot(y3_conv_h_IIR_LP,'r:')
subplot(515), plot(y3_IIR_HP), axis([0 200 -2 2]), title('IIR HP filtrerad')
hold on, plot(y3_conv_h_IIR_HP,'r:')

% What do you see? Does the results correspond your expectations?
% Yes. According to y(n)=x(n)*h(n) these results corresponds this equation.
% If compared with the results from past filters these results match up.

%% Task 7

% Load the ekg signal

load('ppg_ecg_ex.mat')

% Create the filters

a_FIR=1;
b_FIR_LP=[0.25 0.25 0.25 0.25];
b_FIR_HP=[0.25 -0.25 0.25 -0.25];

b_IIR_LP=0.1;
a_IIR_LP=[1 -0.9];

b_IIR_HP=0.1;
a_IIR_HP=[1 0.9];

% Filter the ekg signal with each filter

ekg_FIR_LP=filter(b_FIR_LP,a_FIR,ekg(1,:));
ekg_FIR_HP=filter(b_FIR_HP,a_FIR,ekg(1,:));
ekg_IIR_LP=filter(b_IIR_LP,a_IIR_LP,ekg(1,:));
ekg_IIR_HP=filter(b_IIR_HP,a_IIR_HP,ekg(1,:));

% Plot the results

figure,
subplot(511), plot(ekg(1,:)), axis([0 0.3*1e4 -5*1e-4 15*1e-4]), title('Insignal')
subplot(512), plot(ekg_FIR_LP), axis([0 0.3*1e4 -5*1e-4 15*1e-4]), title('FIR LP filtrerad')
subplot(513), plot(ekg_FIR_HP), axis([0 0.3*1e4 -5*1e-4 15*1e-4]), title('FIR HP filtrerad')
subplot(514), plot(ekg_IIR_LP), axis([0 0.3*1e4 -5*1e-4 15*1e-4]), title('IIR LP filtrerad')
subplot(515), plot(ekg_IIR_HP), axis([0 0.3*1e4 -5*1e-4 15*1e-4]), title('IIR HP filtrerad')

% What has happened? What practical use can this filtration have?
% Compared to the input signal the lines are much more defined, and
% depending on the filter, amplifying certain signals.
% 
% In the LP filter the jagged lines are removed, because the jagged lines had a higher
% frequency. In the FIR HP the signal that resulted in the jagged lines is
% displayed. In the IIR LP the EKG signal is preserved but with lower
% amplitudes, and in the IIR HP signal the jagged signal is displayed.

% The filters has a practical use of filtering unwanted frequencies or
% making certain frequencies more prominent for analysis.

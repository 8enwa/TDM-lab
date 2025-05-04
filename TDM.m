clc;
clear;
close all;

Fs = 100000;            
t = 0:1/Fs:1e-2;         
f1 = 2000;               
f2 = 2000;              

x1 = sin(2*pi*f1*t);     
x2 = square(2*pi*f2*t);  

tdm_signal = zeros(1, length(t)*2);
tdm_signal(1:2:end) = x1;
tdm_signal(2:2:end) = x2;

x1_rec = tdm_signal(1:2:end);
x2_rec = tdm_signal(2:2:end);

figure('Name','TDM Simulation');

subplot(4,1,1);
plot(t, x1);
title('Input Signal 1 (Sine 2kHz)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4,1,2);
plot(t, x2);
title('Input Signal 2 (Square 2kHz)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4,1,3);
plot(tdm_signal);
title('TDM Signal (Interleaved Samples)');
xlabel('Sample Index'); ylabel('Amplitude'); grid on;

subplot(4,1,4);
plot(t, x1_rec);
hold on;
plot(t, x2_rec);
title('Recovered Signals');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
legend('Recovered x1', 'Recovered x2');

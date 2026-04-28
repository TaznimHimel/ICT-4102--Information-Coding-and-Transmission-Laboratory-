clc;
clear;
close all;

% Signal Parameters
fs = 2000;                    % Sampling frequency
t = 0:1/fs:0.5;               % Time vector (0.5 seconds)
f_sig = 10;                   % Signal frequency (10 Hz)
signal = sin(2*pi*f_sig*t);   % Original clean sine wave
N = length(t);

%% 1. Random Noise (Uniform)
% Distributed between -0.5 and 0.5
noise_random = 0.5 * (2 * rand(1, N) - 1);
sig_random = signal + noise_random;

%% 2. Thermal Noise (Gaussian, low power)
thermal_std = 0.1;
noise_thermal = thermal_std * randn(1, N);
sig_thermal = signal + noise_thermal;

%% 3. Impulse Noise (Fixed)
% Random spikes with positive and negative values
noise_impulse = zeros(1, N);
spike_locations = randperm(N, 15);       % 15 random spike positions
noise_impulse(spike_locations) = 1.5 * sign(randn(1, 15));
sig_impulse = signal + noise_impulse;

%% 4. AWGN (Additive White Gaussian Noise)
snr_db = 5;                              % Low SNR for clear effect
sig_awgn = awgn(signal, snr_db, 'measured');

%% Visualization
figure('Name', 'Effect of Noise on Signal');

% Original Signal
subplot(5,1,1);
plot(t, signal, 'k', 'LineWidth', 1.5);
title('Original Clean Signal (Sine Wave)');
grid on;

% Random Noise Effect
subplot(5,1,2);
plot(t, sig_random,'r');
title('Signal + Random (Uniform) Noise');
grid on;

% Thermal Noise Effect
subplot(5,1,3);
plot(t, sig_thermal,'m');
title('Signal + Thermal Noise (Gaussian)');
grid on;

% Impulse Noise Effect
subplot(5,1,4);
plot(t, sig_impulse,'b');
title('Signal + Impulse Noise (Random Spikes)');
grid on;

% AWGN Effect
subplot(5,1,5);
plot(t, sig_awgn,'g');
title(['Signal + AWGN (SNR = ', num2str(snr_db), ' dB)']);
grid on;
xlabel('Time (s)');
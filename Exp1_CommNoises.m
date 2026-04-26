clc;
clear;
close all;

% Simulate a clean signal (sine wave)
fs = 1000;                     % Sampling frequency
t = linspace(0, 1, fs);        % Time vector
freq = 5;                      % Frequency of sine wave
clean_signal = sin(2*pi*freq*t);

% 1. AWGN Noise
snr_db = 10;                                   % Desired SNR in dB
signal_power = mean(clean_signal.^2);          % Signal power
snr_linear = 10^(snr_db / 10);                 % Convert dB to linear
noise_power = signal_power / snr_linear;       % Noise power

awgn_noise = sqrt(noise_power) * randn(1, fs); % AWGN samples
noisy_signal_awgn = clean_signal + awgn_noise;

% 2. Impulse Noise
impulse_noise = zeros(1, fs);
impulse_positions = randi([1 fs], 1, 50);
impulse_values = 5 * (2*randi([0 1], 1, 50) - 1); % Generates -5 or 5
impulse_noise(impulse_positions) = impulse_values;
noisy_signal_impulse = clean_signal + impulse_noise;

% 3. Thermal Noise
thermal_mean = 0;
thermal_variance = 0.05;
thermal_noise = thermal_mean + sqrt(thermal_variance) * randn(1, fs);
noisy_signal_thermal = clean_signal + thermal_noise;

% 4. Random Noise
random_noise = -1 + 2*rand(1, fs);  % Uniform distribution between -1 and 1
noisy_signal_random = clean_signal + random_noise;

% Plotting
figure;

subplot(5,1,1);
plot(t, clean_signal, 'LineWidth', 1.2);
title('Clean Signal (Sine Wave)');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(5,1,2);
plot(t, noisy_signal_awgn, 'LineWidth', 1.2);
title('Noisy Signal with AWGN');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(5,1,3);
plot(t, noisy_signal_impulse, 'LineWidth', 1.2);
title('Noisy Signal with Impulse Noise');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(5,1,4);
plot(t, noisy_signal_thermal, 'LineWidth', 1.2);
title('Noisy Signal with Thermal Noise');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(5,1,5);
plot(t, noisy_signal_random, 'LineWidth', 1.2);
title('Noisy Signal with Random Noise');
xlabel('Time');
ylabel('Amplitude');
grid on;

% SNR Calculation
snr_awgn    = 10 * log10(var(clean_signal) / var(awgn_noise));
snr_impulse = 10 * log10(var(clean_signal) / var(impulse_noise));
snr_thermal = 10 * log10(var(clean_signal) / var(thermal_noise));
snr_random  = 10 * log10(var(clean_signal) / var(random_noise));

fprintf('Signal-to-Noise Ratio (SNR) with AWGN: %.2f dB\n', snr_awgn);
fprintf('Signal-to-Noise Ratio (SNR) with Impulse Noise: %.2f dB\n', snr_impulse);
fprintf('Signal-to-Noise Ratio (SNR) with Thermal Noise: %.2f dB\n', snr_thermal);
fprintf('Signal-to-Noise Ratio (SNR) with Random Noise: %.2f dB\n', snr_random);
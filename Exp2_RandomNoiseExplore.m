clc;
clear;
close all;

% Clean signal
fs = 1000;
t = linspace(0, 1, fs);
freq = 5;
clean_signal = sin(2*pi*freq*t);

% Noise characteristics
means = [0, 1, -1];
variances = [0.1, 1, 10];

figure;

plot_index = 1;
for i = 1:length(means)
    for j = 1:length(variances)
        mean_val = means(i);
        variance = variances(j);

        noise = mean_val + sqrt(variance) * randn(1, fs);
        noisy_signal = clean_signal + noise;

        subplot(length(means), length(variances), plot_index);
        plot(t, noisy_signal, 'LineWidth', 1);
        title(['Mean = ', num2str(mean_val), ', Var = ', num2str(variance)]);
        xlabel('Time');
        ylabel('Amplitude');
        grid on;

        plot_index = plot_index + 1;
    end
end

% SNR calculation
fprintf('SNR Results:\n');
for i = 1:length(means)
    for j = 1:length(variances)
        mean_val = means(i);
        variance = variances(j);

        noise = mean_val + sqrt(variance) * randn(1, fs);
        snr_val = 10 * log10(var(clean_signal) / var(noise));

        fprintf('SNR for Mean %.1f and Variance %.1f: %.2f dB\n', ...
            mean_val, variance, snr_val);
    end
end
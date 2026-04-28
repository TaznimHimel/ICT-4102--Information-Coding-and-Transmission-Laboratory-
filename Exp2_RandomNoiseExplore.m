clc;

clear;

close all;

N = 10000;

means = [0, 2, -2];

variances = [0.5, 1, 2];

colors = ['r', 'm', 'b'];

figure;

for i = 1:length(means)

for j = 1:length(variances)



    mu = means(i);

    sigma = sqrt(variances(j));

% Gaussian random noise Genarate

    noise = mu + sigma * randn(1, N);


% Plot histogram
    subplot(length(means), length(variances), (i-1)*length(variances)+j);

    histogram(noise, 50, 'FaceColor', colors(i));



    title(['\mu = ', num2str(mu), ', \sigma^2 = ', num2str(variances(j))]);

    xlabel('Amplitude');

    ylabel('Frequency');

end

end
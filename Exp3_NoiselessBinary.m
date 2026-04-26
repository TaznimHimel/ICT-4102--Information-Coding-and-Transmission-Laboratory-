clc;
clear;
close all;

% Generate random binary data
data_length = 100;
transmitted_data = randi([0 1], 1, data_length);

% Noiseless channel
received_data = transmitted_data;

% Display data
disp('Transmitted Data:');
disp(transmitted_data);

disp('Received Data:');
disp(received_data);

% Plotting
figure;

subplot(1,2,1);
stairs(transmitted_data, 'b', 'LineWidth', 1.5);
title('Transmitted Data');
xlabel('Bit Index');
ylabel('Bit Value');
ylim([-0.5 1.5]);
grid on;

subplot(1,2,2);
stairs(received_data, 'g', 'LineWidth', 1.5);
title('Received Data');
xlabel('Bit Index');
ylabel('Bit Value');
ylim([-0.5 1.5]);
grid on;
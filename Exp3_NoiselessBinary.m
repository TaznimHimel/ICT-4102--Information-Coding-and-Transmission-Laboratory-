clc;

clear;

close all;

% Number of bits (larger for practical simulation)

N = 1000;

% Generate random binary input bits

input_bits = randi([0 1], 1, N);

% Noiseless channel (output = input)

output_bits = input_bits;

% Display first few bits for clarity

disp('First 20 Input Bits:');

disp(input_bits(1:20));

disp('First 20 Output Bits (After Noiseless Channel):');

disp(output_bits(1:20));

% Error calculation

errors = sum(input_bits ~= output_bits);

% Bit Error Rate (BER)

ber = errors / N;

% Display results

fprintf('\nTotal Bits Transmitted: %d\n', N);

fprintf('Number of Errors      : %d\n', errors);

fprintf('Bit Error Rate (BER)  : %.6f\n', ber);

% Visualization (show first 50 bits for clarity)

figure;

subplot(2,1,1);

stem(input_bits(1:50), 'filled', 'LineWidth', 1.5);

title('Input Binary Signal (First 50 Bits)');

xlabel('Bit Index');

ylabel('Bit Value');

axis([0 51 -0.2 1.2]);

grid on;

subplot(2,1,2);

stem(output_bits(1:50), 'r', 'filled', 'LineWidth', 1.5);

title('Output Binary Signal (Noiseless, First 50 Bits)');

xlabel('Bit Index');

ylabel('Bit Value');

axis([0 51 -0.2 1.2]);

grid on;
clc;
clear;
close all;

% Input probability of error
p = input('Enter the probability of error (p) between 0 and 1: ');

if p < 0 || p > 1
    error('p must be between 0 and 1');
end

% Binary entropy function
binary_entropy = @(x) -(x.*log2(x + eps) + (1-x).*log2(1-x + eps));

% Channel capacity
capacity = 1 - binary_entropy(p);

fprintf('Channel Capacity of BSC with error probability %.2f: %.4f bits/channel use\n', p, capacity);

% Plot channel capacity
p_values = linspace(0, 1, 100);
capacity_values = 1 - binary_entropy(p_values);

figure;
plot(p_values, capacity_values, 'LineWidth', 2);
title('Binary Symmetric Channel Capacity');
xlabel('Error Probability (p)');
ylabel('Channel Capacity (C)');
grid on;